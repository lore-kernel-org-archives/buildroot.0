Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8BDD6EC0E
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 14:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EBD2845BF;
	Fri, 29 Nov 2024 14:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngf-RG5IJsc9; Fri, 29 Nov 2024 14:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE7A845C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE7A845C1;
	Fri, 29 Nov 2024 14:18:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A76E6A6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95D7540B3F
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vmaN99tHY2v for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 14:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77E6540B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E6540B27
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77E6540B27
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:18:22 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tH1Xy-00ENDM-5G; Fri, 29 Nov 2024 15:00:38 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id cf32f484;
 Fri, 29 Nov 2024 14:00:37 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 29 Nov 2024 16:00:32 +0200
Message-ID: <20241129140037.897174-1-aperez@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mQuia2pnbA0lEDI4FdBmAPD2aeauLsGv4asRGgMnGeM=; b=JLMw7gyQAK+SxlhWRGDaFfvfc0
 1z2Wfz7ZeXpO4ELnV4VfhxzgUdwSnGUnC8a/wPibDPj8rFt9LVojrYOqCJ+Ob9UUcIY1/7faE3GpS
 JCdms31BkpivNA9JIhFppfxy491s1Ib3C5n4uNu/wIHZ5BlgmPPzX73zm4Ko/O+pqS+5Wl5ujDg5D
 UaeFX4zFhQVELZkUVVQzjQ0ipK67uUOCS6wtED+hM9BxVe5YHv3WLE0Y5p0eRqwtzx7DUv+F2UgNq
 e3XKCoZkzZwfjr2kUC1Uk8JUrgRZKgP4QaOPAK1LnhGdBSNfZEBnwg6SPPuDh6VmRgJuMLDsij11D
 BleawNhg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=JLMw7gyQ
Subject: [Buildroot] [PATCH 1/1] package/libdex: bump to version 0.8.1
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

This release has a fix to properly disable assertions in release
builds.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.8.1/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index 7e08676fe4..d6fba67f32 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.0.sha256sum
-sha256  659ab5d0eb7f10bd36af0cde08055158987690b9714e7f5b001c788ec1d01a25  libdex-0.8.0.tar.xz
+# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.1.sha256sum
+sha256  955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0  libdex-0.8.1.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 0d27b35675..381c605b16 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -6,7 +6,7 @@
 
 # The middle number is even for stable releases, odd for development ones.
 LIBDEX_VERSION_MAJOR = 0.8
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
