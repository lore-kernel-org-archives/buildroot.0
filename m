Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A3AD116F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 13:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1ED8131F;
	Sun, 30 Nov 2025 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-GPKI4FnUO1; Sun, 30 Nov 2025 13:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01623812AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01623812AE;
	Sun, 30 Nov 2025 13:05:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A17A219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583E660755
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Le-qBCH7K7nl for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 13:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13DBD6071C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DBD6071C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13DBD6071C
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 13:05:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F1B9A4C372B;
 Sun, 30 Nov 2025 14:05:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53298)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPh7W-000000007eX-3H16;
 Sun, 30 Nov 2025 13:05:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Nov 2025 14:05:42 +0100
Message-ID: <20251130130542.3034475-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764507943;
 bh=D83Z1tZFMlCGmJc9EO/ASp0lsPp5tH2xrQEucGKfWy0=;
 h=From:To:Cc:Subject:Date:From;
 b=aMBjpRNggbkOmpkHGqTcMOIpAZnWHC/GXsnslTPv7JWSon10cx/scOyLmd1v+nVSv
 ebtiolFKCdnzEuXYMrelsxBpt7y/p1vcW39wtWy8UI+jm9DG+W85PmbrvpHXbRqL/O
 Be0x3vW808TJiAcQBQ5Ss0yvu31GJoTM9ixm4n6TPhOKgBszxZTYu1Mj5B2U4+U6wY
 YTBnj1RakepR9T+PqhMUj/M2vhmwsSTkwcoM4iJclbP8mnWdY2b3pLixZsfojPysZ/
 pkhiPe//6yeia667cFlSfnx5f8cAVDRcb9EYQC4hF6op+rO0qe7FHDySzhHQvV01dE
 +KumpMcyMBcEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=aMBjpRNg
Subject: [Buildroot] [PATCH 1/1] package/libcue: fix cmake 4 compatibility
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Not yet found by buildroot autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Raise-CMake-minimum-version-to-3.10.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
