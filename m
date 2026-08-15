Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCE7C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53976408BA;
	Sat, 15 Aug 2026 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUQ7wkmJFyk7; Sat, 15 Aug 2026 14:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 302C840807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786804880;
	bh=JZ/x7YjrKRGbp+wmGjinRCd6Rz4InsRZi+K8i5/vvgM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HqbWpjQCJjZwTnZEQRq53x+5Lwa8UC+/oS3RgQPyDEDzsBagwCL2fdn4RNyroeYvu
	 TtlJOSCHoT219XKehdysUJp7jQ1s+JD62JSZ/J3ZqJXqCixPnFoz+C7dWHOnXS4+OS
	 ERjYSUVlR1Si5Ktb9gPZkLTCTjAPLoAYleAjS2z5kAFL9/PMDik4gljcFMqIaQCHpi
	 5S/NONZzWgUaq6cBZaTSLa+/TeRAiFjdObzvvd8TilHWRVTiduDSnc82MNmwnQ+KMC
	 uyAinHVEOJoXZw7HZgd/jkBPZjTiFnkWIWGV925I3tkK2hWsItJ39Hbh1k8Vty8f1X
	 Z19hiRnUz8t8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 302C840807;
	Sat, 15 Aug 2026 14:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA4E4CD
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6160E80E00
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vSGeTbj-fNa for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07E5880DFF
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E5880DFF
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lizVg/41
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07E5880DFF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786804875;
 bh=yR+jxJ98nDmqaM5DI277EKs5V9gApSalzqPSYAp7TUg=;
 h=From:To:Subject:Date:From;
 b=lizVg/41uf3NIx9ZLT5Tc3qcgovFidpyAfSvnVGqlPBoHwY+eLFrndu7ENxNiUqFH
 p4DawMxMzLRE7kKW3tcCmV1Moo3UoYFpY2bwFZdQ5HVe/KdyvEbts/gG4iWMFQMGxv
 WYl0kK/tPPXahg00PnQ0ShLGlAM2vwQYhRHe21xwK7SNpJUh1os3SB0TeQOntDFE0c
 F0B8Y66iG6N83ACHoJI8TDtz6Gs/wcnaTCWud6vtNZs5tN5VAIjwo7GeScedG2fCHz
 c9+KSCE86TVoGqq2VuNGTYaJvyszPK1RVKSx/2ljZrZXhibgyu8p45tdD+jxVotCYK
 EIAn1PvpklIQg==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E37BFA4C4B3D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:41:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60174)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvFZT-000000000iz-1MZB
 for buildroot@buildroot.org; Sat, 15 Aug 2026 14:41:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 16:41:15 +0200
Message-ID: <20260815144115.173696-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.6
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

https://www.samba.org/samba/history/samba-4.24.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d945475f7eff0e3722fdbfa68247031d83f12210

 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 3931e55669..9fccc9bf5e 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.5.tar.asc
-sha256  6d5d7ee82f5ce9da4135086c9b184e47a58b4b023565f58abbb1f8c8a922306b  samba-4.24.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.6.tar.asc
+sha256  810cc955acb367e9bde556dccfb50db177a02b7c553aa1629a0b905fa7616267  samba-4.24.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 79551e1ee4..6291cb29b9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.5
+SAMBA4_VERSION = 4.24.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
