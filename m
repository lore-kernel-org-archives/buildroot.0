Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86420C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4789B82FCE;
	Fri, 11 Jul 2025 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZszZXlFWojL; Fri, 11 Jul 2025 13:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCFB81138
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCFB81138;
	Fri, 11 Jul 2025 13:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 580E8114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E0481138
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAhFIrW7Dpnu for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 13:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B59281029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B59281029
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B59281029
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:43:43 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaE2N-00FOUL-Bm; Fri, 11 Jul 2025 15:43:39 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ef40b49b;
 Fri, 11 Jul 2025 13:43:38 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 16:43:37 +0300
Message-ID: <20250711134338.2817791-1-aperez@igalia.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+3N1co8G/yw9vziWeAuTejKAxU6LwUX0LZNsfUWdILU=; b=n4BxZKG4AqPnE6XyzAFf0tmJDB
 Kg5KITdA6HF+ZcnkVXlokQVTOfFRcCxy2oNZyx4fsZn0JLzJsV2hXGXY9SaeO5gP3Sc+/4D5o+VF5
 99lfFLyR+4xVp9F0Z5IiV+r5T37ABswkgEhoiFQDElViTtf5mNgnhRxyrxbJCBg0OYwhZ/hL1fMzV
 9DdPJ+TXEAoXwIx3PnCvl8tGYz9NEwrUofmXTtVnuNkKwlOzP1xIH350KvB/vqyWQxpPhrQI7BLJI
 Zg27uueGSyhpxSuUstJcRKFQ+5crFfpx7V8dom33JdJVIRQS71/Swl41P8vYh3H6tuNCz/Mqkee4U
 la1VNZxA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=n4BxZKG4
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.16.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This maintenance release solves build issues and memory leaks.
Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 5055998ab7..f0578808c4 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.3.tar.xz.sums
-md5  ab73398b1e35495977e50bee103969d2  wpebackend-fdo-1.14.3.tar.xz
-sha1  2d2945df15cc1efa957657fa727f3bc4c6f580bb  wpebackend-fdo-1.14.3.tar.xz
-sha256  10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c  wpebackend-fdo-1.14.3.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
+md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
+sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
+sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index dbabacf498..e5972754f6 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.3
+WPEBACKEND_FDO_VERSION = 1.16.0
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
