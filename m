Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BEC369CB
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 06:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23ECF607BE;
	Tue, 29 Apr 2025 06:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmhFNJU1taJC; Tue, 29 Apr 2025 06:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F67D60E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F67D60E4F;
	Tue, 29 Apr 2025 06:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B0E21E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C64281C6F
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QigTk2BQSwY for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 06:49:05 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 29 Apr 2025 06:49:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0847281BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0847281BD9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=20723122b=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0847281BD9
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:49:04 +0000 (UTC)
X-CSE-ConnectionGUID: X90WhG0dS26YKY2BMjrGJA==
X-CSE-MsgGUID: NehWWev8SX2RTVZrXH0ktg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; d="scan'208";a="41495454"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2025 23:41:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:41:47 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 23:41:45 -0700
Date: Tue, 29 Apr 2025 12:11:27 +0530
MIME-Version: 1.0
Message-ID: <20250429-optee-4-6-v1-1-1cdb296ef7c8@microchip.com>
References: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
In-Reply-To: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=bzHGmTxrr+E1AXt3opCWyu3lucqriSJT4F3hngRDAAs=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMWQIlCyT7lyfsiX5VVd52+kGzy/9Yc0+N7qCZrRtmSLh6
 L1yXcb0jlIWBjEOBlkxRZbuzfNnGxb96cz8ybkCZg4rE8gQBi5OAZiI3y5GhoamTovlyUkXH/xx
 3NMWYXnE0vdStuqEDb+Xic7j8TOds4/hr5Dq3zcKR32zWbe+2naleObDshYxr5A/RfULvHpv3/5
 gwwMA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1745909345; x=1777445345;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bzHGmTxrr+E1AXt3opCWyu3lucqriSJT4F3hngRDAAs=;
 b=e3uprLYmtyyNTgz+bdPgwGWRbsNNGcTfdYlLHuRs1nQl7PGiNgJgOLtQ
 xjGMbS11UjRqrNv+MF5FKNMYctbG9WErv/XvHpxLHUycBblieO/s+8UVA
 ReUfQuVUX+usn9Up/ggL+Ww1sV4nLEH2vlxbp+6pLB/ANQDJ0bC/8vqkn
 /JRVVom+dLKZeesKcZfXDQKOGDdUBdmEBdzgkJYlXbVQYmtZWY85L+Zt8
 FZF/3BPDpw9fIyKH3uVH4ZohoyUWt7+QJghxchPCWoLSVg26mzc5z3vYd
 E5LBQzhN1S/6zaVqvCRecjOWfNNufoPpiccEWdvjQIqN9eDSIlV+/SceD
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=e3uprLYm
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: bump to 4.6.0
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

Update OP-TEE to its latest tag

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index de0ed3168b1d57252c7f4462931c3959f4660142..433dae90d8be7647eeca1cb9d4d0ab5f48fb4d5d 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -79,7 +79,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.5.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.6.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 685826d2f9dcef6c20e9073cba5397a88807ffe7..c86bd1e0d996edff13e4256573d5d53e094fbc02 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43c389f0505e8bc21d6fbaa8ea83ec67d1746ed14a537e3f505cd0e5b4cc2db9  optee-os-4.5.0.tar.gz
+sha256  0c947c6972bf50c483cb993af01041d4094b1e03711c7246cdde6ba2ffc351fe  optee-os-4.6.0.tar.gz
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
