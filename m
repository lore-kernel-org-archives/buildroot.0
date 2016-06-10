From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Fri, 10 Jun 2016 16:41:56 +0300
Subject: [Buildroot] [PATCH RESEND] Bump linux kernel and u-boot versions
Message-ID: <1465566116-28333-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update kernel version to the most recent stable as of today 4.6.2
with back-ported ARC PGU support from 4.7-rc2.

Bump u-boot to 2016.05 release.
Add 1 u-boot patch to disable IOC.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Resending due to previously sent one was discarded by mailing list.

 ...drm_connector_unplug_all-to-drm_connector.patch | 118 +++
 ...troduce-drm_connector_register_all-helper.patch | 108 +++
 ...Add-support-of-ARC-PGU-display-controller.patch | 939 +++++++++++++++++++++
 ...bindings-documentation-for-ARC-PGU-displa.patch |  65 ++
 ...-Add-maintainer-for-ARC-PGU-display-contr.patch |  35 +
 .../0006-arc-axs10x-add-support-of-ARC-PGU.patch   | 119 +++
 ...use-dedicated-memory-area-for-frame-buffe.patch |  50 ++
 ...-Specify-reserved-memory-for-frame-buffer.patch | 122 +++
 ...xs10x-really-enable-ARC-PGU-in-defconfigs.patch |  83 ++
 .../u-boot/U-Boot-arc-cache-Disable-IOC.patch      |  58 ++
 configs/snps_axs101_defconfig                      |   8 +-
 configs/snps_axs103_defconfig                      |   8 +-
 12 files changed, 1707 insertions(+), 6 deletions(-)
 create mode 100644 board/synopsys/axs10x/patches/linux/0001-drm-Rename-drm_connector_unplug_all-to-drm_connector.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0002-drm-Introduce-drm_connector_register_all-helper.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0003-drm-Add-support-of-ARC-PGU-display-controller.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0004-drm-Add-DT-bindings-documentation-for-ARC-PGU-displa.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0005-MAINTAINERS-Add-maintainer-for-ARC-PGU-display-contr.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0006-arc-axs10x-add-support-of-ARC-PGU.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0007-drm-arcpgu-use-dedicated-memory-area-for-frame-buffe.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0008-ARC-axs10x-Specify-reserved-memory-for-frame-buffer.patch
 create mode 100644 board/synopsys/axs10x/patches/linux/0009-arc-axs10x-really-enable-ARC-PGU-in-defconfigs.patch
 create mode 100644 board/synopsys/axs10x/patches/u-boot/U-Boot-arc-cache-Disable-IOC.patch

