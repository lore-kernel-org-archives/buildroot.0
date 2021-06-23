From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Wed, 23 Jun 2021 13:39:04 +0100
Subject: [Buildroot] [PATCH 1/1] configs/chromebook_elm: bump to Linux v5.10
Message-ID: <20210623123904.1341170-1-bilal.wasim@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the chromebook elm configuration to use v5.10 which is an LTS.

With v5.10, none of the patches previously needed to enable the display
are needed anymore. Deleting them and making minor updates to the linux
kernel configuration.

Signed-off-by: Bilal Wasim <bilal.wasim@imgtec.com>
---
 board/chromebook/elm/linux.config             |  66 ++++---
 ...ctor-Set-default-status-connected-fo.patch |  35 ----
 ...ps8640-Get-the-EDID-from-eDP-control.patch |  50 ------
 ...0-Return-an-error-for-incorrect-atta.patch |  35 ----
 ...0-Print-an-error-if-VDO-control-fail.patch |  58 -------
 ...e-ps8640-Rework-power-state-handling.patch | 162 ------------------
 ...tek-dsi-Fix-scrolling-of-panel-with-.patch |  41 -----
 configs/chromebook_elm_defconfig              |   9 +-
 8 files changed, 48 insertions(+), 408 deletions(-)
 delete mode 100644 board/chromebook/elm/patches/linux/0001-drm-bridge_connector-Set-default-status-connected-fo.patch
 delete mode 100644 board/chromebook/elm/patches/linux/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch
 delete mode 100644 board/chromebook/elm/patches/linux/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch
 delete mode 100644 board/chromebook/elm/patches/linux/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch
 delete mode 100644 board/chromebook/elm/patches/linux/0005-drm-bridge-ps8640-Rework-power-state-handling.patch
 delete mode 100644 board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch

diff --git a/board/chromebook/elm/linux.config b/board/chromebook/elm/linux.config
index 50402eae8a..895a3b85c3 100644
--- a/board/chromebook/elm/linux.config
+++ b/board/chromebook/elm/linux.config
@@ -30,7 +30,6 @@ CONFIG_SCHED_MC=y
 CONFIG_SCHED_SMT=y
 CONFIG_NR_CPUS=4
 CONFIG_NUMA=y
-CONFIG_SECCOMP=y
 CONFIG_PARAVIRT=y
 CONFIG_CRASH_DUMP=y
 CONFIG_COMPAT=y
@@ -46,6 +45,7 @@ CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
@@ -96,7 +96,6 @@ CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_OF_OVERLAY=y
 # CONFIG_BLK_DEV is not set
 CONFIG_SRAM=y
@@ -116,12 +115,39 @@ CONFIG_DM_MIRROR=m
 CONFIG_DM_ZERO=m
 CONFIG_NETDEVICES=y
 # CONFIG_ETHERNET is not set
-CONFIG_USB_RTL8152=y
-CONFIG_USB_USBNET=y
-# CONFIG_USB_NET_AX88179_178A is not set
-# CONFIG_USB_NET_NET1080 is not set
-# CONFIG_USB_NET_CDC_SUBSET is not set
-# CONFIG_USB_NET_ZAURUS is not set
+CONFIG_PHYLIB=y
+CONFIG_USB_CATC=m
+CONFIG_USB_KAWETH=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_RTL8152=m
+CONFIG_USB_LAN78XX=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_CDC_EEM=m
+CONFIG_USB_NET_HUAWEI_CDC_NCM=m
+CONFIG_USB_NET_CDC_MBIM=m
+CONFIG_USB_NET_DM9601=m
+CONFIG_USB_NET_SR9700=m
+CONFIG_USB_NET_SR9800=m
+CONFIG_USB_NET_SMSC75XX=m
+CONFIG_USB_NET_SMSC95XX=m
+CONFIG_USB_NET_GL620A=m
+CONFIG_USB_NET_PLUSB=m
+CONFIG_USB_NET_MCS7830=m
+CONFIG_USB_NET_RNDIS_HOST=m
+CONFIG_USB_ALI_M5632=y
+CONFIG_USB_AN2720=y
+CONFIG_USB_EPSON2888=y
+CONFIG_USB_KC2190=y
+CONFIG_USB_NET_CX82310_ETH=m
+CONFIG_USB_NET_KALMIA=m
+CONFIG_USB_NET_QMI_WWAN=m
+CONFIG_USB_NET_INT51X1=m
+CONFIG_USB_IPHETH=m
+CONFIG_USB_SIERRA_NET=m
+CONFIG_USB_VL600=m
+CONFIG_USB_NET_CH9200=m
+CONFIG_USB_NET_AQC111=m
 # CONFIG_WLAN_VENDOR_ADMTEK is not set
 # CONFIG_WLAN_VENDOR_ATH is not set
 # CONFIG_WLAN_VENDOR_ATMEL is not set
