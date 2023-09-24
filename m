Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73208CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2097F4193C;
	Sun, 24 Sep 2023 21:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2097F4193C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLPEwgPjCd6G; Sun, 24 Sep 2023 21:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8FD41934;
	Sun, 24 Sep 2023 21:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D8FD41934
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA9C1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 336EB81CEF
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336EB81CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2oSEvzUDFyJ for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 741D681D47
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741D681D47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 727C587643; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:14:49 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 1147afc11771161534988a5b5af082876fe0f8fd
X-Git-Newrev: a04464807afcb461d5e6960da06f446f6393596f
X-Patchwork-Hint: ignore
Message-Id: <20230924212150.727C587643@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/conmon: fix
 libseccomp shared build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a04464807afcb461d5e6960da06f446f6393596f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Drop patch and disable libseccomp when building statically to avoid the
following build failure raised since commit
29834d8a12d984e8efe05398c5aaa6a61f7880e0:

src/seccomp_notify.c: In function 'seccomp_notify_plugins_load':
src/seccomp_notify.c:136:42: warning: implicit declaration of function 'dlopen'; did you mean 'popen'? [-Wimplicit-function-declaration]
  136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
      |                                          ^~~~~~
      |                                          popen
src/seccomp_notify.c:136:53: error: 'RTLD_NOW' undeclared (first use in this function)
  136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
      |                                                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/13d3b46990720bba8621c922b5dce54ab650e96d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8144dd1b4cca2d5c89e329b0497f49f512c9caed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-remove-unused-dlfcn.h-header-file.patch   | 26 ----------------------
 package/conmon/conmon.mk                           |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
deleted file mode 100644
index 14f817942e..0000000000
--- a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e28634a0e847a14c58482f962bc9b1d69937387f Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 12 Aug 2023 12:53:37 +0200
-Subject: [PATCH] remove unused dlfcn.h header file
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/containers/conmon/issues/443
----
- src/seccomp_notify.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
-index 8d34d9d..2a8371d 100644
---- a/src/seccomp_notify.c
-+++ b/src/seccomp_notify.c
-@@ -7,7 +7,6 @@
- 
- #include <errno.h>
- #include <sys/ioctl.h>
--#include <dlfcn.h>
- #include <sys/wait.h>
- #include <sys/mount.h>
- #include <signal.h>
--- 
-2.39.2
-
diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 29deb2af47..50807f8c6a 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -11,7 +11,7 @@ CONMON_LICENSE_FILES = LICENSE
 
 CONMON_DEPENDENCIES = host-pkgconf libglib2
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+ifeq ($(BR2_PACKAGE_LIBSECCOMP):$(BR2_STATIC_LIBS),y:)
 CONMON_DISABLE_SECCOMP = 0
 CONMON_DEPENDENCIES += libseccomp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
