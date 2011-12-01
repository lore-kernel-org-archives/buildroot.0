From: Daniel Mack <zonque@gmail.com>
Date: Thu,  1 Dec 2011 12:56:32 +0100
Subject: [Buildroot] [PATCH v2 3/5] wpa_supplicant: fix build with new
	libnl-3
In-Reply-To: <1322740594-13595-1-git-send-email-zonque@gmail.com>
References: <1322740594-13595-1-git-send-email-zonque@gmail.com>
Message-ID: <1322740594-13595-3-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CFLAGS have to be augmented for the include dir and a small patch
will make the binary link to libnl-3 and libnl-genl-3 instead of libnl
and libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 .../wpa_supplicant-0.7.3-libnl-3.patch             |   15 +++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0.7.3-libnl-3.patch

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
index b2e7be3..f7f1af4 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -56,7 +56,7 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CFLAGS += $(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include/libnl3/" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(WPA_SUPPLICANT_CONFIG)
-- 
1.7.7.3