@@ -139,7 +165,6 @@ CONFIG_MWIFIEX_SDIO=m
 # CONFIG_WLAN_VENDOR_TI is not set
 # CONFIG_WLAN_VENDOR_ZYDAS is not set
 # CONFIG_WLAN_VENDOR_QUANTENNA is not set
-CONFIG_INPUT_POLLDEV=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
@@ -180,9 +205,9 @@ CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_GPIO=m
 CONFIG_I2C_MT65XX=y
 CONFIG_I2C_RK3X=y
-CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_I2C_SLAVE=y
 CONFIG_SPI=y
+CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_NXP_FLEXSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_MT65XX=y
@@ -201,7 +226,6 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
-CONFIG_POWER_AVS=y
 CONFIG_POWER_RESET_BRCMSTB=y
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
@@ -345,7 +369,6 @@ CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
 CONFIG_RTC_DRV_PCF2127=m
-CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_DMADEVICES=y
 CONFIG_FSL_EDMA=y
@@ -355,14 +378,14 @@ CONFIG_MTK_CQDMA=y
 CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 # CONFIG_VIRTIO_MENU is not set
-CONFIG_MFD_CROS_EC=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
 CONFIG_CROS_EC_SPI=y
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_S2MPS11=y
-CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_XGENE=y
 CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_VC5=y
@@ -380,17 +403,11 @@ CONFIG_REMOTEPROC=y
 CONFIG_MTK_CMDQ=y
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_EXTCON_USB_GPIO=y
-CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_IIO=y
 CONFIG_MAX9611=m
-CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-CONFIG_IIO_CROS_EC_SENSORS=m
-CONFIG_IIO_CROS_EC_LIGHT_PROX=m
 CONFIG_SENSORS_ISL29018=m
-CONFIG_IIO_CROS_EC_BARO=m
 CONFIG_MPL3115=m
 CONFIG_PWM=y
-CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_MTK_DISP=y
 CONFIG_PWM_MEDIATEK=y
 CONFIG_PHY_XGENE=y
