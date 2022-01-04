Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC57C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D80F408BE;
	Tue,  4 Jan 2022 18:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JC2VII0lf9SX; Tue,  4 Jan 2022 18:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E89E41515;
	Tue,  4 Jan 2022 18:35:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA9B1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58507408BE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qu6W8DOXf8dm for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A4DE4095F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B9A1183249; Tue,  4 Jan 2022 18:28:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 19:10:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cc445fd5fbb83c2b55f679f3d92223f34f214cb
X-Git-Newrev: 0197eb3a7121712d5ae1c8c5c3e180961fce1cdb
X-Patchwork-Hint: ignore
Message-Id: <20220104182811.B9A1183249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: fix python3 version check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0197eb3a7121712d5ae1c8c5c3e180961fce1cdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch to fix the python 3 version check that
broke the build since the python 3.10 version bump.

Add host-python-packaging dependency since the backport
add "from packaging import version" while checking the
python version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1935414730
https://gitlab.com/buildroot.org/buildroot/-/jobs/1935415049

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...t-a-flaw-in-the-Python-3-version-checking.patch | 106 +++++++++++++++++++++
 package/zfs/zfs.mk                                 |   5 +-
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
new file mode 100644
index 0000000000..70978f9f4d
--- /dev/null
+++ b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
@@ -0,0 +1,106 @@
+From 4dc82e9d503518a00e54972be7c0cb5f342f985e Mon Sep 17 00:00:00 2001
+From: Rich Ercolani <214141+rincebrain@users.noreply.github.com>
+Date: Tue, 8 Jun 2021 20:20:16 -0400
+Subject: [PATCH] Correct a flaw in the Python 3 version checking
+
+It turns out the ax_python_devel.m4 version check assumes that
+("3.X+1.0" >= "3.X.0") is True in Python, which is not when X+1
+is 10 or above and X is not. (Also presumably X+1=100 and ...)
+
+So let's remake the check to behave consistently, using the
+"packaging" or (if absent) the "distlib" modules.
+
+(Also, update the Github workflows to use the new packages.)
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Reviewed-by: John Kennedy <john.kennedy@delphix.com>
+Signed-off-by: Rich Ercolani <rincebrain@gmail.com>
+Closes: #12073
+(cherry picked from commit 08cd0717359b1a18693e3c8e6d6e5a2819b35a48)
+[Romain: drop rpm spec and github workflows changes]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ config/always-pyzfs.m4    | 15 +++++++++++++++
+ config/ax_python_devel.m4 | 33 +++++++++++++++++++++++++++------
+ 2 files changed, 42 insertions(+), 6 deletions(-)
+
+diff --git a/config/always-pyzfs.m4 b/config/always-pyzfs.m4
+index 76e07b593..fa39fd885 100644
+--- a/config/always-pyzfs.m4
++++ b/config/always-pyzfs.m4
+@@ -46,6 +46,21 @@ AC_DEFUN([ZFS_AC_CONFIG_ALWAYS_PYZFS], [
+ 	])
+ 	AC_SUBST(DEFINE_PYZFS)
+ 
++	dnl #
++	dnl # Python "packaging" (or, failing that, "distlib") module is required to build and install pyzfs
++	dnl #
++	AS_IF([test "x$enable_pyzfs" = xcheck -o "x$enable_pyzfs" = xyes], [
++		ZFS_AC_PYTHON_MODULE([packaging], [], [
++			ZFS_AC_PYTHON_MODULE([distlib], [], [
++				AS_IF([test "x$enable_pyzfs" = xyes], [
++					AC_MSG_ERROR("Python $PYTHON_VERSION packaging and distlib modules are not installed")
++				], [test "x$enable_pyzfs" != xno], [
++					enable_pyzfs=no
++				])
++			])
++		])
++	])
++
+ 	dnl #
+ 	dnl # Require python-devel libraries
+ 	dnl #
+diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
+index c51b45b7d..cdfbbf81f 100644
+--- a/config/ax_python_devel.m4
++++ b/config/ax_python_devel.m4
+@@ -97,9 +97,18 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
+ 	# Check for a version of Python >= 2.1.0
+ 	#
+ 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
+-	ac_supports_python_ver=`$PYTHON -c "import sys; \
+-		ver = sys.version.split ()[[0]]; \
+-		print (ver >= '2.1.0')"`
++	ac_supports_python_ver=`cat<<EOD | $PYTHON -
++from __future__ import print_function;
++import sys;
++try:
++	from packaging import version;
++except ImportError:
++	from distlib import version;
++ver = sys.version.split ()[[0]];
++(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
++tst_ver = tst_ver.strip ("'");
++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
++EOD`
+ 	if test "$ac_supports_python_ver" != "True"; then
+ 		if test -z "$PYTHON_NOVERSIONCHECK"; then
+ 			AC_MSG_RESULT([no])
+@@ -126,9 +135,21 @@ to something else than an empty string.
+ 	#
+ 	if test -n "$1"; then
+ 		AC_MSG_CHECKING([for a version of Python $1])
+-		ac_supports_python_ver=`$PYTHON -c "import sys; \
+-			ver = sys.version.split ()[[0]]; \
+-			print (ver $1)"`
++		# Why the strip ()?  Because if we don't, version.parse
++		# will, for example, report 3.10.0 >= '3.11.0'
++		ac_supports_python_ver=`cat<<EOD | $PYTHON -
++
++from __future__ import print_function;
++import sys;
++try:
++	from packaging import version;
++except ImportError:
++	from distlib import version;
++ver = sys.version.split ()[[0]];
++(tst_cmp, tst_ver) = "$1".split ();
++tst_ver = tst_ver.strip ("'");
++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
++EOD`
+ 		if test "$ac_supports_python_ver" = "True"; then
+ 		   AC_MSG_RESULT([yes])
+ 		else
+-- 
+2.31.1
+
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 3b1afb419a..0e7e3e4e74 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -11,6 +11,7 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
+# 0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
 ZFS_AUTORECONF = YES
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib
@@ -39,7 +40,7 @@ endif
 # The optional PyZFS uses different scripts depending on the python
 # version (ex: arc_summary2 or arc_summary3).
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-ZFS_DEPENDENCIES += python python-setuptools host-python-cffi
+ZFS_DEPENDENCIES += python python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
@@ -47,7 +48,7 @@ ZFS_CONF_ENV += \
 	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
 ZFS_CONF_OPTS += --enable-pyzfs
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi
+ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi host-python-packaging
 ZFS_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
