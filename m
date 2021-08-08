Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697F7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B09960FD8
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B09960FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A86606E0;
	Sun,  8 Aug 2021 07:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENvR7-GnmPuh; Sun,  8 Aug 2021 07:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D67460707;
	Sun,  8 Aug 2021 07:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E13D51BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDDA6403F4
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNb6JGLz-owm for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:49:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94FF0403C3
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:49:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 671C98D1D6; Sun,  8 Aug 2021 07:48:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 09:39:28 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c5adedbc52b5327fc4e94b36c17aaacab1c7dcff
X-Git-Newrev: 0bc7a29af1a5f3afcd79e479d6fb8aa0fe5f991f
X-Patchwork-Hint: ignore
Message-Id: <20210808074854.671C98D1D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libmodsecurity:
 fix build with libmaxminddb
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0bc7a29af1a5f3afcd79e479d6fb8aa0fe5f991f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Build with libmaxminddb is broken since bump to version 3.0.5 in commit
464d0be380c84ac7c3f1684e49153c3868280d7e because of
https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788

So revert this commit until upstream answer to comment to
https://github.com/SpiderLabs/ModSecurity/issues/2131

Reverting this commit requires autoreconfiguring, which itself causes
lots of warnings as configure.ac queries git to know the version of
various parts of libmodsecurity. However, it turns out that those
versions are only used to be displayed in the output of the configure
script, which is quite useless. The only one that is referenced
elsewhere is LIBINJECTION_VERSION, but it's in fact a different thing:
it is defined by others/libinjection/src/libinjection_sqli.c.

The only variable that was AC_SUBST() and therefore visible elsewhere
was MSC_GIT_VERSION, but it is not used anywhere in the code base,
except in the configure script itself.

Note that one patch is 0001 and the other 0003, because there was
already a 0002 patch.

Fixes:
 - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 94b6fbd5823cbf94f2f76e402b0d73b473a8b64f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re.ac-drop-usage-of-git-at-configure-time.patch | 79 ++++++++++++++++++++++
 ...0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 ++++++++
 package/libmodsecurity/libmodsecurity.mk           |  2 +
 3 files changed, 109 insertions(+)

diff --git a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
new file mode 100644
index 0000000000..14767fb28e
--- /dev/null
+++ b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
@@ -0,0 +1,79 @@
+From a2116312068b6b2c5732dfebde19b751cc81d4f3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 1 Aug 2021 23:21:35 +0200
+Subject: [PATCH] configure.ac: drop usage of git at configure time
+
+The usage of git is only to print some messages at configure time,
+which is not very useful, and causes a significant number of warning
+when regenerating the configure script.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 23 -----------------------
+ 1 file changed, 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 20163e1e..14e5892a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,6 @@
+ 
+ # Get the hash of the last commit, to be used if it is not an
+ # official release.
+-AC_DEFUN([MSC_GIT_HASH], m4_esyscmd_s(git log -1 --format="%h" --abbrev-commit))
+ AC_DEFUN([MSC_MAJOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MAJOR " | awk {'print $3'} | sed 's/\"//g'))
+ AC_DEFUN([MSC_MINOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MINOR " | awk {'print $3'} | sed 's/\"//g'))
+ AC_DEFUN([MSC_PATCHLEVEL], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_PATCHLEVEL " | awk {'print $3'} | sed 's/\"//g'))
+@@ -25,9 +24,6 @@ m4_define([msc_version],
+ m4_define([msc_version_with_patchlevel],
+     [msc_version_major.msc_version_minor.msc_version_patchlevel])
+ 
+-m4_define([msc_version_git],
+-    [m4_esyscmd_s(git describe)])
+-
+ m4_define([msc_version_info],
+     [msc_version_c_plus_a:msc_version_patchlevel:msc_version_minor])
+ 
+@@ -73,11 +69,6 @@ AC_MSG_ERROR([\
+ 
+    ])
+ fi
+-# Libinjection version
+-AC_DEFUN([LIBINJECTION_VERSION], m4_esyscmd_s(cd "others/libinjection" && git describe && cd ../..))
+-
+-# SecLang test version
+-AC_DEFUN([SECLANG_TEST_VERSION], m4_esyscmd_s(cd "test/test-cases/secrules-language-tests" && git log -1 --format="%h" --abbrev-commit && cd ../../..))
+ 
+ 
+ # Check for yajl
+@@ -217,10 +208,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
+ MSC_VERSION=msc_version
+ AC_SUBST([MSC_VERSION])
+ 
+-MSC_GIT_VERSION=msc_version_git
+-AC_SUBST([MSC_GIT_VERSION])
+-
+-
+ AC_ARG_ENABLE(debug-logs,
+     [AC_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
+ 
+@@ -412,16 +399,6 @@ AC_OUTPUT
+ 
+ 
+ # Print a fancy summary
+-echo " "
+-echo " "
+-echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
+-echo " "
+-echo " Mandatory dependencies"
+-echo -n "   + libInjection                                  ...."
+-echo LIBINJECTION_VERSION
+-echo -n "   + SecLang tests                                 ...."
+-echo SECLANG_TEST_VERSION
+-
+ echo " "
+ echo " Optional dependencies"
+ 
+-- 
+2.31.1
+
diff --git a/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch b/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
new file mode 100644
index 0000000000..9608e3d935
--- /dev/null
+++ b/package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch
@@ -0,0 +1,28 @@
+From 6737dc133cb4811a000c02b4e0a92b72f0b220ee Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Jul 2021 19:12:51 +0200
+Subject: [PATCH] Revert "Fix maxminddb link on FreeBSD"
+
+This reverts commit 785958f9b5089b918c7d054cbcc2fe4a3c7b3788.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/libmaxmind.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/libmaxmind.m4 b/build/libmaxmind.m4
+index 656fc250..02820b5a 100644
+--- a/build/libmaxmind.m4
++++ b/build/libmaxmind.m4
+@@ -10,7 +10,7 @@ dnl  MAXMIND_VERSION
+ AC_DEFUN([PROG_MAXMIND], [
+ 
+ # Possible names for the maxmind library/package (pkg-config)
+-MAXMIND_POSSIBLE_LIB_NAMES="maxminddb maxmind"
++MAXMIND_POSSIBLE_LIB_NAMES="libmaxminddb maxminddb maxmind"
+ 
+ # Possible extensions for the library
+ MAXMIND_POSSIBLE_EXTENSIONS="so la sl dll dylib"
+-- 
+2.30.2
+
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index b2637257b6..66e7e522a1 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -12,6 +12,8 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
+# We're patching build/libmaxmind.m4
+LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
