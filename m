Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1F3EA8531
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0591E41816;
	Sun,  8 Mar 2026 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6qlYxZiV9QN; Sun,  8 Mar 2026 15:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5183E417B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772985577;
	bh=veDOAKOdRvNtRXECNSiWIBckk9I4PeQXbfOrfZKfFh0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HmUbZ3rB7LMPZXlfD+7nZtO3WS7fgzySlJKhMbaU7jy/885I3MmBk4NidWaRTL6yb
	 2vA1prw1i6buPDobx2xrL3u1nNJGx8vsSMiWN26+S+085QQ2OgtGpM+2QqI6NoIXtC
	 usEwyAi0MMMZNH3dOEq8w+F8JQEtLCpM47qtH5EiEX+fL04vuD/xOMVXkJtIRjg0K5
	 9UrcznSZfJ4yVnX6ZtD5AeGgM3nTQ1uq79Pwvs6wceyqmwjLjIeHiy/eLHB7txBfvN
	 E9CgpDNC96H4UD6RwVkxeUM0n8i10aLdrL5Qt2Ex1DpuAKh1GsxuHpUlJG9N/GFf6p
	 qRXyzrEv0RglQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5183E417B3;
	Sun,  8 Mar 2026 15:59:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 064D8223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC0B2417B3
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vX5bOuiIaQaq for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1DB6417AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DB6417AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1DB6417AA
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:59:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBB7DA4C3831
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:59:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40538)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzGXT-000000001JX-1Bfy
 for buildroot@buildroot.org; Sun, 08 Mar 2026 15:59:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 16:59:31 +0100
Message-ID: <20260308155931.2579104-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772985571;
 bh=UdTjm3Ekjg1Y4oDHSi+Bj1UBlnLVA2gtUgAGut+zkI0=;
 h=From:To:Subject:Date:From;
 b=ee3d4h4rnAM/2iljw7+YCnxO6+zFoJFnjuDC9nUou57AmNrwZ1AWq4KnAV5ae+J6V
 LT6UrPU9RKV0Toa7NLqzzOfKMMl+mGjGNulwmyodHeFQcM6nMm/HrtvaBGMOf9K+U9
 7GNtw//SxsWbsofoEuec73LZmcUE+QUEJ52eiWoZINADpQcIvUH+Igz0dIwwNBLQFb
 H0jpgASJBhRgyKnKprbHWrm+E+ijb6zTIQh3i1IlfBynMR8czT1MEhJSJ7PvM9WRm0
 oX+S03RlXToZtgdLkwZtNRDCgFuRanNaov/b1wfuYvaVpsPO6P/S+i2Tl9xWeSZMwI
 Yc971Jh40lUxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ee3d4h4r
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.19
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

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index b5cbc3d737..ca28e43ba4 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  9477c365114d910120aaec5336a1d16196c833d8486f7c6da67bedef57880ade  ethtool-6.15.tar.xz
+sha256  1c2114ab6e0c0d2aa67d699960eb11df4f341e2403139cdf28ae9da858a6025f  ethtool-6.19.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 4e60cadbf6..9fe63f31e7 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.15
+ETHTOOL_VERSION = 6.19
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
