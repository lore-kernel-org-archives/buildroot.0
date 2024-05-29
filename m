Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F7C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 09:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B887381174;
	Wed, 29 May 2024 09:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6UZyGqYOZxW; Wed, 29 May 2024 09:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 539E281065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539E281065;
	Wed, 29 May 2024 09:14:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38F2A1BF333
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 09:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 244744017C
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 09:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNj5Y2gbGRUR for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 09:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 558274016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558274016D
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 558274016D
 for <buildroot@buildroot.org>; Wed, 29 May 2024 09:13:54 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sCFNW-00Dt63-Vx; Wed, 29 May 2024 11:13:51 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 69c4ba3f;
 Wed, 29 May 2024 09:13:50 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 12:13:47 +0300
Message-ID: <20240529091349.1075724-1-aperez@igalia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTzL6g2+lxEg0nMXGrM0p28ocYiCXjVSPr78hpKdCWM=; b=bIQt+K3x5/YTsfgSSQzjuXEejM
 WkklOLD/MYBRfa/KnIPlKNU9l25CYUhxYDqwr5VmbEZpS6Ir/pwom2CXGZEubeoM2ge/op0PV0jr+
 wOjg0XHNJauZwFhQbDdItYLJf6LPU7RD3RjupARIEBT8mNdSYC8NAZni0PN/V3Z4Zo3ZsorbdEpKI
 MdY94InmWruk6yeI7J3zNSbzG8SAPv/tWNzIC8I5IHzacRppW3zsbrVRQPV8cCyPfbqusGK3cJAIS
 FeCMcLrwcBdp49FNwF/tLN6ietU6gOVZ5rtdQoPMBm9v4lJOJCs67gPvnDNQPYJ/Zp1RatMfYiMCM
 VQ3XGrkg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=bIQt+K3x
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a small bugfix release, with a rendering fix for popup menus
and that can use weston-protocols version 14 for building. Release
notes:

  https://wpewebkit.org/release/cog-0.18.4.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index c0e99e14aa..b59b5f4795 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.3.tar.xz.sums
-md5  e457de5b5ac8994ae9971c0a5a22b8a2  cog-0.18.3.tar.xz
-sha1  21df2a84c651b45e78d08e45e71631250a0078c3  cog-0.18.3.tar.xz
-sha256  cd4ec937175a290ccd7c8ec398e4569aec04084cd94b11b2d83518778ba9d055  cog-0.18.3.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.4.tar.xz.sums
+md5  0566ab6676b499ebcff372fbe39e24fc  cog-0.18.4.tar.xz
+sha1  2d6f88cfb07eaac1be2bf9954832f19f8a856631  cog-0.18.4.tar.xz
+sha256  31d7079db2eeed790899d2f1f824dd6a54bf30d072d196d737be572f105d99b1  cog-0.18.4.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 11c0e3b502..7f680bb700 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.3
+COG_VERSION = 0.18.4
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
