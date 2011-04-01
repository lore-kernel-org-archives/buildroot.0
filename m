From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Apr 2011 21:56:21 +0200
Subject: [Buildroot] [git commit master 1/1] openssl: fix compilation for
	i386
Message-ID: <20110401195641.A6ECA81D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=47736c88c3dcc7ec4906bbb80acb194d2211b0c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3445.

OpenSSL emits bswap instructions when building for i386 targets which
unfortunately is only available on 486+ class processors.
Since the normal workaround is detected at build time and we are cross
compiling we need to specify this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    7 ++++---
 package/openssl/openssl.mk |    5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0908804..c22d0b6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,12 +4,13 @@
 	avahi, busybox, dnsmasq, dropbear, ethtool, fakeroot, ffmpeg,
 	file, gnuconfig, gst-ffmpeg, gst-plugins-good, icu,
 	imagemagick, libdnet, libpng, libxml2, libxslt, makedevs,
-	mpg123, mtd-utils, ncurses, netsnmp, pkg-config, qt, samba,
-	socat, squashfs, webkit, xerces, xlib_xtrans, xorg-server,
-	xterm, xz
+	mpg123, mtd-utils, ncurses, netsnmp, openssl, pkg-config, qt,
+	samba, socat, squashfs, webkit, xerces, xlib_xtrans,
+	xorg-server, xterm, xz
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#3445: Not working openssl-10.0.0d on 386sx
 	#3451: fakeroot package: wrong FAKEROOT_SITE variable
 	#3457: alsamixergui: broken URL
 	#3475: Calling sync on large filesystems when not always necessary
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 7bf347a..0163ef8 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -39,6 +39,11 @@ ifeq ($(ARCH),x86_64)
 	OPENSSL_TARGET_ARCH = x86_64
 endif
 
+# Workaround for bug #3445
+ifeq ($(BR2_x86_i386),y)
+	OPENSSL_TARGET_ARCH = generic32 386
+endif
+
 define OPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_ARGS) \
-- 
1.7.3.4
