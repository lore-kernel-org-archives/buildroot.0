From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Sun, 16 May 2010 18:22:28 +0530
Subject: [Buildroot] BR, macb and dm9601
Message-ID: <AANLkTimQiIfkxtO4U7yRSV1TdUkTb_x5HCUgewNKdP4T@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jacmet

I am on at91sam9263ek, using kernel 2.6.33.2. Having trouble with
inbuilt ethernet device (Atmel macb).
It doesn't take the IP in /etc/network/interfaces o startup. i need to
manually set the Ip address. Same is the case with ifplud on eth0.
Remove it and plug it,  ip address does not get assigned
automatically.

While the same kernel and filesystem work perfectly well with a
Davicom usb ethernet (dm9601 driver), in the said all situations.

I am on BR  6d1ab151cb4a14a6ca29e692de26fefd2f453d0a, master. But it
seems  this has anything to do with the filesystem. The network stack
has to be ok since Davicom works as expected.

Where do i start to dig? Atmel has released patches for 2.6.28 and
2.6.30. I tried enabling the patch in BR kernel config.

BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"
BR2_KERNEL_ARCH_PATCH_VERSION="2.6.28"
BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
# BR2_PACKAGE_PATCH is not set
BR2_PACKAGE_UDEV_PATH_ID=y
# BR2_PACKAGE_CLASSPATH is not set
# BR2_PACKAGE_EXPAT is not set
BR2_TARGET_U_BOOT_ARCH_PATCH=y
BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR=""
BR2_TARGET_UBOOT_CUSTOM_PATCH=""
BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
BR2_KERNEL_ARCH_PATCH_ENABLED=y
BR2_LINUX_BSP_PATCH=""

But seems its not getting pulled. Again, is it ok to enable first the
2.6.28 patch and next time 2.6.30? Atmel has released a patch for
2.6.33. But not the experimental ones as for 2.6.28 and 2.6.30.

I tried applying the 2.6.33 patch  directly on fresh kernel tree
outside BR. But there is substantial difference from the 2.6.28 tree
even after patching.

# diff  /usr/linux-2.6.33.2/drivers/net/macb.c
/usr/src/linux-2.6.28/drivers/net/macb.c