diff --git a/board/synopsys/axs10x/patches/linux/0001-drm-Rename-drm_connector_unplug_all-to-drm_connector.patch b/board/synopsys/axs10x/patches/linux/0001-drm-Rename-drm_connector_unplug_all-to-drm_connector.patch
new file mode 100644
index 0000000..01c81b5
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0001-drm-Rename-drm_connector_unplug_all-to-drm_connector.patch
@@ -0,0 +1,118 @@
+From d9183a76556a3cce031c829a3360bc91fa144115 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Date: Wed, 23 Mar 2016 11:42:54 +0300
+Subject: [PATCH 1/9] drm: Rename drm_connector_unplug_all() to
+ drm_connector_unregister_all()
+
+Current name is a bit misleading because what that helper function
+really does it calls drm_connector_unregister() for all connectors.
+
+This all has nothing to do with hotplugging so let's name things
+properly.
+
+And while at it remove potentially dangerous locking around
+drm_connector_unregister() in rcar_du_remove() as mentioned
+in kerneldoc for drm_connector_unregister_all().
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Daniel Vetter <daniel@ffwll.ch>
+Cc: David Airlie <airlied@linux.ie>
+Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
+Cc: linux-renesas-soc at vger.kernel.org
+Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: http://patchwork.freedesktop.org/patch/msgid/1458722577-20283-2-git-send-email-abrodkin at synopsys.com
+---
+ drivers/gpu/drm/drm_crtc.c            | 18 +++++++++---------
+ drivers/gpu/drm/rcar-du/rcar_du_drv.c |  5 +----
+ drivers/gpu/drm/udl/udl_drv.c         |  2 +-
+ include/drm/drm_crtc.h                |  4 ++--
+ 4 files changed, 13 insertions(+), 16 deletions(-)
+
+diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
+index e08f962..55ffde5 100644
+--- a/drivers/gpu/drm/drm_crtc.c
++++ b/drivers/gpu/drm/drm_crtc.c
+@@ -1067,25 +1067,25 @@ void drm_connector_unregister(struct drm_connector *connector)
+ }
+ EXPORT_SYMBOL(drm_connector_unregister);
+ 
+-
+ /**
+- * drm_connector_unplug_all - unregister connector userspace interfaces
++ * drm_connector_unregister_all - unregister connector userspace interfaces
+  * @dev: drm device
+  *
+- * This function unregisters all connector userspace interfaces in sysfs. Should
+- * be call when the device is disconnected, e.g. from an usb driver's
+- * ->disconnect callback.
++ * This functions unregisters all connectors from sysfs and other places so
++ * that userspace can no longer access them. Drivers should call this as the
++ * first step tearing down the device instace, or when the underlying
++ * physical device disappeared (e.g. USB unplug), right before calling
++ * drm_dev_unregister().
+  */
+-void drm_connector_unplug_all(struct drm_device *dev)
++void drm_connector_unregister_all(struct drm_device *dev)
+ {
+ 	struct drm_connector *connector;
+ 
+ 	/* FIXME: taking the mode config mutex ends up in a clash with sysfs */
+-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
++	drm_for_each_connector(connector, dev)
+ 		drm_connector_unregister(connector);
+-
+ }
+-EXPORT_SYMBOL(drm_connector_unplug_all);
++EXPORT_SYMBOL(drm_connector_unregister_all);
+ 
+ /**
+  * drm_encoder_init - Init a preallocated encoder
+diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+index ed6006b..644db36 100644
+--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
++++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+@@ -278,10 +278,7 @@ static int rcar_du_remove(struct platform_device *pdev)
+ 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
+ 	struct drm_device *ddev = rcdu->ddev;
+ 
+-	mutex_lock(&ddev->mode_config.mutex);
+-	drm_connector_unplug_all(ddev);
+-	mutex_unlock(&ddev->mode_config.mutex);
+-
++	drm_connector_unregister_all(ddev);
+ 	drm_dev_unregister(ddev);
+ 
+ 	if (rcdu->fbdev)
+diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
+index 772ec9e..c204089 100644
+--- a/drivers/gpu/drm/udl/udl_drv.c
++++ b/drivers/gpu/drm/udl/udl_drv.c
+@@ -94,7 +94,7 @@ static void udl_usb_disconnect(struct usb_interface *interface)
+ 	struct drm_device *dev = usb_get_intfdata(interface);
+ 
+ 	drm_kms_helper_poll_disable(dev);
+-	drm_connector_unplug_all(dev);
++	drm_connector_unregister_all(dev);
+ 	udl_fbdev_unplug(dev);
+ 	udl_drop_usb(dev);
+ 	drm_unplug_dev(dev);
+diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
+index e0170bf..bc7fbb57 100644
+--- a/include/drm/drm_crtc.h
++++ b/include/drm/drm_crtc.h
+@@ -2259,8 +2259,8 @@ static inline unsigned drm_connector_index(struct drm_connector *connector)
+ 	return connector->connector_id;
+ }
+ 
+-/* helper to unplug all connectors from sysfs for device */
+-extern void drm_connector_unplug_all(struct drm_device *dev);
++/* helper to unregister all connectors from sysfs for device */
++extern void drm_connector_unregister_all(struct drm_device *dev);
+ 
+ extern int drm_bridge_add(struct drm_bridge *bridge);
+ extern void drm_bridge_remove(struct drm_bridge *bridge);
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0002-drm-Introduce-drm_connector_register_all-helper.patch b/board/synopsys/axs10x/patches/linux/0002-drm-Introduce-drm_connector_register_all-helper.patch
new file mode 100644
index 0000000..aced6e9
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0002-drm-Introduce-drm_connector_register_all-helper.patch
@@ -0,0 +1,108 @@
+From eac9046b00a52554577bdf8a5b88e9c5c359bd05 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
+Date: Tue, 19 Apr 2016 15:24:51 +0300
+Subject: [PATCH 2/9] drm: Introduce drm_connector_register_all() helper
+
+As a pair to already existing drm_connector_unregister_all() we're adding
+generic implementation of what is already done in some drivers.
+
+Once this helper is implemented we'll be ready to switch existing
+driver-specific implementations with the generic one.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Daniel Vetter <daniel@ffwll.ch>
+Cc: David Airlie <airlied@linux.ie>
+Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Link: http://patchwork.freedesktop.org/patch/msgid/1461068693-11260-2-git-send-email-abrodkin at synopsys.com
+---
+ drivers/gpu/drm/drm_crtc.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ drivers/gpu/drm/drm_drv.c  |  6 +++++-
+ include/drm/drm_crtc.h     |  3 ++-
+ 3 files changed, 47 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
+index 55ffde5..0936af2 100644
+--- a/drivers/gpu/drm/drm_crtc.c
++++ b/drivers/gpu/drm/drm_crtc.c
+@@ -1068,6 +1068,46 @@ void drm_connector_unregister(struct drm_connector *connector)
+ EXPORT_SYMBOL(drm_connector_unregister);
+ 
+ /**
++ * drm_connector_register_all - register all connectors
++ * @dev: drm device
++ *
++ * This function registers all connectors in sysfs and other places so that
++ * userspace can start to access them. Drivers can call it after calling
++ * drm_dev_register() to complete the device registration, if they don't call
++ * drm_connector_register() on each connector individually.
++ *
++ * When a device is unplugged and should be removed from userspace access,
++ * call drm_connector_unregister_all(), which is the inverse of this
++ * function.
++ *
++ * Returns:
++ * Zero on success, error code on failure.
++ */
++int drm_connector_register_all(struct drm_device *dev)
++{
++	struct drm_connector *connector;
++	int ret;
++
++	mutex_lock(&dev->mode_config.mutex);
++
++	drm_for_each_connector(connector, dev) {
++		ret = drm_connector_register(connector);
++		if (ret)
++			goto err;
++	}
++
++	mutex_unlock(&dev->mode_config.mutex);
++
++	return 0;
++
++err:
++	mutex_unlock(&dev->mode_config.mutex);
++	drm_connector_unregister_all(dev);
++	return ret;
++}
++EXPORT_SYMBOL(drm_connector_register_all);
++
++/**
+  * drm_connector_unregister_all - unregister connector userspace interfaces
+  * @dev: drm device
+  *
+diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
+index 167c8d3..2c9a2b6 100644
+--- a/drivers/gpu/drm/drm_drv.c
++++ b/drivers/gpu/drm/drm_drv.c
+@@ -715,7 +715,11 @@ EXPORT_SYMBOL(drm_dev_unref);
+  *
+  * Register the DRM device @dev with the system, advertise device to user-space
+  * and start normal device operation. @dev must be allocated via drm_dev_alloc()
+- * previously.
++ * previously. Right after drm_dev_register() the driver should call
++ * drm_connector_register_all() to register all connectors in sysfs. This is
++ * a separate call for backward compatibility with drivers still using
++ * the deprecated ->load() callback, where connectors are registered from within
++ * the ->load() callback.
+  *
+  * Never call this twice on any device!
+  *
+diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
+index bc7fbb57..6d3a3eb 100644
+--- a/include/drm/drm_crtc.h
++++ b/include/drm/drm_crtc.h
+@@ -2259,7 +2259,8 @@ static inline unsigned drm_connector_index(struct drm_connector *connector)
+ 	return connector->connector_id;
+ }
+ 
+-/* helper to unregister all connectors from sysfs for device */
++/* helpers to {un}register all connectors from sysfs for device */
++extern int drm_connector_register_all(struct drm_device *dev);
+ extern void drm_connector_unregister_all(struct drm_device *dev);
+ 
+ extern int drm_bridge_add(struct drm_bridge *bridge);
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0003-drm-Add-support-of-ARC-PGU-display-controller.patch b/board/synopsys/axs10x/patches/linux/0003-drm-Add-support-of-ARC-PGU-display-controller.patch
new file mode 100644
index 0000000..0a58c20
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0003-drm-Add-support-of-ARC-PGU-display-controller.patch
@@ -0,0 +1,939 @@
+From 872c022bf547f33281adcc9fff39aa4a1ec334a9 Mon Sep 17 00:00:00 2001
+From: Carlos Palminha <palminha@synopsys.com>
+Date: Fri, 19 Feb 2016 15:30:26 +0300
+Subject: [PATCH 3/9] drm: Add support of ARC PGU display controller
+
+ARC PGU could be found on some development boards from Synopsys.
+This is a simple byte streamer that reads data from a framebuffer
+and sends data to the single encoder.
+
+Signed-off-by: Carlos Palminha <palminha@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: David Airlie <airlied@linux.ie>
+Cc: dri-devel at lists.freedesktop.org
+Cc: linux-snps-arc at lists.infradead.org
+---
+ drivers/gpu/drm/Kconfig           |   2 +
+ drivers/gpu/drm/Makefile          |   1 +
+ drivers/gpu/drm/arc/Kconfig       |  10 ++
+ drivers/gpu/drm/arc/Makefile      |   2 +
+ drivers/gpu/drm/arc/arcpgu.h      |  50 +++++++
+ drivers/gpu/drm/arc/arcpgu_crtc.c | 257 ++++++++++++++++++++++++++++++++++
+ drivers/gpu/drm/arc/arcpgu_drv.c  | 282 ++++++++++++++++++++++++++++++++++++++
+ drivers/gpu/drm/arc/arcpgu_hdmi.c | 201 +++++++++++++++++++++++++++
+ drivers/gpu/drm/arc/arcpgu_regs.h |  40 ++++++
+ 9 files changed, 845 insertions(+)
+ create mode 100644 drivers/gpu/drm/arc/Kconfig
+ create mode 100644 drivers/gpu/drm/arc/Makefile
+ create mode 100644 drivers/gpu/drm/arc/arcpgu.h
+ create mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
+ create mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
+ create mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
+ create mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
+
+diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
+index f2a74d0..9e4f2f1 100644
+--- a/drivers/gpu/drm/Kconfig
++++ b/drivers/gpu/drm/Kconfig
+@@ -281,3 +281,5 @@ source "drivers/gpu/drm/imx/Kconfig"
+ source "drivers/gpu/drm/vc4/Kconfig"
+ 
+ source "drivers/gpu/drm/etnaviv/Kconfig"
++
++source "drivers/gpu/drm/arc/Kconfig"
+diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
+index 6eb94fc..c338d04 100644
+--- a/drivers/gpu/drm/Makefile
++++ b/drivers/gpu/drm/Makefile
+@@ -78,3 +78,4 @@ obj-y			+= panel/
+ obj-y			+= bridge/
+ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
+ obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
++obj-$(CONFIG_DRM_ARCPGU)+= arc/
+diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
+new file mode 100644
+index 0000000..f9a13b6
+--- /dev/null
++++ b/drivers/gpu/drm/arc/Kconfig
+@@ -0,0 +1,10 @@
++config DRM_ARCPGU
++	tristate "ARC PGU"
++	depends on DRM && OF
++	select DRM_KMS_CMA_HELPER
++	select DRM_KMS_FB_HELPER
++	select DRM_KMS_HELPER
++	help
++	  Choose this option if you have an ARC PGU controller.
++
++	  If M is selected the module will be called arcpgu.
+diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
+new file mode 100644
+index 0000000..d48fda7
+--- /dev/null
++++ b/drivers/gpu/drm/arc/Makefile
+@@ -0,0 +1,2 @@
++arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_drv.o
++obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
+diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
+new file mode 100644
+index 0000000..86574b6
+--- /dev/null
++++ b/drivers/gpu/drm/arc/arcpgu.h
+@@ -0,0 +1,50 @@
++/*
++ * ARC PGU DRM driver.
++ *
++ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#ifndef _ARCPGU_H_
++#define _ARCPGU_H_
++
++struct arcpgu_drm_private {
++	void __iomem		*regs;
++	struct clk		*clk;
++	struct drm_fbdev_cma	*fbdev;
++	struct drm_framebuffer	*fb;
++	struct list_head	event_list;
++	struct drm_crtc		crtc;
++	struct drm_plane	*plane;
++};
++
++#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
++
++static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
++				 unsigned int reg, u32 value)
++{
++	iowrite32(value, arcpgu->regs + reg);
++}
++
++static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
++			       unsigned int reg)
++{
++	return ioread32(arcpgu->regs + reg);
++}
++
++int arc_pgu_setup_crtc(struct drm_device *dev);
++int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
++struct drm_fbdev_cma *arcpgu_fbdev_cma_init(struct drm_device *dev,
++	unsigned int preferred_bpp, unsigned int num_crtc,
++	unsigned int max_conn_count);
++
++#endif
+diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
+new file mode 100644
+index 0000000..92f8bef
+--- /dev/null
++++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
+@@ -0,0 +1,257 @@
++/*
++ * ARC PGU DRM driver.
++ *
++ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#include <drm/drm_atomic_helper.h>
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_fb_cma_helper.h>
++#include <drm/drm_gem_cma_helper.h>
++#include <drm/drm_plane_helper.h>
++#include <linux/clk.h>
++#include <linux/platform_data/simplefb.h>
++
++#include "arcpgu.h"
++#include "arcpgu_regs.h"
++
++#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
++
++static struct simplefb_format supported_formats[] = {
++	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 },
++	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 },
++};
++
++static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++	uint32_t pixel_format = crtc->primary->state->fb->pixel_format;
++	struct simplefb_format *format = NULL;
++	int i;
++
++	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
++		if (supported_formats[i].fourcc == pixel_format)
++			format = &supported_formats[i];
++	}
++
++	if (WARN_ON(!format))
++		return;
++
++	if (format->fourcc == DRM_FORMAT_RGB888)
++		arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
++			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
++					   ARCPGU_MODE_RGB888_MASK);
++
++}
++
++static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
++	.destroy = drm_crtc_cleanup,
++	.set_config = drm_atomic_helper_set_config,
++	.page_flip = drm_atomic_helper_page_flip,
++	.reset = drm_atomic_helper_crtc_reset,
++	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
++	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
++};
++
++static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++	struct drm_display_mode *m = &crtc->state->adjusted_mode;
++	u32 val;
++
++	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
++		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
++
++	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
++		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
++				    m->crtc_hsync_end - m->crtc_hdisplay));
++
++	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
++		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
++				    m->crtc_vsync_end - m->crtc_vdisplay));
++
++	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
++		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
++				    m->crtc_vblank_end - m->crtc_vblank_start));
++
++	val = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
++
++	if (m->flags & DRM_MODE_FLAG_PVSYNC)
++		val |= ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST;
++	else
++		val &= ~(ARCPGU_CTRL_VS_POL_MASK << ARCPGU_CTRL_VS_POL_OFST);
++
++	if (m->flags & DRM_MODE_FLAG_PHSYNC)
++		val |= ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST;
++	else
++		val &= ~(ARCPGU_CTRL_HS_POL_MASK << ARCPGU_CTRL_HS_POL_OFST);
++
++	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, val);
++	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
++	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
++
++	arc_pgu_set_pxl_fmt(crtc);
++
++	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
++}
++
++static void arc_pgu_crtc_enable(struct drm_crtc *crtc)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++
++	clk_prepare_enable(arcpgu->clk);
++	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
++		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
++		      ARCPGU_CTRL_ENABLE_MASK);
++}
++
++static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++
++	if (!crtc->primary->fb)
++		return;
++
++	clk_disable_unprepare(arcpgu->clk);
++	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
++			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
++			      ~ARCPGU_CTRL_ENABLE_MASK);
++}
++
++static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
++				     struct drm_crtc_state *state)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++	struct drm_display_mode *mode = &state->adjusted_mode;
++	long rate, clk_rate = mode->clock * 1000;
++
++	rate = clk_round_rate(arcpgu->clk, clk_rate);
++	if (rate != clk_rate)
++		return -EINVAL;
++
++	return 0;
++}
++
++static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
++				      struct drm_crtc_state *state)
++{
++	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
++	unsigned long flags;
++
++	if (crtc->state->event) {
++		struct drm_pending_vblank_event *event = crtc->state->event;
++
++		crtc->state->event = NULL;
++		event->pipe = drm_crtc_index(crtc);
++
++		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
++
++		spin_lock_irqsave(&crtc->dev->event_lock, flags);
++		list_add_tail(&event->base.link, &arcpgu->event_list);
++		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
++	}
++}
++
++static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
++	.mode_set	= drm_helper_crtc_mode_set,
++	.mode_set_base	= drm_helper_crtc_mode_set_base,
++	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
++	.enable		= arc_pgu_crtc_enable,
++	.disable	= arc_pgu_crtc_disable,
++	.prepare	= arc_pgu_crtc_disable,
++	.commit		= arc_pgu_crtc_enable,
++	.atomic_check	= arc_pgu_crtc_atomic_check,
++	.atomic_begin	= arc_pgu_crtc_atomic_begin,
++};
++
++static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
++					struct drm_plane_state *state)
++{
++	struct arcpgu_drm_private *arcpgu;
++	struct drm_gem_cma_object *gem;
++
++	if (!plane->state->crtc || !plane->state->fb)
++		return;
++
++	arcpgu = crtc_to_arcpgu_priv(plane->state->crtc);
++	gem = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
++	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
++}
++
++static const struct drm_plane_helper_funcs arc_pgu_plane_helper_funcs = {
++	.prepare_fb = NULL,
++	.cleanup_fb = NULL,
++	.atomic_update = arc_pgu_plane_atomic_update,
++};
++
++static void arc_pgu_plane_destroy(struct drm_plane *plane)
++{
++	drm_plane_helper_disable(plane);
++	drm_plane_cleanup(plane);
++}
++
++static const struct drm_plane_funcs arc_pgu_plane_funcs = {
++	.update_plane		= drm_atomic_helper_update_plane,
++	.disable_plane		= drm_atomic_helper_disable_plane,
++	.destroy		= arc_pgu_plane_destroy,
++	.reset			= drm_atomic_helper_plane_reset,
++	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
++	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
++};
++
++static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
++{
++	struct arcpgu_drm_private *arcpgu = drm->dev_private;
++	struct drm_plane *plane = NULL;
++	u32 formats[ARRAY_SIZE(supported_formats)], i;
++	int ret;
++
++	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
++	if (!plane)
++		return ERR_PTR(-ENOMEM);
++
++	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
++		formats[i] = supported_formats[i].fourcc;
++
++	ret = drm_universal_plane_init(drm, plane, 0xff, &arc_pgu_plane_funcs,
++				       formats, ARRAY_SIZE(formats),
++				       DRM_PLANE_TYPE_PRIMARY, NULL);
++	if (ret)
++		return ERR_PTR(ret);
++
++	drm_plane_helper_add(plane, &arc_pgu_plane_helper_funcs);
++	arcpgu->plane = plane;
++
++	return plane;
++}
++
++int arc_pgu_setup_crtc(struct drm_device *drm)
++{
++	struct arcpgu_drm_private *arcpgu = drm->dev_private;
++	struct drm_plane *primary;
++	int ret;
++
++	primary = arc_pgu_plane_init(drm);
++	if (IS_ERR(primary))
++		return PTR_ERR(primary);
++
++	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, primary, NULL,
++					&arc_pgu_crtc_funcs, NULL);
++	if (ret) {
++		arc_pgu_plane_destroy(primary);
++		return ret;
++	}
++
++	drm_crtc_helper_add(&arcpgu->crtc, &arc_pgu_crtc_helper_funcs);
++	return 0;
++}
+diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
+new file mode 100644
+index 0000000..5b35e5db
+--- /dev/null
++++ b/drivers/gpu/drm/arc/arcpgu_drv.c
+@@ -0,0 +1,282 @@
++/*
++ * ARC PGU DRM driver.
++ *
++ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#include <linux/clk.h>
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_fb_cma_helper.h>
++#include <drm/drm_gem_cma_helper.h>
++#include <drm/drm_atomic_helper.h>
++
++#include "arcpgu.h"
++#include "arcpgu_regs.h"
++
++static void arcpgu_fb_output_poll_changed(struct drm_device *dev)
++{
++	struct arcpgu_drm_private *arcpgu = dev->dev_private;
++
++	if (arcpgu->fbdev)
++		drm_fbdev_cma_hotplug_event(arcpgu->fbdev);
++}
++
++static int arcpgu_atomic_commit(struct drm_device *dev,
++				    struct drm_atomic_state *state, bool async)
++{
++	return drm_atomic_helper_commit(dev, state, false);
++}
++
++static struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
++	.fb_create  = drm_fb_cma_create,
++	.output_poll_changed = arcpgu_fb_output_poll_changed,
++	.atomic_check = drm_atomic_helper_check,
++	.atomic_commit = arcpgu_atomic_commit,
++};
++
++static void arcpgu_setup_mode_config(struct drm_device *drm)
++{
++	drm_mode_config_init(drm);
++	drm->mode_config.min_width = 0;
++	drm->mode_config.min_height = 0;
++	drm->mode_config.max_width = 1920;
++	drm->mode_config.max_height = 1080;
++	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
++}
++
++int arcpgu_gem_mmap(struct file *filp, struct vm_area_struct *vma)
++{
++	int ret;
++
++	ret = drm_gem_mmap(filp, vma);
++	if (ret)
++		return ret;
++
++	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
++	return 0;
++}
++
++static const struct file_operations arcpgu_drm_ops = {
++	.owner = THIS_MODULE,
++	.open = drm_open,
++	.release = drm_release,
++	.unlocked_ioctl = drm_ioctl,
++#ifdef CONFIG_COMPAT
++	.compat_ioctl = drm_compat_ioctl,
++#endif
++	.poll = drm_poll,
++	.read = drm_read,
++	.llseek = no_llseek,
++	.mmap = arcpgu_gem_mmap,
++};
++
++static void arcpgu_preclose(struct drm_device *drm, struct drm_file *file)
++{
++	struct arcpgu_drm_private *arcpgu = drm->dev_private;
++	struct drm_pending_vblank_event *e, *t;
++	unsigned long flags;
++
++	spin_lock_irqsave(&drm->event_lock, flags);
++	list_for_each_entry_safe(e, t, &arcpgu->event_list, base.link) {
++		if (e->base.file_priv != file)
++			continue;
++		list_del(&e->base.link);
++		e->base.destroy(&e->base);
++	}
++	spin_unlock_irqrestore(&drm->event_lock, flags);
++}
++
++static void arcpgu_lastclose(struct drm_device *drm)
++{
++	struct arcpgu_drm_private *arcpgu = drm->dev_private;
++
++	drm_fbdev_cma_restore_mode(arcpgu->fbdev);
++}
++
++static int arcpgu_load(struct drm_device *drm)
++{
++	struct platform_device *pdev = to_platform_device(drm->dev);
++	struct arcpgu_drm_private *arcpgu;
++	struct device_node *encoder_node;
++	struct resource *res;
++	int ret;
++
++	arcpgu = devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
++	if (arcpgu == NULL)
++		return -ENOMEM;
++
++	drm->dev_private = arcpgu;
++
++	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
++	if (IS_ERR(arcpgu->clk))
++		return PTR_ERR(arcpgu->clk);
++
++	INIT_LIST_HEAD(&arcpgu->event_list);
++
++	arcpgu_setup_mode_config(drm);
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	arcpgu->regs = devm_ioremap_resource(&pdev->dev, res);
++	if (IS_ERR(arcpgu->regs)) {
++		dev_err(drm->dev, "Could not remap IO mem\n");
++		return PTR_ERR(arcpgu->regs);
++	}
++
++	dev_info(drm->dev, "arc_pgu ID: 0x%x\n",
++		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
++
++	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
++		return -ENODEV;
++
++	if (arc_pgu_setup_crtc(drm) < 0)
++		return -ENODEV;
++
++	/* find the encoder node and initialize it */
++	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
++	if (!encoder_node) {
++		dev_err(drm->dev, "failed to get an encoder slave node\n");
++		return -ENODEV;
++	}
++
++	ret = arcpgu_drm_hdmi_init(drm, encoder_node);
++	if (ret < 0)
++		return ret;
++
++	drm_mode_config_reset(drm);
++	drm_kms_helper_poll_init(drm);
++
++	arcpgu->fbdev = drm_fbdev_cma_init(drm, 16,
++					      drm->mode_config.num_crtc,
++					      drm->mode_config.num_connector);
++	if (IS_ERR(arcpgu->fbdev)) {
++		ret = PTR_ERR(arcpgu->fbdev);
++		arcpgu->fbdev = NULL;
++		return -ENODEV;
++	}
++
++	platform_set_drvdata(pdev, arcpgu);
++	return 0;
++}
++
++int arcpgu_unload(struct drm_device *drm)
++{
++	struct arcpgu_drm_private *arcpgu = drm->dev_private;
++
++	if (arcpgu->fbdev) {
++		drm_fbdev_cma_fini(arcpgu->fbdev);
++		arcpgu->fbdev = NULL;
++	}
++	drm_kms_helper_poll_fini(drm);
++	drm_vblank_cleanup(drm);
++	drm_mode_config_cleanup(drm);
++
++	return 0;
++}
++
++static struct drm_driver arcpgu_drm_driver = {
++	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
++			   DRIVER_ATOMIC,
++	.preclose = arcpgu_preclose,
++	.lastclose = arcpgu_lastclose,
++	.name = "drm-arcpgu",
++	.desc = "ARC PGU Controller",
++	.date = "20160219",
++	.major = 1,
++	.minor = 0,
++	.patchlevel = 0,
++	.fops = &arcpgu_drm_ops,
++	.dumb_create = drm_gem_cma_dumb_create,
++	.dumb_map_offset = drm_gem_cma_dumb_map_offset,
++	.dumb_destroy = drm_gem_dumb_destroy,
++	.get_vblank_counter = drm_vblank_no_hw_counter,
++	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
++	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
++	.gem_free_object = drm_gem_cma_free_object,
++	.gem_vm_ops = &drm_gem_cma_vm_ops,
++	.gem_prime_export = drm_gem_prime_export,
++	.gem_prime_import = drm_gem_prime_import,
++	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
++	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
++	.gem_prime_vmap = drm_gem_cma_prime_vmap,
++	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
++	.gem_prime_mmap = drm_gem_cma_prime_mmap,
++};
++
++static int arcpgu_probe(struct platform_device *pdev)
++{
++	struct drm_device *drm;
++	int ret;
++
++	drm = drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
++	if (!drm)
++		return -ENOMEM;
++
++	ret = arcpgu_load(drm);
++	if (ret)
++		goto err_unref;
++
++	ret = drm_dev_register(drm, 0);
++	if (ret)
++		goto err_unload;
++
++	ret = drm_connector_register_all(drm);
++	if (ret)
++		goto err_unregister;
++
++	return 0;
++
++err_unregister:
++	drm_dev_unregister(drm);
++
++err_unload:
++	arcpgu_unload(drm);
++
++err_unref:
++	drm_dev_unref(drm);
++
++	return ret;
++}
++
++static int arcpgu_remove(struct platform_device *pdev)
++{
++	struct drm_device *drm = platform_get_drvdata(pdev);
++
++	drm_connector_unregister_all(drm);
++	drm_dev_unregister(drm);
++	arcpgu_unload(drm);
++	drm_dev_unref(drm);
++
++	return 0;
++}
++
++static const struct of_device_id arcpgu_of_table[] = {
++	{.compatible = "snps,arcpgu"},
++	{}
++};
++
++MODULE_DEVICE_TABLE(of, arcpgu_of_table);
++
++static struct platform_driver arcpgu_platform_driver = {
++	.probe = arcpgu_probe,
++	.remove = arcpgu_remove,
++	.driver = {
++		   .name = "arcpgu",
++		   .of_match_table = arcpgu_of_table,
++		   },
++};
++
++module_platform_driver(arcpgu_platform_driver);
++
++MODULE_AUTHOR("Carlos Palminha <palminha@synopsys.com>");
++MODULE_DESCRIPTION("ARC PGU DRM driver");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
+new file mode 100644
+index 0000000..08b6bae
+--- /dev/null
++++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
+@@ -0,0 +1,201 @@
++/*
++ * ARC PGU DRM driver.
++ *
++ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_encoder_slave.h>
++#include <drm/drm_atomic_helper.h>
++
++#include "arcpgu.h"
++
++struct arcpgu_drm_connector {
++	struct drm_connector connector;
++	struct drm_encoder_slave *encoder_slave;
++};
++
++static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
++{
++	const struct drm_encoder_slave_funcs *sfuncs;
++	struct drm_encoder_slave *slave;
++	struct arcpgu_drm_connector *con =
++		container_of(connector, struct arcpgu_drm_connector, connector);
++
++	slave = con->encoder_slave;
++	if (slave == NULL) {
++		dev_err(connector->dev->dev,
++			"connector_get_modes: cannot find slave encoder for connector\n");
++		return 0;
++	}
++
++	sfuncs = slave->slave_funcs;
++	if (sfuncs->get_modes == NULL)
++		return 0;
++
++	return sfuncs->get_modes(&slave->base, connector);
++}
++
++struct drm_encoder *
++arcpgu_drm_connector_best_encoder(struct drm_connector *connector)
++{
++	struct drm_encoder_slave *slave;
++	struct arcpgu_drm_connector *con =
++		container_of(connector, struct arcpgu_drm_connector, connector);
++
++	slave = con->encoder_slave;
++	if (slave == NULL) {
++		dev_err(connector->dev->dev,
++			"connector_best_encoder: cannot find slave encoder for connector\n");
++		return NULL;
++	}
++
++	return &slave->base;
++}
++
++static enum drm_connector_status
++arcpgu_drm_connector_detect(struct drm_connector *connector, bool force)
++{
++	enum drm_connector_status status = connector_status_unknown;
++	const struct drm_encoder_slave_funcs *sfuncs;
++	struct drm_encoder_slave *slave;
++
++	struct arcpgu_drm_connector *con =
++		container_of(connector, struct arcpgu_drm_connector, connector);
++
++	slave = con->encoder_slave;
++	if (slave == NULL) {
++		dev_err(connector->dev->dev,
++			"connector_detect: cannot find slave encoder for connector\n");
++		return status;
++	}
++
++	sfuncs = slave->slave_funcs;
++	if (sfuncs && sfuncs->detect)
++		return sfuncs->detect(&slave->base, connector);
++
++	dev_err(connector->dev->dev, "connector_detect: could not detect slave funcs\n");
++	return status;
++}
++
++static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
++{
++	drm_connector_unregister(connector);
++	drm_connector_cleanup(connector);
++}
++
++static const struct drm_connector_helper_funcs
++arcpgu_drm_connector_helper_funcs = {
++	.get_modes = arcpgu_drm_connector_get_modes,
++	.best_encoder = arcpgu_drm_connector_best_encoder,
++};
++
++static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
++	.dpms = drm_helper_connector_dpms,
++	.reset = drm_atomic_helper_connector_reset,
++	.detect = arcpgu_drm_connector_detect,
++	.fill_modes = drm_helper_probe_single_connector_modes,
++	.destroy = arcpgu_drm_connector_destroy,
++	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
++	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
++};
++
++static struct drm_encoder_helper_funcs arcpgu_drm_encoder_helper_funcs = {
++	.dpms = drm_i2c_encoder_dpms,
++	.mode_fixup = drm_i2c_encoder_mode_fixup,
++	.mode_set = drm_i2c_encoder_mode_set,
++	.prepare = drm_i2c_encoder_prepare,
++	.commit = drm_i2c_encoder_commit,
++	.detect = drm_i2c_encoder_detect,
++};
++
++static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
++	.destroy = drm_encoder_cleanup,
++};
++
++int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
++{
++	struct arcpgu_drm_connector *arcpgu_connector;
++	struct drm_i2c_encoder_driver *driver;
++	struct drm_encoder_slave *encoder;
++	struct drm_connector *connector;
++	struct i2c_client *i2c_slave;
++	int ret;
++
++	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
++	if (encoder == NULL)
++		return -ENOMEM;
++
++	i2c_slave = of_find_i2c_device_by_node(np);
++	if (!i2c_slave || !i2c_get_clientdata(i2c_slave)) {
++		dev_err(drm->dev, "failed to find i2c slave encoder\n");
++		return -EPROBE_DEFER;
++	}
++
++	if (i2c_slave->dev.driver == NULL) {
++		dev_err(drm->dev, "failed to find i2c slave driver\n");
++		return -EPROBE_DEFER;
++	}
++
++	driver =
++	    to_drm_i2c_encoder_driver(to_i2c_driver(i2c_slave->dev.driver));
++	ret = driver->encoder_init(i2c_slave, drm, encoder);
++	if (ret) {
++		dev_err(drm->dev, "failed to initialize i2c encoder slave\n");
++		return ret;
++	}
++
++	encoder->base.possible_crtcs = 1;
++	encoder->base.possible_clones = 0;
++	ret = drm_encoder_init(drm, &encoder->base, &arcpgu_drm_encoder_funcs,
++			       DRM_MODE_ENCODER_TMDS, NULL);
++	if (ret)
++		return ret;
++
++	drm_encoder_helper_add(&encoder->base,
++			       &arcpgu_drm_encoder_helper_funcs);
++
++	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
++					GFP_KERNEL);
++	if (!arcpgu_connector) {
++		ret = -ENOMEM;
++		goto error_encoder_cleanup;
++	}
++
++	connector = &arcpgu_connector->connector;
++	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
++	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
++			DRM_MODE_CONNECTOR_HDMIA);
++	if (ret < 0) {
++		dev_err(drm->dev, "failed to initialize drm connector\n");
++		goto error_encoder_cleanup;
++	}
++
++	ret = drm_mode_connector_attach_encoder(connector, &encoder->base);
++	if (ret < 0) {
++		dev_err(drm->dev, "could not attach connector to encoder\n");
++		drm_connector_unregister(connector);
++		goto error_connector_cleanup;
++	}
++
++	arcpgu_connector->encoder_slave = encoder;
++
++	return 0;
++
++error_connector_cleanup:
++	drm_connector_cleanup(connector);
++
++error_encoder_cleanup:
++	drm_encoder_cleanup(&encoder->base);
++	return ret;
++}
+diff --git a/drivers/gpu/drm/arc/arcpgu_regs.h b/drivers/gpu/drm/arc/arcpgu_regs.h
+new file mode 100644
+index 0000000..95a13a8
+--- /dev/null
++++ b/drivers/gpu/drm/arc/arcpgu_regs.h
+@@ -0,0 +1,40 @@
++/*
++ * ARC PGU DRM driver.
++ *
++ * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ */
++
++#ifndef _ARC_PGU_REGS_H_
++#define _ARC_PGU_REGS_H_
++
++#define ARCPGU_REG_CTRL		0x00
++#define ARCPGU_REG_STAT		0x04
++#define ARCPGU_REG_FMT		0x10
++#define ARCPGU_REG_HSYNC	0x14
++#define ARCPGU_REG_VSYNC	0x18
++#define ARCPGU_REG_ACTIVE	0x1c
++#define ARCPGU_REG_BUF0_ADDR	0x40
++#define ARCPGU_REG_STRIDE	0x50
++#define ARCPGU_REG_START_SET	0x84
++
++#define ARCPGU_REG_ID		0x3FC
++
++#define ARCPGU_CTRL_ENABLE_MASK	0x02
++#define ARCPGU_CTRL_VS_POL_MASK	0x1
++#define ARCPGU_CTRL_VS_POL_OFST	0x3
++#define ARCPGU_CTRL_HS_POL_MASK	0x1
++#define ARCPGU_CTRL_HS_POL_OFST	0x4
++#define ARCPGU_MODE_RGB888_MASK	0x04
++#define ARCPGU_STAT_BUSY_MASK	0x02
++
++#endif
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0004-drm-Add-DT-bindings-documentation-for-ARC-PGU-displa.patch b/board/synopsys/axs10x/patches/linux/0004-drm-Add-DT-bindings-documentation-for-ARC-PGU-displa.patch
new file mode 100644
index 0000000..388a469
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0004-drm-Add-DT-bindings-documentation-for-ARC-PGU-displa.patch
@@ -0,0 +1,65 @@
+From 847811b6c7bad952bcdefd22e5c404b0def22db9 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 19 Feb 2016 15:35:52 +0300
+Subject: [PATCH 4/9] drm: Add DT bindings documentation for ARC PGU display
+ controller
+
+This add DT bindings documentation for ARC PGU display controller.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Pawel Moll <pawel.moll@arm.com>
+Cc: Mark Rutland <mark.rutland@arm.com>
+Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
+Cc: Kumar Gala <galak@codeaurora.org>
+Cc: devicetree at vger.kernel.org
+Cc: linux-snps-arc at lists.infradead.org
+Acked-by: Rob Herring <robh@kernel.org>
+---
+ .../devicetree/bindings/display/snps,arcpgu.txt    | 35 ++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/display/snps,arcpgu.txt
+
+diff --git a/Documentation/devicetree/bindings/display/snps,arcpgu.txt b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+new file mode 100644
+index 0000000..c5c7dfd
+--- /dev/null
++++ b/Documentation/devicetree/bindings/display/snps,arcpgu.txt
+@@ -0,0 +1,35 @@
++ARC PGU
++
++This is a display controller found on several development boards produced
++by Synopsys. The ARC PGU is an RGB streamer that reads the data from a
++framebuffer and sends it to a single digital encoder (usually HDMI).
++
++Required properties:
++  - compatible: "snps,arcpgu"
++  - reg: Physical base address and length of the controller's registers.
++  - clocks: A list of phandle + clock-specifier pairs, one for each
++    entry in 'clock-names'.
++  - clock-names: A list of clock names. For ARC PGU it should contain:
++      - "pxlclk" for the clock feeding the output PLL of the controller.
++
++Required sub-nodes:
++  - port: The PGU connection to an encoder chip.
++
++Example:
++
++/ {
++	...
++
++	pgu at XXXXXXXX {
++		compatible = "snps,arcpgu";
++		reg = <0xXXXXXXXX 0x400>;
++		clocks = <&clock_node>;
++		clock-names = "pxlclk";
++
++		port {
++			pgu_output: endpoint {
++				remote-endpoint = <&hdmi_enc_input>;
++			};
++		};
++	};
++};
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0005-MAINTAINERS-Add-maintainer-for-ARC-PGU-display-contr.patch b/board/synopsys/axs10x/patches/linux/0005-MAINTAINERS-Add-maintainer-for-ARC-PGU-display-contr.patch
new file mode 100644
index 0000000..38094a7
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0005-MAINTAINERS-Add-maintainer-for-ARC-PGU-display-contr.patch
@@ -0,0 +1,35 @@
+From a9560ce58248df0452e6122a8ed5e131eed0bd78 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 19 Feb 2016 15:34:30 +0300
+Subject: [PATCH 5/9] MAINTAINERS: Add maintainer for ARC PGU display
+ controller
+
+This updates MAINTEINERS file with information about maintainer of
+ARC PGU display controller driver.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: linux-snps-arc at lists.infradead.org
+---
+ MAINTAINERS | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9c567a4..8a3efa4 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -847,6 +847,12 @@ S:	Maintained
+ F:	drivers/net/arcnet/
+ F:	include/uapi/linux/if_arcnet.h
+ 
++ARC PGU DRM DRIVER
++M:	Alexey Brodkin <abrodkin@synopsys.com>
++S:	Supported
++F:	drivers/gpu/drm/arc/
++F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
++
+ ARM HDLCD DRM DRIVER
+ M:	Liviu Dudau <liviu.dudau@arm.com>
+ S:	Supported
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0006-arc-axs10x-add-support-of-ARC-PGU.patch b/board/synopsys/axs10x/patches/linux/0006-arc-axs10x-add-support-of-ARC-PGU.patch
new file mode 100644
index 0000000..4bd460e
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0006-arc-axs10x-add-support-of-ARC-PGU.patch
@@ -0,0 +1,119 @@
+From 97ad37b548e57d172f1c7bda3683e10fbde42245 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 19 Feb 2016 15:19:43 +0300
+Subject: [PATCH 6/9] arc: axs10x - add support of ARC PGU
+
+Synopsys DesignWare ARC SDP boards sport ARC SDP display
+controller attached to ADV7511 HDMI encoder.
+
+That change adds desctiption of both ARC PGU and ADV7511 in
+ARC SDP'd base-board Device Tree.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Rob Herring <robh+dt@kernel.org>
+Cc: Pawel Moll <pawel.moll@arm.com>
+Cc: Mark Rutland <mark.rutland@arm.com>
+Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
+Cc: Kumar Gala <galak@codeaurora.org>
+Cc: Vineet Gupta <vgupta@synopsys.com>
+Cc: devicetree at vger.kernel.org
+Cc: linux-snps-arc at lists.infradead.org
+---
+ arch/arc/boot/dts/axs10x_mb.dtsi | 61 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 61 insertions(+)
+
+diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
+index 44a578c..8fee596 100644
+--- a/arch/arc/boot/dts/axs10x_mb.dtsi
++++ b/arch/arc/boot/dts/axs10x_mb.dtsi
+@@ -34,6 +34,12 @@
+ 				clock-frequency = <50000000>;
+ 				#clock-cells = <0>;
+ 			};
++
++			pguclk: pguclk {
++				#clock-cells = <0>;
++				compatible = "fixed-clock";
++				clock-frequency = <74440000>;
++			};
+ 		};
+ 
+ 		ethernet at 0x18000 {
+@@ -147,6 +153,37 @@
+ 			clocks = <&i2cclk>;
+ 			interrupts = <16>;
+ 
++			adv7511:adv7511 at 39{
++				compatible="adi,adv7511";
++				reg = <0x39>;
++				interrupts = <23>;
++				adi,input-depth = <8>;
++				adi,input-colorspace = "rgb";
++				adi,input-clock = "1x";
++				adi,clock-delay = <0x03>;
++
++				ports {
++					#address-cells = <1>;
++					#size-cells = <0>;
++
++					/* RGB/YUV input */
++					port at 0 {
++						reg = <0>;
++						adv7511_input:endpoint {
++						remote-endpoint = <&pgu_output>;
++						};
++					};
++
++					/* HDMI output */
++					port at 1 {
++						reg = <1>;
++						adv7511_output: endpoint {
++							remote-endpoint = <&hdmi_connector_in>;
++						};
++					};
++				};
++			};
++
+ 			eeprom at 0x54{
+ 				compatible = "24c01";
+ 				reg = <0x54>;
+@@ -160,6 +197,16 @@
+ 			};
+ 		};
+ 
++		hdmi0: connector {
++			compatible = "hdmi-connector";
++			type = "a";
++			port {
++				hdmi_connector_in: endpoint {
++					remote-endpoint = <&adv7511_output>;
++				};
++			};
++		};
++
+ 		gpio0:gpio at 13000 {
+ 			compatible = "snps,dw-apb-gpio";
+ 			reg = <0x13000 0x1000>;
+@@ -221,5 +268,19 @@
+ 				reg = <2>;
+ 			};
+ 		};
++
++		pgu at 17000 {
++			compatible = "snps,arcpgu";
++			reg = <0x17000 0x400>;
++			encoder-slave = <&adv7511>;
++			clocks = <&pguclk>;
++			clock-names = "pxlclk";
++
++			port {
++				pgu_output: endpoint {
++					remote-endpoint = <&adv7511_input>;
++				};
++			};
++		};
+ 	};
+ };
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0007-drm-arcpgu-use-dedicated-memory-area-for-frame-buffe.patch b/board/synopsys/axs10x/patches/linux/0007-drm-arcpgu-use-dedicated-memory-area-for-frame-buffe.patch
new file mode 100644
index 0000000..f777942
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0007-drm-arcpgu-use-dedicated-memory-area-for-frame-buffe.patch
@@ -0,0 +1,50 @@
+From 44e7c78c9337ddba898a34339a626acd766ccadf Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Wed, 27 Apr 2016 16:02:39 +0300
+Subject: [PATCH 7/9] drm/arcpgu: use dedicated memory area for frame buffer
+
+Now when ARC supports reserved memory areas and
+per-device coherent DMA allocations we may switch ARC PGU
+to use of those dedicated areas.
+
+One of the benefits we may move frame-buffer area out
+from IO Coherency aperture and so significantly
+reduce IOC utilization allowing less demanding
+peripherals to use all perks of IOC.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Cc: Dave Airlie <airlied@gmail.com>
+Cc: Daniel Vetter <daniel@ffwll.ch>
+Cc: linux-kernel at vger.kernel.org
+Cc: linux-snps-arc at lists.infradead.org
+---
+ drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
+index 5b35e5db..76e187a 100644
+--- a/drivers/gpu/drm/arc/arcpgu_drv.c
++++ b/drivers/gpu/drm/arc/arcpgu_drv.c
+@@ -19,6 +19,7 @@
+ #include <drm/drm_fb_cma_helper.h>
+ #include <drm/drm_gem_cma_helper.h>
+ #include <drm/drm_atomic_helper.h>
++#include <linux/of_reserved_mem.h>
+ 
+ #include "arcpgu.h"
+ #include "arcpgu_regs.h"
+@@ -135,6 +136,11 @@ static int arcpgu_load(struct drm_device *drm)
+ 	dev_info(drm->dev, "arc_pgu ID: 0x%x\n",
+ 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
+ 
++	/* Get the optional framebuffer memory resource */
++	ret = of_reserved_mem_device_init(drm->dev);
++	if (ret && ret != -ENODEV)
++		return ret;
++
+ 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
+ 		return -ENODEV;
+ 
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0008-ARC-axs10x-Specify-reserved-memory-for-frame-buffer.patch b/board/synopsys/axs10x/patches/linux/0008-ARC-axs10x-Specify-reserved-memory-for-frame-buffer.patch
new file mode 100644
index 0000000..d0bb01b
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0008-ARC-axs10x-Specify-reserved-memory-for-frame-buffer.patch
@@ -0,0 +1,122 @@
+From 1712f2b1b36e7b606f5ecb4b4a23affb8682cc7c Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Wed, 27 Apr 2016 16:59:50 +0300
+Subject: [PATCH 8/9] ARC: [axs10x] Specify reserved memory for frame buffer
+
+Allocation of a frame buffer memory in a special memory region
+allows bypassing of so-called IO Coherency aperture
+which is typically set as a range 0x8z-0xAz.
+
+I.e. all data traffic to PGU bypasses IO Coherency block
+and saves its bandwidth for other peripherals.
+
+Even though for AXS101 (which sorts ARC770 CPU) IOC is not
+an option for a sake of keeping one DT description for the
+base-board (axs10x_mb.dtsi) we're still defining reserved
+memory location in the very end of DDR.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Acked-by: Vineet Gupta <vgupta@synopsys.com>
+Cc: devicetree at vger.kernel.org
+---
+ arch/arc/boot/dts/axc001.dtsi     | 22 ++++++++++++++++++++--
+ arch/arc/boot/dts/axc003.dtsi     | 14 ++++++++++++++
+ arch/arc/boot/dts/axc003_idu.dtsi | 14 ++++++++++++++
+ arch/arc/boot/dts/axs10x_mb.dtsi  |  2 +-
+ 4 files changed, 49 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
+index 420dcfd..262496a 100644
+--- a/arch/arc/boot/dts/axc001.dtsi
++++ b/arch/arc/boot/dts/axc001.dtsi
+@@ -93,8 +93,26 @@
+ 	memory {
+ 		#address-cells = <1>;
+ 		#size-cells = <1>;
+-		ranges = <0x00000000 0x80000000 0x40000000>;
++		ranges = <0x00000000 0x80000000 0x20000000>;
+ 		device_type = "memory";
+-		reg = <0x80000000 0x20000000>;	/* 512MiB */
++		reg = <0x80000000 0x1b000000>;	/* (512 - 32) MiB */
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++		/*
++		 * We just move frame buffer area to the very end of
++		 * available DDR. And even though in case of ARC770 there's
++		 * no strict requirement for a frame-buffer to be in any
++		 * particular location it allows us to use the same
++		 * base board's DT node for ARC PGU as for ARc HS38.
++		 */
++		frame_buffer: frame_buffer at 9e000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x9e000000 0x2000000>;
++			no-map;
++		};
+ 	};
+ };
+diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
+index f90fadf..35ece04 100644
+--- a/arch/arc/boot/dts/axc003.dtsi
++++ b/arch/arc/boot/dts/axc003.dtsi
+@@ -100,4 +100,18 @@
+ 		device_type = "memory";
+ 		reg = <0x80000000 0x20000000>;	/* 512MiB */
+ 	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++		/*
++		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
++		 */
++		frame_buffer: frame_buffer at be000000 {
++			compatible = "shared-dma-pool";
++			reg = <0xbe000000 0x2000000>;
++			no-map;
++		};
++	};
+ };
+diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
+index 06a9f29..df9ddb6 100644
+--- a/arch/arc/boot/dts/axc003_idu.dtsi
++++ b/arch/arc/boot/dts/axc003_idu.dtsi
+@@ -123,4 +123,18 @@
+ 		device_type = "memory";
+ 		reg = <0x80000000 0x20000000>;	/* 512MiB */
+ 	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++		/*
++		 * Move frame buffer out of IOC aperture (0x8z-0xAz).
++		 */
++		frame_buffer: frame_buffer at be000000 {
++			compatible = "shared-dma-pool";
++			reg = <0xbe000000 0x2000000>;
++			no-map;
++		};
++	};
+ };
+diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
+index 8fee596..c3ecb5e 100644
+--- a/arch/arc/boot/dts/axs10x_mb.dtsi
++++ b/arch/arc/boot/dts/axs10x_mb.dtsi
+@@ -275,7 +275,7 @@
+ 			encoder-slave = <&adv7511>;
+ 			clocks = <&pguclk>;
+ 			clock-names = "pxlclk";
+-
++			memory-region = <&frame_buffer>;
+ 			port {
+ 				pgu_output: endpoint {
+ 					remote-endpoint = <&adv7511_input>;
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/linux/0009-arc-axs10x-really-enable-ARC-PGU-in-defconfigs.patch b/board/synopsys/axs10x/patches/linux/0009-arc-axs10x-really-enable-ARC-PGU-in-defconfigs.patch
new file mode 100644
index 0000000..be039af
--- /dev/null
+++ b/board/synopsys/axs10x/patches/linux/0009-arc-axs10x-really-enable-ARC-PGU-in-defconfigs.patch
@@ -0,0 +1,83 @@
+From 06a1d78b98ab18b98f278fcba9c7d37e55553d8f Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 4 Mar 2016 14:20:10 +0300
+Subject: [PATCH 9/9] arc: axs10x: really enable ARC PGU in defconfigs
+
+Previous patch only added device tree description and
+this one adds selection of all required components in defconfgs.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/boot/dts/axs101.dts          | 2 +-
+ arch/arc/boot/dts/axs103_idu.dts      | 2 +-
+ arch/arc/configs/axs101_defconfig     | 4 ++++
+ arch/arc/configs/axs103_smp_defconfig | 4 ++++
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arc/boot/dts/axs101.dts b/arch/arc/boot/dts/axs101.dts
+index 3f9b058..445c3e4 100644
+--- a/arch/arc/boot/dts/axs101.dts
++++ b/arch/arc/boot/dts/axs101.dts
+@@ -16,6 +16,6 @@
+ 	compatible = "snps,axs101", "snps,arc-sdp";
+ 
+ 	chosen {
+-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0";
++		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=1280x720 at 60";
+ 	};
+ };
+diff --git a/arch/arc/boot/dts/axs103_idu.dts b/arch/arc/boot/dts/axs103_idu.dts
+index f999fef..783557e 100644
+--- a/arch/arc/boot/dts/axs103_idu.dts
++++ b/arch/arc/boot/dts/axs103_idu.dts
+@@ -19,6 +19,6 @@
+ 	compatible = "snps,axs103", "snps,arc-sdp";
+ 
+ 	chosen {
+-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=ttyS3,115200n8 debug print-fatal-signals=1";
++		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 debug print-fatal-signals=1 consoleblank=0 video=1280x720 at 60";
+ 	};
+ };
+diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
+index 6cdffea..222f2c1 100644
+--- a/arch/arc/configs/axs101_defconfig
++++ b/arch/arc/configs/axs101_defconfig
+@@ -71,11 +71,15 @@ CONFIG_SERIAL_OF_PLATFORM=y
+ CONFIG_I2C=y
+ CONFIG_I2C_CHARDEV=y
+ CONFIG_I2C_DESIGNWARE_PLATFORM=y
++CONFIG_DRM=y
++CONFIG_DRM_ARCPGU=y
+ # CONFIG_HWMON is not set
+ CONFIG_FB=y
+ CONFIG_FRAMEBUFFER_CONSOLE=y
+ CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+ CONFIG_LOGO=y
++CONFIG_DRM_FBDEV_EMULATION=y
++CONFIG_DRM_I2C_ADV7511=y
+ # CONFIG_LOGO_LINUX_MONO is not set
+ # CONFIG_LOGO_LINUX_VGA16 is not set
+ # CONFIG_LOGO_LINUX_CLUT224 is not set
+diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
+index b25ee73..e4d3e5f 100644
+--- a/arch/arc/configs/axs103_smp_defconfig
++++ b/arch/arc/configs/axs103_smp_defconfig
+@@ -73,11 +73,15 @@ CONFIG_SERIAL_OF_PLATFORM=y
+ CONFIG_I2C=y
+ CONFIG_I2C_CHARDEV=y
+ CONFIG_I2C_DESIGNWARE_PLATFORM=y
++CONFIG_DRM=y
++CONFIG_DRM_ARCPGU=y
+ # CONFIG_HWMON is not set
+ CONFIG_FB=y
+ CONFIG_FRAMEBUFFER_CONSOLE=y
+ CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+ CONFIG_LOGO=y
++CONFIG_DRM_FBDEV_EMULATION=y
++CONFIG_DRM_I2C_ADV7511=y
+ # CONFIG_LOGO_LINUX_MONO is not set
+ # CONFIG_LOGO_LINUX_VGA16 is not set
+ # CONFIG_LOGO_LINUX_CLUT224 is not set
+-- 
+2.5.5
+
diff --git a/board/synopsys/axs10x/patches/u-boot/U-Boot-arc-cache-Disable-IOC.patch b/board/synopsys/axs10x/patches/u-boot/U-Boot-arc-cache-Disable-IOC.patch
new file mode 100644
index 0000000..6eb7dc9
--- /dev/null
+++ b/board/synopsys/axs10x/patches/u-boot/U-Boot-arc-cache-Disable-IOC.patch
@@ -0,0 +1,58 @@
+From 9a6dd15b56b5bb005290d0e4f51e76d384b6c1e6 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 25 Apr 2016 13:21:01 +0300
+Subject: [PATCH] arc/cache: Disable IOC
+
+As of today there's no way in U-Boot to distinguish
+cache operations on data being DMAed to or from memory
+and all those CPUs do them selves on memory.
+
+If IOC block was detected we disabled all cache operations
+and that was completely fine for data being transferred
+by means of DMA simply because IOC did its work and
+made sure data is coherent.
+
+But except DMA that changes memory in U-Boot
+we sometimes need to alter memory contents as well.
+And it applies not only to data but to instructions as well.
+These are 2 very good examples:
+ 1) U-Boot's self relocation
+ 2) Kick-start of slave cores in SMP systems
+
+In both above cases we modify code and if instructions
+caches of CPUs won't be updated until that new code gets
+pushed out of data cache of the core which made modification
+to either SLC or in external memory (if there's no SLC).
+
+So until there's a good and clean solution on cache management for
+2 separate cases (DMA and instructions) we'll disable IOC in U-Boot.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/lib/cache.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arc/lib/cache.c b/arch/arc/lib/cache.c
+index d1fb661..b52d7be 100644
+--- a/arch/arc/lib/cache.c
++++ b/arch/arc/lib/cache.c
+@@ -148,7 +148,7 @@ static void read_decode_cache_bcr_arcv2(void)
+ 		slc_exists = 1;
+ 		slc_line_sz = (slc_cfg.fields.lsz == 0) ? 128 : 64;
+ 	}
+-
++#if 0 /* Disable IOC due to inability to distinguish ops on DMA data and not */
+ 	union {
+ 		struct bcr_clust_cfg {
+ #ifdef CONFIG_CPU_BIG_ENDIAN
+@@ -163,6 +163,7 @@ static void read_decode_cache_bcr_arcv2(void)
+ 	cbcr.word = read_aux_reg(ARC_BCR_CLUSTER);
+ 	if (cbcr.fields.c)
+ 		ioc_exists = 1;
++#endif
+ }
+ #endif
+ 
+-- 
+2.5.0
+
diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index 08def3e..7d11fc4 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -9,17 +9,19 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
 # Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.2"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
+BR2_LINUX_KERNEL_PATCH="board/synopsys/axs10x/patches/linux/"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
+BR2_TARGET_UBOOT_PATCH="board/synopsys/axs10x/patches/u-boot/"
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index d997508..6d43ec1 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -10,17 +10,19 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
 # Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.2"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
+BR2_LINUX_KERNEL_PATCH="board/synopsys/axs10x/patches/linux/"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
+BR2_TARGET_UBOOT_PATCH="board/synopsys/axs10x/patches/u-boot/"
-- 
2.5.5
