Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC369C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F3B46260;
	Wed, 21 Jan 2026 18:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGMqLsVq_9_I; Wed, 21 Jan 2026 18:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8902643CDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769018930;
	bh=mcgpqgfD4bobd7OBk14AtluvI8KULwHPsoSX5biKhmE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UicJ5wLhMusQQjp/vBhWfpfSy38cdQb5C6ZacZMI8Eu3UNK0R+0Igvr1niq2SlRdl
	 ImKtQ5i1ftC6tzcOf81aS9ejKmKUBRRtejKnol381QEYekxsdXz5Bvv9je52bDW9RV
	 xmkuN8CDZ/ux5gbqy3BeWvR/UYJikNNDtP8kDlwebiGo8vgFwQ6KvRA7Qo9aInQyud
	 gFLMAtWn/Dn9FEpZtEj043eT7Im+2rjII2BGodfN16C0M7O2gFmqcYVUaqYpLtXZM4
	 QRDJZSihXOv/ylhQ1RRWYUQ79P1S2OdwGu/YjURuB0mCE6CKzbRE2dZgI8CRr3A2Rl
	 ZZJOL8zaVwlWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8902643CDA;
	Wed, 21 Jan 2026 18:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CED4158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10CDE85433
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwyBD3HwucFB for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D92E8542E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D92E8542E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D92E8542E
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:08:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C382A4C4668
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 19:08:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vicdG-000000006nf-1GIS
 for buildroot@buildroot.org; Wed, 21 Jan 2026 18:08:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:08:42 +0100
Message-ID: <20260121180842.48561-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769018923;
 bh=/pzgsusEmBxm/2NikfxaGsskDZF5kaoaiz+bQ7oni6c=;
 h=From:To:Subject:Date:From;
 b=dfpfKGoYWEldewX4yKwh0nrvLuEGvZApRUBwFL2pYWhvwuacIikKKuH0iNuJBkcNn
 IG0wL1Tixno67PRqvgI1ZX3KgTcUevaFMMJahp4vuAVMwyjfWIMDbFYyyuGYwJVO9Q
 2/3JKd6bRrhMdN24QxOKNR/7qHMpTD5G7neZQL16pq1xgbN8Ucx5ehSqPykuHdD6x+
 mapSutZ0FGP1lQj5v19zx1h/ddtFvAoZiQ0XYB1ekSvgxNG2aotixJWDaYnSfd4knG
 /9VMwzMX1RgDLMGWaj7tS3Or/uUBao3LtjstIkATBTYPZemLrfWKm1N+9ThunBi9UG
 Ws/LTOAVQoGVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dfpfKGoY
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: bump version to 2.92
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

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q1/018380.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 212774cd10..258f0b1e93 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
-sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
+sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dec7c9a86d..74fc053089 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.91
+DNSMASQ_VERSION = 2.92
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
