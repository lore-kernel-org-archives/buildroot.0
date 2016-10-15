From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:44 +0200
Subject: [Buildroot] [git commit] ipkg: remove deprecated package
Message-ID: <20161015211550.32E0C82110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b80ca8913a6f29664f0a16a71516f8bf532acd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                       |   8 +++
 package/Config.in                      |   1 -
 package/ipkg/0001-fix-musl-build.patch |  50 -------------
 package/ipkg/0002-fix-nommu.patch      |  24 -------
 package/ipkg/Config.in                 |   7 --
 package/ipkg/ipkg-build                | 127 ---------------------------------
 package/ipkg/ipkg.hash                 |   2 -
 package/ipkg/ipkg.mk                   |  13 ----
 8 files changed, 8 insertions(+), 224 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7d68c67..c27ae3d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_IPKG
+	bool "ipkg removed"
+	select BR2_LEGACY
+	help
+	  ipkg dates back to the early 2000s when Compaq started the
+	  handhelds.org project and it hasn't seen development since 2006.
+	  Use opkg as a replacement.
+
 config BR2_GCC_VERSION_4_7_X
 	bool "gcc 4.7.x support removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1b0ffcf..0257685 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1651,7 +1651,6 @@ comment "*                                                      "
 comment "See the manual:                                        "
 comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
-	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
 	source "package/rpm/Config.in"
 endmenu