@@ -417,6 +434,13 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_HUGETLBFS=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_PSTORE=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=m
+CONFIG_NFS_SWAP=y
+CONFIG_CIFS=m
+CONFIG_CIFS_STATS2=y
+CONFIG_CIFS_WEAK_PW_HASH=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
@@ -450,4 +474,4 @@ CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
-# CONFIG_STRICT_DEVMEM is not set
\ No newline at end of file
+# CONFIG_STRICT_DEVMEM is not set
diff --git a/board/chromebook/elm/patches/linux/0001-drm-bridge_connector-Set-default-status-connected-fo.patch b/board/chromebook/elm/patches/linux/0001-drm-bridge_connector-Set-default-status-connected-fo.patch
deleted file mode 100644
index f037391897..0000000000
--- a/board/chromebook/elm/patches/linux/0001-drm-bridge_connector-Set-default-status-connected-fo.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 510d0ad0ce1b51c072309ba12dfb024fc2c3dbac Mon Sep 17 00:00:00 2001
-From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Date: Wed, 26 Aug 2020 10:15:22 +0200
-Subject: [PATCH 1/5] drm/bridge_connector: Set default status connected for
- eDP connectors
-
-In an eDP application, HPD is not required and on most bridge chips
-useless. If HPD is not used, we need to set initial status as connected,
-otherwise the connector created by the drm_bridge_connector API remains
-in an unknown state.
-
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Acked-by: Sam Ravnborg <sam@ravnborg.org>
-Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
-Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>
----
- drivers/gpu/drm/drm_bridge_connector.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
-index c6994fe673f3..a58cbde59c34 100644
---- a/drivers/gpu/drm/drm_bridge_connector.c
-+++ b/drivers/gpu/drm/drm_bridge_connector.c
-@@ -187,6 +187,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
- 		case DRM_MODE_CONNECTOR_DPI:
- 		case DRM_MODE_CONNECTOR_LVDS:
- 		case DRM_MODE_CONNECTOR_DSI:
-+		case DRM_MODE_CONNECTOR_eDP:
- 			status = connector_status_connected;
- 			break;
- 		default:
--- 
-2.25.1
-
diff --git a/board/chromebook/elm/patches/linux/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch b/board/chromebook/elm/patches/linux/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch
deleted file mode 100644
index 5f7517c7b9..0000000000
--- a/board/chromebook/elm/patches/linux/0002-drm-bridge-ps8640-Get-the-EDID-from-eDP-control.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cc0f2fea61fb34ca84e4812a615e0035d812aa8b Mon Sep 17 00:00:00 2001
-From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Date: Wed, 26 Aug 2020 10:15:23 +0200
-Subject: [PATCH 2/5] drm/bridge: ps8640: Get the EDID from eDP control
-
-The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
-.get_edid callback and set the flag to indicate the core to use it.
-
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Acked-by: Sam Ravnborg <sam@ravnborg.org>
-Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
----
- drivers/gpu/drm/bridge/parade-ps8640.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
-index 4b099196afeb..13755d278db6 100644
---- a/drivers/gpu/drm/bridge/parade-ps8640.c
-+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
-@@ -242,8 +242,18 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
- 	return ret;
- }
- 
-+static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
-+					   struct drm_connector *connector)
-+{
-+	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-+
-+	return drm_get_edid(connector,
-+			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
-+}
-+
- static const struct drm_bridge_funcs ps8640_bridge_funcs = {
- 	.attach = ps8640_bridge_attach,
-+	.get_edid = ps8640_bridge_get_edid,
- 	.post_disable = ps8640_post_disable,
- 	.pre_enable = ps8640_pre_enable,
- };
-@@ -294,6 +304,8 @@ static int ps8640_probe(struct i2c_client *client)
- 
- 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
- 	ps_bridge->bridge.of_node = dev->of_node;
-+	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
-+	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
- 
- 	ps_bridge->page[PAGE0_DP_CNTL] = client;
- 
--- 
-2.25.1
-
diff --git a/board/chromebook/elm/patches/linux/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch b/board/chromebook/elm/patches/linux/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch
deleted file mode 100644
index 5f52c45424..0000000000
--- a/board/chromebook/elm/patches/linux/0003-drm-bridge-ps8640-Return-an-error-for-incorrect-atta.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 62afc499fc46c8018f40733c31a675b28f0717d8 Mon Sep 17 00:00:00 2001
-From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Date: Wed, 26 Aug 2020 10:15:24 +0200
-Subject: [PATCH 3/5] drm/bridge: ps8640: Return an error for incorrect attach
- flags
-
-Bridge drivers that implement the new model only shall return an error
-from their attach() handler when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
-is not set. So make sure we return an error because only the new
-drm_bridge model is supported.
-
-Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
-Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
----
- drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
-index 13755d278db6..ce3e8b2da8c9 100644
---- a/drivers/gpu/drm/bridge/parade-ps8640.c
-+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
-@@ -200,6 +200,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
- 						   .channel = 0,
- 						   .node = NULL,
- 						 };
-+
-+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-+		return -EINVAL;
-+
- 	/* port at 0 is ps8640 dsi input port */
- 	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
- 	if (!in_ep)
--- 
-2.25.1
-
diff --git a/board/chromebook/elm/patches/linux/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch b/board/chromebook/elm/patches/linux/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch
deleted file mode 100644
index 4ef074a6c8..0000000000
--- a/board/chromebook/elm/patches/linux/0004-drm-bridge-ps8640-Print-an-error-if-VDO-control-fail.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4897262a71cbf55d726d9174f5f646897dc13704 Mon Sep 17 00:00:00 2001
-From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Date: Wed, 26 Aug 2020 10:15:25 +0200
-Subject: [PATCH 4/5] drm/bridge: ps8640: Print an error if VDO control fails
-
-Print an error message inside ps8640_bridge_vdo_control() function when
-it fails so we can simplify a bit the callers, they will only need to
-check the error code.
-
-Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
-Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
----
- drivers/gpu/drm/bridge/parade-ps8640.c | 13 ++++++-------
- 1 file changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
-index ce3e8b2da8c9..9f7b7a9c53c5 100644
---- a/drivers/gpu/drm/bridge/parade-ps8640.c
-+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
-@@ -82,8 +82,11 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
- 	ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
- 					     sizeof(vdo_ctrl_buf),
- 					     vdo_ctrl_buf);
--	if (ret < 0)
-+	if (ret < 0) {
-+		DRM_ERROR("failed to %sable VDO: %d\n",
-+			  ctrl == ENABLE ? "en" : "dis", ret);
- 		return ret;
-+	}
- 
- 	return 0;
- }
-@@ -150,10 +153,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
- 	}
- 
- 	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
--	if (ret) {
--		DRM_ERROR("failed to enable VDO: %d\n", ret);
-+	if (ret)
- 		goto err_regulators_disable;
--	}
- 
- 	/* Switch access edp panel's edid through i2c */
- 	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
-@@ -175,9 +176,7 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
- 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
- 	int ret;
- 
--	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
--	if (ret < 0)
--		DRM_ERROR("failed to disable VDO: %d\n", ret);
-+	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
- 
- 	gpiod_set_value(ps_bridge->gpio_reset, 1);
- 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
--- 
-2.25.1
-
diff --git a/board/chromebook/elm/patches/linux/0005-drm-bridge-ps8640-Rework-power-state-handling.patch b/board/chromebook/elm/patches/linux/0005-drm-bridge-ps8640-Rework-power-state-handling.patch
deleted file mode 100644
index f682600d11..0000000000
--- a/board/chromebook/elm/patches/linux/0005-drm-bridge-ps8640-Rework-power-state-handling.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 5bb60fe7c748a0aae2bdbab10e73b2dc48c09dda Mon Sep 17 00:00:00 2001
-From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
-Date: Wed, 26 Aug 2020 10:15:26 +0200
-Subject: [PATCH 5/5] drm/bridge: ps8640: Rework power state handling
-
-The get_edid() callback can be triggered anytime by an ioctl, i.e
-
-  drm_mode_getconnector (ioctl)
-    -> drm_helper_probe_single_connector_modes
-       -> drm_bridge_connector_get_modes
-          -> ps8640_bridge_get_edid
-
-Actually if the bridge pre_enable() function was not called before
-get_edid(), the driver will not be able to get the EDID properly and
-display will not work until a second get_edid() call is issued and if
-pre_enable() is called before. The side effect of this, for example, is
-that you see anything when `Frecon` starts, neither the splash screen,
-until the graphical session manager starts.
-
-To fix this we need to make sure that all we need is enabled before
-reading the EDID. This means the following:
-
-1. If get_edid() is called before having the device powered we need to
-   power on the device. In such case, the driver will power off again the
-   device.
-
-2. If get_edid() is called after having the device powered, all should
-   just work. We added a powered flag in order to avoid recurrent calls
-   to ps8640_bridge_poweron() and unneeded delays.
-
-3. This seems to be specific for this device, but we need to make sure
-   the panel is powered on before do a power on cycle on this device.
-   Otherwise the device fails to retrieve the EDID.
-
-Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
----
- drivers/gpu/drm/bridge/parade-ps8640.c | 64 +++++++++++++++++++++++---
- 1 file changed, 58 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
-index 9f7b7a9c53c5..c5d76e209bda 100644
---- a/drivers/gpu/drm/bridge/parade-ps8640.c
-+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
-@@ -65,6 +65,7 @@ struct ps8640 {
- 	struct regulator_bulk_data supplies[2];
- 	struct gpio_desc *gpio_reset;
- 	struct gpio_desc *gpio_powerdown;
-+	bool powered;
- };
- 
- static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
-@@ -91,13 +92,15 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
- 	return 0;
- }
- 
--static void ps8640_pre_enable(struct drm_bridge *bridge)
-+static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
- {
--	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
- 	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
- 	unsigned long timeout;
- 	int ret, status;
- 
-+	if (ps_bridge->powered)
-+		return;
-+
- 	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
- 				    ps_bridge->supplies);
- 	if (ret < 0) {
-@@ -164,6 +167,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
- 		goto err_regulators_disable;
- 	}
- 
-+	ps_bridge->powered = true;
-+
- 	return;
- 
- err_regulators_disable:
-@@ -171,12 +176,12 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
- 			       ps_bridge->supplies);
- }
- 
--static void ps8640_post_disable(struct drm_bridge *bridge)
-+static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
- {
--	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
- 	int ret;
- 
--	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-+	if (!ps_bridge->powered)
-+		return;
- 
- 	gpiod_set_value(ps_bridge->gpio_reset, 1);
- 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
-@@ -184,6 +189,28 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
- 				     ps_bridge->supplies);
- 	if (ret < 0)
- 		DRM_ERROR("cannot disable regulators %d\n", ret);
-+
-+	ps_bridge->powered = false;
-+}
-+
-+static void ps8640_pre_enable(struct drm_bridge *bridge)
-+{
-+	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-+	int ret;
-+
-+	ps8640_bridge_poweron(ps_bridge);
-+
-+	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-+	if (ret < 0)
-+		ps8640_bridge_poweroff(ps_bridge);
-+}
-+
-+static void ps8640_post_disable(struct drm_bridge *bridge)
-+{
-+	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-+
-+	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-+	ps8640_bridge_poweroff(ps_bridge);
- }
- 
- static int ps8640_bridge_attach(struct drm_bridge *bridge,
-@@ -249,9 +276,34 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
- 					   struct drm_connector *connector)
- {
- 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-+	bool poweroff = !ps_bridge->powered;
-+	struct edid *edid;
-+
-+	/*
-+	 * When we end calling get_edid() triggered by an ioctl, i.e
-+	 *
-+	 *   drm_mode_getconnector (ioctl)
-+	 *     -> drm_helper_probe_single_connector_modes
-+	 *        -> drm_bridge_connector_get_modes
-+	 *           -> ps8640_bridge_get_edid
-+	 *
-+	 * We need to make sure that what we need is enabled before reading
-+	 * EDID, for this chip, we need to do a full poweron, otherwise it will
-+	 * fail.
-+	 */
-+	drm_bridge_chain_pre_enable(bridge);
- 
--	return drm_get_edid(connector,
-+	edid = drm_get_edid(connector,
- 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
-+
-+	/*
-+	 * If we call the get_edid() function without having enabled the chip
-+	 * before, return the chip to its original power state.
-+	 */
-+	if (poweroff)
-+		drm_bridge_chain_post_disable(bridge);
-+
-+	return edid;
- }
- 
- static const struct drm_bridge_funcs ps8640_bridge_funcs = {
--- 
-2.25.1
-
diff --git a/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch b/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch
deleted file mode 100644
index 43bffe5261..0000000000
--- a/board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 51109530891c981b681816152bd205724deabcca Mon Sep 17 00:00:00 2001
-From: Jitao Shi <jitao.shi@mediatek.com>
-Date: Sat, 10 Oct 2020 15:09:09 +0800
-Subject: [PATCH] Revert "drm/mediatek: dsi: Fix scrolling of panel with small
- hfp or hbp"
-
-This reverts commit 35bf948f1edbf507f6e57e0879fa6ea36d2d2930.
-
-Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
-Reviewed-by: Bilal Wasim <bilal.wasim@imgtec.com>
-Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>
----
- drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
-index 80b7a082e874..16fd99dcdacf 100644
---- a/drivers/gpu/drm/mediatek/mtk_dsi.c
-+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
-@@ -466,13 +466,14 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
- 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
- 
- 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
--		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
-+		horizontal_backporch_byte =
-+			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
- 	else
--		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
--					    dsi_tmp_buf_bpp;
-+		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
-+			dsi_tmp_buf_bpp - 10);
- 
- 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
--			  timing->da_hs_zero + timing->da_hs_exit;
-+			  timing->da_hs_zero + timing->da_hs_exit + 3;
- 
- 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
- 		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
--- 
-2.25.1
-
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 4f82370fb9..827d929631 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -2,20 +2,17 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/chromebook/elm/patches/"
-
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel (5.9 series)
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+# Linux headers same as kernel (5.10 series)
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
 
 # Build Kernel with a Custom config.
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-- 
2.25.1
