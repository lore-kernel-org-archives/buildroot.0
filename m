Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E195CEB2CA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 766A7411B8;
	Sat, 15 Nov 2025 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l833zVaZB3KN; Sat, 15 Nov 2025 10:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1FD41195
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1FD41195;
	Sat, 15 Nov 2025 10:33:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59921158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB3F60863
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxqHZmWrlxkL for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 10:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61700606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61700606F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61700606F1
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:33:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68387A4C6BB9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 11:33:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38912)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKDbH-000000008G4-42g1
 for buildroot@buildroot.org; Sat, 15 Nov 2025 10:33:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 11:33:47 +0100
Message-ID: <20251115103347.3462638-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763202828;
 bh=atZvhW31wUZYiCiflIIfLaFNr71LYS/8B9GoOWfcaNQ=;
 h=From:To:Subject:Date:From;
 b=hNkJPJOWkd38B8ON6u4TkJ5I0s0rXEU/QxR00X1QVKQRiJJYwV+ka8Rct+p9eJZ/z
 xEj7o21qn2bsZ6WwLsd3bn1T8CLcSxoYZ7Lr7RL89sXYtc4IMBLHrg6tvOCA13uHSv
 jXRZrPGg+eAI7FzbPcmiDIg8GVXc7fjhvZT25O9JZ/AOM5keoLb6QhRGw0GFztM9h1
 v4KWlcyaOwAcgkiM4T/Yl8oLxDnnYlA8uIPpLzOwEXCyHbboJaq+5WsfI7KiciACgE
 GEctHJq3zbr9pEt7jHeBvoZ8glb35Uw/7CuYcgBJwavmavI6QGwPYYKdvON6EqVV/G
 0ObcMAn/qoUhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=hNkJPJOW
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version to
 20251111
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

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20251111

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 735b352d1f..4c6676dfb0 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407  intel-microcode-20250812.tar.gz
+sha256  5a9a0d17240f486461bc101ef74f2b8c10675cdd02d0ba0bd6168b061c62e970  intel-microcode-20251111.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 2850dd01e4..e8bbf15a81 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20250812
+INTEL_MICROCODE_VERSION = 20251111
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
