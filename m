Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B31C55172
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 07:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B7C606CA;
	Tue,  4 Aug 2026 07:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Drrh9hL33ilD; Tue,  4 Aug 2026 07:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9161A60707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785826933;
	bh=3CSV2yJGBRhi+6R3bA0lIUE2tSJixJNwn1cSdcrjhFE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=bhvCoQEXmhebTz/b++4qKDSsksAO29HQeweX1ZZ0YY346KcOuPORumr0uKQJfqZOY
	 xAoRWTxY52qcwTqYF/ygTfH/RNKBD2rnxe4M06A2s4bGo7sL7e1/ex4rldpdqtC4B2
	 IOzCJNhByWD22/8TgEXY52SoPaZDIr2osUISl9IL8vAqvwUo6QLr4cBtgsO2APQnmh
	 o7y22whVS/fwwPAEOAPIyPlIskVzbFdebTvgq3OpDxpVArdKwkFM513knaPiiFrU/D
	 WZG8Gs5J8GL8EUVWc6Xo2jBcHI+5OirfYhuRTq8rejnTH2jyGH6rB6XVtsd8mH4Wpi
	 wDmtMvzi3YzIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9161A60707;
	Tue,  4 Aug 2026 07:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A94282
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 07:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF18A40081
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 07:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJ42cHhAVLEe for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 07:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C737840061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C737840061
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C737840061
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 07:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4hnSnT/L0QK+BsGqt3w98DxZb8WA/dxcAsImnNrM9+01dQBBlCsRtL0xnwfDactHHMUElIJ1J0+PLcrFqjjXKlTkzAB5dAD1lIo8nuk11U11kd91HNYcFM84vP80lYRC5dbmnJNScDX+8gESttPAwy81wPcgUQNNhYHlM7kTtr4FaPZQeIK/r+YsLUNi5C30egi/U7fmZP1yYVNXB6GoUj/DZvlm9+vLHxaQiktkSGtpjlkLCA7K+umgKrawWsE+UE4YRMzdJNQjoBofV4e17lZB69HPU6BTuQM5YyGsL9eV5Jhlk0ZI7xDzEEfvbeAWTz2vBWFhjiIBL6vcQEIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5YM7C9gwtmSTkZSmH1dBYWHIZ+ImI3azV5/sa3oYZY=;
 b=Z1c9hNVWghZIN7ynPvqEa3Iu+nyP0JecJAWYyCi9/nx0ZJvUd1qL8i3Nj2P7nUH12KU3FDajPm07UVmJoB5q1OhL1g6rl7Gyp6/ogYDP0iZwhLeb6bEfSYn8f4dhSsk4re+wBaCKx6d9pSc/3GVRfLDj1l7OdYdvV+sSbQwsUT1AyZcTY/OWCmsojRFxm1XqGULkfB4Vn4bdaNPJmJylBarDgDcQCFZ/+2DewXtflDGTkyPaRUA5iF++LUIDQZ2IZkx9TodPm7i4as1x0GElxR/+jK/XGrr1Syn6BeARODatysefB949whLIFBge+cnNToTNNB23CHabHE3To8icww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:610:cd::34)
 by DS2PR12MB9822.namprd12.prod.outlook.com (2603:10b6:8:2ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 07:02:05 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::8f) by CH0PR03CA0119.outlook.office365.com
 (2603:10b6:610:cd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 07:02:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 07:02:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 02:02:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 02:01:22 -0500
Received: from xirengwts12.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 4 Aug 2026 02:01:20 -0500
To: <buildroot@buildroot.org>
Date: Tue, 4 Aug 2026 08:01:13 +0100
Message-ID: <20260804070113.884891-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DS2PR12MB9822:EE_
X-MS-Office365-Filtering-Correlation-Id: d973e73d-2235-430e-6328-08def1f64aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|18002099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: fEJK14P4JvWMUTXHAO5rgkGc7vcfgPLmpSUDz1s0yDg7HFXsdcVxEzgdp5IWzF3XoLbABoU/yeh0FGa9jDqCen26gFHpItSON71Z8NQRjyPyZyUKqk8OmsaE2oyRHp+AOsqmgoCm4jGrsoLnDg/X/xYCul+GxsKAu2/GWHx5ww4g5nMQNAwXMdDN9qGF/MRPcnZCVum/SRduZwnsjhMihti3cVms7d8i205jHow989sDuCm0LWelFk2RZ/Kp0zPBJ/KIgmnDT1wOEeOG8gLLeJbEl+MsdL1pJuVqzRwtAETjVcI5d6c2ZuNBiZAbcuqj8aAo7/yAbjkkiIhcsy0u9ICNUvM2b18c6ln9frSfruErXxPE4139Qrazh3tEifWgAzC+F+qnWeR/HeUY41LIvRC4WMq7PdR9BTpDnI9WaCt2lqdH73B3zBh1J+gS76tRN6NfXPTzETnBLeB13N0ymWOqLLHRCvU4b6q/ecJHK64ZH+2Isj2hnxymA6N67U5tK9bmKdWsL3SRf2ucj3W6rbU0FHPk6oA47jA0WyZE6gjIEPEfy2c7h1msvzuajVsfSDxAQrUzL4e+P+C+Ksk5r2iKweez8EN2GAuptgadPSJKXdeSc9KJ8/rJfXm5E6SHx3uX8FeG+Ko/5PRET++DLPxUsI6r9JnRlbuGY9v31+eeE5obKiuPcD8RJK4g8SYeTMcilVEZDDXOQ348592KRDKdxZW39CfW6HkdgtRon7Ca4dy+q3+x4FElTYPayOovxJK2IstZnpLPz3fASPhgFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yfbtSefFnq5MUjmoSwzGJJWurv1pkJ9M76Uzzv3/bFTecapgGJEpyNCgMtGt22sBC605AkXCKEKmxXDTFQctOX/0IqHn/rmsqz9cedagBGzch+3Eb26CDuPyI24+pEuFkVxK9YWKn0cWYoIKoVfvPblOkyof7pQhHGQ+0L4hGnOImgtKYeRghOcEdJ4CKvHZUTP5BDkyRKcWgNvVePwTSw2SHTsrhdinoSjtlikTHJS4WMbOg3fBLOdxlhdE0fO0siU2FhSjahayDW7zrQfPejehJ1tyzCV+Y/PMjVWQEZDSVKBbaB2YvKBl39l0lFGxiPoob+Yc9b7co5U5h0mmChttnOivQJ0F8NZCuIMebga9I5IM5GhQnE7tIcWBwSftIMLbC9LH6B+k2DafCEfBUC5gkzyzPwvNR1iuQaC73gtHsSKk5rwCOuktXSrU/dHH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 07:02:05.0024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d973e73d-2235-430e-6328-08def1f64aad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9822
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5YM7C9gwtmSTkZSmH1dBYWHIZ+ImI3azV5/sa3oYZY=;
 b=e878/QKIpBrmkMV+he5pIXVjfK0aty+na7SKWWzvY9gZyAxjlnUGzJ03yaHTIrTAdEqdsMN+U7bVO7H/uVdvz0eXDoIWV/cZ+gsEdxOYKTKqGlKuptP3tTILVolJWPD9gELRCs8S+nhmEntmu77ZS+fo8XZTx5Kok4cz1MI+sfQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=e878/QKI
Subject: [Buildroot] [PATCH v1 1/1] package/binutils-bare-metal: bump to
 binutils 2.47
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the binutils-bare-metal package to version 2.47.

Release notes can be found here:
https://sourceware.org/pipermail/binutils/2026-July/150449.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/binutils-bare-metal/binutils-bare-metal.hash | 2 +-
 package/binutils-bare-metal/binutils-bare-metal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.hash b/package/binutils-bare-metal/binutils-bare-metal.hash
index 99556d8b15..d029c55943 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.hash
+++ b/package/binutils-bare-metal/binutils-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
+sha512  3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98  binutils-2.47.tar.xz
 
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 3239dfb18a..343bf44c4d 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.46.0
+BINUTILS_BARE_METAL_VERSION = 2.47
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
