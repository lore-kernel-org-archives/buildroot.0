Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08736C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 05:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C6140942;
	Fri,  7 Aug 2026 05:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEtzQmmurmko; Fri,  7 Aug 2026 05:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DAA740953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786079402;
	bh=PNtcfYOGy01Gt2VhO501rSSnVtANLXoA/0t9RiuWBzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WIojOW5mgqNdkh6EpQ9e0FjGJpxkDxbPNZuU85zWIP29h8gCHYh26f+MEhsXdvA0C
	 gDOaCFwWoBdgr/hCfJeYDKunSKj1DXQ3ijTZR4gtA5K/H73tK0BZnISjgMv3ltCVi+
	 /tgK4r/zw87AtYTqAle2f/BoDv2rlrJzALLrjtCtpOFzRxVRRwtH4sqAaTSEsFKhvL
	 GOpYt4z4WPPo3TT94j0lY2Tr/ms9pRlhR0KFQYzA60Ji3TCbxrecPcraOG4/XA34dP
	 izJeDe21OUepf+Jr9kZLTHhsBPvnLvYyfTssoJFAbtWjgJgOaWYxfeCLP4qiJ5mLgP
	 rlqUCfOGQQTHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DAA740953;
	Fri,  7 Aug 2026 05:10:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEF723F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 05:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F41AE6089A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 05:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OSrQc_uB7t1 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 05:10:00 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBDED60893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBDED60893
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBDED60893
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 05:09:59 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 5297D4402AF;
 Fri,  7 Aug 2026 08:09:14 +0300 (IDT)
To: buildroot@buildroot.org
Date: Fri,  7 Aug 2026 08:09:50 +0300
Message-ID: <10beb0cd9d3809081b3800620c88838d112d5f93.1786079390.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1786079354;
 bh=Ej6yYodZ7yxtnl51HUY8RG+trEV2ZYXUH372FhWuQc8=;
 h=From:To:Cc:Subject:Date:From;
 b=ywlzQNj/yLkikeknv5YNIu8RtYd7Pqaq2FtdALHoeow8uCBoPRMwBedaeNajff/mr
 d7cLawJLS5jUCtQysTWeQD6nqjR5EJ1ipuRGRGhGjPb0dy3M5kEKxMfovdZc0puy/J
 9cfe5B/1e2xdcrbmGJJiy2xLeWAiuhsncItLcLDbJPWQmgifpoi0N1LHaGHYS2AemC
 HMSDo3Pz83uxsIHm4Bzj9wm7o2GqrQonrkSl+Co/vN1JW3GzGU39z0thux3iP34ZiJ
 hkyomjmmtGGh5/ONkbrUTxDxquQ6wWNSk7qHANhLYpSM9ImgsICP4kezl/Vm9MecdJ
 D/SwbYKSQQVTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=ywlzQNj/
Subject: [Buildroot] [PATCH] package/sexpect: bump to version 2.4.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/clarkwang/sexpect/compare/v2.3.15...v2.4.0

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sexpect/sexpect.hash | 2 +-
 package/sexpect/sexpect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
index ce1232de82fe..3c8f2b226535 100644
--- a/package/sexpect/sexpect.hash
+++ b/package/sexpect/sexpect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  44f5711aa99f3ccf9c4b0edfcd9a7d25fa64b442574624ce451713d1532c1a7e  sexpect-2.3.15.tar.gz
+sha256  8f7a989ecf67f4ff6eb167d29a8e2e54db85143ebf3e8f904ea16ee5576a4b0d  sexpect-2.4.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
index bbc84c1ca6ec..0ca4d39bec31 100644
--- a/package/sexpect/sexpect.mk
+++ b/package/sexpect/sexpect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEXPECT_VERSION = 2.3.15
+SEXPECT_VERSION = 2.4.0
 SEXPECT_SITE = $(call github,clarkwang,sexpect,v$(SEXPECT_VERSION))
 SEXPECT_LICENSE = GPL-3.0
 SEXPECT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
