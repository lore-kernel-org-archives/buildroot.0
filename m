Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CD7741989;
	Sat, 28 May 2022 20:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5giPT2NCtM5T; Sat, 28 May 2022 20:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8874197F;
	Sat, 28 May 2022 20:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1973B1BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0704F40B75
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1sW7HLJ-Y6j for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:04:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAFD40B06
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:04:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C87C585F51; Sat, 28 May 2022 19:52:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 22:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4245bc29d4ac37ffaaaee0f502a7abf3729a6715
X-Git-Newrev: 13c7db8716efffeb11b13e06087f4105010803be
X-Patchwork-Hint: ignore
Message-Id: <20220528195247.C87C585F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix build failure on
 Aarch64 host for powerpc64 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=13c7db8716efffeb11b13e06087f4105010803be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building on Aarch64 host for powerpc64 we get this error:
gcc: error: unrecognized command-line option '-m64'

This happens because we don't have the flexibility to override the LDFLAGS
when linking nsinstall host tool that is built in libnss. Also libnss uses
the same LDFLAGS it uses for target and that is not correct.
So let's add a patch to add NATIVE_LDFLAGS variable to override LFDFLAGS
when building nsinstall utility and set it to HOST_LDFLAGS in libnss.mk

Fixes:
http://autobuild.buildroot.net/results/67500395f19aa698b98404cde8d20463e55504bf/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add upstream link in patch itself]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...1771036-Fix-build-failure-on-Aarch64-host.patch | 37 ++++++++++++++++++++++
 package/libnss/libnss.mk                           |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
new file mode 100644
index 0000000000..12b376744e
--- /dev/null
+++ b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
@@ -0,0 +1,37 @@
+From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 24 May 2022 23:40:45 +0200
+Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
+
+If trying to build on Aarch64 host for powerpc64 target we can't override
+the LDFLAGS leading to this build failure:
+gcc: error: unrecognized command-line option '-m64'
+
+So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
+any build environment can pass LDFLAGS that fits better for host
+architecture.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=1771036]
+---
+ coreconf/nsinstall/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
+index 08dfbc2fe..5061789ff 100644
+--- a/nss/coreconf/nsinstall/Makefile
++++ b/nss/coreconf/nsinstall/Makefile
+@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
+ OS_CFLAGS=$(NATIVE_FLAGS)
+ endif
+ 
++ifdef NATIVE_LDFLAGS
++LDFLAGS=$(NATIVE_LDFLAGS)
++endif
++
+ include $(DEPTH)/coreconf/rules.mk
+ 
+ # Redefine MAKE_OBJDIR for just this directory
+-- 
+2.34.1
+
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 540092dfcf..0d0f1d84b9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -92,7 +92,9 @@ define LIBNSS_BUILD_CMDS
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
+		$(LIBNSS_BUILD_VARS) \
+		NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX" \
+		NATIVE_LDFLAGS="$(HOST_LDFLAGS)"
 endef
 
 define LIBNSS_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
