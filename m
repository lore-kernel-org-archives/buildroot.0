Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43111D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15008840F2;
	Fri, 12 Dec 2025 07:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4j6hccMc21y; Fri, 12 Dec 2025 07:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3614B83F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526269;
	bh=wur6GTz1mQO0QY+adPcc4+BsBKJWX4oaiKF+os9D00U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=noYEm5IFa/NZfgGz1A7P+WMfNHYxWgNxynTpeyNQrmHDdAJRDvKx1Eh6qIaKkZN17
	 eu32juJZ62AUhlwASmJ4QMS2MXmsa0yffy5XhzOkZlEuZbrcYHKsfYOjdjxSRsmTzI
	 mURt/OVBUC/UG9XnH+7MAksmb+jXdzrMlowltiQG5Xb1luUIsAikHNThy71WW5QLbW
	 0HI0FoBcJ9JrKhBqjo/UcrPAFNN4bVpbz+hzt5vmLU4siCBYTshy9s1/BSrlgbcNTh
	 OwfWcLUCXwXyaN6xq/Fg8Dp9mxBuESaEFsQiCTsxhjJTWQxoU98Q3AWlo4DbJHA9Y1
	 zD0kMnzuevNww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3614B83F3A;
	Fri, 12 Dec 2025 07:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3CF1E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9AE41150
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g25H-sQu-OM for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B72941169
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B72941169
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 997F285C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 330be1e4c1375e3b1a0e4f84013fe96531edce7c
X-Git-Newrev: ca863d787047dc6cf1f2d20ee60b08e82439642b
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.997F285C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libebml: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca863d787047dc6cf1f2d20ee60b08e82439642b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libebml/0001-drop-CMake-older-than-3.5.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libebml/0001-drop-CMake-older-than-3.5.patch b/package/libebml/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..3a9098f6b3
--- /dev/null
+++ b/package/libebml/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From 6725c5f0169981cb0bd2ee124fbf0d8ca30b762d Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:33:56 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2.
+
+Upstream: https://github.com/Matroska-Org/libebml/commit/6725c5f0169981cb0bd2ee124fbf0d8ca30b762d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.4.5]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 11ee059a..c7b969a8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(ebml VERSION 1.4.5)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
