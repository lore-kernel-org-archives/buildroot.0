From: Daniel Mack <zonque@gmail.com>
Date: Sat,  3 Dec 2011 18:03:29 +0100
Subject: [Buildroot] [PATCH v4 2/5] hostapd: fix build with new libnl-3
In-Reply-To: <1322931812-10734-1-git-send-email-zonque@gmail.com>
References: <1322931812-10734-1-git-send-email-zonque@gmail.com>
Message-ID: <1322931812-10734-2-git-send-email-zonque@gmail.com>
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
 package/hostapd/hostapd-0.7.3-libnl3.patch |   15 +++++++++++++++
 package/hostapd/hostapd.mk                 |    1 +
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/hostapd/hostapd-0.7.3-libnl3.patch

diff --git a/package/hostapd/hostapd-0.7.3-libnl3.patch b/package/hostapd/hostapd-0.7.3-libnl3.patch
new file mode 100644
index 0000000..e47da73
--- /dev/null
+++ b/package/hostapd/hostapd-0.7.3-libnl3.patch
@@ -0,0 +1,15 @@
+--- a/src/drivers/drivers.mak	2011-11-29 19:09:23.889942913 +0100
++++ b/src/drivers/drivers.mak	2011-11-29 19:09:40.637381428 +0100
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
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0d6c2c5..26ebf1d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -18,6 +18,7 @@ endif
 
 define HOSTAPD_LIBNL_CONFIG
 	echo "CONFIG_LIBNL20=y" >>$(HOSTAPD_CONFIG)
+	echo "CFLAGS += -I$(STAGING_DIR)/usr/include/libnl3/" >>$(HOSTAPD_CONFIG)
 endef
 
 define HOSTAPD_CRYPTO_CONFIG
-- 
1.7.7.3
