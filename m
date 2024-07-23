Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAC9C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6FB607F8;
	Tue, 23 Jul 2024 16:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fOuuxBRv6_J; Tue, 23 Jul 2024 16:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA076080C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA076080C;
	Tue, 23 Jul 2024 16:12:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 800691BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7770780E41
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Jvn8FuyLHE for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=79348e9772=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EEB380E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEB380E8B
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EEB380E8B
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:11:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NBhOGC025882;
 Tue, 23 Jul 2024 18:11:58 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g2c4u311-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 18:11:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3944540049;
 Tue, 23 Jul 2024 18:11:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA461244DB4;
 Tue, 23 Jul 2024 18:11:45 +0200 (CEST)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 23 Jul
 2024 18:11:45 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Tue, 23 Jul 2024 18:11:39 +0200
Message-ID: <20240723161142.2728577-3-etienne.carriere@foss.st.com>
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
 Nkre07uX189h1z9l4dsYPT/cimF+zqfXGCLhhry4MPg=; b=I7wykrAe23e3aZqm
 fV7uEbxGx7abR8aqH7TPxY/UHS8rTZ4hwTmEyhdgwuL4nuwNc6zeDCH6craOKGPW
 YAicpN7aFf5E+7MUj2w8Px878aksq4NLk6JZ2SvkPkFor05RKcplTTjup8rkQj3s
 O90Ty0M4MuL0CU+4c2QXnNKQ1PCGSHr/6tGhtLgu+S5d9UZQzEnbnqEis49LEijy
 Srp/8Rs8qhvgmXDio/qwXozrvUayrmGfdbY3j4AI6moUxg4nRqjE/ZWZ8QpoNvwD
 5E+xxwt7Rj6geOWlS60zIx49wGPFNjjiv/DmAr2XKzEgRadG/Lv6/Rs4qkEmP2Vn
 OgixJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=I7wykrAe
Subject: [Buildroot] [PATCH 3/6] package/optee-test: bump to version 4.3.0
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

Bump OP-TEE Test package to OP-TEE release tag 4.3.0.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 269b7a3165..5922487a62 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/4.2.0/optee-test-4.2.0.tar.gz
-sha256  e976d3dccf38947d79e358a0385b581fc3d48efa10b6eebd3b3b048facb1235d  optee-test-4.2.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/4.3.0/optee-test-4.3.0.tar.gz
+sha256  7bb181b74be88593df48321b816837acaad8e4d45e883f25a2e039978e5ec415  optee-test-4.3.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 69e84fdbd2..9037678b1d 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 4.2.0
+OPTEE_TEST_VERSION = 4.3.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
