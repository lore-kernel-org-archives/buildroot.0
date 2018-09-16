From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Sep 2018 16:55:11 +0200
Subject: [Buildroot] [PATCH v3,2/2] brltty: bump to version 5.6
In-Reply-To: <20180916145511.7304-1-fontaine.fabrice@gmail.com>
References: <20180916145511.7304-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916145511.7304-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first, second and third patch (already in version)
- Fix major/minor build failure with glibc 2.28, see:
  https://github.com/brltty/brltty/commit/cee581fac78d29bdf9acb6d1378cf4d005ff3afd
- Update web site URL to brltty.app, see
  https://github.com/brltty/brltty/commit/97efaecd6cfb665c0b5f0ac8ec69416618d45635
- Update license to LPGL-2.1+, see:
  https://github.com/brltty/brltty/commit/16ccb7d13f018e7557633a24fc02866b85871fa0

Fixes:
 - http://autobuild.buildroot.org/results/0fb2c33f00990e471736c4180f23026fa9adb982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Remove LICENSE-GPL from BRLTTY_LICENSE_FILES and brltty.hash

 ...s-from-generating-spurious-log-messa.patch | 28 --------
 ...0001-buildsys-fix-cross-compilation.patch} |  0
 ...-to-make-sure-the-platform-supports-.patch | 31 ---------
 ...0003-Remove-MKOBJ-in-favour-of-MKMOD.patch | 64 -------------------
 package/brltty/Config.in                      |  2 +-
 package/brltty/brltty.hash                    |  5 +-
 package/brltty/brltty.mk                      |  6 +-
 7 files changed, 6 insertions(+), 130 deletions(-)
 delete mode 100644 package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
 rename package/brltty/{0004-buildsys-fix-cross-compilation.patch => 0001-buildsys-fix-cross-compilation.patch} (100%)
 delete mode 100644 package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
 delete mode 100644 package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch

