Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288ABC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB42A6085B;
	Tue, 23 Jul 2024 16:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tu75eVwh_9pE; Tue, 23 Jul 2024 16:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F377460860
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F377460860;
	Tue, 23 Jul 2024 16:12:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B65B1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0280E405C9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjUKa6cJyYOD for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx08-00178001.pphosted.com;
 envelope-from=prvs=79348e9772=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8522E40598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8522E40598
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8522E40598
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:12:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NBrcxg025597;
 Tue, 23 Jul 2024 18:11:58 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gr6j18xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 18:11:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 045C54004A;
 Tue, 23 Jul 2024 18:11:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2D45244DB0;
 Tue, 23 Jul 2024 18:11:46 +0200 (CEST)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 23 Jul
 2024 18:11:46 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Tue, 23 Jul 2024 18:11:40 +0200
Message-ID: <20240723161142.2728577-4-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723161142.2728577-1-etienne.carriere@foss.st.com>
References: <20240723161142.2728577-1-etienne.carriere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.128]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_05,2024-07-23_01,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Elr9xNiBc723bDsCIwfvVyGL85C5voSuXIihraL96oE=; b=X4LM7qKVtH+uQi7q
 ckCCiAv+vMoGt0RHjGowCelRO9B0pHF7+yTjVDVD4JLNxk+l+41IVkJBcLA/cRdm
 V5VIEcfo370g6nsVH5hIndbGwrC8dreBORWHBR5ThqstxV8Di4eAzKdN2KqeBpk7
 m3TXoQt94cAC/MKYM1aXCZOoG3LTb0g3v2bVM+MYDtlURKs/4xmOeqamugn+E7EV
 z/YoWffGgx8auU3LYpKmO+1hO/dkfjoFRYDtIBcL9d34jzSg3SXaK8W/GV7CXjX0
 1t4EeBqXCohlKM9kCmtY2e8GFSvVTDyO4M/sp3yQwrIZ5LUn4X17wKUy9mW1RZAl
 qfB5AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=X4LM7qKV
Subject: [Buildroot] [PATCH 4/6] package/optee-examples: bump to version
 4.3.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump OP-TEE Examples package to OP-TEE release tag 4.3.0.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index a60b6619f1..a6ecd2caec 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/4.2.0/optee-examples-4.2.0.tar.gz
-sha256  fcc032f84c0c7c90fbc3936c6d4d10e502797da7a7c23780ce2a5a88a720887d  optee-examples-4.2.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/4.3.0/optee-examples-4.3.0.tar.gz
+sha256  ee1576617365b5fe9d20d72c16cf6b39159eb79b1401189bd37a91ef03371820  optee-examples-4.3.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 7d52a277d2..8eb8724ff6 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.2.0
+OPTEE_EXAMPLES_VERSION = 4.3.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
