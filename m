From: Bilal Wasim <bilalwasim676@gmail.com>
Date: Mon, 21 Sep 2020 23:12:46 +0500
Subject: [Buildroot] [PATCH 3/3] boards: chromebook: Add support of
 Chromebook Elm
In-Reply-To: <20200921181246.88781-1-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
Message-ID: <20200921181246.88781-4-bilalwasim676@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds supports for building buildroot kernel + rootfs
for MT8173 Elm board, also known as Chromebook Elm
(https://www.acer.com/ac/en/US/content/series/acerchromebookr13).

Though Chrome-OS is officially supproted on this board, the
mainline kernel works as well (benchmarks + conformance), and so
the 5.9 kernel is used. As the 5.9 kernel isn't yet released, we
use the 5.9-rc5 for now, which will be up-revd to 5.9 once its
released.

Using the mainline kernel means that we have to apply certain
patches to get the HDMI screen working. These patches are lying
in the "drm-misc-next" list and will make it to the kernel after
5.9. At that time, we will remove the patches and point buildroot
to use the latest kernel (hopefully, 5.10).

This commit also adds an ITS file(for creating FIT images), an ARGS
file(for providing kernel args) and a "sign.sh" script to generate
signed kernel images.

Additionally a readme is added to help the user get started.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
---
 board/chromebook/elm/kernel.args              |   1 +
 board/chromebook/elm/kernel.its               |  38 ++
 board/chromebook/elm/linux-5.9-elm-hdmi.patch | 404 ++++++++++++++++
 board/chromebook/elm/linux.config             | 453 ++++++++++++++++++
 board/chromebook/elm/readme.txt               |  56 +++
 board/chromebook/elm/sign.sh                  |  41 ++
 6 files changed, 993 insertions(+)
 create mode 100644 board/chromebook/elm/kernel.args
 create mode 100644 board/chromebook/elm/kernel.its
 create mode 100644 board/chromebook/elm/linux-5.9-elm-hdmi.patch
 create mode 100644 board/chromebook/elm/linux.config
 create mode 100644 board/chromebook/elm/readme.txt
 create mode 100644 board/chromebook/elm/sign.sh

diff --git a/board/chromebook/elm/kernel.args b/board/chromebook/elm/kernel.args
new file mode 100644
index 0000000000..848e179d68
--- /dev/null
+++ b/board/chromebook/elm/kernel.args
@@ -0,0 +1 @@
+root=PARTUUID=%U/PARTNROFF=1 rootwait rw noinitrd kern_guid=%U console=tty0
diff --git a/board/chromebook/elm/kernel.its b/board/chromebook/elm/kernel.its
new file mode 100644
index 0000000000..b92f8adb1f
--- /dev/null
+++ b/board/chromebook/elm/kernel.its
@@ -0,0 +1,38 @@
+/dts-v1/;
+  
+/ {
+	description = "Chrome OS kernel image with FDT";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			data = /incbin/("Image");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0>;
+			entry = <0>;
+		};
+
+		fdt-1 {
+			description = "mt8173-elm.dtb";
+			data = /incbin/("mt8173-elm.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		default = "conf-1";
+		conf-1 {
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+	};
+};
diff --git a/board/chromebook/elm/linux-5.9-elm-hdmi.patch b/board/chromebook/elm/linux-5.9-elm-hdmi.patch
new file mode 100644
index 0000000000..7f549dcc6d
--- /dev/null
+++ b/board/chromebook/elm/linux-5.9-elm-hdmi.patch
@@ -0,0 +1,404 @@
+From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+To: linux-kernel at vger.kernel.org
+Cc: Collabora Kernel ML <kernel@collabora.com>, matthias.bgg at gmail.com,
+        drinkcat at chromium.org, hsinyi at chromium.org,
+        laurent.pinchart at ideasonboard.com, sam at ravnborg.org,
+        Daniel Vetter <daniel@ffwll.ch>,
+        David Airlie <airlied@linux.ie>,
+        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
+        Maxime Ripard <mripard@kernel.org>,
+        Thomas Zimmermann <tzimmermann@suse.de>,
+        dri-devel at lists.freedesktop.org
+Subject: [PATCH v2 1/5] drm/bridge_connector: Set default status connected for
+ eDP connectors
+Date: Wed, 26 Aug 2020 10:15:22 +0200
+
+In an eDP application, HPD is not required and on most bridge chips
+useless. If HPD is not used, we need to set initial status as connected,
+otherwise the connector created by the drm_bridge_connector API remains
+in an unknown state.
+
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Acked-by: Sam Ravnborg <sam@ravnborg.org>
+Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
+Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>
+---
+
+Changes in v2:
+- Included the patch `drm/bridge_connector: Set default status connected for eDP connectors`
+
+ drivers/gpu/drm/drm_bridge_connector.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
+index c6994fe673f3..a58cbde59c34 100644
+--- a/drivers/gpu/drm/drm_bridge_connector.c
++++ b/drivers/gpu/drm/drm_bridge_connector.c
+@@ -187,6 +187,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
+ 		case DRM_MODE_CONNECTOR_DPI:
+ 		case DRM_MODE_CONNECTOR_LVDS:
+ 		case DRM_MODE_CONNECTOR_DSI:
++		case DRM_MODE_CONNECTOR_eDP:
+ 			status = connector_status_connected;
+ 			break;
+ 		default:
+
+From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+To: linux-kernel at vger.kernel.org
+Cc: Collabora Kernel ML <kernel@collabora.com>, matthias.bgg at gmail.com,
+        drinkcat at chromium.org, hsinyi at chromium.org,
+        laurent.pinchart at ideasonboard.com, sam at ravnborg.org,
+        Andrzej Hajda <a.hajda@samsung.com>,
+        Daniel Vetter <daniel@ffwll.ch>,
+        David Airlie <airlied@linux.ie>,
+        Jernej Skrabec <jernej.skrabec@siol.net>,
+        Jonas Karlman <jonas@kwiboo.se>,
+        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
+        Neil Armstrong <narmstrong@baylibre.com>,
+        dri-devel at lists.freedesktop.org
+Subject: [PATCH v2 2/5] drm/bridge: ps8640: Get the EDID from eDP control
+Date: Wed, 26 Aug 2020 10:15:23 +0200
+
+The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
+.get_edid callback and set the flag to indicate the core to use it.
+
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Acked-by: Sam Ravnborg <sam@ravnborg.org>
+Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+---
+
+Changes in v2:
+- Included the patch `drm/bridge: ps8640: Get the EDID from eDP control`
+
+ drivers/gpu/drm/bridge/parade-ps8640.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
+index 4b099196afeb..13755d278db6 100644
+--- a/drivers/gpu/drm/bridge/parade-ps8640.c
++++ b/drivers/gpu/drm/bridge/parade-ps8640.c
+@@ -242,8 +242,18 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
+ 	return ret;
+ }
+ 
++static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
++					   struct drm_connector *connector)
++{
++	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
++
++	return drm_get_edid(connector,
++			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
++}
++
+ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
+ 	.attach = ps8640_bridge_attach,
++	.get_edid = ps8640_bridge_get_edid,
+ 	.post_disable = ps8640_post_disable,
+ 	.pre_enable = ps8640_pre_enable,
+ };
+@@ -294,6 +304,8 @@ static int ps8640_probe(struct i2c_client *client)
+ 
+ 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
+ 	ps_bridge->bridge.of_node = dev->of_node;
++	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
++	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
+ 
+ 	ps_bridge->page[PAGE0_DP_CNTL] = client;
+ 
+From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+To: linux-kernel at vger.kernel.org
+Cc: Collabora Kernel ML <kernel@collabora.com>, matthias.bgg at gmail.com,
+        drinkcat at chromium.org, hsinyi at chromium.org,
+        laurent.pinchart at ideasonboard.com, sam at ravnborg.org,
+        Andrzej Hajda <a.hajda@samsung.com>,
+        Daniel Vetter <daniel@ffwll.ch>,
+        David Airlie <airlied@linux.ie>,
+        Jernej Skrabec <jernej.skrabec@siol.net>,
+        Jonas Karlman <jonas@kwiboo.se>,
+        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
+        Neil Armstrong <narmstrong@baylibre.com>,
+        dri-devel at lists.freedesktop.org
+Subject: [PATCH v2 3/5] drm/bridge: ps8640: Return an error for incorrect
+ attach flags
+Date: Wed, 26 Aug 2020 10:15:24 +0200
+
+Bridge drivers that implement the new model only shall return an error
+from their attach() handler when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
+is not set. So make sure we return an error because only the new
+drm_bridge model is supported.
+
+Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
+Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
+Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>
+---
+
+Changes in v2: None
+
+ drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
+index 13755d278db6..ce3e8b2da8c9 100644
+--- a/drivers/gpu/drm/bridge/parade-ps8640.c
++++ b/drivers/gpu/drm/bridge/parade-ps8640.c
+@@ -200,6 +200,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
+ 						   .channel = 0,
+ 						   .node = NULL,
+ 						 };
++
++	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
++		return -EINVAL;
++
+ 	/* port at 0 is ps8640 dsi input port */
+ 	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+ 	if (!in_ep)
+
+From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+To: linux-kernel at vger.kernel.org
+Cc: Collabora Kernel ML <kernel@collabora.com>, matthias.bgg at gmail.com,
+        drinkcat at chromium.org, hsinyi at chromium.org,
+        laurent.pinchart at ideasonboard.com, sam at ravnborg.org,
+        Andrzej Hajda <a.hajda@samsung.com>,
+        Daniel Vetter <daniel@ffwll.ch>,
+        David Airlie <airlied@linux.ie>,
+        Jernej Skrabec <jernej.skrabec@siol.net>,
+        Jonas Karlman <jonas@kwiboo.se>,
+        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
+        Neil Armstrong <narmstrong@baylibre.com>,
+        dri-devel at lists.freedesktop.org
+Subject: [PATCH v2 4/5] drm/bridge: ps8640: Print an error if VDO control
+ fails
+Date: Wed, 26 Aug 2020 10:15:25 +0200
+
+Print an error message inside ps8640_bridge_vdo_control() function when
+it fails so we can simplify a bit the callers, they will only need to
+check the error code.
+
+Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
+Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+Reviewed-by: Bilal Wasim <bwasim.lkml@gmail.com>
+Tested-by: Bilal Wasim <bwasim.lkml@gmail.com>
+---
+
+Changes in v2: None
+
+ drivers/gpu/drm/bridge/parade-ps8640.c | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
+index ce3e8b2da8c9..9f7b7a9c53c5 100644
+--- a/drivers/gpu/drm/bridge/parade-ps8640.c
++++ b/drivers/gpu/drm/bridge/parade-ps8640.c
+@@ -82,8 +82,11 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
+ 	ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
+ 					     sizeof(vdo_ctrl_buf),
+ 					     vdo_ctrl_buf);
+-	if (ret < 0)
++	if (ret < 0) {
++		DRM_ERROR("failed to %sable VDO: %d\n",
++			  ctrl == ENABLE ? "en" : "dis", ret);
+ 		return ret;
++	}
+ 
+ 	return 0;
+ }
+@@ -150,10 +153,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
+ 	}
+ 
+ 	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
+-	if (ret) {
+-		DRM_ERROR("failed to enable VDO: %d\n", ret);
++	if (ret)
+ 		goto err_regulators_disable;
+-	}
+ 
+ 	/* Switch access edp panel's edid through i2c */
+ 	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
+@@ -175,9 +176,7 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
+ 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+ 	int ret;
+ 
+-	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
+-	if (ret < 0)
+-		DRM_ERROR("failed to disable VDO: %d\n", ret);
++	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
+ 
+ 	gpiod_set_value(ps_bridge->gpio_reset, 1);
+ 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
+
+From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+To: linux-kernel at vger.kernel.org
+Cc: Collabora Kernel ML <kernel@collabora.com>, matthias.bgg at gmail.com,
+        drinkcat at chromium.org, hsinyi at chromium.org,
+        laurent.pinchart at ideasonboard.com, sam at ravnborg.org,
+        Andrzej Hajda <a.hajda@samsung.com>,
+        Daniel Vetter <daniel@ffwll.ch>,
+        David Airlie <airlied@linux.ie>,
+        Jernej Skrabec <jernej.skrabec@siol.net>,
+        Jonas Karlman <jonas@kwiboo.se>,
+        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
+        Neil Armstrong <narmstrong@baylibre.com>,
+        dri-devel at lists.freedesktop.org
+Subject: [PATCH v2 5/5] drm/bridge: ps8640: Rework power state handling
+Date: Wed, 26 Aug 2020 10:15:26 +0200
+
+The get_edid() callback can be triggered anytime by an ioctl, i.e
+
+  drm_mode_getconnector (ioctl)
+    -> drm_helper_probe_single_connector_modes
+       -> drm_bridge_connector_get_modes
+          -> ps8640_bridge_get_edid
+
+Actually if the bridge pre_enable() function was not called before
+get_edid(), the driver will not be able to get the EDID properly and
+display will not work until a second get_edid() call is issued and if
+pre_enable() is called before. The side effect of this, for example, is
+that you see anything when `Frecon` starts, neither the splash screen,
+until the graphical session manager starts.
+
+To fix this we need to make sure that all we need is enabled before
+reading the EDID. This means the following:
+
+1. If get_edid() is called before having the device powered we need to
+   power on the device. In such case, the driver will power off again the
+   device.
+
+2. If get_edid() is called after having the device powered, all should
+   just work. We added a powered flag in order to avoid recurrent calls
+   to ps8640_bridge_poweron() and unneeded delays.
+
+3. This seems to be specific for this device, but we need to make sure
+   the panel is powered on before do a power on cycle on this device.
+   Otherwise the device fails to retrieve the EDID.
+
+Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
+---
+
+Changes in v2:
+- Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)
+
+ drivers/gpu/drm/bridge/parade-ps8640.c | 64 +++++++++++++++++++++++---
+ 1 file changed, 58 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
+index 9f7b7a9c53c5..c5d76e209bda 100644
+--- a/drivers/gpu/drm/bridge/parade-ps8640.c
++++ b/drivers/gpu/drm/bridge/parade-ps8640.c
+@@ -65,6 +65,7 @@ struct ps8640 {
+ 	struct regulator_bulk_data supplies[2];
+ 	struct gpio_desc *gpio_reset;
+ 	struct gpio_desc *gpio_powerdown;
++	bool powered;
+ };
+ 
+ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
+@@ -91,13 +92,15 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
+ 	return 0;
+ }
+ 
+-static void ps8640_pre_enable(struct drm_bridge *bridge)
++static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
+ {
+-	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+ 	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
+ 	unsigned long timeout;
+ 	int ret, status;
+ 
++	if (ps_bridge->powered)
++		return;
++
+ 	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
+ 				    ps_bridge->supplies);
+ 	if (ret < 0) {
+@@ -164,6 +167,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
+ 		goto err_regulators_disable;
+ 	}
+ 
++	ps_bridge->powered = true;
++
+ 	return;
+ 
+ err_regulators_disable:
+@@ -171,12 +176,12 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
+ 			       ps_bridge->supplies);
+ }
+ 
+-static void ps8640_post_disable(struct drm_bridge *bridge)
++static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
+ {
+-	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+ 	int ret;
+ 
+-	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
++	if (!ps_bridge->powered)
++		return;
+ 
+ 	gpiod_set_value(ps_bridge->gpio_reset, 1);
+ 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
+@@ -184,6 +189,28 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
+ 				     ps_bridge->supplies);
+ 	if (ret < 0)
+ 		DRM_ERROR("cannot disable regulators %d\n", ret);
++
++	ps_bridge->powered = false;
++}
++
++static void ps8640_pre_enable(struct drm_bridge *bridge)
++{
++	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
++	int ret;
++
++	ps8640_bridge_poweron(ps_bridge);
++
++	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
++	if (ret < 0)
++		ps8640_bridge_poweroff(ps_bridge);
++}
++
++static void ps8640_post_disable(struct drm_bridge *bridge)
++{
++	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
++
++	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
++	ps8640_bridge_poweroff(ps_bridge);
+ }
+ 
+ static int ps8640_bridge_attach(struct drm_bridge *bridge,
+@@ -249,9 +276,34 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
+ 					   struct drm_connector *connector)
+ {
+ 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
++	bool poweroff = !ps_bridge->powered;
++	struct edid *edid;
++
++	/*
++	 * When we end calling get_edid() triggered by an ioctl, i.e
++	 *
++	 *   drm_mode_getconnector (ioctl)
++	 *     -> drm_helper_probe_single_connector_modes
++	 *        -> drm_bridge_connector_get_modes
++	 *           -> ps8640_bridge_get_edid
++	 *
++	 * We need to make sure that what we need is enabled before reading
++	 * EDID, for this chip, we need to do a full poweron, otherwise it will
++	 * fail.
++	 */
++	drm_bridge_chain_pre_enable(bridge);
+ 
+-	return drm_get_edid(connector,
++	edid = drm_get_edid(connector,
+ 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
++
++	/*
++	 * If we call the get_edid() function without having enabled the chip
++	 * before, return the chip to its original power state.
++	 */
++	if (poweroff)
++		drm_bridge_chain_post_disable(bridge);
++
++	return edid;
+ }
+ 
+ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
diff --git a/board/chromebook/elm/linux.config b/board/chromebook/elm/linux.config
new file mode 100644
index 0000000000..50402eae8a
--- /dev/null
+++ b/board/chromebook/elm/linux.config
@@ -0,0 +1,453 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IRQ_TIME_ACCOUNTING=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_NUMA_BALANCING=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_USER_NS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_KALLSYMS_ALL=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_MEDIATEK=y
+CONFIG_ARM64_VA_BITS_48=y
+CONFIG_SCHED_MC=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=4
+CONFIG_NUMA=y
+CONFIG_SECCOMP=y
+CONFIG_PARAVIRT=y
+CONFIG_CRASH_DUMP=y
+CONFIG_COMPAT=y
+CONFIG_RANDOMIZE_BASE=y
+# CONFIG_EFI is not set
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_ADVANCED_DEBUG=y
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_LADDER=y
+CONFIG_ARM_CPUIDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_ARM_SCPI_CPUFREQ=y
+CONFIG_ARM_MEDIATEK_CPUFREQ=y
+CONFIG_ARM_SCPI_PROTOCOL=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEBUG_FS is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_KSM=y
+CONFIG_MEMORY_FAILURE=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_INET_UDP_DIAG=y
+# CONFIG_IPV6 is not set
+CONFIG_CFG80211=y
+# CONFIG_CFG80211_DEFAULT_PS is not set
+CONFIG_MAC80211=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_VEXPRESS_CONFIG=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_CFI_STAA=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_DATAFLASH=y
+CONFIG_MTD_SST25L=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_CADENCE_QUADSPI=y
+CONFIG_OF_OVERLAY=y
+# CONFIG_BLK_DEV is not set
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=m
+CONFIG_EEPROM_AT25=m
+CONFIG_RAID_ATTRS=m
+CONFIG_SCSI=y
+# CONFIG_SCSI_PROC_FS is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SAS_LIBSAS=y
+CONFIG_SCSI_UFSHCD=y
+CONFIG_SCSI_UFSHCD_PLATFORM=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_BLK_DEV_DM=m
+CONFIG_DM_MIRROR=m
+CONFIG_DM_ZERO=m
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+CONFIG_USB_RTL8152=y
+CONFIG_USB_USBNET=y
+# CONFIG_USB_NET_AX88179_178A is not set
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+# CONFIG_WLAN_VENDOR_ADMTEK is not set
+# CONFIG_WLAN_VENDOR_ATH is not set
+# CONFIG_WLAN_VENDOR_ATMEL is not set
+# CONFIG_WLAN_VENDOR_BROADCOM is not set
+# CONFIG_WLAN_VENDOR_CISCO is not set
+# CONFIG_WLAN_VENDOR_INTEL is not set
+# CONFIG_WLAN_VENDOR_INTERSIL is not set
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+# CONFIG_WLAN_VENDOR_MEDIATEK is not set
+# CONFIG_WLAN_VENDOR_RALINK is not set
+# CONFIG_WLAN_VENDOR_REALTEK is not set
+# CONFIG_WLAN_VENDOR_RSI is not set
+# CONFIG_WLAN_VENDOR_ST is not set
+# CONFIG_WLAN_VENDOR_TI is not set
+# CONFIG_WLAN_VENDOR_ZYDAS is not set
+# CONFIG_WLAN_VENDOR_QUANTENNA is not set
+CONFIG_INPUT_POLLDEV=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_ADC=m
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_MOUSE_ELAN_I2C=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
+CONFIG_TOUCHSCREEN_ELAN=y
+CONFIG_INPUT_MISC=y
+# CONFIG_SERIO_SERPORT is not set
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_8250_MT6577=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_XILINX_PS_UART=y
+CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_FSL_LINFLEXUART=y
+CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_IPMI_HANDLER=m
+CONFIG_IPMI_DEVICE_INTERFACE=m
+CONFIG_IPMI_SI=m
+CONFIG_TCG_TPM=y
+CONFIG_TCG_TIS_I2C_INFINEON=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX_PCA954x=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_GPIO=m
+CONFIG_I2C_MT65XX=y
+CONFIG_I2C_RK3X=y
+CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I2C_SLAVE=y
+CONFIG_SPI=y
+CONFIG_SPI_NXP_FLEXSPI=y
+CONFIG_SPI_GPIO=y
+CONFIG_SPI_MT65XX=y
+CONFIG_SPI_PL022=y
+CONFIG_SPI_ROCKCHIP=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_MAX77620=y
+CONFIG_GPIO_ALTERA=m
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_MB86S7X=y
+CONFIG_GPIO_PL061=y
+CONFIG_GPIO_XGENE=y
+CONFIG_GPIO_MAX732X=y
+CONFIG_GPIO_PCA953X=y
+CONFIG_GPIO_PCA953X_IRQ=y
+CONFIG_GPIO_BD9571MWV=m
+CONFIG_GPIO_MAX77620=y
+CONFIG_POWER_AVS=y
+CONFIG_POWER_RESET_BRCMSTB=y
+CONFIG_POWER_RESET_XGENE=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_BATTERY_SBS=m
+CONFIG_BATTERY_BQ27XXX=y
+CONFIG_SENSORS_ARM_SCPI=y
+CONFIG_SENSORS_LM90=m
+CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_INA3221=m
+CONFIG_THERMAL=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
+CONFIG_THERMAL_EMULATION=y
+CONFIG_WATCHDOG=y
+CONFIG_MEDIATEK_WATCHDOG=y
+CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_MFD_HI6421_PMIC=y
+CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MT6397=y
+CONFIG_MFD_RK808=y
+CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_ROHM_BD718XX=y
+CONFIG_REGULATOR_DEBUG=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_BD718XX=y
+CONFIG_REGULATOR_BD9571MWV=y
+CONFIG_REGULATOR_DA9211=y
+CONFIG_REGULATOR_FAN53555=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_HI6421V530=y
+CONFIG_REGULATOR_MAX77620=y
+CONFIG_REGULATOR_MAX8973=y
+CONFIG_REGULATOR_MT6397=y
+CONFIG_REGULATOR_PFUZE100=y
+CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_RK808=y
+CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_VCTRL=m
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
+CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
+CONFIG_MEDIA_SDR_SUPPORT=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_DRM=y
+CONFIG_DRM_I2C_CH7006=m
+CONFIG_DRM_I2C_SIL164=m
+CONFIG_DRM_I2C_NXP_TDA998X=m
+CONFIG_DRM_MALI_DISPLAY=m
+CONFIG_DRM_PANEL_LVDS=m
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
+CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_PARADE_PS8640=y
+CONFIG_DRM_SII902X=m
+CONFIG_DRM_THINE_THC63LVD1024=m
+CONFIG_DRM_TI_SN65DSI86=m
+CONFIG_DRM_ANALOGIX_ANX78XX=y
+CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_MEDIATEK=y
+CONFIG_DRM_MEDIATEK_HDMI=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_SIMPLE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_BACKLIGHT_LP855X=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_MT8173=y
+CONFIG_SND_SOC_MT8173_RT5650_RT5676=y
+CONFIG_I2C_HID=m
+CONFIG_USB_CONN_GPIO=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_MTU3=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_DWC3=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CONSOLE=y
+CONFIG_USB_SERIAL_PL2303=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_SNP_UDC_PLAT=y
+CONFIG_USB_BDC_UDC=y
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_EEM=y
+CONFIG_TYPEC=m
+CONFIG_TYPEC_TCPM=m
+CONFIG_TYPEC_FUSB302=m
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=32
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ARASAN=y
+CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SDHCI_F_SDH30=y
+CONFIG_MMC_SPI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_EXYNOS=y
+CONFIG_MMC_DW_HI3798CV200=y
+CONFIG_MMC_DW_K3=y
+CONFIG_MMC_MTK=y
+CONFIG_MMC_SDHCI_XENON=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_LEDS_SYSCON=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DS1307=m
+CONFIG_RTC_DRV_MAX77686=y
+CONFIG_RTC_DRV_RK808=m
+CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_RX8581=m
+CONFIG_RTC_DRV_S5M=y
+CONFIG_RTC_DRV_DS3232=y
+CONFIG_RTC_DRV_PCF2127=m
+CONFIG_RTC_DRV_CROS_EC=y
+CONFIG_RTC_DRV_PL031=y
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_MV_XOR_V2=y
+CONFIG_PL330_DMA=y
+CONFIG_MTK_CQDMA=y
+CONFIG_QCOM_HIDMA_MGMT=y
+CONFIG_QCOM_HIDMA=y
+# CONFIG_VIRTIO_MENU is not set
+CONFIG_MFD_CROS_EC=y
+CONFIG_CROS_EC_I2C=y
+CONFIG_CROS_EC_SPI=y
+CONFIG_COMMON_CLK_RK808=y
+CONFIG_COMMON_CLK_SCPI=y
+CONFIG_COMMON_CLK_CS2000_CP=y
+CONFIG_COMMON_CLK_S2MPS11=y
+CONFIG_CLK_QORIQ=y
+CONFIG_COMMON_CLK_XGENE=y
+CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_VC5=y
+CONFIG_COMMON_CLK_MT6797_MMSYS=y
+CONFIG_COMMON_CLK_MT6797_IMGSYS=y
+CONFIG_COMMON_CLK_MT6797_VDECSYS=y
+CONFIG_COMMON_CLK_MT6797_VENCSYS=y
+CONFIG_HWSPINLOCK=y
+CONFIG_ARM_MHU=y
+CONFIG_PLATFORM_MHU=y
+CONFIG_ARM_SMMU=y
+CONFIG_ARM_SMMU_V3=y
+CONFIG_MTK_IOMMU=y
+CONFIG_REMOTEPROC=y
+CONFIG_MTK_CMDQ=y
+CONFIG_MTK_PMIC_WRAP=y
+CONFIG_EXTCON_USB_GPIO=y
+CONFIG_EXTCON_USBC_CROS_EC=y
+CONFIG_IIO=y
+CONFIG_MAX9611=m
+CONFIG_IIO_CROS_EC_SENSORS_CORE=m
+CONFIG_IIO_CROS_EC_SENSORS=m
+CONFIG_IIO_CROS_EC_LIGHT_PROX=m
+CONFIG_SENSORS_ISL29018=m
+CONFIG_IIO_CROS_EC_BARO=m
+CONFIG_MPL3115=m
+CONFIG_PWM=y
+CONFIG_PWM_CROS_EC=m
+CONFIG_PWM_MTK_DISP=y
+CONFIG_PWM_MEDIATEK=y
+CONFIG_PHY_XGENE=y
+CONFIG_PHY_FSL_IMX8MQ_USB=y
+CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_QCOM_USB_HS=y
+CONFIG_PHY_SAMSUNG_USB2=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_FANOTIFY=y
+CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
+CONFIG_QUOTA=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_CUSE=m
+CONFIG_OVERLAY_FS=y
+CONFIG_OVERLAY_FS_INDEX=y
+CONFIG_OVERLAY_FS_XINO_AUTO=y
+CONFIG_OVERLAY_FS_METACOPY=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_PSTORE=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_SECURITY=y
+CONFIG_CRYPTO_CRYPTD=y
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
+CONFIG_CRYPTO_SEQIV=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_ECB=y
+CONFIG_CRYPTO_XXHASH=m
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_SHA3=m
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_DEV_CCREE=m
+CONFIG_PACKING=y
+CONFIG_INDIRECT_PIO=y
+CONFIG_CRC_CCITT=m
+CONFIG_CRC_T10DIF=y
+CONFIG_LIBCRC32C=m
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=32
+CONFIG_IRQ_POLL=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_STACKTRACE=y
+# CONFIG_FTRACE is not set
+# CONFIG_STRICT_DEVMEM is not set
\ No newline at end of file
diff --git a/board/chromebook/elm/readme.txt b/board/chromebook/elm/readme.txt
new file mode 100644
index 0000000000..b63e7e8bcf
--- /dev/null
+++ b/board/chromebook/elm/readme.txt
@@ -0,0 +1,56 @@
+Mediatek MT8173 aka Chromebook Elm
+==================================
+
+This file describes booting the Chromebook from an SD card containing
+Buildroot kernel and rootfs, using the original bootloader. This is
+the least invasive way to get Buildroot onto the devices and a good
+starting point.
+
+The bootloader will only boot a kernel from a GPT partition marked
+bootable with cgpt tool from vboot-utils package.
+The kernel image must be signed using futility from the same package.
+The signing part is done by sign.sh script in this directory.
+
+It does not really matter where rootfs is as long as the kernel is able
+to find it, but this particular configuration assumes the kernel is on
+partition 1 and rootfs is on partition 2 of the SD card.
+Make sure to check kernel.args if you change this.
+
+Making the boot media
+---------------------
+Start by configuring and building the images.
+
+	make chromebook_elm_defconfig
+	make menuconfig # if necessary
+	make
+
+The important files are:
+
+	uImage.kpart (kernel and device tree, signed)
+	rootfs.tar
+	bootsd.img (SD card image containing both kernel and rootfs)
+
+Write the image directly to some SD card.
+WARNING: make sure there is nothing important on that card,
+and double-check the device name!
+
+	SD=/dev/mmcblk1		# may be /dev/sdX on some hosts
+	dd if=output/images/bootsd.img of=$SD
+
+Switching to developer mode and booting from SD
+-----------------------------------------------
+Power Chromebook down, then power it up while holding Esc+F3.
+BEWARE: switching to developer mode deletes all user data.
+Create backups if you need them.
+
+While in developer mode, Chromebook will boot into a white screen saying
+"OS verification is off".
+
+Press Ctrl-D at this screen to boot Chromium OS from eMMC.
+Press Ctrl-U at this screen to boot from SD (or USB)
+Press Power to power it off.
+Do NOT press Space unless you mean it.
+This will switch it back to normal mode.
+
+The is no way to get rid of the white screen without re-flashing the bootloader.
+
diff --git a/board/chromebook/elm/sign.sh b/board/chromebook/elm/sign.sh
new file mode 100644
index 0000000000..b1c1ffee40
--- /dev/null
+++ b/board/chromebook/elm/sign.sh
@@ -0,0 +1,41 @@
+#!/bin/sh
+
+# This script creates u-boot FIT image containing the kernel and the DT,
+# then signs it using futility from vboot-utils.
+# The resulting file is called uImage.kpart.
+
+BOARD_DIR=$(dirname $0)/${BOARD_NAME}
+mkimage=$HOST_DIR/bin/mkimage
+futility=$HOST_DIR/bin/futility
+devkeys=$HOST_DIR/share/vboot/devkeys
+
+run() { echo "$@"; "$@"; }
+die() { echo "$@" >&2; exit 1; }
+test -f $BINARIES_DIR/Image  || \
+	die "No kernel image found"
+test -x $mkimage || \
+	die "No mkimage found (host-uboot-tools has not been built?)"
+test -x $futility || \
+	die "No futility found (host-vboot-utils has not been built?)"
+
+# kernel.its references zImage and exynos5250-snow.dtb, and all three
+# files must be in current directory for mkimage.
+run cp $BOARD_DIR/kernel.its $BINARIES_DIR/kernel.its || exit 1
+echo "# entering $BINARIES_DIR for the next command"
+(cd $BINARIES_DIR && run $mkimage -f kernel.its uImage.itb) || exit 1
+
+# futility requires non-empty file to be supplied with --bootloader
+# even if it does not make sense for the target platform.
+echo > $BINARIES_DIR/dummy.txt
+
+run $futility vbutil_kernel \
+	--keyblock $devkeys/kernel.keyblock \
+	--signprivate $devkeys/kernel_data_key.vbprivk \
+	--arch aarch64 \
+	--version 1 \
+	--config $BOARD_DIR/kernel.args \
+	--vmlinuz $BINARIES_DIR/uImage.itb \
+	--bootloader $BINARIES_DIR/dummy.txt \
+	--pack $BINARIES_DIR/uImage.kpart || exit 1
+
+rm -f $BINARIES_DIR/kernel.its $BINARIES_DIR/dummy.txt
-- 
2.25.1
