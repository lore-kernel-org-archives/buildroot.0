Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E356E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B78817AE;
	Sat, 20 Dec 2025 16:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4TZNX0PrEKK; Sat, 20 Dec 2025 16:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE7A81754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766249357;
	bh=BGQlOyv6eqSFIqjCJOf9xmALE+8i9xENabwfblbk/+8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfzGFm5K86yyJmHebO2kIbzo9zAVwfo4NfuVYd/uGT/70zWpkgi5KvZb9gibNGcDL
	 4Dora+UHICosIjm6DFiBqhnj7oR3TlE9m8GoVLjaVs7fFDVpQZ37s4oT4QtcSDFjHq
	 OXdzHBntK9qtALprPOupvkCUnwHR+ojjd+70JU7aAKap+fjFA7yiF6r6PItlIqvSyb
	 sYdtnx83SsRQEnsv3VP3xv3xXwp0GLPu05qERVvbsnMo4oeyawy4SMMgAbWknL+Ele
	 JloycnjcV0uumYUGzIMrbctLJU1oeH7IlxZKEn6j25R1bfPiiDzKzkcn0PjKk0KH4b
	 0sad3EdDRyN2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE7A81754;
	Sat, 20 Dec 2025 16:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3AED1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0DB64091B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAI5JimYSzXd for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E612D4091A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E612D4091A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E612D4091A
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 43F52A4C44EB
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:49:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX08j-000000001Jn-3DMr
 for buildroot@buildroot.org; Sat, 20 Dec 2025 16:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 17:49:08 +0100
Message-ID: <20251220164909.128665-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220164909.128665-1-bernd@kuhls.net>
References: <20251220164909.128665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766249350;
 bh=Iuo7ynAHOwwclEWTMckhtfNyw1+lgJeR8H528vMgHlI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OtXVR0+EFWMPVOEIeOy+H++/0N9N8Jpydn0AhvuAO3t6NexQ/2s7YHQop8oY80m9u
 4UInhjkjZS6uXR7y8XQeA6gZi2Pq9V4YYOyMvHP6ywgbK5FKZxiig/MMZOi9r3UkVg
 ecAfNZcAWS9uK9pK5HlCWW9PvNBmXfCCWojmNacuvXTTwuD7BpNm9Czi9ehDSnEZD1
 PDYoogMQcjvwaSViBzXpKIuu0O/yR1Qtwm2iKD1I9NkSUeL61rByFVYTXaAF0iHM7c
 xOHKcvIYeop42ssHZLmGTAMljhEQbjndEBvizx/wEH8sF74v9x2ZLmPvtZXn1aUB2L
 V0gSIeLabVlAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=OtXVR0+E
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.15.1
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

https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-utils
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index fd03588294..ee47d43ab9 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741  alsa-utils-1.2.14.tar.bz2
+sha256  5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327  alsa-utils-1.2.15.1.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 64da2201bf..9af2d0136e 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.14
+ALSA_UTILS_VERSION = 1.2.15.1
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
