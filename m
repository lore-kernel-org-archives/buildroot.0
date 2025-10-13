Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C011CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BB84134B;
	Mon, 13 Oct 2025 18:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izXUCxGX_a9o; Mon, 13 Oct 2025 18:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377B941358
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377B941358;
	Mon, 13 Oct 2025 18:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B241C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 962FA60E10
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp-T4-MUh2Ji for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B58E260DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58E260DFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B58E260DFE
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:37:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB032A4C687E
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:37:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52180)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8NQb-000000004Tp-0qoE
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:37:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:37:49 +0200
Message-ID: <20251013183749.3515456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760380669;
 bh=K90jmGMjcPQ2f4HaeeazRemA5H2BPyYBai6oeYoS5wA=;
 h=From:To:Subject:Date:From;
 b=F40ttK7n0NitVqnJ2tYI6tguGlQbNyjovsD5/HW3EeqA54s0bsuDABdciQhcvbIDD
 txI+67KBpy6uOuAUNkgU7z6WQ3fVxHjQsh45pTJ8o8KDdx4oLNvQHlmTXWj0BE/6Ld
 CTpq7Zt8IMl5BHT2x/n2q7poJ23ZXKcwx1iI6vbafsPXNiIM5wOh7cNJo+PxBxCwpk
 p4+jjAiOqEYzGcIGaNIu/PcNlucMcsYKZc67syaLRviqojsv6+YxtwYccglyCYI5jk
 mEvQA7WPg3bLV3ayCJ1oLfHfw79Cs6IFMA1T2b78Kv6s0pbIVKyEGKnSecp3dzPhTK
 +APscqqih1z4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=F40ttK7n
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to 2.6.0
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

Release notes: https://github.com/cisco/openh264/releases/tag/v2.6.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 230b33c57d..af02a33746 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a1b5c88bfb31c4d2251835e57a7df99f91181955cea6ec3ddd4ab82aa54ae9f1  libopenh264-2.5.1.tar.gz
+sha256  558544ad358283a7ab2930d69a9ceddf913f4a51ee9bf1bfb9e377322af81a69  libopenh264-2.6.0.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index f9a50e4c61..c9584b4ebe 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.5.1
-LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
+LIBOPENH264_VERSION = 2.6.0
+LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
 LIBOPENH264_CPE_ID_VENDOR = cisco
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
