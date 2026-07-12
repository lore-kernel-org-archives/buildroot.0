Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B4CC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2BF6060D;
	Sun, 12 Jul 2026 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJILGoCM8_0O; Sun, 12 Jul 2026 10:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A189760639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783851429;
	bh=t2faQoWHqpRwvPy3XFtwMEbEWMhVS6imgM29L5vjhYw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r+WM9QOR854xccSYpTmzpkLq5NOlBisb7JVo9rPHq08LypHdfl1/1evjOF5AL6Gnw
	 wZNDWbUEqNI6+wZ0ZDZQbBuRRmBc3N789MMqPof4MBTh8y/lODxl05OD9ReRl0tS3e
	 iW9WHo3lMM2CiYTGEhXZG2vNBjd2Gy7tuPU6cgU9xchnPWIobXpH38wNu/sC9+GSce
	 zSfFhjY8FlbrfMAy/e/a34cQ0cQei2Q9hRWQImDQbxhjVEUE//kKyI7M4ukuA1x5Qe
	 VOiyKCP6MWX+SEe4gecWTAZEU7g5sA+7ED/9tdC3Y7rDXqeXIHNjkZyAI5aqcDK0na
	 YTaHGu8Zgs1Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A189760639;
	Sun, 12 Jul 2026 10:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7523722F
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 10:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7250681387
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 10:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZURqZDNZpah for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 10:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92C9480F4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C9480F4C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92C9480F4C
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 10:17:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C0DCA4C342A
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 12:17:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46026)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wirFB-000000006tA-0eAE
 for buildroot@buildroot.org; Sun, 12 Jul 2026 10:17:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 12:17:05 +0200
Message-ID: <20260712101705.1533933-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783851425;
 bh=ePHPFtzTKKsbodCJb0o3vNzZu/+vWmIWHoV8Q1Vbi/0=;
 h=From:To:Subject:Date:From;
 b=BwuoyDMDA4Po6IxpZetuU2KLK1jj0BICyq4+PCfZx45IkOmYqmLB5TE/j/ikNxdVV
 ilINZKg/LPQoepJGxuG41L2V3+OMNMvQZxFgRi8gNV/cEFLP7sUdzQTWYSdaBG7ILt
 bA6B/vPOb+5Imr77oaLCNBRw6GsZooVPylMLZA7VfHS6LZaJpS5i7nz4/pjzugLr66
 j4AXxATBjSk1AR/kFxHGTdM7u41UXwGPZM8H0rcv/Rs3j7aWO4Bz7mWnuYjaQzlERI
 dvaRP+ReHgKGkt7qa3awLcnJ22NUoq8iWJW484SdHAGOCG7hj12n3Fs4CT9GOuO2+G
 swU0tbVLQ/G1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BwuoyDMD
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.1
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

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/85e3f743b32291c56f9cfba4c1c8e0bad1caee96
https://gitlab.com/bkuhls/buildroot/-/commits/f1a0203adb5cea15551f2ddf0565227fa86f424f

 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 2e02f7b256..f19f646832 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  660bf9725a7871343a0d232068a7634fbcfb69b6c2f8eff455827faefb0cd162  ethtool-7.0.tar.xz
+sha256  4d78c26edc0255bc92f4b995b5fd66108d75ff966ed4694f6025a6d370bc2496  ethtool-7.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index b518c971c4..77798971bd 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 7.0
+ETHTOOL_VERSION = 7.1
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
