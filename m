Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C68D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19A3841C5;
	Fri, 12 Dec 2025 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PH2NCwYrFMd2; Fri, 12 Dec 2025 07:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9348184032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526284;
	bh=/ieKSr9M6sd4Y82o82hJzvAZqoIE6NgYQ8CmYFJtzHo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bOLFdrBzW0bwiN8uTkwlq27VV7ZLQTrEHkr4dsrtC0qNjYOf9/9ZmXGmBlQ5yWIiC
	 /b2d4NWJD7ea1ZCHXM+56nCjtN1RB4iVPDmKp4VFf2kObca3BuXylFbnrfzZJVTAfZ
	 GmmpeY0JeoF6HsGw3pOsusnDsSU5xHSqM3su5z3+dMUv2lZmtnua/rymf1bG6hxqW9
	 6aS1ljjdWx3q18GaXE2tkEjCTv/Lu96R0UpwWPxst97LKC3ISxrWMhWgTAurFnsJBE
	 SemhRCl2JVxGST3iiq7fQJvhJt5zCVQEGMLpMmjfzbwyWOasQX3/g4F4HncKCEdE2x
	 ZEH1Bi0cZ3LfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9348184032;
	Fri, 12 Dec 2025 07:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E22A2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A4341172
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBUKI1hoKrXl for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 919E141112
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 919E141112
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90CB2869E8; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc311aacf5fb563f2fd7955b163de0149d7a39cd
X-Git-Newrev: 330be1e4c1375e3b1a0e4f84013fe96531edce7c
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.90CB2869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcue: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=330be1e4c1375e3b1a0e4f84013fe96531edce7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not yet found by buildroot autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Raise-CMake-minimum-version-to-3.10.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
new file mode 100644
index 0000000000..f61b752004
--- /dev/null
+++ b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
@@ -0,0 +1,42 @@
+From d62e39506f4f9b12d58efbd2f1e2667c06b13a19 Mon Sep 17 00:00:00 2001
+From: Andreas Sturmlechner <asturm@gentoo.org>
+Date: Sun, 28 Sep 2025 22:12:39 +0200
+Subject: [PATCH] Raise CMake minimum version to 3.10
+
+Signed-off-by: Andreas Sturmlechner <asturm@gentoo.org>
+
+Downloaded from Gentoo commit
+https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=67d125dc0333e62fccb360f5918b044aa4bdf978
+
+Upstream: https://github.com/lipnitsk/libcue/pull/73
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 2.3.0]
+---
+ CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c4f9d8e..0d3cb04 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,10 +1,14 @@
++CMAKE_MINIMUM_REQUIRED(VERSION 3.10 FATAL_ERROR)
++
++if (POLICY CMP0145)
++	cmake_policy(SET CMP0145 OLD) # since 3.27
++endif()
++
+ SET(PACKAGE libcue)
+ SET(PACKAGE_NAME libcue)
+ SET(PACKAGE_VERSION 2.3.0)
+ SET(PACKAGE_SOVERSION 2)
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
+-
+ PROJECT(libcue C)
+ 
+ include(GNUInstallDirs)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
