Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3541F9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFF261B82;
	Tue, 14 Apr 2026 16:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIGHaDMQ2G-i; Tue, 14 Apr 2026 16:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B515861B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776182835;
	bh=b3kLPRj8j3Aa8Jw1DT4CHutkTGtG2kBAQXhnusjiXRY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=go0ig8Ans+rr8esDFjoijLt0vwdsN1X58oxCKkZP0mus6N7lVsGBTQQvhVTH8B1oT
	 h0zHtt2G4PpM7691sSAOV16HitKh0XcH8uutpkO5QfxLaAlxVrO9Rn1zzwvpPfZQcf
	 XFOJR8bN1bQGfPeEmylA7SvMNuLv6tmshj82cdIkBIAGnxTDuGDZY15RuHunnGlUsT
	 HrexJmzpvT9stfo+3npL29qcO9ZBGZm3omr72G8BzULvTLkFNMPOqlBBdD0+MTLj0Z
	 Kd50Kggn48zDELiHdPjfC9MP3ovIQ17YFciqkYbwq7WsZNLP5/BNm0jl/Kp5M5hC9g
	 yrKH33+ece6MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B515861B21;
	Tue, 14 Apr 2026 16:07:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37536283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28F2240088
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0PwBy4wAhtz for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 682D440055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 682D440055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 682D440055
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:07:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBB62A4C059A;
 Tue, 14 Apr 2026 18:07:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgI8-000000003ZX-1EVn;
 Tue, 14 Apr 2026 16:07:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitar Tomov <dimi@tpm.dev>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 14 Apr 2026 18:07:05 +0200
Message-ID: <20260414160708.2041081-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414160708.2041081-1-bernd@kuhls.net>
References: <20260414160708.2041081-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776182829;
 bh=y4fJzXobn99Ufq7m5Y479xg1j8/2lEPFE+bmP8inrQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QW13XMnL7RAnRK6Cmlb767OaQDspn/zAufiD0UnILQqFOBahQvxmigq3HxtnurJ6F
 He//jHIM+54d02I3LaVy5zT/T4b/FzaAfqbWNdBa3Gt/VnI8kKRAHyb8LxL+DCa0n0
 b0biHbqNUPf1VCRX4Ddmj0UNyYHQWhfLKlg7NJ8emusZCAomiBhdBNhnT4tPfkL1tC
 g4yy0BtppTmaCH82nOSpV14TKV2SuLWhEMfVtNRM8q3NrSJ1N3Wx4xCf6t0U1LPlXM
 eQrQQ1hfMTJsZfqDxWVYuXX1MjaM5msdV1C106hni13qDUkH/ZKoyLmpD13lpJtRgC
 k6i3aNBkqO/Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QW13XMnL
Subject: [Buildroot] [PATCH 2/5] package/strongswan: security bump version
 to 6.0.5
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

https://github.com/strongswan/strongswan/releases/tag/6.0.5

Switched _SITE to https.

Fixes CVE-2026-25075.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 7a6939b979..44eadbaecf 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
-md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
+# From https://download.strongswan.org/strongswan-6.0.5.tar.bz2.md5
+md5  7049111627010dc02293970c82e43d28  strongswan-6.0.5.tar.bz2
 # Calculated based on the hash above
-sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
+sha256  437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9  strongswan-6.0.5.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index bb5fd2d217..2e20b244ad 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 6.0.4
+STRONGSWAN_VERSION = 6.0.5
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
-STRONGSWAN_SITE = http://download.strongswan.org
+STRONGSWAN_SITE = https://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
