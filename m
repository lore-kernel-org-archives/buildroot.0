Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73ACC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 09:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A0880DEC;
	Sun, 16 Aug 2026 09:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHdYUIVmrDlg; Sun, 16 Aug 2026 09:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD2980DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786872601;
	bh=RVrjy7IEuQ2iLRHxrxkqJXLyVPBz9MOK7yrU+i5Ck7E=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eDE25uPXnw+yonncV9V0dH7oQ3VPdjh8INMCZKX0ia3h+bIQ7Mz2V1RfpYsX+HIUg
	 j5lWl1rsNGWFkwEkzXGtJGSfE2S1GpETZNnhtLD8mUMM654FkHOWGdi1cQjwp6gSli
	 F/Cyl/fhoiE/MQwc3u1yf+DRZ5Fz8XtOX5l2MDWvOBtWOYIPuexy7eZKOaLqbmS17c
	 TeUhZfSNtTMv9weVF3gpnnXPSAuJ3xvNfa4QMqdLIvTUVF7uEzzgNq9q/5ufF5ABgq
	 MeZdijasKEVrBx0w91bTaFre3NIZmZFyxsbgjSyXmEsdEyZQMvRdLb+ReK8266Qmpk
	 8TGzTjL3Sloyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD2980DE1;
	Sun, 16 Aug 2026 09:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0ED033B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A6C40629
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTVgC6e84WaN for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 09:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 936BA402FF
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 936BA402FF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 936BA402FF
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786872597; bh=Uc43xBQ/dgigO9+Ke/iTZIS3JKzRBCNlcdfWnL8BvhQ=;
 h=Date:From:To:Subject:From;
 b=AVP3I7VUfzJyaSUiUVgS5E9i9RIHEMBGRTuf9Myg1gFAIMrhzr9Cp1naGoVp4GMpP
 yr8YY9S2rzZDQHEZwqYsEtc6VaWRQIYbnIZ8vguK927srFT6NWuMP//L2uzS7zEnBj
 hH6FmOnl+ft7px1mHSYLcaRKKVcNHwPqN2SrIzN+zM37g4x1uGcTrrPNys7FQ2nsU2
 fTwAnkJ0aRZ5H/3BBkHW+zAfaNNUm2QjaVAJB0dGdVdvvs1dK+pXIBAozNigTyPK3a
 vEAYwtJvTg/XkM7hNfE+9bgjffa97aAN2cF+MZ2N1lMYQi+BT3rAd+QbWN1aKJfbzS
 ZmU1O0g5CLfSQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C38B431E0AF6; Sun, 16 Aug 2026 11:29:57 +0200 (CEST)
Date: Sun, 16 Aug 2026 11:29:57 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoGDFa6rPRC6pXm6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/quickjs: bump to 2026-06-04
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

See here for a Changelog:
https://bellard.org/quickjs/Changelog

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 70dfb2d19c..4509e54e99 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
+sha256  b376e839b322978313d929fd20663b11ba58b75df5a46c126dd19ea2fa70ad2a  quickjs-2026-06-04.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 511f142456..72535ff4ef 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-09-13
+QUICKJS_VERSION = 2026-06-04
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
