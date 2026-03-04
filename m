Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932FCEFCE37
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9621980AED;
	Wed,  4 Mar 2026 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_x0AfwrMjvq; Wed,  4 Mar 2026 18:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C3B80AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772650599;
	bh=O2kBkRG8urEd/Tyomj2eKuBetQqxKhyCpg/tOx2LJIY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o2/dOqNbIfIITm1QBuXiOVm0UCBZ1aa7wfU5RsPWwSW7CVrRn47LEMFE4Dg1h9i/p
	 71NUVF3uYRL9+SDztVrg/a7k2PjRHfexdZ2gBRfV0pQm0SbXb2+LiPSPwb8armuE8X
	 HTSU4xtlaOTvaflSPIO4pAsMOK06atBeRxAbyOb0PDTSk4fPdfJw2aOkLKIX6i62cK
	 aQbCpthV/AbFokg1oi3hTp/roA1/s0qPerzoty8heIfu9ZB7TvtVr7/H9mDH7OhpGl
	 UgklslIdknTX03G9EsH/CKNZ+wZRGuFday8wD7PQG93buaS0ivCTtdNNsJNEpq6P3F
	 vnCJPmyEyBLXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C3B80AC6;
	Wed,  4 Mar 2026 18:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C84A325B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9DB2402BC
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0avs9g9hIQk for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A677F403C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A677F403C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A677F403C2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:56:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A563A4C3370
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:56:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54776)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxrOM-000000003Xv-3vkv
 for buildroot@buildroot.org; Wed, 04 Mar 2026 18:56:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 19:56:17 +0100
Message-ID: <20260304185618.3474153-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772650579;
 bh=3g6UaLzNTpVJUsTc9iYxamBbGDtQzAKLeTkRXP/JLKg=;
 h=From:To:Subject:Date:From;
 b=gvDbmHnR8SgY4uHt/tIavM6xS+2DbtceTX+9oyM8/Jkx/SjPhsAMcfmPIMotaSy1H
 p8aXOzMHbvW8cLKbeHTresjcVrWQg8YU9CRsTUBQx66rrKrNM5h0mFLAkjaoyKNXyQ
 KbJP21FggswpuT4+YNeHJ8ExeKCnA04L0CTBs+TeT0r22M+/vgg8iYq3gmewEwDQkY
 T4NAiGiNpeqn+h4lSSx8vjxiyZVnAUB9j03Ar7jSCEF3QWYprJ85JWwQexuhAw35LZ
 vvSKwvPHEAxX0BfHjEB+Mp7XdkspycdqgGSKLWXqUdmeZLmTBDI5nKjMX+Aay+Eco4
 OjexdmkiDjzkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gvDbmHnR
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.3
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index bf3a8a2c5e..d4cb4dac07 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2eea3df18d766059d6667a187ae47d0ea986fa0502d8ba8fdf92183e65e9871  intel-media-26.1.2.tar.gz
+sha256  6e0483625eec81aad52984cc08cc2cb38ee571ab2efd93b0d33b0c31611b0a13  intel-media-26.1.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 551e506d5b..6fe62ca8cd 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.2
+INTEL_MEDIADRIVER_VERSION = 26.1.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