diff --git a/package/ipkg/0001-fix-musl-build.patch b/package/ipkg/0001-fix-musl-build.patch
deleted file mode 100644
index fce3ec4..0000000
--- a/package/ipkg/0001-fix-musl-build.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Remove __P macro usage to fix musl build
-
-__P() is used for compatibility with old K&R C compilers. With ANSI C
-this macro has no effect.
-
-This fixes a compilation error with musl libc because of undeclared
-__P.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/md5.c
-===================================================================
---- a/md5.c
-+++ b/md5.c
-@@ -97,21 +97,21 @@
- 
- /* Initialize structure containing state of computation.
-    (RFC 1321, 3.3: Step 3)  */
--static void md5_init_ctx __P ((struct md5_ctx *ctx));
-+static void md5_init_ctx (struct md5_ctx *ctx);
- 
- /* Starting with the result of former calls of this function (or the
-    initialization function update the context for the next LEN bytes
-    starting at BUFFER.
-    It is necessary that LEN is a multiple of 64!!! */
--static void md5_process_block __P ((const void *buffer, size_t len,
--				    struct md5_ctx *ctx));
-+static void md5_process_block (const void *buffer, size_t len,
-+				    struct md5_ctx *ctx);
- 
- /* Starting with the result of former calls of this function (or the
-    initialization function update the context for the next LEN bytes
-    starting at BUFFER.
-    It is NOT required that LEN is a multiple of 64.  */
--static void md5_process_bytes __P ((const void *buffer, size_t len,
--				    struct md5_ctx *ctx));
-+static void md5_process_bytes (const void *buffer, size_t len,
-+				    struct md5_ctx *ctx);
- 
- /* Process the remaining bytes in the buffer and put result from CTX
-    in first 16 bytes following RESBUF.  The result is always in little
-@@ -120,7 +120,7 @@
- 
-    IMPORTANT: On some systems it is required that RESBUF is correctly
-    aligned for a 32 bits value.  */
--static void *md5_finish_ctx __P ((struct md5_ctx *ctx, void *resbuf));
-+static void *md5_finish_ctx (struct md5_ctx *ctx, void *resbuf);
- 
- //----------------------------------------------------------------------------
- //--------end of md5.h
diff --git a/package/ipkg/0002-fix-nommu.patch b/package/ipkg/0002-fix-nommu.patch
deleted file mode 100644
index 64cec1e..0000000
--- a/package/ipkg/0002-fix-nommu.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-libbb: fix no MMU build
-
-uClibc-ng defines __ARCH_HAS_MMU__ for ARM or m68k because these
-architectures may potentially have MMU. The code should test for
-__ARCH_USE_MMU__, which indicates if the MMU is really in use. But
-since the configure script detects the presence of fork(), using
-HAVE_FORK directly is a better solution.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: no active upstream
-
-diff -Nuar ipkg-0.99.163-orig/libbb/libbb.h ipkg-0.99.163/libbb/libbb.h
---- ipkg-0.99.163-orig/libbb/libbb.h	2006-02-06 10:13:02.000000000 +0200
-+++ ipkg-0.99.163/libbb/libbb.h	2016-07-26 13:50:09.296988855 +0300
-@@ -341,7 +341,7 @@
- #define CONSOLE_DEV "/dev/console"
- 
- /* Cope with mmu-less systems somewhat gracefully */
--#if defined(__UCLIBC__) && !defined(__ARCH_HAS_MMU__)
-+#if !defined(HAVE_FORK)
- #define fork	vfork
- #endif
- 
diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
deleted file mode 100644
index a987bd6..0000000
--- a/package/ipkg/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_IPKG
-	bool "ipkg"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	help
-	  The Itsy Package Installer from handhelds.org
-
-	  http://www.handhelds.org
diff --git a/package/ipkg/ipkg-build b/package/ipkg/ipkg-build
deleted file mode 100755
index f3f5d0c..0000000
--- a/package/ipkg/ipkg-build
+++ /dev/null
@@ -1,127 +0,0 @@
-#!/bin/sh
-
-# ipkg-build -- construct a .ipk from a directory
-# Carl Worth <cworth@east.isi.edu>
-# based on a script by Steve Redler IV, steve at sr-tech.com 5-21-2001
-set -e
-
-ipkg_extract_value() {
-	sed -e "s/^[^:]*:[[:space:]]*//"
-}
-
-required_field() {
-	field=$1
-
-	value=`grep "^$field:" < $CONTROL/control | ipkg_extract_value`
-	if [ -z "$value" ]; then
-		echo "ipkg-build: Error: $CONTROL/control is missing field $field" ;
-		PKG_ERROR=1
-	fi
-	echo $value
-}
-
-pkg_appears_sane() {
-	local pkg_dir=$1
-
-	local owd=`pwd`
-	cd $pkg_dir
-
-	PKG_ERROR=0
-	if [ ! -f "$CONTROL/control" ]; then
-		echo "ipkg-build: Error: Control file $pkg_dir/$CONTROL/control not found."
-		cd $owd
-		return 1
-	fi
-
-	pkg=`required_field Package`
-	version=`required_field Version`
-	arch=`required_field Architecture`
-	required_field Maintainer >/dev/null
-	required_field Description >/dev/null
-
-	if echo $pkg | grep '[^a-z0-9.+-]'; then
-		echo "ipkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
-		PKG_ERROR=1;
-	fi
-
-	local bad_fields=`sed -ne 's/^\([^[:space:]][^:[:space:]]\+[[:space:]]\+\)[^:].*/\1/p' < $CONTROL/control | sed -e 's/\\n//'`
-	if [ -n "$bad_fields" ]; then
-		bad_fields=`echo $bad_fields`
-		echo "ipkg-build: Error: The following fields in $CONTROL/control are missing a ':'"
-		echo "	$bad_fields"
-		echo "ipkg-build: This may be due to a missing initial space for a multi-line field value"
-		PKG_ERROR=1
-	fi
-
-	for script in $CONTROL/preinst $CONTROL/postinst $CONTROL/prerm $CONTROL/postrm; do
-		if [ -f $script -a ! -x $script ]; then
-			echo "ipkg-build: Error: package script $script is not executable"
-			PKG_ERROR=1
-		fi
-	done
-
-	if [ -f $CONTROL/conffiles ]; then
-		for cf in `cat $CONTROL/conffiles`; do
-			if [ ! -f ./$cf ]; then
-				echo "ipkg-build: Error: $CONTROL/conffiles mentions conffile $cf which does not exist"
-				PKG_ERROR=1
-			fi
-		done
-	fi
-
-	cd $owd
-	return $PKG_ERROR
-}
-
-###
-# ipkg-build "main"
-###
-
-case $# in
-1)
-	dest_dir=.
-	;;
-2)
-	dest_dir=$2
-	;;
-*)
-	echo "Usage: ipkg-build <pkg_directory> [<destination_directory>]" ;
-	exit 1 
-	;;
-esac
-
-pkg_dir=$1
-
-if [ ! -d $pkg_dir ]; then
-	echo "ipkg-build: Error: Directory $pkg_dir does not exist"
-	exit 1
-fi
-
-# CONTROL is second so that it takes precedence
-CONTROL=
-[ -d $pkg_dir/DEBIAN ] && CONTROL=DEBIAN
-[ -d $pkg_dir/CONTROL ] && CONTROL=CONTROL
-if [ -z "$CONTROL" ]; then
-	echo "ipkg-build: Error: Directory $pkg_dir has no CONTROL subdirectory."
-	exit 1
-fi
-
-if ! pkg_appears_sane $pkg_dir; then
-	echo "Please fix the above errors and try again."
-	exit 1
-fi
-
-tmp_dir=$dest_dir/IPKG_BUILD.$$
-mkdir $tmp_dir
-
-tar -C $pkg_dir -czf $tmp_dir/data.tar.gz . --exclude=$CONTROL
-tar -C $pkg_dir/$CONTROL -czf $tmp_dir/control.tar.gz .
-
-echo "2.0" > $tmp_dir/debian-binary
-
-pkg_file=$dest_dir/${pkg}_${version}_${arch}.ipk
-tar -C $tmp_dir -czf $pkg_file debian-binary data.tar.gz control.tar.gz
-rm $tmp_dir/debian-binary $tmp_dir/data.tar.gz $tmp_dir/control.tar.gz
-rmdir $tmp_dir
-
-echo "Packaged contents of $pkg_dir into $pkg_file"
diff --git a/package/ipkg/ipkg.hash b/package/ipkg/ipkg.hash
deleted file mode 100644
index 34a2d62..0000000
--- a/package/ipkg/ipkg.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  405743e1ba320ed6095d42a898f1486e3af1d745cae2bd45dfe1d8403a4d8995  ipkg-0.99.163.tar.gz
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
deleted file mode 100644
index 10ef207..0000000
--- a/package/ipkg/ipkg.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# ipkg
-#
-################################################################################
-
-IPKG_VERSION = 0.99.163
-IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
-IPKG_INSTALL_STAGING = YES
-IPKG_LICENSE = GPLv2+
-IPKG_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
