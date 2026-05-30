Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFECD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF54B853FE;
	Sat, 30 May 2026 20:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFfZZpY1hlLN; Sat, 30 May 2026 20:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBCC985401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171867;
	bh=tEjaVyV8eRzYvth+4xLat0yHn42jiPozhLJHlMDxzz0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EP8+HNc63fQI2mpk58fAluoe/2Vn3M9ZvBHtVUPQcCf3Bt034G9L0Hh6IMNTJS7Rb
	 QsGUlzLKsixIdUu6nBlihO1lASWDJTz8Cq31yv/Q1dpf2/3DhkBsE1aP/6m2vZUsdl
	 ibLYKhaa0S9VysYn1MlBN+3hDnoAAQ/NTJNfjZGHR2JWvGOJ/xev6qHb33XMU2+pOm
	 9XB+kdrCHeV0dOim1fFNF6VShAul3iAawrJO0f1WXpE2HYz6jDOP88TvgF6jhYAP88
	 eunZe0UFIc5CfAERAwX7WqhBdMQL5HaTJoZ0hfRtDtxfyZSaOQXGJpf/DulLGk1NKF
	 pXqYiYm4B/8Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBCC985401;
	Sat, 30 May 2026 20:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F873F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA68409DD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTpnBBMP9VAu for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E3C5407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3C5407FC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E3C5407FC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:11:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 97D361A3751
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 655AF6073B;
 Sat, 30 May 2026 20:11:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 292D810888CC7; 
 Sat, 30 May 2026 22:11:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 May 2026 22:10:53 +0200
Message-ID: <20260530201054.2926152-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780171861; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fV3yay6p8WQx3cVDpGzaHR5j4Yj6EBMSo1w/lw/Tw9E=;
 b=GKx6sTDVSYTZOXlQXRTOJyl4qXN/DDPJSB4webnJASx4Quz5gWAyqRijL6web6rW/ehNV4
 +aG/RelCPyphVDQResM5sgaC5gnO+ywh+k05vKX37QBa2eCRl2AXKoTInXT0JRwIngx67X
 zFYFxhUhva4ziWhKXLG96B2aMegklq715MwgfKr663IkrRlkDANVMFWchapxcMlc29ng9Y
 kh0fMCuUcPDYxz9CqCKMWaJ9q5iVD31On9N38AHd2KlTOsyetqO8x5GPaP5q29NhwhcYje
 1MU8/rltfmtmNlBR4fl0S+ALcLJvq99IAZ5Le2Hytq3qhlludASted4mV0sHNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GKx6sTDV
Subject: [Buildroot] [PATCH] package/liburing: properly handle VERSION vs.
 SITE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VERSION should ideally contain only the version, i.e 2.12 and not some
additional prefix like liburing- as it prevents our logic matching
against release-monitoring.org data to work properly.

Fixes: d2ed4565321c74772014681ca5ddcb433162e468 ("package/liburing: bump to version 2.12")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburing/liburing.hash | 2 +-
 package/liburing/liburing.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index d37b69497f..d50a81d2cb 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
+sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  2.12.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 24ceb281b5..78b43d5bfa 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURING_VERSION = liburing-2.12
+LIBURING_VERSION = 2.12
 LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
-LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
+LIBURING_SITE = $(call github,axboe,liburing,liburing-$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
