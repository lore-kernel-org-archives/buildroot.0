From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:48:58 +0200
Subject: [Buildroot] [git commit] package/libvncserver: bump to version
 0.9.12
Message-ID: <20190622154813.1AB778293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee59023794f5540e5c70bca944ad25bc79eabb0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- autotools is no more available, switch to cmake
- Disable ffmpeg (used for example)
- Add LZO dependency (to avoid using internal LZO) through the new
  WITH_LZO option added by
  https://github.com/LibVNC/libvncserver/commit/139da17b6ed0ccd1acd824a87972182834671f92
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Limit-client-cut-text-length-to-1-MB.patch | 65 ----------------------
 package/libvncserver/Config.in                     |  1 +
 package/libvncserver/libvncserver.hash             |  3 +-
 package/libvncserver/libvncserver.mk               | 45 +++++++--------
 4 files changed, 26 insertions(+), 88 deletions(-)

diff --git a/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch b/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch
deleted file mode 100644
index 84a537640d..0000000000
--- a/package/libvncserver/0001-Limit-client-cut-text-length-to-1-MB.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 28afb6c537dc82ba04d5f245b15ca7205c6dbb9c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
-Date: Mon, 26 Feb 2018 13:48:00 +0100
-Subject: [PATCH] Limit client cut text length to 1 MB
-
-This patch constrains a client cut text length to 1 MB. Otherwise
-a client could make server allocate 2 GB of memory and that seems to
-be to much to classify it as a denial of service.
-
-The limit also prevents from an integer overflow followed by copying
-an uninitilized memory when processing msg.cct.length value larger
-than SIZE_MAX or INT_MAX - sz_rfbClientCutTextMsg.
-
-This patch also corrects accepting length value of zero (malloc(0) is
-interpreted on differnet systems differently).
-
-CVE-2018-7225
-<https://github.com/LibVNC/libvncserver/issues/218>
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libvncserver/rfbserver.c | 20 +++++++++++++++++++-
- 1 file changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
-index 116c488..4fc4d9d 100644
---- a/libvncserver/rfbserver.c
-+++ b/libvncserver/rfbserver.c
-@@ -88,6 +88,8 @@
- #include <errno.h>
- /* strftime() */
- #include <time.h>
-+/* PRIu32 */
-+#include <inttypes.h>
- 
- #ifdef LIBVNCSERVER_WITH_WEBSOCKETS
- #include "rfbssl.h"
-@@ -2575,7 +2577,23 @@ rfbProcessClientNormalMessage(rfbClientPtr cl)
- 
- 	msg.cct.length = Swap32IfLE(msg.cct.length);
- 
--	str = (char *)malloc(msg.cct.length);
-+	/* uint32_t input is passed to malloc()'s size_t argument,
-+	 * to rfbReadExact()'s int argument, to rfbStatRecordMessageRcvd()'s int
-+	 * argument increased of sz_rfbClientCutTextMsg, and to setXCutText()'s int
-+	 * argument. Here we impose a limit of 1 MB so that the value fits
-+	 * into all of the types to prevent from misinterpretation and thus
-+	 * from accessing uninitialized memory (CVE-2018-7225) and also to
-+	 * prevent from a denial-of-service by allocating to much memory in
-+	 * the server. */
-+	if (msg.cct.length > 1<<20) {
-+	    rfbLog("rfbClientCutText: too big cut text length requested: %" PRIu32 "\n",
-+		    msg.cct.length);
-+	    rfbCloseClient(cl);
-+	    return;
-+	}
-+
-+	/* Allow zero-length client cut text. */
-+	str = (char *)calloc(msg.cct.length ? msg.cct.length : 1, 1);
- 	if (str == NULL) {
- 		rfbLogPerror("rfbProcessClientNormalMessage: not enough memory");
- 		rfbCloseClient(cl);
--- 
-2.11.0
-
diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index d5fac82e87..c8042905ce 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBVNCSERVER
 	depends on BR2_USE_MMU # VNCommand.c uses fork()
 	# binutils issue (bad expression)
 	depends on !BR2_nios2
+	select BR2_PACKAGE_LZO
 	help
 	  libvncserver is a VNC server/client library.
 
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 8d994e4b6a..d98d78d766 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894  LibVNCServer-0.9.11.tar.gz
+sha256  33cbbb4e15bb390f723c311b323cef4a43bcf781984f92d92adda3243a116136  LibVNCServer-0.9.12.tar.gz
+sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 8063570d98..3805b2faaa 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,66 +4,67 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.11
+LIBVNCSERVER_VERSION = 0.9.12
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_INSTALL_STAGING = YES
-LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
-LIBVNCSERVER_DEPENDENCIES = host-pkgconf
-
-# Upstream decided to remove generated autotools files from the
-# tarball, so we need to generate them.
-LIBVNCSERVER_AUTORECONF = YES
-
-# libvncserver does not get along with newer libva versions
-# https://github.com/LibVNC/libvncserver/issues/11
-LIBVNCSERVER_CONF_OPTS += --without-libva
+LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
+LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
 # only used for examples
-LIBVNCSERVER_CONF_OPTS += --with-sdl-config=/bin/false
+LIBVNCSERVER_CONF_OPTS += \
+	-DWITH_FFMPEG=OFF \
+	-DWITH_SDL=OFF
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBVNCSERVER_CONF_OPTS += --without-pthread
+LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=OFF
 endif
 
 # openssl supports needs NPTL thread support
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
+LIBVNCSERVER_CONF_OPTS += -DWITH_OPENSSL=ON
 LIBVNCSERVER_DEPENDENCIES += openssl
 else
-LIBVNCSERVER_CONF_OPTS += --without-crypto --without-ssl
+LIBVNCSERVER_CONF_OPTS += -DWITH_OPENSSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-LIBVNCSERVER_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+LIBVNCSERVER_CONF_OPTS += -DWITH_GCRYPT=ON
 LIBVNCSERVER_DEPENDENCIES += libgcrypt
 else
-LIBVNCSERVER_CONF_OPTS += --without-gcrypt
+LIBVNCSERVER_CONF_OPTS += -DWITH_GCRYPT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBVNCSERVER_DEPENDENCIES += gnutls host-pkgconf
+LIBVNCSERVER_CONF_OPTS += -DWITH_GNUTLS=ON
+LIBVNCSERVER_DEPENDENCIES += gnutls
 else
-LIBVNCSERVER_CONF_OPTS += --without-gnutls
+LIBVNCSERVER_CONF_OPTS += -DWITH_GNUTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_JPEG=ON
 LIBVNCSERVER_DEPENDENCIES += jpeg
 else
-LIBVNCSERVER_CONF_OPTS += --without-jpeg
+LIBVNCSERVER_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_PNG=ON
 LIBVNCSERVER_DEPENDENCIES += libpng
 else
-LIBVNCSERVER_CONF_OPTS += --without-png
+LIBVNCSERVER_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=ON
 LIBVNCSERVER_DEPENDENCIES += zlib
 else
-LIBVNCSERVER_CONF_OPTS += --without-zlib
+LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
