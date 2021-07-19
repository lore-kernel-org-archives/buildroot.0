From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:19:10 +0200
Subject: [Buildroot] [git commit] package/rhash: bump to version 1.4.2
Message-ID: <20210719204514.226DB88437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=46a6b2c031c5ad28b75cb07092779a363786a237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/rhash/RHash/releases/tag/v1.4.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-allow-cross-compilation.patch   | 57 ----------------------
 .../rhash/0002-configure-add-uclinux-target.patch  | 36 --------------
 package/rhash/rhash.hash                           |  6 +--
 package/rhash/rhash.mk                             |  2 +-
 4 files changed, 4 insertions(+), 97 deletions(-)

diff --git a/package/rhash/0001-configure-allow-cross-compilation.patch b/package/rhash/0001-configure-allow-cross-compilation.patch
deleted file mode 100644
index 6a8f40f184..0000000000
--- a/package/rhash/0001-configure-allow-cross-compilation.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a3d0ef352529217c9c32ce1a1b1db1420798cbe5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 10 Oct 2020 11:07:39 +0200
-Subject: [PATCH] configure: allow cross-compilation
-
-Some compilers are in fact a wrapper (e.g. to speed compilation with
-ccache or distcc, or as a cross-compiler wrapper). Those wrappers may
-not properly recognise the -v option, or may internally enforce some
-flags that conflict with -v.
-
-Use --version as a fall-back.
-
-With --version. the compiler will report its executable's basename, e.g.
-arm-linux-gcc not gcc. Catter for that by grepping for the compiler
-family name.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998 at free.fr:
-  - retain "$CC -v" as default, fallback to "$CC --version"
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 9d72895..46491f7 100755
---- a/configure
-+++ b/configure
-@@ -513,9 +513,14 @@ else
-   CC_TMP="$CC"
-   test -n "$OPT_CC" && OTHER_CC= || OTHER_CC="gcc cc"
-   for CC in "$CC_TMP" $OTHER_CC; do
-+    cc_name_tmp=
-     if run_cmd "$CC -v"; then
-       cc_name_tmp=$($CC -v 2>&1 | tail -n 1 | cut -d ' ' -f 1)
--      if test "$cc_name_tmp" = "gcc"; then
-+    elif run_cmd "$CC --version"; then
-+      cc_name_tmp=$($CC --version 2>&1 | head -n 1 | cut -d ' ' -f 1)
-+    fi
-+    if test "${cc_name_tmp}"; then
-+      if echo "$cc_name_tmp" | grep -q "gcc"; then
-         cc_name=$cc_name_tmp
-         start_check "$CC version"
-         cc_vendor=gnu
-@@ -539,7 +544,7 @@ else
-         finish_check "$cc_name $cc_version"
-         break
-       fi
--      if $CC -v 2>&1 | grep -q "clang"; then
-+      if echo "$cc_name_tmp" | grep -q "clang"; then
-         start_check "$CC version"
-         cc_vendor=clang
-         cc_version=$($CC -dumpversion 2>&1)
--- 
-2.25.1
-
diff --git a/package/rhash/0002-configure-add-uclinux-target.patch b/package/rhash/0002-configure-add-uclinux-target.patch
deleted file mode 100644
index ca4a55644e..0000000000
--- a/package/rhash/0002-configure-add-uclinux-target.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 683f6875313cab9643402bb1710ebabb76e7c018 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 14 Jan 2021 08:37:06 +0100
-Subject: [PATCH] configure: add uclinux target
-
-Fix the following build failure with
---target=arm-buildroot-uclinux-uclibcgnueabi:
-
-Checking for target OS ... UNKNOWN
-
-Error: Unknown target OS, please specify the --target option
-
-Fixes:
- - http://autobuild.buildroot.org/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index c8e1ea7..aae4dce 100755
---- a/configure
-+++ b/configure
-@@ -426,7 +426,7 @@ else
-     component=$1
-     part=$(echo $BUILD_TARGET | cut -d '-' -f $component)
-     case "$(echo $part | tr '[A-Z]' '[a-z]')" in
--      linux) TARGET_OS=Linux ;;
-+      linux|uclinux) TARGET_OS=Linux ;;
-       freebsd*) TARGET_OS=FreeBSD ;;
-       gnu/kfreebsd) TARGET_OS=FreeBSD ;;
-       netbsd) TARGET_OS=NetBSD ;;
--- 
-2.29.2
-
diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index ba7bbb8ab7..e0555af3c2 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.1/
-sha1  e1f559d060fd07bfca854c8ae3384798bd2ef266  rhash-1.4.1-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.2/
+sha1  fdb0b0c16f3ba3eba734b3adf9f2fc4c427ff987  rhash-1.4.2-src.tar.gz
 # Locally calculated
-sha256  430c812733e69b78f07ce30a05db69563450e41e217ae618507a4ce2e144a297  rhash-1.4.1-src.tar.gz
+sha256  600d00f5f91ef04194d50903d3c79412099328c42f28ff43a0bdb777b00bec62  rhash-1.4.2-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 92abcd29b0..d19c355cbb 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.1
+RHASH_VERSION = 1.4.2
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
