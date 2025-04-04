Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D12AC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 11:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B748148D;
	Fri,  4 Apr 2025 11:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_SSkeeoqDnl; Fri,  4 Apr 2025 11:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F35A81980
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F35A81980;
	Fri,  4 Apr 2025 11:15:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A68A117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52D9405B9
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKPuKbd2ySN2 for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=18212901c=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D54894052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D54894052D
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D54894052D
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:40 +0000 (UTC)
X-CSE-ConnectionGUID: OD9/7JEtTm6INTpKo/nToA==
X-CSE-MsgGUID: p+AYauEWSPGU1e3EWBXeMA==
X-IronPort-AV: E=Sophos;i="6.15,188,1739862000"; d="scan'208";a="40101908"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2025 04:08:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 04:08:06 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 4 Apr 2025 04:08:05 -0700
Date: Fri, 4 Apr 2025 16:37:54 +0530
MIME-Version: 1.0
Message-ID: <20250404-optee-4-5-0-v1-2-704dadae3f5b@microchip.com>
References: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
In-Reply-To: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=HOdxcxJtf+crottWr5FWlml53Jbm4Hl57cIDrDEA588=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaS/3zvhRXnk/cZ0c3aD7ub1SrZyzNyyZelb2FWXzMiZu
 n1FwpPqjlIWBjEOBlkxRZbuzfNnGxb96cz8ybkCZg4rE8gQBi5OAZhI7AmGfxqMMiJK5l7z9vq6
 5G7P+piiLrPqq8LD/Sv3Vqy1jvt5uIThr0BUvf/z7R/tCoU8Gb9d9l2vIdG+PTL/WkVd2OlTz//
 95AYA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1743765341; x=1775301341;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=HOdxcxJtf+crottWr5FWlml53Jbm4Hl57cIDrDEA588=;
 b=rRZ1uBJpEPnfYgr8+uYoxYPmsbQGPADjGw9fyWkJcDCKGJeF4glYbkfD
 ohkQPcebiIPANO57X+wdRSN4uLYcbAp2pDM5p0gL0fLC4/AH/V4csHO+q
 dNOkAqJmAV5l6UwpWQYdAX3H7iFrMkByqWid1NHvsTy4ldlT2XK9gqTQB
 2PK/AiO1sRTkg+AXW7wTpoXrEzyrJH7fQiqmRokI7AOSlyLXs4uJRyJNT
 5+zzZI30urjgE6kggjGGm/sy6XY2wJup04aVOquv1ZRBA6y8xU65jRGkH
 ennONnx/8kJ15zwxTFmJHP7DJ21usV3QpFax39RoHukVng39kLYTVAdww
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=rRZ1uBJp
Subject: [Buildroot] [PATCH 2/4] package/optee-client: bump to 4.5.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest version of optee-client

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-client/Config.in         | 4 ++--
 package/optee-client/optee-client.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index efed800a87f688f616da1390096742aa03382528..865b0d8f31f7b77fcf0afa88fa5c47f611775663 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.3.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.5.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 8904c930ee67d7672809832057967e9b481fe3bc..f66f75e43bbf593c5b510588b89102a27e534edd 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/4.3.0/optee-client-4.3.0.tar.gz
-sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/4.5.0/optee-client-4.5.0.tar.gz
+sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
