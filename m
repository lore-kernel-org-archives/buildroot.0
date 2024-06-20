Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693E2C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92AA80ED6;
	Thu, 20 Jun 2024 21:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0UY0Xg7WwVX; Thu, 20 Jun 2024 21:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C3680F14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C3680F14;
	Thu, 20 Jun 2024 21:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05BFA1BF239
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 21:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3CC1404F9
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 21:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQOq_BbbWeXs for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 21:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F118404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F118404EF
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F118404EF
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 21:33:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3627ef1fc07so1089884f8f.3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718919233; x=1719524033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M6LnsFeWtxb751pGx+5ztvKNujDFkZTkqozasvLb49Y=;
 b=dIpYY7UwWzWXPc9jcE6L/q7HAZODb265DTUFfftkAZfL4uPlm/QGWqqctkxByXMnWa
 kW/67zdv1fw/L4WYD8ewAPGPJiKjU+f0vvQFGQA7RQEy3mRqXDZcmZdJDDtfUvACgL8q
 NCqXh8cUDJ11YpLZxQLfZ5hpGxA0znH6S7m9JAThapazjcJMmj1pLaVoh7yNn6HiYXZR
 YnzVXj2D691RYnWV6jID/am6XWNNqrz7S+0KhLYA9R012DpPHYu3+Mv1C/2mWzz4ZKbN
 UQ05zFQXz+dJ+sAa6hHw43pwmaUpjt1bh+HKLDaxDuxbLbrHeSp3/p/zefpWGb1NZB2f
 T6qQ==
X-Gm-Message-State: AOJu0YxzHpCz5w0V1KnYL8bWUzVE8upIIjr3joK1Jc6VKG/1Im/i2inl
 BsbiolXt6crKuj1gH5zVH7kSJ4qXoEMSUq7tUmEvIQnkXUSApTOM1DF1SbnrfAq8/yPk2DkVdZN
 r
X-Google-Smtp-Source: AGHT+IEg93KgW2j9THlfKqhWl/WynrUZOfnlzZHJ9gfFBoLU4WHDCiXVF+fj61GbLnhHTHmajY59Ng==
X-Received: by 2002:a05:600c:2143:b0:421:7f4d:5240 with SMTP id
 5b1f17b1804b1-42475182ac4mr46474095e9.24.1718919233160; 
 Thu, 20 Jun 2024 14:33:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481910fd4sm4766375e9.30.2024.06.20.14.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 14:33:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 23:33:21 +0200
