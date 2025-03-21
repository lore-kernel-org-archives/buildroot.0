Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653BBC36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F6D424DC;
	Fri, 21 Mar 2025 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzmBApug79zB; Fri, 21 Mar 2025 17:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B284424CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B284424CA;
	Fri, 21 Mar 2025 17:35:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65217E2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C07C400C5
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e12S7NNy5TY3 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 17:35:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5D2540484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5D2540484
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5D2540484
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 17:35:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5f9.dip0.t-ipconnect.de [79.214.197.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB6D1A4C310E
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 18:35:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60764)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tvgHK-000000008Tn-1aF0
 for buildroot@buildroot.org; Fri, 21 Mar 2025 17:35:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Mar 2025 18:35:30 +0100
Message-Id: <20250321173530.71510-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742578530;
 bh=TDFpJzDqjHm09X/Oiw8D+VHB26kg/16pmmNLx20wBM0=;
 h=From:To:Subject:Date:From;
 b=MI5Lh84euKSDZ2hoZQIb6QctqpVEfaC1CghFrKXdAwpTRPFaRLDhgUORf45cCa04Q
 YuPZTAkiPsUeYFEAYmwCV/dI+AUXJ+Xag3s1Bhy7JvKLBjFteXhZCfZrBOgm7MksEj
 EVWesHwcTh4yqEV+tio5ieJQi+KQkj4zNf43B+/ONlK/2/2Cwn3ZweLWUCvLbcgWhd
 07542aSmzbQTYQMSpXWs+HqZxCrgjQseam2J9PRf4uZHs4Gk/5w5eQvLBqJEQ8MclF
 6IoAfvxrHqJhUmZUgV/jB/m1me002ebpOot6at1L6LbEqzusrFXnWbJvOn24+pTes4
 /1x+NNgZjaEpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=MI5Lh84e
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.9.2-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 9112fa16f7..2507e58940 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9604bf46ef5502306c59d93cd7f9a7ec298e30a17197dd2d8d49300c6ee51a9c  kodi-pvr-waipu-21.9.1-Omega.tar.gz
+sha256  93b9fc17660a70e7cccf02a8845db3cd5dbd044ae3ef35d3bb052bfa13b9de15  kodi-pvr-waipu-21.9.2-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index d830c9d114..abe47f7977 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.9.1-Omega
+KODI_PVR_WAIPU_VERSION = 21.9.2-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
