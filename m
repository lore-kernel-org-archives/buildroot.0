From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 16:19:58 +0100
Subject: [Buildroot] [git commit] rtl8723bs: new package
Message-ID: <20170129152058.3A2BC81EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeecbe16e295c3e9a93f1e3d0341cbca3e5c56cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../0001-rtl8723bs-add-debug-level-modparam.patch  | 41 ++++++++++++++++++++++
 package/rtl8723bs/Config.in                        | 10 ++++++
 package/rtl8723bs/rtl8723bs.mk                     | 27 ++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 796ad33..6a3a1a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ endmenu
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
+	source "package/rtl8723bs/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch b/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
new file mode 100644
index 0000000..0443c1f
--- /dev/null
+++ b/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
@@ -0,0 +1,41 @@
+From 9f70428f506ac9d5af325004c01c59c62669d7eb Mon Sep 17 00:00:00 2001
+From: Jason Abele <jason@jasonabeleconsulting.com>
+Date: Sat, 15 Aug 2015 18:20:54 -0700
+Subject: [PATCH] rtl8723bs: add debug level modparam
+
+For ease of controlling debug printk verbosity, add a module parameter
+which sets debug level at module load.
+
+Signed-off-by: Jason Abele <jason@jasonabeleconsulting.com>
+[Fixed to apply on current version]
+Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
+---
+ os_dep/os_intfs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/os_dep/os_intfs.c b/os_dep/os_intfs.c
+index b30c2a0..eeb8946 100644
+--- a/os_dep/os_intfs.c
++++ b/os_dep/os_intfs.c
+@@ -231,6 +231,10 @@ module_param(rtw_decrypt_phy_file, int, 0644);
+ MODULE_PARM_DESC(rtw_decrypt_phy_file,"Enable Decrypt PHY File");
+ #endif
+
++int rtw_debug_level = _drv_err_;
++module_param(rtw_debug_level, int, 0644);
++MODULE_PARM_DESC(rtw_debug_level,"Set Driver Debug Verbosity");
++
+ int _netdev_open(struct net_device *pnetdev);
+ int netdev_open (struct net_device *pnetdev);
+ static int netdev_close (struct net_device *pnetdev);
+@@ -347,6 +351,7 @@ static uint loadparam(struct adapter *padapter, _nic_hdl pnetdev)
+ 	registry_par->qos_opt_enable = (u8)rtw_qos_opt_enable;
+
+ 	registry_par->hiq_filter = (u8)rtw_hiq_filter;
++	GlobalDebugLevel = rtw_debug_level;
+ 	return status;
+ }
+
+--
+2.8.3
+
diff --git a/package/rtl8723bs/Config.in b/package/rtl8723bs/Config.in
new file mode 100644
index 0000000..3d5dea4
--- /dev/null
+++ b/package/rtl8723bs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8723BS
+	bool "rtl8723bs"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8723bs wifi driver
+
+	  https://github.com/hadess/rtl8723bs
+
+comment "rtl8723bs needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723bs/rtl8723bs.mk b/package/rtl8723bs/rtl8723bs.mk
new file mode 100644
index 0000000..f5bc1ac
--- /dev/null
+++ b/package/rtl8723bs/rtl8723bs.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rtl8723bs
+#
+################################################################################
+
+RTL8723BS_VERSION = 11ab92d8ccd71c80f0102828366b14ef6b676fb2
+RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
+RTL8723BS_LICENSE = GPLv2, proprietary (*.bin firmware blobs)
+
+RTL8723BS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8723BS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+RTL8723BS_BINS = rtl8723bs_ap_wowlan.bin rtl8723bs_wowlan.bin \
+	rtl8723bs_bt.bin rtl8723bs_nic.bin
+
+define RTL8723BS_INSTALL_FIRMWARE
+	$(foreach bin, $(RTL8723BS_BINS), \
+		$(INSTALL) -D -m 644 $(@D)/$(bin) $(TARGET_DIR)/lib/firmware/rtlwifi/$(bin)
+	)
+endef
+RTL8723BS_POST_INSTALL_TARGET_HOOKS += RTL8723BS_INSTALL_FIRMWARE
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
