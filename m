From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Mar 2016 10:43:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: unavailable for static
	builds
Message-ID: <1458380622-28765-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minidlna has long standing issues with static-only builds:
http://patchwork.ozlabs.org/patch/501844/
http://patchwork.ozlabs.org/patch/506310/

This patch fixes
http://autobuild.buildroot.net/results/d73/d7370d0f8d1c7c028996feab0ea4f36edbf8a698/
http://autobuild.buildroot.net/results/575/5752be7c1820579425ba24178482ab0d6eea7b62/
"pack_utils.c:(.text+0x9a8): multiple definition of `free_metadata'"

The multiple definition can be fixed of course but instead of digging
deeper and deeper into this mess let's disable static builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/Config.in   | 6 ++++--
 package/minidlna/minidlna.mk | 9 ---------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 6925e01..999ea01 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MINIDLNA
 	bool "minidlna"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -19,7 +20,8 @@ config BR2_PACKAGE_MINIDLNA
 
 	  http://minidlna.sourceforge.net/
 
-comment "minidlna needs a toolchain w/ threads, wchar"
+comment "minidlna needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_nios2
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 729680c..0e765e8 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -14,17 +14,8 @@ MINIDLNA_DEPENDENCIES = \
 	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
 	host-xutil_makedepend
 
-ifeq ($(BR2_STATIC_LIBS),y)
-# the configure script / Makefile forgets to link with some of the dependent
-# libraries breaking static linking, so help it along
-MINIDLNA_PKGCONFIG_DEPS = libavcodec libexif vorbis sqlite3
-MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs $(MINIDLNA_PKGCONFIG_DEPS)`
-MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
-MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
-else
 MINIDLNA_CONF_OPTS = \
 	--disable-static
-endif
 
 define MINIDLNA_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/minidlna.conf $(TARGET_DIR)/etc/minidlna.conf
-- 
2.7.0
