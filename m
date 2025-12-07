Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48FFD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6DC80969;
	Fri, 12 Dec 2025 07:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYjA3Y7_E5FI; Fri, 12 Dec 2025 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB738430B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526336;
	bh=V/RTBFWQIvf5/tQXE4gNjag5BKCP4fjmdgPr4Pc7UdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PtRWcNinf3U2O8NnauY19b0kCUKU8e3qgCT1szPIUMECXVEjyTbP8Kl0lDitkzH7y
	 YKulVAbdW542QvbiwAiJH74JP7dK51NBqp4LghWuZ7JITMhhnwzpGy/4FbjvEGUK55
	 Q9COXN2NWHygE6yOi4URs3lWfSf70OMqowieoZN5G+0HtkEWZHyxPKbOyMUVMfZNk1
	 iwFeatrVLI2eSKaC9JsEKjH2D9L/DSYgZSdwhPtDLAhjQezRRXKFV9VnhBXVsGfLPK
	 d2Dp9BeZlFpqHcZr5T+3ck7jRnA54Ga3391UlNFu0D4Ux4+R1hC7DAyuiESRDsovrb
	 Yui77I684tmYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB738430B;
	Fri, 12 Dec 2025 07:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA2B2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 813034118A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nTjF6xvVHO9 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F9541162
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F9541162
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 653C07FEE1; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:19:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50580a046f30bfd5256b13afd5825cb1d076185c
X-Git-Newrev: ababaabb05b26a800622789f87408a038f956045
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.653C07FEE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: fix cmake 4
 compatibility
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ababaabb05b26a800622789f87408a038f956045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-CMake-Raised-required-version-to-3.5.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
new file mode 100644
index 0000000000..9d8482d5d2
--- /dev/null
+++ b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
@@ -0,0 +1,27 @@
+From 101e1ba89dc41ceb75090831da97c43a76cd2906 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <mail@heiko-becker.de>
+Date: Thu, 20 Feb 2025 15:20:07 +0100
+Subject: [PATCH] CMake: Raised required version to 3.5 (#240)
+
+CMake >= 4.0.0-rc1 removed compatibility with versions < 3.5 and errors
+out with such versions passed to cmake_minimum_required(). 3.5.0 has
+been released 9 years ago, so I'd assume it's available almost
+everywhere.
+
+Upstream: https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8749ef86..31457723 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+ project(double-conversion VERSION 3.3.0)
+ 
+ option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
