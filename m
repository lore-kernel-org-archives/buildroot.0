Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AADCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 15:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E434F60BBE;
	Fri,  5 Jun 2026 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY9NYeWMXTS3; Fri,  5 Jun 2026 15:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C4A60B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780672742;
	bh=b4oJNZMOWjGwm1cLFkhkA+MT0N8ME8imrr9AEiXkmL0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOzx+Fs+Gvfwbivekt3Itg7MVu0e3J9L4xNQn1b/kTEkJfo6yiRsuHXoAeyGPd5bE
	 1iN9Np/IDFIpmg12cgW59HXb2VeqMVywBiTuLYVja+9ISFAIRyT39MTPHzXZyuiu1/
	 w411x18BZHUwRnbC4oGJGd8ieI1z3Hp604zoqIDL7XH+xDG0SiNGhb+yl6hc08LQyQ
	 LQQmTg29KAD6c2ufcb10XzrAERuYUq+ggNSGDz9jiz+F917bRJjuyfZiTEWXmz4O59
	 XTZHksM4ihIEVHMzZBtNfFfF5BXU5GkV4Pm38/qlC9M0oiYxGTWcvvxH6xO9cge/pl
	 y4bjrpB9kN3XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C4A60B45;
	Fri,  5 Jun 2026 15:19:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB56388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 15:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00A6760B45
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 15:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aA-fPN6Y5R2l for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 15:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87EF060B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EF060B2D
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87EF060B2D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 15:18:55 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wVWJv-00DFMR-BZ; Fri, 05 Jun 2026 17:18:51 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 54a77c61;
 Fri, 5 Jun 2026 15:18:50 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri,  5 Jun 2026 18:18:49 +0300
Message-ID: <20260605151850.2908568-1-aperez@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KbCcUGdQulpu1Tijps6SA6MwHphI4x2nGWlNoXvGF2E=; b=Qrjec7HB/EGjVi1ivNIMvc1hH8
 tYmWUEfO/Gp/evatDoMhihPEbrRbNb91dbdftKroFKjx1mRaCScY25ur+NsmBWs2IaupGFmnx4mfD
 JLD1TVL5kF27a9iKaFoNO7bDHyBfp3xr85fe7s4pNz2tsoyEts80W8Kyo06A0aDmv3QoFoCeronul
 44q3NNRkWECUdqWnmtLeiPaIy/K+rR8nNM2fp5Bah7gNpSEECSWFCJjYCP7PbPqO4ftdZrSAQUZAq
 sfl5mA1tWQ61miEohUNW42wc4Ov0zeJ71SRHGoQ4DP5YsLfOPovcjPBto9XZ4S+cJ+pAD8BGiudaB
 QymdW8OA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Qrjec7HB
Subject: [Buildroot] [PATCH] package/libavif: bump to version 1.4.2
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

The most interesting changes are fixes for a memory leak, and for a
couple of crashes. Otherwise, it is an incremental update. Release
notes:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index 4f9d899d27..8a37e5ba19 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  d4aea31a4becb3273ba7968221be2e48148ba05eb8a68d14e671963e17785648  libavif-1.4.1.tar.gz
+sha256  2b645287340ba5a631d268b551dc2d72bd73ac33335962dd36dcdb6d8366921d  libavif-1.4.2.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 8bd130fd65..7f178d0ff4 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.4.1
+LIBAVIF_VERSION = 1.4.2
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
