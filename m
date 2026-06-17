Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D0CD98EE
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 06:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A72885CE5;
	Wed, 17 Jun 2026 06:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmkPXJrBJ2fL; Wed, 17 Jun 2026 06:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB40985CDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781677170;
	bh=bkPXQAhD6wZuMfqY4JtKfWgViU2FY8nnVdkrSH7KZNU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ZcW4VHVKMGy4IGD1hDbGY5OuEcs/+ZQYub5Zr2/xDpi4u5ZPW6I/J48yabm4GCoqs
	 v8k4W5kprncCmC4Ibs/9wLSA0PjQVZpoMpZYdEraLz9hSNDTI+muqrUtSbO8RC2RIz
	 tPre2YwZs5ymgRAovP83x8U4xCzAJ5JNymkjVBZ6uxcSVs+H2mwAss9welYoMSrsuY
	 Lu30Py3vazfQC4Z1Oa5Z6NhbAqhFoJmt1tXbc6WuPU7nYXgODCaenU7PhAb/XzGEhE
	 tXK5NnN1jbRwDrCOBpZowWsd8PlRHn5cXNFZaZv2TUacdUVF3WMQwp1tGRDRLwrS7X
	 LnGf/lGoeTShw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB40985CDD;
	Wed, 17 Jun 2026 06:19:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB19433C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B163A85CDD
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuqTSFTPVUtK for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 06:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::9;
 helo=ph7pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C657D85CDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C657D85CDA
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C657D85CDA
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 06:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuUMoV4icsI9RYDcVJA5Ik45ffEdO/7Gow7mP87R9pqz4yhw3oh8enRCOTAeHLS+2MJlRN987TkG0oaLPvdobe557BtXLK1PKK6w6ZIKrZ4sE0mPMVEza1Ct2Av0q4LFzt5bER6FWbtRaS7Fi22YqWUB3wHKdLGo8aQ+xM3GYOjtwRFi8Pe2I2g7Pa5ssGf4PazkfieOs+/thfbS1IVQiD7sumasMxJf9dUCJ5FDplN8k31G7jVcTbT7Fdtx5Bj9FvrxkXCpIhhIcm2lhZeTTYtbiKLTQR1C7zkfZS4WncpCE3sbZMYZB9EdYUwJV8popsPsEvOtghLgWo+w6wle4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZeaBZeP4ZuRnk3f1RNOdxaFtb/hWef74kK4m5i51qk=;
 b=E0ke9XCC+wGAy+UlZTYWeLihNbeDVfT/nB0Dve1B9CmPYjWupqOVMTcqTwj+E9lbNZaq2U4qYfDkBQ63o8hPptA0QTgjSwxbzObSmeB8x1Unfa9P8KCSzzvU22kmz4U5euVhijpAUTWVredsJWiDNPjjBGe0XSshFXr4SH6jxdg5GrU0HAxn/Imp22zQKAERgIziN1KN+gwtFKsYLiS9z45iSZKGtBVkzdQT5xK/gU+01z0/8eHeHyHjOJCKa3F6CecVHrJMOsT0kbHeX24VqDZ5LrWgG8AQp9MrWmEcgvjPGvT4EcU0vzZ4dpRAKohX++y5QoxryfaN/XqL3nsRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0147.namprd03.prod.outlook.com (2603:10b6:a03:33c::32)
 by DS4PR12MB9793.namprd12.prod.outlook.com (2603:10b6:8:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:19:21 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3c) by SJ0PR03CA0147.outlook.office365.com
 (2603:10b6:a03:33c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 06:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:19:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 01:19:20 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 01:19:19 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 07:19:17 +0100
Message-ID: <20260617061917.3534410-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DS4PR12MB9793:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b422d8b-4fed-4a54-d4f6-08decc385ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|56012099006|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: bR5ugNqiNccqmfMsirUClbujQU8KYzr9MA5Jxgr0bW/66xS+JThjhQErqPzY2MwkbVfPDcuawrCpg7CObvWE3BuLKloLzweZMBe4ouTCMJ7Dnn8qOgiUB0g9YDa0TmDq8kf0hZaQPHJJ907VlxdLtCjzkTmSgTxErmwvTp6rkp+DzmWNjaziUMzLmXnajNN2nIhMZzpi+ihzNjx+iOI9LbYKLhBNHimttxqR3bTsDrL7FSVh+1AS4e0Lv5+qiB443KGC8Nv4YHk1pRd69joc021IbceuZAjpSzH0i8U0ZqnZ43Dvj5H/5A3Lf0L373e7qUgnM818Bt/qRmF5F5gF1NvllQqYcW8KC7iCy3QY5myYHJDsMvEktNbCu8XYRtJQCSh0e9VsmnTseFSYuZD7tqdFvGtwZ1+3D9HJ6C0btzFENcx4xptyuQyBy1M027tnxqzZESKeK6ipVzRWzHSmSkpumli5aT0y9TtbbRSeHSHwPbdxuDgck+5MKXpO4ol1LT/Y+qQvbd76gfeQQYMuFaaOjgo96TwT5VR7fppray0DM5qKjgwx/wePJ2F4ZXaVq/aIuMqF/U5ZS7hxrr77fRPi1ejHE7MaOxl9qPcns2I5UIG2PUgs1MYEyxt5D6L5uriUOGZxXg3z6KrzyAFZNuUbKJWrh92EiPMM/05hSJFrasPjzp3jFANav76dbHsS/oZLr4w6hj8DQQBH4OVC6R5mN+JkMbqmLsYlRqJVXdMDqOZIZagU/Tf/D/mAbg2g80HQ5lIisSbN/HSTZBPaiA0X/BnhhtY2cyDFz90kW8U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0qEpZ5CMLxydUpJO3alWqnyvecTNnXzYII+ryipgf8eFHmop5jBNHcwNARh8UDg3cclYgh4W0hFX1s2HoqlzBp7Cv4nk8aIAl+S21agTbkYjq3aKe28mMYR5GzWaCj+klc7/mE7YHivsB1DxzG0aGfeMSyXsGVRp4PXNpZJ66vUYk5dFbOZgYqPXDV5fXSg5JFOZAfRYfQSZ0rQZJb8tRy2mffGiEAvnNZ/tzZDRmBknjGnQsT9IdsWiPTK81o8UKoPZCET3g1GuV9EdxSI3S0eXCo1RUOwc0wIxD2vj7fM+PT6qPh1Y66NwDBM1tmA+0ABwPIJpPGQTri1MaMF9q56WaHWC+AR2Fy460gpmia7vpSNxCiDstnKprElef5SS/J48zuo5pummoOjs8fap5owNuiqbOaUKndWpqZZk+dUwi9cGiXHYFI8piB2ZI4F9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:19:21.4335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b422d8b-4fed-4a54-d4f6-08decc385ede
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZeaBZeP4ZuRnk3f1RNOdxaFtb/hWef74kK4m5i51qk=;
 b=FXZXMV2fGZ/4lo4Zp5nMgDAcYYRNsYsKc4cMKYnRPPEQB1o1nN5io4HEeqrdyllVZ0i0Gsa9dhN1vMk9UXnXEEhPECS06DWmjw5Gb8PzCCqhWQrwy8rknvEBUXxLOjNDnQyclS/S/7P16nvzp+nANCHL4BoJ9uBQmdhr/qZP7Fc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FXZXMV2f
Subject: [Buildroot] [PATCH v1 1/1] package/xilinx-fpgautil: bump to
 xlnx-rel-v2026.1
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

Bump xilinx-fpgautil to xlnx-rel-v2026.1 version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index b66ef8186b..42a10c40bd 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  043d87f12550283008ee0850f18ca807a48cc4ee085182ae84f8bed65fa73425  xilinx-fpgautil-xlnx-rel-v2025.2.tar.gz
+sha256  6126a6d1baa937bf94e044fdde1eaecbd1c0b545835293bad51bbf5a8e6b7cc0  xilinx-fpgautil-xlnx-rel-v2026.1.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index f53ed80e2f..bc63427f18 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.2
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2026.1
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
