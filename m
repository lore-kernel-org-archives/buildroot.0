Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F7F53D6E
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 16:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2D640F03;
	Mon, 16 Mar 2026 16:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJyLpYl-Xevi; Mon, 16 Mar 2026 16:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CCA40F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773677674;
	bh=X24PyCPLectMVexlEjDLmyn0S/dCDyvggrStURWrx2M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sqxZinDZcj9908ngwLeMIxT21bwmQNeOwwSjlQXStI4yWK+KF+yi03mFkYBoH4GYD
	 lh4StrseOWOiqI8AaqYH8IAqvF+L6GrG4Mf6EH1Wz+OHpKyNTxi0p7yLuPmr/jkE8N
	 TSqTVcXh1VeyYjCPny5psKB/67J6BLqYEteWgVXxHqQMts1V2lv4u+jbLsn5759+ux
	 19yR9+IxQnl3lXTFKqTXXIr7DYo12/vd7xPHtZG0W98XK14IBt1wf0sqKG8wSBBXo1
	 JIx6RTSMASvtsHTxcAmx+TtTNMAl7DOqi98qL7gaEaW2LyjpHtU6V3mPqHnp0PfOqm
	 eQYoWRvNQi68g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CCA40F00;
	Mon, 16 Mar 2026 16:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62E5B3BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D1960FB6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTHsvjuGz5Ih for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 16:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5D9360FDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D9360FDB
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5D9360FDB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:28 +0000 (UTC)
X-CSE-ConnectionGUID: uR2ufADUS/OYfM2LmR25Bg==
X-CSE-MsgGUID: PdD3otzlTh2Mcl4ckYyQ+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 18:14:24 +0200
X-CSE-ConnectionGUID: tDJ0pNnLS2uTCj6zNfkN6Q==
X-CSE-MsgGUID: FZoQ9ZqDR0O1OQk6rdt2iw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces04_data.me-crop.lan with SMTP; 16 Mar 2026 18:17:28 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 16 Mar 2026 18:14:24 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon, 16 Mar 2026 18:13:56 +0200
Message-ID: <20260316161402.1994225-2-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773677668; x=1805213668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4b2xoK7UM01/z4HwguLom//4XpKltfdPBrKpKMumwc0=;
 b=fDg0XkRIAIZ5F83UTgl+XtT1aKc8tfx7k4PGvDBIJGHtG1h1fzhfQVs2
 RXqSAW9OlNFUx4EvM4EZCUtwd9ng8jOIYO5qwyYh3Ii7Z25BGcFV3gvmC
 Bxj4zilYdVvdBUSRJyaYD4BikJ8fIGmfbvBwtF8OanQWcwYztsIYi/0dK
 +itscUKYfZsy5DZfK0L9C7RbiFIwrIEz0h4C1Uq9USGzG/VVeZJ8f1KLh
 9fOpRirRTCVqAmRbS5Lru8UJM4UOEsxys13bNKdXz5YvpmzIa5frQYoW+
 Rd7uwtEsL1H1S5EICli8dYGgtUjtuaqoytvzlfTBUrYovcq/9kx6Z5RVw
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2/5] package/libopenssl: security bump version
 to 3.5.1
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Fixes CVE-2025-4575:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e97ca416c61e912d98b9d3439674cb40510cf160)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 9f8b23005a..1675d72fb2 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
-sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
+sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5e785e1bf0..f3521b3cf3 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.0
+LIBOPENSSL_VERSION = 3.5.1
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
