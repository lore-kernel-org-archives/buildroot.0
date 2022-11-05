Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5702860A4F;
	Sat,  5 Nov 2022 22:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5702860A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5VXG_D1crm1; Sat,  5 Nov 2022 22:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 554B760671;
	Sat,  5 Nov 2022 22:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 554B760671
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFE601BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB64881A5C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB64881A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ON598ZCT7SSV for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:43:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD35812E2
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD35812E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3855F87F72; Sat,  5 Nov 2022 22:43:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:43:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca6f38a340bf7eaac76aafcdf7dd78f5c61b0ba6
X-Git-Newrev: fbf3253d76399f2b310120e87c29569dd65749cc
X-Patchwork-Hint: ignore
Message-Id: <20221105224319.3855F87F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: fix build without
 makeinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbf3253d76399f2b310120e87c29569dd65749cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable documentation to avoid the following build failure without
makeinfo raised at least since bump to version 1.6.10 in commit
f0faa3b71c585cb70bcd6fa4bafb756b98130bd5 (and probably since the
addition of the package in commit
663f39c88c01593855c18355a4decdceeffd884b):

/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
WARNING: 'makeinfo' is missing on your system.
         You should only need it if you modified a '.texi' file, or
         any other file indirectly affecting the aspect of the manual.
         You might want to install the Texinfo package:
         <https://www.gnu.org/software/texinfo/>
         The spurious makeinfo call might also be the consequence of
         using a buggy 'make' (AIX, DU, IRIX), in which case you might
         want to install GNU make:
         <https://www.gnu.org/software/make/>
Makefile:442: recipe for target 'freeipmi-faq.info' failed

Fixes:
 - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeipmi/0001-add-disable-doc.patch | 72 +++++++++++++++++++++++++++++
 package/freeipmi/freeipmi.mk                |  2 +
 2 files changed, 74 insertions(+)

diff --git a/package/freeipmi/0001-add-disable-doc.patch b/package/freeipmi/0001-add-disable-doc.patch
new file mode 100644
index 0000000000..e410d2b52f
--- /dev/null
+++ b/package/freeipmi/0001-add-disable-doc.patch
@@ -0,0 +1,72 @@
+From 5324c88632c021a87251370b03067d857e9a9892 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Nov 2022 19:02:42 +0100
+Subject: [PATCH] add --disable-doc
+
+Allow the user to disable documentation through --disable-doc to avoid
+the following build failure without makeinfo:
+
+/home/buildroot/autobuild/instance-0/output-1/build/freeipmi-1.6.10/config/missing: line 81: makeinfo: command not found
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+Makefile:442: recipe for target 'freeipmi-faq.info' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ac6ff1c746a354f885fc1674d10e7bff9e536134
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/61]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 4 ++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cf757f634..d74952e30 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,6 @@
+ ACLOCAL_AMFLAGS = -I config
+ 
+ SUBDIRS = \
+-	doc \
+ 	etc \
+ 	common \
+ 	libfreeipmi \
+@@ -33,6 +32,11 @@ SUBDIRS = \
+ 	rmcpping \
+ 	contrib
+ 
++if ENABLE_DOC
++SUBDIRS += \
++	doc
++endif
++
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ 
+diff --git a/configure.ac b/configure.ac
+index 54fdf6367..7a94b958b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -341,6 +341,10 @@ else
+ fi
+ AC_SUBST(WITH_DEBUG)
+ 
++AC_ARG_ENABLE(doc,
++              AC_HELP_STRING([--disable-doc], [turn off documentation]))
++AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
++
+ dnl Allow advanced developers to compile with raw dumping
+ AC_ARG_ENABLE(rawdumps,
+    AC_HELP_STRING([--enable-rawdumps], [output raw packet dumps when debugging]))
+-- 
+2.35.1
+
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 916f2eb68a..3e0ac0ffa9 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -12,6 +12,8 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.ipmidetect COPYING.ipmi-fru COPYING.ipmimonitoring \
 	COPYING.ipmiping COPYING.ipmipower COPYING.ipmiseld COPYING.pstdout \
 	COPYING.sunbmc COPYING.ZRESEARCH
+# We're patching configure.ac
+FREEIPMI_AUTORECONF = YES
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
