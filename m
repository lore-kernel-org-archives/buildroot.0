From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Dec 2009 10:00:40 +0100
Subject: [Buildroot] [git commit master] neon: add optional ssl support
Message-ID: <20091221091617.6FD777780C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2f3c46561e585ba698e73a91bbff03b2e3be411c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    5 +++--
 package/neon/Config.in |    6 ++++++
 package/neon/neon.mk   |    6 ++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 01b25aa..4d439bc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,9 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap, lighttpd,
-	mesa, mpg123, mtd-utils, pcre, qt, sshfs, tremor, u-boot, usbutils
+	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap,
+	lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, sshfs,
+	tremor, u-boot, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/neon/Config.in b/package/neon/Config.in
index ce72a2f..318e4c6 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -12,6 +12,12 @@ config BR2_PACKAGE_NEON_ZLIB
 	help
 	  build with ZLIB support
 
+config BR2_PACKAGE_NEON_SSL
+	bool "SSL support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  build with SSL support
+
 choice
 	prompt "XML Support"
 	default BR2_PACKAGE_NEON_NOXML
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1f26a0c..ed5f999 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -22,6 +22,12 @@ NEON_DEPENDENCIES+=zlib
 else
 NEON_CONF_OPT+=--without-zlib
 endif
+ifeq ($(BR2_PACKAGE_NEON_SSL),y)
+NEON_CONF_OPT+=--with-ssl
+NEON_DEPENDENCIES+=openssl
+else
+NEON_CONF_OPT+=--without-ssl
+endif
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
 NEON_CONF_OPT+=--with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
 NEON_CONF_OPT+=--with-libxml2=no
-- 
1.6.3.3
