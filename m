Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC40C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2305E60AD5;
	Sat,  5 Nov 2022 21:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2305E60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdN4rnRUposN; Sat,  5 Nov 2022 21:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD8160A90;
	Sat,  5 Nov 2022 21:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AD8160A90
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 855CB1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6079A60A90
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6079A60A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fgrr2isnoOWb for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:31:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3734360A7D
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3734360A7D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2432587E49; Sat,  5 Nov 2022 21:31:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 22:31:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b681cfefe2aee03df290715f3047f624595288
X-Git-Newrev: 94e47000c27c447de45e7190fbe8d3ef24d7df04
X-Patchwork-Hint: ignore
Message-Id: <20221105213145.2432587E49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gsl: fix powerpc build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94e47000c27c447de45e7190fbe8d3ef24d7df04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following powerpc build failures on:
 - musl raised because fpu_control.h is not available:

In file included from fp.c:8:
fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
   21 | #include <fpu_control.h>
      |          ^~~~~~~~~~~~~~~

 - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
   set:

   In file included from fp.c:8:
fp-gnuppc.c: In function 'gsl_ieee_set_mode':
fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
   53 |       mode |= _FPU_RC_NEAREST ;
      |               ^~~~~~~~~~~~~~~

These build failures are raised since the addition of the package in
commit 9d9f7feba4ffbfeb54479f1ad90d47acca1a6f0b

Fixes:
 - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
 - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-build-on-powerpc.patch   | 53 ++++++++++++++++++++++
 package/gsl/gsl.mk                                 |  2 +
 2 files changed, 55 insertions(+)

diff --git a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
new file mode 100644
index 0000000000..13f6da4588
--- /dev/null
+++ b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
@@ -0,0 +1,53 @@
+From 84e62d57b90b41a0c96bb9fb6ec61ecaac76a1ab Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Nov 2022 21:31:36 +0100
+Subject: [PATCH] configure.ac: fix build on powerpc
+
+Fix the following powerpc build failures on:
+ - musl raised because fpu_control.h is not available:
+
+In file included from fp.c:8:
+fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
+   21 | #include <fpu_control.h>
+      |          ^~~~~~~~~~~~~~~
+
+ - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
+   set:
+
+   In file included from fp.c:8:
+fp-gnuppc.c: In function 'gsl_ieee_set_mode':
+fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
+   53 |       mode |= _FPU_RC_NEAREST ;
+      |               ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
+ - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index bfd9ca30..1ee6dca0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -389,6 +389,14 @@ if test "$ac_cv_c_ieee_interface" = "gnux86" ; then
+    fi
+ fi
+ 
++if test "$ac_cv_c_ieee_interface" = "gnuppc" ; then
++    AC_CACHE_CHECK([for _FPU_RC_NEAREST], ac_cv_c__fpu_rc_nearest,
++    [ac_cv_c__fpu_rc_nearest=no
++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <fpu_control.h>
++]], [[ unsigned short mode = _FPU_RC_NEAREST ; ]])],[ac_cv_c__fpu_rc_nearest="yes"],[ac_cv_c_ieee_interface=unknown])
++    ])
++fi
++
+ ac_tr_ieee_interface=HAVE_`echo $ac_cv_c_ieee_interface | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`_IEEE_INTERFACE
+ AC_DEFINE_UNQUOTED($ac_tr_ieee_interface,1,[IEEE Interface Type])
+ 
+-- 
+2.35.1
+
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 416955b72c..3604f9836c 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -10,6 +10,8 @@ GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
 GSL_LICENSE_FILES = COPYING
 GSL_CONFIG_SCRIPTS = gsl-config
+# We're patching configure.ac
+GSL_AUTORECONF = YES
 
 # uClibc pretends to have fenv support as it installs <fenv.h>, but in
 # practice, it only implements it for i386. Problem reported upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
