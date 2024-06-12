Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394FEC27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E47C3400B9;
	Wed, 12 Jun 2024 19:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M2uug98d4fV; Wed, 12 Jun 2024 19:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B99DC412E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B99DC412E0;
	Wed, 12 Jun 2024 19:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 908E71BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC2540360
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TAWRn_UBRVW for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 353FC40357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353FC40357
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 353FC40357
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:21:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd5a.dip0.t-ipconnect.de [79.214.205.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7673A4C1248;
 Wed, 12 Jun 2024 21:21:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41676)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sHTWu-000000007Zu-2ngV;
 Wed, 12 Jun 2024 19:21:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 21:21:08 +0200
Message-Id: <20240612192108.52176-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612192108.52176-1-bernd@kuhls.net>
References: <20240612192108.52176-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718220069;
 bh=vFOeHLgpvaF9v9aWkWLP7CbcUGoBgpayG/W0tr0rfJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v1/GnRNRB96XZ8a8Oo2A20uH27WRxZHDXmBscwTMsZfSVvGYD9Aavt1DsDcq751St
 0bvwHOP8qw6z7poTXrtXXzzz8xDSp9HOV0CVj3SB53sMpBYe2srirrwsqzbYMkUPi1
 0Zq5I+zQrvAvJTmFNpwf1VJrQAOqP0/eqoWukNj1Xwz7vPk3OJ3yzcO4SQ4lC26c7m
 ZfNwhrU63Jk9jBvaX6y/g6vqIVbtESictpgfXA7ApNqr3JL+7LdNyIWpusNbV6T55x
 d5SItYaoF90IaFTIAlfteuSQqEJcHEumJh88f2YKz8U09PKjUpWVN6C3m5t0Q1Ggwo
 kO/85/SVa5X4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=v1/GnRNR
Subject: [Buildroot] [PATCH 2/2] package/intel-gmmlib: bump version to
 22.3.20
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
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index aadf01a169..ecd5427b77 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ea9c418b0fd84a982850f230cb2d783dfe2e1f9923065f54b2fcaad1e9b33417  intel-gmmlib-22.3.19.tar.gz
+sha256  227c1614d4817154b4e6fbfb667ba2b231ea7aa53796d91f1800af9aeb703f59  intel-gmmlib-22.3.20.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 74e19e93fd..86391e9ade 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.19
+INTEL_GMMLIB_VERSION = 22.3.20
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
