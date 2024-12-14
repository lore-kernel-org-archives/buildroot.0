Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB8E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 13:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F111560674;
	Sat, 14 Dec 2024 13:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7gzUHIX6arF; Sat, 14 Dec 2024 13:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01490607A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01490607A2;
	Sat, 14 Dec 2024 13:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C49CD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C73400DA
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAKNxkb_HtXQ for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 13:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C13940254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C13940254
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C13940254
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:03:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c577.dip0.t-ipconnect.de [79.214.197.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70AE9A4C17D2
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:03:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46270)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMRne-000000002Bg-35DB
 for buildroot@buildroot.org; Sat, 14 Dec 2024 13:03:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 14:03:14 +0100
Message-Id: <20241214130314.343885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734181395;
 bh=RvwEWgMo5sVZ7u4lJhP3R9Ig/dP9RrJMdXpb6v4MKRo=;
 h=From:To:Subject:Date:From;
 b=hTQMUCgc+kc4rNIjelot5vzGYgBHmEUG/yTuxFEU0OUSL+hWU/Sqd8dOjYqomkYAC
 k2rl5mLzOt8DKpx9zRjB9P/GHSWDwfuzPS7zos2hshponsyWBM52oO3+U07CI70YAO
 LOs69859OqTMB0DbxNIcKlj2x6HnKDnwfPveXVfiLYqfk7eCFtFeTfv7NNOQulwNQE
 UieO7JyHfotrJyGrqLmEaKT66Z+0y2Kh1SKdfDXiZqguhyabm7JlA+mChvCvtVQ+iI
 yJ5B5caUaj796dW7PhDcQQPhorWt4EACLUGpFHNcJm/kWt42GNSbeOpS4WFKjTDuMn
 iI9vBGXbsYnmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=hTQMUCgc
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.124
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
https://lists.x.org/archives/xorg-announce/2024-December/003562.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index aec9f58749..3ef978775d 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-August/003528.html
-sha256  a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e  libdrm-2.4.123.tar.xz
-sha512  d3e6ba26bbd609fd87ca131690547eeb6a903c0a8c28b7f5cd5d0947619da09f31daf7bf4b6c38bf5e5dc173e2ccba476338ef682d8cf06d6b71ba73fc9b948d  libdrm-2.4.123.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003562.html
+sha256  ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379  libdrm-2.4.124.tar.xz
+sha512  0408c3ae5780c57d19321a9a7b046d656e252b2f48e520b2beb18f83495bea39c445deb9a9a6795b46194051c2ea4da476e08c63972daf841064099df6dff365  libdrm-2.4.124.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 021a575474..a8a912859e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.123
+LIBDRM_VERSION = 2.4.124
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
