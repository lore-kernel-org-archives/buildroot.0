Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E731C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 644B041B42;
	Thu,  7 Mar 2024 17:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1d-j45IPmIN; Thu,  7 Mar 2024 17:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E6F41B97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E6F41B97;
	Thu,  7 Mar 2024 17:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0B81BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 094E841B42
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11PbEUHxx4az for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9F5F41BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F5F41BB7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9F5F41BB7
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:43:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57B3FA4C25AF;
 Thu,  7 Mar 2024 18:43:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50290)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHlu-000000004Od-0X88;
 Thu, 07 Mar 2024 18:43:10 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:43:08 +0100
Message-Id: <20240307174309.36603-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307174309.36603-1-bernd@kuhls.net>
References: <20240307174309.36603-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833390;
 bh=XAsir4X+RuD1vZ8daR5Ob74fVDKS0BISO+Ywo6fHO4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=duh19l3RpwYmBleoUilJ4aQZvJVWbTaeOJ4KbwZa6DN4av9WirymIJb46L/LTqACB
 HjiG48rNM8ZhAvuoJ4bNcINz0ThFNU5fo5Ezpzjj+rlczgulaqU8xMqdJe1ht761J7
 ZGkHndRdqiFRwtBZDlJ92pRECxGKU4YC219gAxi4GA3GfvGJ/rSWWas9ukgKJjIjiS
 Ak3ShAERFmjkv7pZbrllSMclPCnqfPFbjHkrEHgTie5FVZO9R3cnJIx1q5BKK6OYpt
 i8D5X298ARCNPJzrp1JtRwFsk/zOHeUcqqkSS9TGnSctSct1ERNKlEcD+OPBXtBIOj
 Gx/8PprC6uxVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=duh19l3R
Subject: [Buildroot] [PATCH 2/3] package/libvpl: bump version to 2.10.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index df1914e4a4..19407e01ba 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  524299a7b920ac0de1f6913ca90515858ea3a8ea2daaea60f8e0be62f22c8041  libvpl-2.10.1.tar.gz
+sha256  ad956ea7ecf14614325f59dfb44cc5ba08e2fcac373342d61c7db152ac651253  libvpl-2.10.2.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 0c5d354874..645fda14de 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.10.1
+LIBVPL_VERSION = 2.10.2
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