diff --git a/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch b/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
deleted file mode 100644
index e6a2005d59..0000000000
--- a/package/brltty/0001-Prevent-scancodes-from-generating-spurious-log-messa.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3ea213e47c6771b7e2481f64a98f30c02fcb4867 Mon Sep 17 00:00:00 2001
-From: Mario Lang <mlang@delysid.org>
-Date: Thu, 30 Nov 2017 13:14:47 +0100
-Subject: [PATCH] Prevent scancodes from generating spurious log messages. (ml)
-
-Signed-off-by: Mario Lang <mlang@blind.guru>
----
-This patch was taken from upstream, and can be removed when 5.6 is out.
-
- Drivers/Braille/HandyTech/braille.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Drivers/Braille/HandyTech/braille.c b/Drivers/Braille/HandyTech/braille.c
-index ef95fd15b..f7e605c1a 100644
---- a/Drivers/Braille/HandyTech/braille.c
-+++ b/Drivers/Braille/HandyTech/braille.c
-@@ -1560,7 +1560,7 @@ brl_readCommand (BrailleDisplay *brl, KeyTableCommandContext context) {
-                   case HT_EXTPKT_Scancode: {
-                     while (length--)
-                       enqueueCommand(BRL_CMD_BLK(PASSAT) | BRL_ARG_PUT(*bytes++));
--                    break;
-+                    continue;
-                   }
- 
-                   case HT_EXTPKT_GetRTC: {
--- 
-2.15.0
-
diff --git a/package/brltty/0004-buildsys-fix-cross-compilation.patch b/package/brltty/0001-buildsys-fix-cross-compilation.patch
similarity index 100%
rename from package/brltty/0004-buildsys-fix-cross-compilation.patch
rename to package/brltty/0001-buildsys-fix-cross-compilation.patch
diff --git a/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch b/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
deleted file mode 100644
index 3dbacb3b57..0000000000
--- a/package/brltty/0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 28dde6749327fd15a1b8b7bcf5cc74a95598582a Mon Sep 17 00:00:00 2001
-From: Mario Lang <mlang@delysid.org>
-Date: Fri, 29 Dec 2017 10:35:05 +0100
-Subject: [PATCH] Check for ioperm to make sure the platform supports ports
- I/O. (ml)
-
-Signed-off-by: Mario Lang <mlang@blind.guru>
----
-This patch was taken from upstream, and can be removed when 5.6 is out.
-
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5e94d33bd..07119dd9f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1446,7 +1446,9 @@ BRLTTY_ARG_PACKAGE([ports], [I/O ports], [], [dnl
-       ports_package="kfreebsd"
-       ;;
-    linux*)
--      ports_package="glibc"
-+      AC_CHECK_FUNC([ioperm], [
-+         ports_package="glibc"
-+      ])
-       ;;
-    mingw*)
-       ports_package="windows"
--- 
-2.15.0
-
diff --git a/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch b/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
deleted file mode 100644
index c1980417aa..0000000000
--- a/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b3b0e47015e9162f519730789976157c7cc38178 Mon Sep 17 00:00:00 2001
-From: Mario Lang <mlang@delysid.org>
-Date: Fri, 29 Dec 2017 14:52:37 +0100
-Subject: [PATCH] Remove MKOBJ in favour of MKMOD. (ml)
-
-Calling ld directly can lead to problems when cross-compiling.
-
-Upstream: https://github.com/brltty/brltty/commit/4c8aba42e246b96d10ffcbd57653682375499e46
-Signed-off-by: Mario Lang <mlang@blind.guru>
----
- Drivers/Braille/EuroBraille/Makefile.in |  2 +-
- config.mk.in                            |  1 -
- configure.ac                            | 10 ----------
- 3 files changed, 1 insertion(+), 12 deletions(-)
-
-diff --git a/Drivers/Braille/EuroBraille/Makefile.in b/Drivers/Braille/EuroBraille/Makefile.in
-index 0500aa70e..ce8a3d1a4 100644
---- a/Drivers/Braille/EuroBraille/Makefile.in
-+++ b/Drivers/Braille/EuroBraille/Makefile.in
-@@ -28,7 +28,7 @@ SRC_FILES = eu_braille.c eu_clio.c eu_esysiris.c
- OBJ_FILES = $(SRC_FILES:.c=.$O)
- 
- braille.$O: $(OBJ_FILES)
--	$(MKOBJ)  $@ $(OBJ_FILES)
-+	$(MKMOD)  $@ $(OBJ_FILES)
- 
- %.$O: $(SRC_DIR)/%.c
- 	$(CC) $(BRL_CFLAGS) -o $@ -c $<
-diff --git a/config.mk.in b/config.mk.in
-index 686f547e6..8d1da79b4 100644
---- a/config.mk.in
-+++ b/config.mk.in
-@@ -250,7 +250,6 @@ LD = @LD@
- LDFLAGS = @LDFLAGS@
- LDLIBS = $(ICU_LIBS) $(POLKIT_LIBS) $(SYSTEM_LIBS) @LIBS@
- 
--MKOBJ = @MKOBJ@
- MKMOD = @MKMOD@
- MKLIB = @MKLIB@
- CONFLIBDIR = @CONFLIBDIR@
-diff --git a/configure.ac b/configure.ac
-index 07119dd9f..ad80b8d60 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -428,16 +428,6 @@ AC_SUBST([can_make_manual])
- test "${DOXYGEN}" = "false" && can_make_BrlAPIref=no || can_make_BrlAPIref=yes
- AC_SUBST([can_make_BrlAPIref])
- 
--AC_CACHE_CHECK([for make relocatable object command], [brltty_cv_prog_mkobj], [dnl
--case "${host_os}"
--in
--   *)
--      brltty_cv_prog_mkobj="\$(LD) -r -o"
--      ;;
--esac])
--MKOBJ="${brltty_cv_prog_mkobj}"
--AC_SUBST([MKOBJ])
--
- AC_CACHE_CHECK([for loadable module creation command], [brltty_cv_prog_mkmod], [dnl
- case "${host_os}"
- in
--- 
-2.15.0
-
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index 48ceb04c99..de11af3bbe 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_BRLTTY
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
 
-	  http://brltty.com/
+	  http://brltty.app/
 
 if BR2_PACKAGE_BRLTTY
 
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 01b4c13fcc..6b9470c82e 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,3 @@
-sha256 4ebf1df5922df0efccac4795f5bd1c514fc850348c34d9ec0868e2798b565a36 brltty-5.5.tar.xz
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad LICENSE-GPL
+sha256 6171258aca833bb2012afd9c63928573a48c3daab7b149a3e90001ba53beb80f brltty-5.6.tar.xz
 sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
-sha256 6ba58188449642de8adefd7adabb436185792c5c51a4b5d04650423c2151dc50 README
+sha256 42685d8fa420f618e325d423be110c69abd976afdef183dfac385ccd44cb12e9 README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 0fcd4f4258..21f6877bb8 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 5.5
+BRLTTY_VERSION = 5.6
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
-BRLTTY_LICENSE = GPL-2.0+, LGPL-2.1+ (data, client side)
-BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL README
+BRLTTY_LICENSE = LGPL-2.1+
+BRLTTY_LICENSE_FILES = LICENSE-LGPL README
 
 BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
-- 
2.17.1