Message-ID: <20240620213321.2289493-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718919233; x=1719524033;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M6LnsFeWtxb751pGx+5ztvKNujDFkZTkqozasvLb49Y=;
 b=eSvDeveNJ37iFN6IaIIYfYefE4UbKE1ffu5++S39S8HHrVHTRMOklgoTYV2Rp1O4Vs
 EkGHryvISH6MJBdcktYL26AZI6IQ0AXBq9D36CaF3rvgM4gsXrrpl19662HdnmwAq8PF
 i1NIK9j7YX7qdb3CW/O2VaPFsYrH7SUmfiSAA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eSvDeveN
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.161 and U-Boot to 2024.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.161 and U-Boot to
version 2024.04. The new Linux kernel version revealed a regression in
the management of the serial UART, which required the application of a
correction patch. This patch has been submitted to the stable tree.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...0001-serial-stm32-rework-RX-over-DMA.patch | 407 ++++++++++++++++++
 .../stm32f769-disco/patches/linux/linux.hash  |   2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash  |   2 +-
 configs/stm32f769_disco_sd_defconfig          |   4 +-
 4 files changed, 411 insertions(+), 4 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/linux/0001-serial-stm32-rework-RX-over-DMA.patch

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/0001-serial-stm32-rework-RX-over-DMA.patch b/board/stmicroelectronics/stm32f769-disco/patches/linux/0001-serial-stm32-rework-RX-over-DMA.patch
new file mode 100644
index 000000000000..b1d31772c437
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/0001-serial-stm32-rework-RX-over-DMA.patch
@@ -0,0 +1,407 @@
+From 12439957e54a8fcb9e7606716bb1bc8d0fdc97cf Mon Sep 17 00:00:00 2001
+From: Erwan Le Ray <erwan.leray@foss.st.com>
+Date: Wed, 20 Oct 2021 17:03:31 +0200
+Subject: [PATCH 5.15] serial: stm32: rework RX over DMA
+
+commit 33bb2f6ac3088936b7aad3cab6f439f91af0223c upstream.
+
+This patch reworks RX support over DMA to improve reliability:
+- change dma buffer cyclic configuration by using 2 periods. DMA buffer
+data are handled by a flip-flop between the 2 periods in order to avoid
+risk of data loss/corruption
+- change the size of dma buffer to 4096 to limit overruns
+- add rx errors management (breaks, parity, framing and overrun).
+  When an error occurs on the uart line, the dma request line is masked at
+  HW level. The SW must 1st clear DMAR (dma request line enable), to
+  handle the error, then re-enable DMAR to recover. So, any correct data
+  is taken from the DMA buffer, before handling the error itself. Then
+  errors are handled from RDR/ISR/FIFO (e.g. in PIO mode). Last, DMA
+  reception is resumed.
+- add a condition on DMA request line in DMA RX routines in order to
+switch to PIO mode when no DMA request line is disabled, even if the DMA
+channel is still enabled.
+  When the UART is wakeup source and is configured to use DMA for RX, any
+  incoming data that wakes up the system isn't correctly received.
+  At data reception, the irq_handler handles the WUF irq, and then the
+  data reception over DMA.
+  As the DMA transfer has been terminated at suspend, and will be restored
+  by resume callback (which has no yet been called by system), the data
+  can't be received.
+  The wake-up data has to be handled in PIO mode while suspend callback
+  has not been called.
+
+Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
+Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
+Link: https://lore.kernel.org/r/20211020150332.10214-3-erwan.leray@foss.st.com
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+[ dario: fix conflicts for backport to v5.15. From the [1] series, only the
+  first patch was applied to the v5.15 branch. This caused a regression in
+  character reception, which can be fixed by applying the second patch. The
+  patch has been tested on the stm32f469-disco board.
+  [1] https://lore.kernel.org/all/20211020150332.10214-1-erwan.leray@foss.st.com/. ]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+Upstream: https://lore.kernel.org/stable/20240620152658.1033479-1-dario.binacchi@amarulasolutions.com/T/#u
+---
+ drivers/tty/serial/stm32-usart.c | 206 ++++++++++++++++++++++++-------
+ drivers/tty/serial/stm32-usart.h |  12 +-
+ 2 files changed, 165 insertions(+), 53 deletions(-)
+
+diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
+index 0e8158cfaf0f..98e6ebfe840d 100644
+--- a/drivers/tty/serial/stm32-usart.c
++++ b/drivers/tty/serial/stm32-usart.c
+@@ -220,66 +220,60 @@ static int stm32_usart_init_rs485(struct uart_port *port,
+ 	return uart_get_rs485_mode(port);
+ }
+ 
+-static int stm32_usart_pending_rx(struct uart_port *port, u32 *sr,
+-				  int *last_res, bool threaded)
++static bool stm32_usart_rx_dma_enabled(struct uart_port *port)
+ {
+ 	struct stm32_port *stm32_port = to_stm32_port(port);
+ 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+-	enum dma_status status;
+-	struct dma_tx_state state;
+ 
+-	*sr = readl_relaxed(port->membase + ofs->isr);
++	if (!stm32_port->rx_ch)
++		return false;
+ 
+-	if (threaded && stm32_port->rx_ch) {
+-		status = dmaengine_tx_status(stm32_port->rx_ch,
+-					     stm32_port->rx_ch->cookie,
+-					     &state);
+-		if (status == DMA_IN_PROGRESS && (*last_res != state.residue))
+-			return 1;
+-		else
+-			return 0;
+-	} else if (*sr & USART_SR_RXNE) {
+-		return 1;
++	return !!(readl_relaxed(port->membase + ofs->cr3) & USART_CR3_DMAR);
++}
++
++/* Return true when data is pending (in pio mode), and false when no data is pending. */
++static bool stm32_usart_pending_rx_pio(struct uart_port *port, u32 *sr)
++{
++	struct stm32_port *stm32_port = to_stm32_port(port);
++	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
++
++	*sr = readl_relaxed(port->membase + ofs->isr);
++	/* Get pending characters in RDR or FIFO */
++	if (*sr & USART_SR_RXNE) {
++		/* Get all pending characters from the RDR or the FIFO when using interrupts */
++		if (!stm32_usart_rx_dma_enabled(port))
++			return true;
++
++		/* Handle only RX data errors when using DMA */
++		if (*sr & USART_SR_ERR_MASK)
++			return true;
+ 	}
+-	return 0;
++
++	return false;
+ }
+ 
+-static unsigned long stm32_usart_get_char(struct uart_port *port, u32 *sr,
+-					  int *last_res)
++static unsigned long stm32_usart_get_char_pio(struct uart_port *port)
+ {
+ 	struct stm32_port *stm32_port = to_stm32_port(port);
+ 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+ 	unsigned long c;
+ 
+-	if (stm32_port->rx_ch) {
+-		c = stm32_port->rx_buf[RX_BUF_L - (*last_res)--];
+-		if ((*last_res) == 0)
+-			*last_res = RX_BUF_L;
+-	} else {
+-		c = readl_relaxed(port->membase + ofs->rdr);
+-		/* apply RDR data mask */
+-		c &= stm32_port->rdr_mask;
+-	}
++	c = readl_relaxed(port->membase + ofs->rdr);
++	/* Apply RDR data mask */
++	c &= stm32_port->rdr_mask;
+ 
+ 	return c;
+ }
+ 
+-static void stm32_usart_receive_chars(struct uart_port *port, bool irqflag)
++static void stm32_usart_receive_chars_pio(struct uart_port *port)
+ {
+-	struct tty_port *tport = &port->state->port;
+ 	struct stm32_port *stm32_port = to_stm32_port(port);
+ 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+-	unsigned long c, flags;
++	unsigned long c;
+ 	u32 sr;
+ 	char flag;
+ 
+-	if (irqflag)
+-		spin_lock_irqsave(&port->lock, flags);
+-	else
+-		spin_lock(&port->lock);
+-
+-	while (stm32_usart_pending_rx(port, &sr, &stm32_port->last_res,
+-				      irqflag)) {
++	while (stm32_usart_pending_rx_pio(port, &sr)) {
+ 		sr |= USART_SR_DUMMY_RX;
+ 		flag = TTY_NORMAL;
+ 
+@@ -298,7 +292,7 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool irqflag)
+ 			writel_relaxed(sr & USART_SR_ERR_MASK,
+ 				       port->membase + ofs->icr);
+ 
+-		c = stm32_usart_get_char(port, &sr, &stm32_port->last_res);
++		c = stm32_usart_get_char_pio(port);
+ 		port->icount.rx++;
+ 		if (sr & USART_SR_ERR_MASK) {
+ 			if (sr & USART_SR_ORE) {
+@@ -332,6 +326,94 @@ static void stm32_usart_receive_chars(struct uart_port *port, bool irqflag)
+ 			continue;
+ 		uart_insert_char(port, sr, USART_SR_ORE, c, flag);
+ 	}
++}
++
++static void stm32_usart_push_buffer_dma(struct uart_port *port, unsigned int dma_size)
++{
++	struct stm32_port *stm32_port = to_stm32_port(port);
++	struct tty_port *ttyport = &stm32_port->port.state->port;
++	unsigned char *dma_start;
++	int dma_count, i;
++
++	dma_start = stm32_port->rx_buf + (RX_BUF_L - stm32_port->last_res);
++
++	/*
++	 * Apply rdr_mask on buffer in order to mask parity bit.
++	 * This loop is useless in cs8 mode because DMA copies only
++	 * 8 bits and already ignores parity bit.
++	 */
++	if (!(stm32_port->rdr_mask == (BIT(8) - 1)))
++		for (i = 0; i < dma_size; i++)
++			*(dma_start + i) &= stm32_port->rdr_mask;
++
++	dma_count = tty_insert_flip_string(ttyport, dma_start, dma_size);
++	port->icount.rx += dma_count;
++	if (dma_count != dma_size)
++		port->icount.buf_overrun++;
++	stm32_port->last_res -= dma_count;
++	if (stm32_port->last_res == 0)
++		stm32_port->last_res = RX_BUF_L;
++}
++
++static void stm32_usart_receive_chars_dma(struct uart_port *port)
++{
++	struct stm32_port *stm32_port = to_stm32_port(port);
++	unsigned int dma_size;
++
++	/* DMA buffer is configured in cyclic mode and handles the rollback of the buffer. */
++	if (stm32_port->rx_dma_state.residue > stm32_port->last_res) {
++		/* Conditional first part: from last_res to end of DMA buffer */
++		dma_size = stm32_port->last_res;
++		stm32_usart_push_buffer_dma(port, dma_size);
++	}
++
++	dma_size = stm32_port->last_res - stm32_port->rx_dma_state.residue;
++	stm32_usart_push_buffer_dma(port, dma_size);
++}
++
++static void stm32_usart_receive_chars(struct uart_port *port, bool irqflag)
++{
++	struct tty_port *tport = &port->state->port;
++	struct stm32_port *stm32_port = to_stm32_port(port);
++	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
++	enum dma_status rx_dma_status;
++	unsigned long flags;
++	u32 sr;
++
++	if (irqflag)
++		spin_lock_irqsave(&port->lock, flags);
++	else
++		spin_lock(&port->lock);
++
++	if (stm32_usart_rx_dma_enabled(port)) {
++		rx_dma_status = dmaengine_tx_status(stm32_port->rx_ch,
++						    stm32_port->rx_ch->cookie,
++						    &stm32_port->rx_dma_state);
++		if (rx_dma_status == DMA_IN_PROGRESS) {
++			/* Empty DMA buffer */
++			stm32_usart_receive_chars_dma(port);
++			sr = readl_relaxed(port->membase + ofs->isr);
++			if (sr & USART_SR_ERR_MASK) {
++				/* Disable DMA request line */
++				stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
++
++				/* Switch to PIO mode to handle the errors */
++				stm32_usart_receive_chars_pio(port);
++
++				/* Switch back to DMA mode */
++				stm32_usart_set_bits(port, ofs->cr3, USART_CR3_DMAR);
++			}
++		} else {
++			/* Disable RX DMA */
++			dmaengine_terminate_async(stm32_port->rx_ch);
++			stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
++			/* Fall back to interrupt mode */
++			dev_dbg(port->dev, "DMA error, fallback to irq mode\n");
++			stm32_usart_receive_chars_pio(port);
++		}
++	} else {
++		stm32_usart_receive_chars_pio(port);
++	}
+ 
+ 	if (irqflag)
+ 		uart_unlock_and_check_sysrq_irqrestore(port, irqflag);
+@@ -373,6 +455,13 @@ static void stm32_usart_tx_interrupt_enable(struct uart_port *port)
+ 		stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
+ }
+ 
++static void stm32_usart_rx_dma_complete(void *arg)
++{
++	struct uart_port *port = arg;
++
++	stm32_usart_receive_chars(port, true);
++}
++
+ static void stm32_usart_tc_interrupt_enable(struct uart_port *port)
+ {
+ 	struct stm32_port *stm32_port = to_stm32_port(port);
+@@ -587,7 +676,12 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
+ 			pm_wakeup_event(tport->tty->dev, 0);
+ 	}
+ 
+-	if ((sr & USART_SR_RXNE) && !(stm32_port->rx_ch))
++	/*
++	 * rx errors in dma mode has to be handled ASAP to avoid overrun as the DMA request
++	 * line has been masked by HW and rx data are stacking in FIFO.
++	 */
++	if (((sr & USART_SR_RXNE) && !stm32_usart_rx_dma_enabled(port)) ||
++	    ((sr & USART_SR_ERR_MASK) && stm32_usart_rx_dma_enabled(port)))
+ 		stm32_usart_receive_chars(port, false);
+ 
+ 	if ((sr & USART_SR_TXE) && !(stm32_port->tx_ch)) {
+@@ -596,7 +690,7 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
+ 		spin_unlock(&port->lock);
+ 	}
+ 
+-	if (stm32_port->rx_ch)
++	if (stm32_usart_rx_dma_enabled(port))
+ 		return IRQ_WAKE_THREAD;
+ 	else
+ 		return IRQ_HANDLED;
+@@ -902,9 +996,11 @@ static void stm32_usart_set_termios(struct uart_port *port,
+ 		stm32_port->cr1_irq = USART_CR1_RTOIE;
+ 		writel_relaxed(bits, port->membase + ofs->rtor);
+ 		cr2 |= USART_CR2_RTOEN;
+-		/* Not using dma, enable fifo threshold irq */
+-		if (!stm32_port->rx_ch)
+-			stm32_port->cr3_irq =  USART_CR3_RXFTIE;
++		/*
++		 * Enable fifo threshold irq in two cases, either when there is no DMA, or when
++		 * wake up over usart, from low power until the DMA gets re-enabled by resume.
++		 */
++		stm32_port->cr3_irq =  USART_CR3_RXFTIE;
+ 	}
+ 
+ 	cr1 |= stm32_port->cr1_irq;
+@@ -967,8 +1063,16 @@ static void stm32_usart_set_termios(struct uart_port *port,
+ 	if ((termios->c_cflag & CREAD) == 0)
+ 		port->ignore_status_mask |= USART_SR_DUMMY_RX;
+ 
+-	if (stm32_port->rx_ch)
++	if (stm32_port->rx_ch) {
++		/*
++		 * Setup DMA to collect only valid data and enable error irqs.
++		 * This also enables break reception when using DMA.
++		 */
++		cr1 |= USART_CR1_PEIE;
++		cr3 |= USART_CR3_EIE;
+ 		cr3 |= USART_CR3_DMAR;
++		cr3 |= USART_CR3_DDRE;
++	}
+ 
+ 	if (rs485conf->flags & SER_RS485_ENABLED) {
+ 		stm32_usart_config_reg_rs485(&cr1, &cr3,
+@@ -1297,9 +1401,9 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
+ 		return -ENODEV;
+ 	}
+ 
+-	/* No callback as dma buffer is drained on usart interrupt */
+-	desc->callback = NULL;
+-	desc->callback_param = NULL;
++	/* Set DMA callback */
++	desc->callback = stm32_usart_rx_dma_complete;
++	desc->callback_param = port;
+ 
+ 	/* Push current DMA transaction in the pending queue */
+ 	ret = dma_submit_error(dmaengine_submit(desc));
+@@ -1463,6 +1567,7 @@ static int stm32_usart_serial_remove(struct platform_device *pdev)
+ 	struct stm32_port *stm32_port = to_stm32_port(port);
+ 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+ 	int err;
++	u32 cr3;
+ 
+ 	pm_runtime_get_sync(&pdev->dev);
+ 	err = uart_remove_one_port(&stm32_usart_driver, port);
+@@ -1473,7 +1578,12 @@ static int stm32_usart_serial_remove(struct platform_device *pdev)
+ 	pm_runtime_set_suspended(&pdev->dev);
+ 	pm_runtime_put_noidle(&pdev->dev);
+ 
+-	stm32_usart_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
++	stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_PEIE);
++	cr3 = readl_relaxed(port->membase + ofs->cr3);
++	cr3 &= ~USART_CR3_EIE;
++	cr3 &= ~USART_CR3_DMAR;
++	cr3 &= ~USART_CR3_DDRE;
++	writel_relaxed(cr3, port->membase + ofs->cr3);
+ 
+ 	if (stm32_port->tx_ch) {
+ 		stm32_usart_of_dma_tx_remove(stm32_port, pdev);
+diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
+index ad6335155de2..852573e1a690 100644
+--- a/drivers/tty/serial/stm32-usart.h
++++ b/drivers/tty/serial/stm32-usart.h
+@@ -109,7 +109,7 @@ struct stm32_usart_info stm32h7_info = {
+ /* USART_SR (F4) / USART_ISR (F7) */
+ #define USART_SR_PE		BIT(0)
+ #define USART_SR_FE		BIT(1)
+-#define USART_SR_NF		BIT(2)
++#define USART_SR_NE		BIT(2)		/* F7 (NF for F4) */
+ #define USART_SR_ORE		BIT(3)
+ #define USART_SR_IDLE		BIT(4)
+ #define USART_SR_RXNE		BIT(5)
+@@ -126,7 +126,8 @@ struct stm32_usart_info stm32h7_info = {
+ #define USART_SR_SBKF		BIT(18)		/* F7 */
+ #define USART_SR_WUF		BIT(20)		/* H7 */
+ #define USART_SR_TEACK		BIT(21)		/* F7 */
+-#define USART_SR_ERR_MASK	(USART_SR_ORE | USART_SR_FE | USART_SR_PE)
++#define USART_SR_ERR_MASK	(USART_SR_ORE | USART_SR_NE | USART_SR_FE |\
++				 USART_SR_PE)
+ /* Dummy bits */
+ #define USART_SR_DUMMY_RX	BIT(16)
+ 
+@@ -246,9 +247,9 @@ struct stm32_usart_info stm32h7_info = {
+ #define STM32_SERIAL_NAME "ttySTM"
+ #define STM32_MAX_PORTS 8
+ 
+-#define RX_BUF_L 200		 /* dma rx buffer length     */
+-#define RX_BUF_P RX_BUF_L	 /* dma rx buffer period     */
+-#define TX_BUF_L 200		 /* dma tx buffer length     */
++#define RX_BUF_L 4096		 /* dma rx buffer length     */
++#define RX_BUF_P (RX_BUF_L / 2)	 /* dma rx buffer period     */
++#define TX_BUF_L RX_BUF_L	 /* dma tx buffer length     */
+ 
+ struct stm32_port {
+ 	struct uart_port port;
+@@ -273,6 +274,7 @@ struct stm32_port {
+ 	bool wakeup_src;
+ 	int rdr_mask;		/* receive data register mask */
+ 	struct mctrl_gpios *gpios; /* modem control gpios */
++	struct dma_tx_state rx_dma_state;
+ };
+ 
+ static struct stm32_port stm32_ports[STM32_MAX_PORTS];
+-- 
+2.34.1
+
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 49a2ba85a7de..5da44436797a 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8beb69ada46f1cbca2f4cf901ec078846035c1cd925d9471422f65aff74243ba  linux-5.15.108.tar.xz
+sha256  d629f78680dc4b65e3d78b61406fb7757b960c83c206e63ad8c2606b3e3c474c  linux-5.15.161.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index 7cef5b688ec3..97a2b4eaf95b 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 952d22cc60dd..6c9d92d4a44f 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.108"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.161"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
