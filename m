From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:42:00 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: fix build with new libnl-3
Message-ID: <20111226160333.D88908FDD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ed19cb1debbf31407ea3d704ce921d1b51ac13f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CFLAGS have to be augmented for the include dir and a small patch
will make the binary link to libnl-3 and libnl-genl-3 instead of libnl
and libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../wpa_supplicant-0.7.3-libnl-3.patch             |   15 +++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch b/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch
new file mode 100644
index 0000000..a460c2a
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch
@@ -0,0 +1,15 @@
+--- a/src/drivers/drivers.mak	2011-11-29 19:19:56.684221050 +0100
++++ b/src/drivers/drivers.mak	2011-11-29 19:20:12.199609246 +0100
+@@ -31,10 +31,10 @@
+ NEED_AP_MLME=y
+ NEED_NETLINK=y
+ NEED_LINUX_IOCTL=y
+-DRV_LIBS += -lnl
++DRV_LIBS += -lnl-3
+ 
+ ifdef CONFIG_LIBNL20
+-DRV_LIBS += -lnl-genl
++DRV_LIBS += -lnl-genl-3
+ DRV_CFLAGS += -DCONFIG_LIBNL20
+ endif
+ endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index baa739b..f722b81 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -66,7 +66,7 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CFLAGS += $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(WPA_SUPPLICANT_CONFIG)
