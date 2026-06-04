Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F6CD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 17:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10246F7B1;
	Thu,  4 Jun 2026 17:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR4d06ElMtTQ; Thu,  4 Jun 2026 17:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29226F7AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780595163;
	bh=mKChxlR070eEdD66MkjlN9fnoiTBoOBqp9MJi+AKtoI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gNuDS96tmM3g/URAZLETeV5ukD73MoI8i+RKa4o7b1nbc6e2sts533XUvhEE2jyuG
	 4icBfhZWcaLwaWT4wyYjvMUGnIx00ty5WtJT/d5Q4dnref/9invO9D0KjjaHoolWw2
	 lJjknvEebS/xLaGV4YLK9RNzuckndgS5Nuj90py0GqaNJobJEZW/EVr03KAdsGXT0s
	 pt0BBCHmc3IUy8wggw4Euz9BGxJtu71YFVN0RI3ZNdQjXRrbYNkkmYI3P700fOi/Oe
	 VWSN8ogEbT7ymF6HvbXcbe/pxs/8wlrPcR0mPmOefffhUvbc9td7DZ+M2DFyk9J+or
	 jB/UY+LdQj0Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F29226F7AE;
	Thu,  4 Jun 2026 17:46:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB2B192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D11EC6F7AE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh_jruLY_Rxl for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 17:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E1956F7AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1956F7AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E1956F7AB
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 17:46:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88B93A4C39AD
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:45:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33318)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVC8k-000000006aq-0vhU
 for buildroot@buildroot.org; Thu, 04 Jun 2026 17:45:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  4 Jun 2026 19:45:58 +0200
Message-ID: <20260604174558.2140973-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780595158;
 bh=2FjgnbHRO8kfaUS+ACZABrD5vGnmr04SmGsJ+Qjcwwo=;
 h=From:To:Subject:Date:From;
 b=meVS/qTqC6AMS2fWZKI0VJO+WLYHFprRu3y3QXR8qNVEitOXbhDVBFpvkPQp2iYCA
 ZkGn6pBycmJHR+HGIn00AAuvT0+6P+8VJMcXgVfjg3Uf349/JEJFwsAFJY7XbPdvDF
 ywvZNDIv4F/J1g0xUHXUTQHHF7bikxUHu6xi0K6KF6meFd3WCaU50BkeW8uTu9jGTM
 QPpXhsaAkRjzyJsgIAUcVnldxshuGmo4XaAwuzDvW589xayfY4Dm5O7Yb+ZLOZJNXK
 BrkMchrZSg29XK8vgT058sAmfM2N69ieijkBFGfSRK6ZXA6CEVdvF6QFqlFWiHcBLJ
 T1SbGz3CTbpjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=meVS/qTq
Subject: [Buildroot] [PATCH/next 1/1] package/dnsmasq: bump version to 2.93
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

https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/594eca24456edeb1c9be2599c98f2e5eeff97fc4

 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 74ee5c415b..176e73899e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
-sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.93.tar.xz.asc
+sha256  0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19  dnsmasq-2.93.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d7ae8a3312..b9a76fd5cc 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92rel2
+DNSMASQ_VERSION = 2.93
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
