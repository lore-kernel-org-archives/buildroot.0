Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BAEC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 07:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFF241E65;
	Tue, 30 May 2023 07:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFF241E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoOki3QOovEw; Tue, 30 May 2023 07:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B89F41E38;
	Tue, 30 May 2023 07:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B89F41E38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B06421BF376
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A7D4014D
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95A7D4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4BCNlUXO9mV for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 07:34:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B814015E
 for <buildroot@buildroot.org>; Tue, 30 May 2023 07:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B814015E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 828A886A5D; Tue, 30 May 2023 07:34:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 09:33:57 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 888eaf619ea2587b3e05c4e103b9b8926ea461cf
X-Git-Newrev: 42448495973b06225253b52e0cbc3cfb9188f39b
X-Patchwork-Hint: ignore
Message-Id: <20230530073422.828A886A5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zfs: fix python3
 support check
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

commit: https://git.buildroot.net/buildroot/commit/?id=42448495973b06225253b52e0cbc3cfb9188f39b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Backport an upstream commit fixing the python3 support check

"The 22.0 release of the python `packaging` package removed the
 `LegacyVersion` trait, causing ZFS to no longer compile.

 This commit replaces the sections of `ax_python_dev.m4` that rely on
 `LegacyVersion` with updated implementations from the upstream
 `autoconf-archive`."

Add a comment above ZFS_AUTORECONF.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819411
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819410
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819409

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2816038d8b468725f318d680a73044ef91925870)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...l-of-LegacyVersion-broke-ax_python_dev.m4.patch | 134 +++++++++++++++++++++
 package/zfs/zfs.mk                                 |   1 +
 2 files changed, 135 insertions(+)

diff --git a/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch b/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
new file mode 100644
index 0000000000..c7c4dc7d10
--- /dev/null
+++ b/package/zfs/0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
@@ -0,0 +1,134 @@
+From ad2c8e13e42bc2f396cce117d17a227dadedd476 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 5 Jan 2023 11:04:24 -0800
+Subject: [PATCH] removal of LegacyVersion broke ax_python_dev.m4
+
+The 22.0 release of the python `packaging` package removed the
+`LegacyVersion` trait, causing ZFS to no longer compile.
+
+This commit replaces the sections of `ax_python_dev.m4` that rely on
+`LegacyVersion` with updated implementations from the upstream
+`autoconf-archive`.
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Signed-off-by: Matthew Ahrens <mahrens@delphix.com>
+Closes #14297
+Upstream: https://github.com/openzfs/zfs/commit/b72efb751147ab57afd1588a15910f547cb22600
+[Romain: backport to 2.1.7]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ config/ax_python_devel.m4 | 71 +++++++++++++++++++--------------------
+ 1 file changed, 35 insertions(+), 36 deletions(-)
+
+diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
+index 7adcf01a0..9eef45065 100644
+--- a/config/ax_python_devel.m4
++++ b/config/ax_python_devel.m4
+@@ -97,23 +97,13 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
+ 	# Check for a version of Python >= 2.1.0
+ 	#
+ 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
+-	ac_supports_python_ver=`cat<<EOD | $PYTHON -
+-from __future__ import print_function;
+-import sys;
+-try:
+-	from packaging import version;
+-except ImportError:
+-	from distlib import version;
+-ver = sys.version.split ()[[0]];
+-(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
+-tst_ver = tst_ver.strip ("'");
+-eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
+-EOD`
++	ac_supports_python_ver=`$PYTHON -c "import sys; \
++		ver = sys.version.split ()[[0]]; \
++		print (ver >= '2.1.0')"`
+ 	if test "$ac_supports_python_ver" != "True"; then
+ 		if test -z "$PYTHON_NOVERSIONCHECK"; then
+ 			AC_MSG_RESULT([no])
+-			m4_ifvaln([$2],[$2],[
+-				AC_MSG_FAILURE([
++			AC_MSG_FAILURE([
+ This version of the AC@&t@_PYTHON_DEVEL macro
+ doesn't work properly with versions of Python before
+ 2.1.0. You may need to re-run configure, setting the
+@@ -122,7 +112,6 @@ PYTHON_EXTRA_LIBS and PYTHON_EXTRA_LDFLAGS by hand.
+ Moreover, to disable this check, set PYTHON_NOVERSIONCHECK
+ to something else than an empty string.
+ ])
+-			])
+ 		else
+ 			AC_MSG_RESULT([skip at user request])
+ 		fi
+@@ -131,37 +120,47 @@ to something else than an empty string.
+ 	fi
+ 
+ 	#
+-	# if the macro parameter ``version'' is set, honour it
++	# If the macro parameter ``version'' is set, honour it.
++	# A Python shim class, VPy, is used to implement correct version comparisons via
++	# string expressions, since e.g. a naive textual ">= 2.7.3" won't work for
++	# Python 2.7.10 (the ".1" being evaluated as less than ".3").
+ 	#
+ 	if test -n "$1"; then
+ 		AC_MSG_CHECKING([for a version of Python $1])
+-		# Why the strip ()?  Because if we don't, version.parse
+-		# will, for example, report 3.10.0 >= '3.11.0'
+-		ac_supports_python_ver=`cat<<EOD | $PYTHON -
+-
+-from __future__ import print_function;
+-import sys;
+-try:
+-	from packaging import version;
+-except ImportError:
+-	from distlib import version;
+-ver = sys.version.split ()[[0]];
+-(tst_cmp, tst_ver) = "$1".split ();
+-tst_ver = tst_ver.strip ("'");
+-eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
+-EOD`
++                cat << EOF > ax_python_devel_vpy.py
++class VPy:
++    def vtup(self, s):
++        return tuple(map(int, s.strip().replace("rc", ".").split(".")))
++    def __init__(self):
++        import sys
++        self.vpy = tuple(sys.version_info)
++    def __eq__(self, s):
++        return self.vpy == self.vtup(s)
++    def __ne__(self, s):
++        return self.vpy != self.vtup(s)
++    def __lt__(self, s):
++        return self.vpy < self.vtup(s)
++    def __gt__(self, s):
++        return self.vpy > self.vtup(s)
++    def __le__(self, s):
++        return self.vpy <= self.vtup(s)
++    def __ge__(self, s):
++        return self.vpy >= self.vtup(s)
++EOF
++		ac_supports_python_ver=`$PYTHON -c "import ax_python_devel_vpy; \
++                        ver = ax_python_devel_vpy.VPy(); \
++			print (ver $1)"`
++                rm -rf ax_python_devel_vpy*.py* __pycache__/ax_python_devel_vpy*.py*
+ 		if test "$ac_supports_python_ver" = "True"; then
+-		   AC_MSG_RESULT([yes])
++			AC_MSG_RESULT([yes])
+ 		else
+ 			AC_MSG_RESULT([no])
+-			m4_ifvaln([$2],[$2],[
+-				AC_MSG_ERROR([this package requires Python $1.
++			AC_MSG_ERROR([this package requires Python $1.
+ If you have it installed, but it isn't the default Python
+ interpreter in your system path, please pass the PYTHON_VERSION
+ variable to configure. See ``configure --help'' for reference.
+ ])
+-				PYTHON_VERSION=""
+-			])
++			PYTHON_VERSION=""
+ 		fi
+ 	fi
+ 
+-- 
+2.34.3
+
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 84e9099ba9..97e9442cf8 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -12,6 +12,7 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
 ZFS_CPE_ID_PRODUCT = openzfs
 
+# 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
 ZFS_AUTORECONF = YES
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
