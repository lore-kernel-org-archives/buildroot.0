Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2610C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A748040AF4;
	Mon, 25 Apr 2022 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIHrtZWQ7wuz; Mon, 25 Apr 2022 20:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7647E404FF;
	Mon, 25 Apr 2022 20:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485F41BF989
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185F840A8B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHU2Lp-4cr4R for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3059D404FF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E76818448E; Mon, 25 Apr 2022 20:15:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 22:16:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b71d2eb60bb3759d2583d54b04d70ecc64c6318
X-Git-Newrev: 68dfd09708c66f1aeca3bf5725eb83c7ea5b35c8
X-Patchwork-Hint: ignore
Message-Id: <20220425201531.E76818448E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410441896147553789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1410441896147553789==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=68dfd09708c66f1aeca3bf5725eb83c7ea5b35c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
because is already merged.

Select libcurl as required dependency, because keylocation now
supports https. OpenSSL was already a dependency, so libcurl will be
built with https support.

Add upstream patch to support uClibc.

We update the test cases to use the latest LTS kernel, 5.15.x.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...t-a-flaw-in-the-Python-3-version-checking.patch | 106 ---------------------
 package/zfs/Config.in                              |   1 +
 package/zfs/zfs.hash                               |   5 +-
 package/zfs/zfs.mk                                 |   6 +-
 support/testing/tests/package/test_zfs.py          |   4 +-
 5 files changed, 9 insertions(+), 113 deletions(-)

diff --git a/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
deleted file mode 100644
index 70978f9f4d..0000000000
--- a/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 4dc82e9d503518a00e54972be7c0cb5f342f985e Mon Sep 17 00:00:00 2001
-From: Rich Ercolani <214141+rincebrain@users.noreply.github.com>
-Date: Tue, 8 Jun 2021 20:20:16 -0400
-Subject: [PATCH] Correct a flaw in the Python 3 version checking
-
-It turns out the ax_python_devel.m4 version check assumes that
-("3.X+1.0" >= "3.X.0") is True in Python, which is not when X+1
-is 10 or above and X is not. (Also presumably X+1=100 and ...)
-
-So let's remake the check to behave consistently, using the
-"packaging" or (if absent) the "distlib" modules.
-
-(Also, update the Github workflows to use the new packages.)
-
-Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
-Reviewed-by: John Kennedy <john.kennedy@delphix.com>
-Signed-off-by: Rich Ercolani <rincebrain@gmail.com>
-Closes: #12073
-(cherry picked from commit 08cd0717359b1a18693e3c8e6d6e5a2819b35a48)
-[Romain: drop rpm spec and github workflows changes]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- config/always-pyzfs.m4    | 15 +++++++++++++++
- config/ax_python_devel.m4 | 33 +++++++++++++++++++++++++++------
- 2 files changed, 42 insertions(+), 6 deletions(-)
-
-diff --git a/config/always-pyzfs.m4 b/config/always-pyzfs.m4
-index 76e07b593..fa39fd885 100644
---- a/config/always-pyzfs.m4
-+++ b/config/always-pyzfs.m4
-@@ -46,6 +46,21 @@ AC_DEFUN([ZFS_AC_CONFIG_ALWAYS_PYZFS], [
- 	])
- 	AC_SUBST(DEFINE_PYZFS)
- 
-+	dnl #
-+	dnl # Python "packaging" (or, failing that, "distlib") module is required to build and install pyzfs
-+	dnl #
-+	AS_IF([test "x$enable_pyzfs" = xcheck -o "x$enable_pyzfs" = xyes], [
-+		ZFS_AC_PYTHON_MODULE([packaging], [], [
-+			ZFS_AC_PYTHON_MODULE([distlib], [], [
-+				AS_IF([test "x$enable_pyzfs" = xyes], [
-+					AC_MSG_ERROR("Python $PYTHON_VERSION packaging and distlib modules are not installed")
-+				], [test "x$enable_pyzfs" != xno], [
-+					enable_pyzfs=no
-+				])
-+			])
-+		])
-+	])
-+
- 	dnl #
- 	dnl # Require python-devel libraries
- 	dnl #
-diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
-index c51b45b7d..cdfbbf81f 100644
---- a/config/ax_python_devel.m4
-+++ b/config/ax_python_devel.m4
-@@ -97,9 +97,18 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
- 	# Check for a version of Python >= 2.1.0
- 	#
- 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
--	ac_supports_python_ver=`$PYTHON -c "import sys; \
--		ver = sys.version.split ()[[0]]; \
--		print (ver >= '2.1.0')"`
-+	ac_supports_python_ver=`cat<<EOD | $PYTHON -
-+from __future__ import print_function;
-+import sys;
-+try:
-+	from packaging import version;
-+except ImportError:
-+	from distlib import version;
-+ver = sys.version.split ()[[0]];
-+(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
-+tst_ver = tst_ver.strip ("'");
-+eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
-+EOD`
- 	if test "$ac_supports_python_ver" != "True"; then
- 		if test -z "$PYTHON_NOVERSIONCHECK"; then
- 			AC_MSG_RESULT([no])
-@@ -126,9 +135,21 @@ to something else than an empty string.
- 	#
- 	if test -n "$1"; then
- 		AC_MSG_CHECKING([for a version of Python $1])
--		ac_supports_python_ver=`$PYTHON -c "import sys; \
--			ver = sys.version.split ()[[0]]; \
--			print (ver $1)"`
-+		# Why the strip ()?  Because if we don't, version.parse
-+		# will, for example, report 3.10.0 >= '3.11.0'
-+		ac_supports_python_ver=`cat<<EOD | $PYTHON -
-+
-+from __future__ import print_function;
-+import sys;
-+try:
-+	from packaging import version;
-+except ImportError:
-+	from distlib import version;
-+ver = sys.version.split ()[[0]];
-+(tst_cmp, tst_ver) = "$1".split ();
-+tst_ver = tst_ver.strip ("'");
-+eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
-+EOD`
- 		if test "$ac_supports_python_ver" = "True"; then
- 		   AC_MSG_RESULT([yes])
- 		else
--- 
-2.31.1
-
diff --git a/package/zfs/Config.in b/package/zfs/Config.in
index c766c370e4..6209c5865b 100644
--- a/package/zfs/Config.in
+++ b/package/zfs/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_ZFS
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBCURL
 	help
 	  OpenZFS on Linux and FreeBSD
 
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 7f4f5a59f8..411af974c6 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,6 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.0.5/zfs-2.0.5.sha256.asc
-sha256  3a17498d704ebf4c5d7231660f6fb44ae07a1545519f567452a4270851a86ec9  zfs-2.0.5.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.4/zfs-2.1.4.sha256.asc
+sha256  3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6  zfs-2.1.4.tar.gz
+sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index dbda8aceb4..07ce3295ec 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,17 +4,17 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.0.5
+ZFS_VERSION = 2.1.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
+ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
-# 0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
 ZFS_AUTORECONF = YES
 
-ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib
+ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl
 
 # sysvinit installs only a commented-out modules-load.d/ config file
 ZFS_CONF_OPTS = \
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 772a66c1e4..706934ca65 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -13,7 +13,7 @@ class TestZfsGlibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.35"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y
@@ -70,7 +70,7 @@ class TestZfsUclibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.35"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y

--===============1410441896147553789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1410441896147553789==--
