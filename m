Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67981C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9937681376;
	Mon, 12 Aug 2024 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYf7h5Pzq8Nj; Mon, 12 Aug 2024 20:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C8981378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C8981378;
	Mon, 12 Aug 2024 20:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3A0C1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC56C81365
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJ9ONHykCoaC for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0731681366
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0731681366
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:23:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B2D85446; Mon, 12 Aug 2024 20:23:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:22:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a700617cc1aa14deb9f4e4f5c63e19c77901389
X-Git-Newrev: b62d671a1b5a12ae95b4bef7a1f30f85af6cd2ed
X-Patchwork-Hint: ignore
Message-Id: <20240812202305.E4B2D85446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/chicken: move literals
 into text section for xtensa architecture"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b62d671a1b5a12ae95b4bef7a1f30f85af6cd2ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 86e51fd5fe2810bbf833b48c4914dcd2de01bdbe.
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-xtensa-text-section-literals.patch        | 30 ----------------------
 package/chicken/chicken.mk                         | 14 ++--------
 2 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
deleted file mode 100644
index b93aaf9e21..0000000000
--- a/package/chicken/0001-xtensa-text-section-literals.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
-From: Woodrow Douglass <wdouglass@carnegierobotics.com>
-Date: Mon, 22 Jul 2024 08:50:37 -0400
-Subject: [PATCH] Move literals into text section for xtensa architecture
-
-Upstream: https://bugs.call-cc.org/ticket/1840
-Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
----
- Makefile.linux | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile.linux b/Makefile.linux
-index b628cda4..e97c2b94 100644
---- a/Makefile.linux
-+++ b/Makefile.linux
-@@ -52,6 +52,11 @@ USES_SONAME = yes
- 
- # architectures
- 
-+ifeq ($(ARCH),xtensa)
-+C_COMPILER_OPTIONS += -mtext-section-literals
-+LINKER_OPTIONS += -mtext-section-literals
-+endif
-+
- ifeq ($(ARCH),x32)
- C_COMPILER_OPTIONS += -mx32
- LINKER_OPTIONS += -mx32
--- 
-2.39.2
-
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 0520280134..2667f7823d 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -11,19 +11,9 @@ CHICKEN_LICENSE_FILES = LICENSE
 CHICKEN_CPE_ID_VENDOR = call-cc
 CHICKEN_INSTALL_STAGING = YES
 
-# Chicken only uses the "arch" variable for some special-case compile
-# arguments If it's empty, it tries to detect the arch host Filter out
-# values that have an effect, or pass "unused" here
-ifeq ($(NORMALIZED_ARCH),x86_64)
-CHICKEN_ARCH = x86-64
-else ifeq ($(NORMALIZED_ARCH),xtensa)
-CHICKEN_ARCH = xtensa
-else
-CHICKEN_ARCH = unused
-endif
-
+# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
 CHICKEN_MAKE_OPTS = \
-	ARCH="$(CHICKEN_ARCH)" \
+	ARCH=unused \
 	C_COMPILER="$(TARGET_CC)" \
 	CXX_COMPILER="$(TARGET_CXX)" \
 	PREFIX=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
