Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242A1C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEAE418CA;
	Wed, 21 Feb 2024 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTbqlsrEdrCz; Wed, 21 Feb 2024 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 976FC41847
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 976FC41847;
	Wed, 21 Feb 2024 20:32:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2201BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B88F281F45
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41tIRxL1gph0 for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8899581F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8899581F3E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8899581F3E
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:31:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CD63A4C0DD6
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:31:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56872)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rctFx-000000001kI-3hWK
 for buildroot@buildroot.org; Wed, 21 Feb 2024 21:31:53 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 21:31:53 +0100
Message-Id: <20240221203153.3428611-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708547514;
 bh=K7WUhqvi5ocvmtBL6ws8xNRrpMuHz47AupqTB49NY/s=;
 h=From:To:Subject:Date:From;
 b=BxMgwTc0u5o2C8r9K9zyEarE5/A/E3A/K6QHrdnnSN7B8+JE45gS0PP9/9VP1sCo4
 j1rtf9r4GudMEHJUcCFaZ0/se/9inWwXPS1YaEuACDLHGiLC/XvPJeQbwyWbYA/mVF
 DfhPwLhO4PravzDoPgubS6nG+RcjwsFvT9y6agNz721ZKgO0Z2gYyIFH4M2rt/30gw
 g17epi9msFkebjk/XHwyTm3uaP++fQNsOzF2ycERVbYcXQqZDLXalHtk+VcmrHewkc
 ZoDj8BqCnhdFzrK1gkOxv/ZkfpgeeU+T5OmOWZ4pohKXMQJM485z1woJ/K6K/pHPBD
 hf+2fe/g3Nk2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=BxMgwTc0
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes: https://www.samba.org/samba/history/samba-4.19.5.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 3353221959..4e74e07bd0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.4.tar.asc
-sha256  4026d93b866db198c8ca1685b0f5d52793f65c6e63cb364163af661fdff0968c  samba-4.19.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.5.tar.asc
+sha256  0e2405b4cec29d0459621f4340a1a74af771ec7cffedff43250cad7f1f87605e  samba-4.19.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 78c5db308d..0980d03175 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.4
+SAMBA4_VERSION = 4.19.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
