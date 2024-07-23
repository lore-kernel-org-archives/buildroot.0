Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB372C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 01:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7340D6070B;
	Tue, 23 Jul 2024 01:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9XYh-aeJSwq; Tue, 23 Jul 2024 01:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC1A607F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC1A607F6;
	Tue, 23 Jul 2024 01:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C23C51BF2F4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB6C740311
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zZtUZj-e-d2 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D14C40308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D14C40308
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D14C40308
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDbN097063;
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N1WDJQ128820
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 20:32:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 20:32:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDRq115180;
 Mon, 22 Jul 2024 20:32:13 -0500
Date: Mon, 22 Jul 2024 20:32:06 -0500
MIME-Version: 1.0
Message-ID: <20240722-optee-bump-v1-1-8e25b342634d@ti.com>
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721698333;
 bh=cJ2juNzsf3Z2MmAvmJJh6q4Bz9Bf5EG1aP0Cd0/f/8o=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=PRC8xifohjhcCzcveXi8DNl2dCglLeyFaUbI260m1wh4Ted3CHKqIr7gq89jUxkaG
 AhprY9Rpwh7gO/AOHs7MCZOXcN+r0cpwIsjPBnExoe/bt9uEzqUDT2axBJITPSDxXh
 v6EjVTHsa4V+q55f5BM3wGXOnR/gf+F0WNKtciB8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PRC8xifo
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: bump to 4.3.0
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update OP-TEE to its latest tag

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 7870629732557..2f996cbafcee6 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.2.0"
+	bool "4.3.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.2.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.3.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 663640b2cec2b..16b3d7430e0ae 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/4.2.0/optee-os-4.2.0.tar.gz
-sha256  ce70f0d177001bf4855cd6cd6396f515af6126e4bba9b12c716a437a5cb40c7b  optee-os-4.2.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/4.3.0/optee-os-4.3.0.tar.gz
+sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
