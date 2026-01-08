Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EAD185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4C960625;
	Thu,  8 Jan 2026 11:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGviMxW_bLZG; Thu,  8 Jan 2026 11:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD7E607F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870897;
	bh=jNFctz4DZfphe5oSH0JVWAYS6GIf6zXhUuTFCy2L0j4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ELBA6AFaWJ5y8ti4K76wM/F1e3+Wr3G4n4oO2AkVAj/il9Wq/8yCr4axioWlJy0LN
	 i8QvAKysuJZ3FyPz4jbp0Kf779M3YhpIO/jIiUFqxqZEMw8d0Ew2JT51m2MDUNbvQh
	 YXuR2FUnpqpwsAz67y7/azDcEkrcr1sYAu9Z/D5M/TXk7iRQvmKAoCdMvAUyR7vlpx
	 llssrx2Om1b3V7JKzFiZMZGxAes4YaT44KGiayWjwWyWQCLMfAKWBW+hCVPLVJdEaL
	 YbPBsgB/VN1/cy8Gp2dpjWZhbAS7bY6d0bKqNn0/BN8QeYoOL287KsT6CFE4rkZMBB
	 bCIeHkdsJv60w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFD7E607F8;
	Thu,  8 Jan 2026 11:14:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C8A436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B0E560A38
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzBA8SEDUi35 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD3960625
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD3960625
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:14:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA40088448; Thu,  8 Jan 2026 11:14:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 12:14:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b86e51016f8e17647a462aa0b78c8878c4880fa
X-Git-Newrev: a2621fd2804ab24dcb627f3b8c401c1fa7eec42f
X-Patchwork-Hint: ignore
Message-Id: <20260108111454.EA40088448@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cfm: fix build with cmake 4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2621fd2804ab24dcb627f3b8c401c1fa7eec42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/d01/d01d8fe3a63128246ce242de450b016b4ef13baa/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists-fix-build-with-cmake-4.patch   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1219a98056
--- /dev/null
+++ b/package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch
@@ -0,0 +1,33 @@
+From d2a823ef01396cd148074a99ccbbf1ca1115b24d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 3 Jan 2026 14:56:38 +0100
+Subject: [PATCH] CMakeLists: fix build with cmake 4
+
+Using CMake 4 the build is broken:
+
+CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+Upstream: https://github.com/microchip-ung/cfm/pull/1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5de2e0a..378e98d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ 
+ project (cfm C)
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ ## libnl ################################################
+ find_path(LibNL_INCLUDE_DIR netlink/netlink.h
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
