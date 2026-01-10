Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8937D277E4
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 19:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26FA3406E6;
	Sat, 10 Jan 2026 19:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hmt1gFA7V-62; Sat, 10 Jan 2026 19:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036A340524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768073594;
	bh=4WtX//wMzcqYBWheVFlprxjUMKTiM7SRHiMfA6dkIv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sRPSJ4AfC/lpubygsGGPYIUbggVMx444Rt68PYnXX45Dvjmro96CyWBa89mikU4RP
	 1ZIXC+BOYYsNZTpX/GT9UYk3HWPw0ZQVPurNzVPazju346dTvqG65zJfk5asdzfjPG
	 CPzF7i5sTHcrd4YrSOfGzvm0umKkQu9LBT3qyiyHC1TM37/Q42H6HkyEdqxuuDWoex
	 E4v4tUxJZHLVuLFNKTXBVbC/1ucZk6hpKKtCFQnVyRgkZAw1/Z2B2VNoUBO03Pq3fz
	 QRs0e+vBWRiDC6m8XL/rymdLiCfQhh9dycmW+9d5oscTa1JQO86nkILqVY0eXXJtZn
	 5eAAshYFNMSlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036A340524;
	Sat, 10 Jan 2026 19:33:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A3C412E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 587E240524
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKv_-KhKpQ6y for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 19:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42AFF40510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AFF40510
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42AFF40510
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:33:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06018A4C3651;
 Sat, 10 Jan 2026 20:32:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45114)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veehi-000000006yJ-2hsX;
 Sat, 10 Jan 2026 19:32:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 20:32:54 +0100
Message-ID: <20260110193254.4079274-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110193254.4079274-1-bernd@kuhls.net>
References: <20260110193254.4079274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768073575;
 bh=FSIy98lAHJMGP9GTusdsq0MpS1Bxd/EACgo8SB/Gg2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YFB/P7u5Dof/JMyBB2e0cSWjH9ESxRlHiD2Py41qBOUoqhrk3bof16n8YrMrLUxB+
 xffAIdSBvjfQp7OHROxWi0VSgZagPxyzYn4Okhs/A9wW/OjdzvucNb3H7DRoZdclw2
 Ri480+Yg8eFhVc5v7Q5cNAHhMIZeLZQLfm0v1zYMvYG0gIFnJ029dQjwerwl7hgRLB
 U2n8aYzo+t0l7DBL67Ijr/zSXZG7mTapTGCh237j+I2+PVAqvwypFCyPfXbmx/NoqA
 b2nBIu8Yx8qngoHLBim04i3vy5G0vZ0SAn+da39mLRIhmKt3q60wXiOBI1PKmzHNRw
 EcZGaPvck/RLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YFB/P7u5
Subject: [Buildroot] [PATCH 2/2] package/ell: bump version to 0.81
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.81

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 418d1a9a2a..034ab74c4b 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b  ell-0.79.tar.xz
+sha256  672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14  ell-0.81.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index a0ae7a68c8..db9dc80366 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.79
+ELL_VERSION = 0.81
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
