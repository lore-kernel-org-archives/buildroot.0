From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:41:36 +0100
Subject: [Buildroot] [git commit] hostapd: fix build with new libnl-3
Message-ID: <20111226160333.CAA478FDD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f7a7b4fb676ae6db33c03402e624ad5b5d6968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CFLAGS have to be augmented for the include dir and a small patch
will make the binary link to libnl-3 and libnl-genl-3 instead of libnl
and libnl-gen.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd-0.7.3-libnl3.patch |   15 +++++++++++++++
 package/hostapd/hostapd.mk                 |    1 +
 2 files changed, 16 insertions(+), 0 deletions(-)

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
