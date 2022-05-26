Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E09EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CD18459E;
	Thu, 26 May 2022 08:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k53UojE9rBrK; Thu, 26 May 2022 08:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B38D84554;
	Thu, 26 May 2022 08:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C8E1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EDF041186
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSuFEAjxqUMA for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BB9E4117D
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9561986535; Thu, 26 May 2022 08:35:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:42:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0066a82527d37348fbe1307aabe084d1be9b9b77
X-Git-Newrev: ddacef50bc0852fca6a49792fc719088d925a178
X-Patchwork-Hint: ignore
Message-Id: <20220526083517.9561986535@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/valgrind: fix
 compilation for uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddacef50bc0852fca6a49792fc719088d925a178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Add upstream patch ([1]) to fix compilation for uclibc

- Add autoreconf as the patch touches configure.ac

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3c88d24249d67e3e6b43d56b7052a155bd0150e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0003-coregrind-fix-compilation-for-uclibc.patch | 65 ++++++++++++++++++++++
 package/valgrind/valgrind.mk                       |  2 +
 2 files changed, 67 insertions(+)

diff --git a/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
new file mode 100644
index 0000000000..ff8dc974d8
--- /dev/null
+++ b/package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch
@@ -0,0 +1,65 @@
+From 9c9fd9ae24b45f915f0759d32f662835c26d37c3 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 8 Apr 2022 12:36:33 +0200
+Subject: [PATCH] coregrind: fix compilation for uclibc
+
+It fixes a known iusse whose details are described at [1] and more
+generally it guarantees that Valgrind is properly compiled for ulibc.
+
+[1] https://www.mail-archive.com/valgrind-users@lists.sourceforge.net/msg05295.html
+
+Suggested-by Michael Trimarchi <michael@amarulasolutions.com>
+Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ configure.ac                        | 2 ++
+ coregrind/m_debuginfo/minilzo-inl.c | 4 ++++
+ coregrind/vg_preloaded.c            | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 6f51dfd9f8fb..c627a9c17a4a 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -1204,6 +1204,8 @@ AC_SUBST(DEFAULT_SUPP)
+ AC_CHECK_HEADER([features.h])
+ 
+ if test x$ac_cv_header_features_h = xyes; then
++  AC_DEFINE([HAVE_HEADER_FEATURES_H], 1,
++          [Define to 1 if you have the `features.h' header.])
+   rm -f conftest.$ac_ext
+   cat <<_ACEOF >conftest.$ac_ext
+ #include <features.h>
+diff --git a/coregrind/m_debuginfo/minilzo-inl.c b/coregrind/m_debuginfo/minilzo-inl.c
+index 153d008fd44f..b45ec92eaa85 100644
+--- a/coregrind/m_debuginfo/minilzo-inl.c
++++ b/coregrind/m_debuginfo/minilzo-inl.c
+@@ -1875,6 +1875,10 @@ extern "C" {
+ 
+ #endif
+ 
++#ifdef HAVE_HEADER_FEATURES_H
++#include <features.h>
++#endif
++
+ #undef LZO_HAVE_CONFIG_H
+ #include "minilzo.h"
+ 
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 5e2098390847..3809811aede7 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -45,6 +45,10 @@
+ #include "pub_core_debuginfo.h"  // Needed for pub_core_redir.h
+ #include "pub_core_redir.h"      // For VG_NOTIFY_ON_LOAD
+ 
++#ifdef HAVE_HEADER_FEATURES_H
++#include <features.h>
++#endif
++
+ #if defined(VGO_linux) || defined(VGO_solaris) || defined(VGO_freebsd)
+ 
+ /* ---------------------------------------------------------------------
+-- 
+2.32.0
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 52f2a04ffa..a3eabec9fe 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -14,6 +14,8 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
+# 0003-coregrind-fix-compilation-for-uclibc.patch
+VALGRIND_AUTORECONF=YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
