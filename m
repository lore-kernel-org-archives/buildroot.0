From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 22:33:28 +0100
Subject: [Buildroot] [git commit] nspr version update 4.9.2 old patch removed
Message-ID: <20130106221238.856B49A5E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94d33410b2ca2b7cf3ce2600d308780326814e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: upstream now provides nspr.pc]
Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/libnspr-fix-flags.patch |   65 -------------------------------
 package/libnspr/libnspr.mk              |   18 +--------
 package/libnspr/nspr.pc.in              |   10 -----
 3 files changed, 1 insertions(+), 92 deletions(-)

diff --git a/package/libnspr/libnspr-fix-flags.patch b/package/libnspr/libnspr-fix-flags.patch
deleted file mode 100644
index d5ad4fa..0000000
--- a/package/libnspr/libnspr-fix-flags.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Fix build issues on ARM with certain toolchains
-
-Some gcc/binutils combinations do not like having a space between
-"-Wa," and the following assembler option, so we simply remove those
-spaces.
-
-However, fixing the configure.in is not sufficient, because libnspr
-absolutely requires the prehistoric autoconf 2.13 to re-generate the
-configure script. So, since the patch to the configure script is not
-horrible, we also patch this script directly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/mozilla/nsprpub/configure.in
-===================================================================
---- a/mozilla/nsprpub/configure.in
-+++ b/mozilla/nsprpub/configure.in
-@@ -925,8 +925,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
--        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
-+        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-+        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
-       else
-         AC_MSG_ERROR([--enable-thumb2 is not supported for non-GNU toolchains])
-@@ -940,8 +940,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
--        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
-+       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
-+        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
-         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
-       fi
-       ;;
-Index: b/mozilla/nsprpub/configure
-===================================================================
---- a/mozilla/nsprpub/configure
-+++ b/mozilla/nsprpub/configure
-@@ -3101,8 +3101,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
--        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa, -march=armv7-a -Wa, -mthumb"
-+        CFLAGS="$CFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-+        CXXFLAGS="$CXXFLAGS -march=armv7-a -mthumb -Wa,-march=armv7-a -Wa,-mthumb"
-         ASFLAGS="$ASFLAGS -march=armv7-a -mthumb"
-       else
-         { echo "configure: error: --enable-thumb2 is not supported for non-GNU toolchains" 1>&2; exit 1; }
-@@ -3116,8 +3116,8 @@
-   case "$target_cpu" in
-     arm*)
-       if test "$GNU_CC"; then
--       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
--        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa, -march=armv5te -Wa, -mthumb-interwork"
-+       CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
-+        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -Wa,-march=armv5te -Wa,-mthumb-interwork"
-         ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork"
-       fi
-       ;;
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 590a755..d7ea4b3 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -3,7 +3,7 @@
 # libnspr
 #
 #############################################################
-LIBNSPR_VERSION = 4.8.7
+LIBNSPR_VERSION = 4.9.2
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src/
 LIBNSPR_SUBDIR = mozilla/nsprpub
@@ -22,22 +22,6 @@ else
 LIBNSPR_CONF_OPT += --disable-thumb2
 endif
 
-define LIBNSPR_INSTALL_STAGING_PC
-	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnspr/nspr.pc.in \
-		$(STAGING_DIR)/usr/lib/pkgconfig/nspr.pc
-	$(SED) 's/@VERSION@/$(LIBNSPR_VERSION)/g;' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/nspr.pc
-endef
-LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_INSTALL_STAGING_PC
-
-define LIBNSPR_INSTALL_TARGET_PC
-	$(INSTALL) -D -m 0644 $(TOPDIR)/package/libnspr/nspr.pc.in \
-		$(TARGET_DIR)/usr/lib/pkgconfig/nspr.pc
-	$(SED) 's/@VERSION@/$(LIBNSPR_VERSION)/g;' \
-		$(TARGET_DIR)/usr/lib/pkgconfig/nspr.pc
-endef
-LIBNSPR_POST_INSTALL_TARGET_HOOKS += LIBNSPR_INSTALL_TARGET_PC
-
 define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
diff --git a/package/libnspr/nspr.pc.in b/package/libnspr/nspr.pc.in
deleted file mode 100644
index 44873d2..0000000
--- a/package/libnspr/nspr.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include/nspr
-
-Name: NSPR
-Description: The Netscape Portable Runtime
-Version: @VERSION@
-Libs: -L${exec_prefix}/lib -lplds4 -lplc4 -lnspr4 -lpthread -ldl
-Cflags: -I${prefix}/include/nspr