36c36,49
< #define TX_RING_SIZE		128
---
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> 	#if defined(CONFIG_ARCH_AT91SAM9260)
> 		#define TX_RING_SIZE       2
> 	#elif defined(CONFIG_ARCH_AT91SAM9263)
> 		#define TX_RING_SIZE       32
> 	#endif
> 	#define TX_BUFFER_SIZE       1536
> 	#define TX_RING_BYTES        (sizeof(struct dma_desc) * TX_RING_SIZE)
> 	#define TX_DMA_SIZE      ((TX_RING_BYTES) + (TX_RING_SIZE) * (TX_BUFFER_SIZE))
> #else
> 	#define TX_RING_SIZE     128
> 	#define TX_RING_BYTES        (sizeof(struct dma_desc) * TX_RING_SIZE)
> #endif
>
38d50
< #define TX_RING_BYTES		(sizeof(struct dma_desc) * TX_RING_SIZE)
214c226
< 		phydev = phy_connect(dev, dev_name(&phydev->dev),
---
> 		phydev = phy_connect(dev, phydev->dev.bus_id,
217c229
< 		phydev = phy_connect(dev, dev_name(&phydev->dev),
---
> 		phydev = phy_connect(dev, phydev->dev.bus_id,
244c256
< 	/* Enable management port */
---
> 	/* Enable managment port */
319c331
< 	if (status & (MACB_BIT(UND) | MACB_BIT(TSR_RLE))) {
---
> 	if (status & MACB_BIT(UND)) {
321,327c333,334
< 		printk(KERN_ERR "%s: TX %s, resetting buffers\n",
< 			bp->dev->name, status & MACB_BIT(UND) ?
< 			"underrun" : "retry limit exceeded");
<
< 		/* Transfer ongoing, disable transmitter, to avoid confusion */
< 		if (status & MACB_BIT(TGO))
< 			macb_writel(bp, NCR, macb_readl(bp, NCR) & ~MACB_BIT(TE));
---
> 		printk(KERN_ERR "%s: TX underrun, resetting buffers\n",
> 			bp->dev->name);
351,354d357
<
< 		/* Enable the transmitter again */
< 		if (status & MACB_BIT(TGO))
< 			macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TE));
380a384
> #if !defined(CONFIG_MACB_TX_SRAM)
382a387
> #endif
446a452
> 	bp->dev->last_rx = jiffies;
516a523
> 	struct net_device *dev = bp->dev;
523a531,539
> 	if (!status) {
> 		/*
> 		 * This may happen if an interrupt was pending before
> 		 * this function was called last time, and no packets
> 		 * have been received since.
> 		 */
> 		netif_rx_complete(dev, napi);
> 		goto out;
> 	}
527a544,551
> 	if (!(status & MACB_BIT(REC))) {
> 		dev_warn(&bp->pdev->dev,
> 			 "No RX buffers complete, status = %02lx\n",
> 			 (unsigned long)status);
> 		netif_rx_complete(dev, napi);
> 		goto out;
> 	}
>
530c554
< 		napi_complete(napi);
---
> 		netif_rx_complete(dev, napi);
535a560
> out:
564c589
< 			if (napi_schedule_prep(&bp->napi)) {
---
> 			if (netif_rx_schedule_prep(dev, &bp->napi)) {
572c597
< 				__napi_schedule(&bp->napi);
---
> 				__netif_rx_schedule(dev, &bp->napi);
576,577c601
< 		if (status & (MACB_BIT(TCOMP) | MACB_BIT(ISR_TUND) |
< 			    MACB_BIT(ISR_RLE)))
---
> 		if (status & (MACB_BIT(TCOMP) | MACB_BIT(ISR_TUND)))
602,616d625
< #ifdef CONFIG_NET_POLL_CONTROLLER
< /*
<  * Polling receive - used by netconsole and other diagnostic tools
<  * to allow network i/o with interrupts disabled.
<  */
< static void macb_poll_controller(struct net_device *dev)
< {
< 	unsigned long flags;
<
< 	local_irq_save(flags);
< 	macb_interrupt(dev->irq, dev);
< 	local_irq_restore(flags);
< }
< #endif
<
623d631
< 	unsigned long flags;
639c647
< 	spin_lock_irqsave(&bp->lock, flags);
---
> 	spin_lock_irq(&bp->lock);
644c652
< 		spin_unlock_irqrestore(&bp->lock, flags);
---
> 		spin_unlock_irq(&bp->lock);
649c657
< 		return NETDEV_TX_BUSY;
---
> 		return 1;
653a662,665
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> 	mapping = bp->tx_ring[entry].addr;
> 	memcpy(bp->tx_buffers + entry * TX_BUFFER_SIZE, skb->data, len);
> #else
655a668
> #endif
665a679
> #if !defined(CONFIG_MACB_TX_SRAM)
666a681
> #endif
678c693
< 	spin_unlock_irqrestore(&bp->lock, flags);
---
> 	spin_unlock_irq(&bp->lock);
682c697
< 	return NETDEV_TX_OK;
---
> 	return 0;
696a712,714
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> 		iounmap((void *)bp->tx_ring);
> #else
698a717
> #endif
706a726,730
>
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> 	if (bp->tx_ring_dma)
> 		release_mem_region(bp->tx_ring_dma, TX_DMA_SIZE);
> #endif
726a751,778
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> #if  defined(CONFIG_ARCH_AT91SAM9260)
> 	if (request_mem_region(AT91SAM9260_SRAM0_BASE, TX_DMA_SIZE, "macb")) {
> 		bp->tx_ring_dma = AT91SAM9260_SRAM0_BASE;
> 	} else {
> 		if (request_mem_region(AT91SAM9260_SRAM1_BASE, TX_DMA_SIZE, "macb")) {
> 			bp->tx_ring_dma = AT91SAM9260_SRAM1_BASE;
> 		} else {
> 			printk(KERN_WARNING "Cannot request SRAM memory for TX ring, already used\n");
> 			return -EBUSY;
> 		}
> 	}
> #elif defined(CONFIG_ARCH_AT91SAM9263)
> 	if (request_mem_region(AT91SAM9263_SRAM0_BASE, TX_DMA_SIZE, "macb")) {
> 		bp->tx_ring_dma = AT91SAM9263_SRAM0_BASE;
> 	} else {
> 		printk(KERN_WARNING "Cannot request SRAM memory for TX ring, already used\n");
> 		return -EBUSY;
> 	}
> #endif
>
> 	bp->tx_ring = ioremap(bp->tx_ring_dma, TX_DMA_SIZE);
> 	if (!bp->tx_ring)
> 		return -ENOMEM;
>
> 	bp->tx_buffers_dma = bp->tx_ring_dma + TX_RING_BYTES;
> 	bp->tx_buffers = (char *) bp->tx_ring + TX_RING_BYTES;
> #else
731a784
>
734a788
> #endif
764a819,824
> #if defined(CONFIG_ARCH_AT91) && defined(CONFIG_MACB_TX_SRAM)
> 	for (i = 0; i < TX_RING_SIZE; i++) {
> 		bp->tx_ring[i].addr = bp->tx_buffers_dma + i * TX_BUFFER_SIZE;
> 		bp->tx_ring[i].ctrl = MACB_BIT(TX_USED);
> 	}
> #else
768a829,830
> #endif
>
1079c1141
< 	strcpy(info->bus_info, dev_name(&bp->pdev->dev));
---
> 	strcpy(info->bus_info, bp->pdev->dev.bus_id);
1082c1144
< static const struct ethtool_ops macb_ethtool_ops = {
---
> static struct ethtool_ops macb_ethtool_ops = {
1103,1117d1164
< static const struct net_device_ops macb_netdev_ops = {
< 	.ndo_open		= macb_open,
< 	.ndo_stop		= macb_close,
< 	.ndo_start_xmit		= macb_start_xmit,
< 	.ndo_set_multicast_list	= macb_set_rx_mode,
< 	.ndo_get_stats		= macb_get_stats,
< 	.ndo_do_ioctl		= macb_ioctl,
< 	.ndo_validate_addr	= eth_validate_addr,
< 	.ndo_change_mtu		= eth_change_mtu,
< 	.ndo_set_mac_address	= eth_mac_addr,
< #ifdef CONFIG_NET_POLL_CONTROLLER
< 	.ndo_poll_controller	= macb_poll_controller,
< #endif
< };
<
1127a1175
> 	DECLARE_MAC_BUF(mac);
1193c1241,1246
< 	dev->netdev_ops = &macb_netdev_ops;
---
> 	dev->open = macb_open;
> 	dev->stop = macb_close;
> 	dev->hard_start_xmit = macb_start_xmit;
> 	dev->get_stats = macb_get_stats;
> 	dev->set_multicast_list = macb_set_rx_mode;
> 	dev->do_ioctl = macb_ioctl;
1241,1242c1294,1297
< 	printk(KERN_INFO "%s: Atmel MACB@0x%08lx irq %d (%pM)\n",
< 	       dev->name, dev->base_addr, dev->irq, dev->dev_addr);
---
> 	printk(KERN_INFO "%s: Atmel MACB at 0x%08lx irq %d "
> 	       "(%s)\n",
> 	       dev->name, dev->base_addr, dev->irq,
> 	       print_mac(mac, dev->dev_addr));
1246,1247c1301,1302
< 		"(mii_bus:phy_addr=%s, irq=%d)\n", dev->name,
< 		phydev->drv->name, dev_name(&phydev->dev), phydev->irq);
---
> 		"(mii_bus:phy_addr=%s, irq=%d)\n",
> 		dev->name, phydev->drv->name, phydev->dev.bus_id, phydev->irq);

May I have some tips to look for the problem?

regards

Nataraj
