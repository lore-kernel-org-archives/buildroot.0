Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B3CCD98EE
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 05:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F040C85BCB;
	Wed, 17 Jun 2026 05:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaVV7C-SUy4Z; Wed, 17 Jun 2026 05:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E62485BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781672751;
	bh=nE5wg3rVEPWF1u+WPg1G4OmgqyEUqkswS6huHgODUEs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SR91hgpjF6Lm8+f6x92FdnJ0u6jakA8trSOqW0oKd7wtULnr/ct1abc3Homwrx+p9
	 8osnkcTO/vyuaOgLtE7BF0lxTc/Q3yIccYM6dQyjkzfbbPYwm6GuMPl1M2jIl128cD
	 qSGuFgAeNYGrcC90QzzF4ydIHl3mPWv5YGISZAOoPEzwbQMBCIHFia2Q/UH0LsMmNv
	 ZNb7s+RJnWWxoNH5x1sLmK4F4OxOdZK4r0ATTMY04EUNYWWhD4DPQQMOae6glfLI/y
	 Q2OwIFicnm2UJjYwQfL5hZvys69Hmjl/tno8C8TCQHVr9RXYmjiu38PWAGgxIsCZUc
	 2JFhh5eD23Mow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E62485BCC;
	Wed, 17 Jun 2026 05:05:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F5A133C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D3226F79D
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqdzjZcYJGKd for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 05:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c101::7;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DE126F7A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE126F7A1
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c101::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DE126F7A1
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 05:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfPlj24FQ0twKSQOId59N0Cu2Z+q7HUkJpNdUxi7Z65wPe6EIz7iQjivbwpHW0hsn62Y10dIqS11k/ON+7TxH2hcTrTqBrooTjcU603hbNMz3RS8s05jrJm6gXvVzP4i5dFNUdMLZF5XhlUwcRU3f4Y9VDWXxw3iDP6v8//tPkzzgBFTiYS3BPg5ZHdt+u07FItFew8yNEVaeM6WwW4dNAJ37a4plOdYe7gjo6UQq9+Vwgy/BMgtjoFRaqhnPkEN7EpDBs2ujyfL8cb8+O5HOVjO7GBNEfCQHBY0ZlrePp9bR4yYnKpdcBJUeTGrfMHOL97SrI7nh38krpQIF8DzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SOZBiohS/rQDZSTndwO9vOGereqyikI2lcfFle9XYk=;
 b=riR9YuPRGrebqMxlS3Dt24TMzGSoyL9ZNM8Y1eIuqY9rMLMRaBlU3W//H7yBTEShje1RkfN5sB7YLWH1ZHdYN7swv4rjfscl6C5zHahZ0MjSBnHVdT8vmoazgEOVTEFka3+aDbSpazFfRU/5WYouxKhJ7w1skLUkrJnU8wi4qwYTAVhnyrkJ2bN6yN898zjCcOIvOnMcUhrBWp6bGkzFurAl5QvDVgcld0JBW2WXtmzqgKGjn3bNTlIDCvUh+dYVx2E+5cFW+vO8ShGCu/UYiKmLT92geKatl/Y2MWdLOAeePWL81YJH86EQ6iTytc5I0J7i++kTDw/jW4Kc60Y4GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MW4PR02CA0019.namprd02.prod.outlook.com (2603:10b6:303:16d::23)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 05:05:41 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::10) by MW4PR02CA0019.outlook.office365.com
 (2603:10b6:303:16d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 05:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:05:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 00:05:40 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 00:05:39 -0500
To: <buildroot@buildroot.org>
Date: Wed, 17 Jun 2026 06:05:27 +0100
Message-ID: <20260617050535.2670810-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260617050535.2670810-1-neal.frager@amd.com>
References: <20260617050535.2670810-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: f85be5d5-4f7a-4824-906d-08decc2e1412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|22082099003|11063799006|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info: 7MUNf1LUBdu30BLl+T6R5/cWKre8dvol9+7Pp5iUvld5aD6l9z/NRvytEJGiGeF8ij/YkwoXK3jU7FRc405zH2LJN6rVQiKn6JSOzVFVl4KY9pZfNDCDc7tbYcch0TZB1tqCBWPfUpVwqkWu8F4hG6RMjmGM98VhsyJjHTjtqo8hlYWpf6LZMFDYYDeesGXLh903hncXBbcnKF6TYFm2h85kZjMDUn7bGfLxFfBC3J34zWQgX/t38qvk1KgsHbrVdP6XFB1HljyqkN5Ln4iQuG1qFxbr5PWIl0X1LJ/5rlN38l0gV5RGtUqoO30NB6RDQxAnUfYke7UEQ30jN0r0CU5XYHRGczXYCWAf8vW1dOph3ROUHtPS3Om/sX0CadnW0Oc+R/als6WXmKpARtHZ+F9icecwHx1rCMHDrwKC9skBx+5uxrzC7DJqCn315Yc4vKGTXwlOekQOALCnjzva4CY+lzNhln3UjvtjNUCRaVTW+nP8ZkWSo+1g3E2D5VW2zvc4iza/Ng71WAr7AQvtBxfNblqfIjt07YY4OWSaLVD8/rgmy8GZAStCLPVb8WJRA2hPdsejT/2/p7EdGOiVqVL63720n3vvyFSebnqrxldmCc+UFAm1DWcbMK0h5Kr/vdMIje+9yy/BMhb0E7YwlPJZJ3N+/xQapt7XtVW9cqjCfAgIcE9XDeSHjISTcXmHy83pcW0pviocLanHjmGWdWpndDor1ySZUceVM295Ymj5XPREtcc4IQhZWUZNRIp1/ofSpm5/DrEtgva2hjEc1RHtBH7FkXAndy8IFjd/R8o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: beWVj77QMzI4GP/eRRFPHvb8JN0yEpvdJwuqwQdO5DtcT8jRiFu4dLZDvoLtMlZue0LaOIeQg/CHWIN9Yqu1QN2W1U5fZRTEs2b6W3Tmh9L7UBLtyblXRIK3LxGQdeIdYQhvf2CZjLAIeCQ0UKkHaKFAGypSuEf7wcSN4TcZxfWKm03CCMKXB+x9p1UUUt0+7otzlrmmYSxwSLgnOD/0/inOKSUrIW4e+YJTTbQ9TmMVMt1vS5esV92PU2cmXOkc5e7/uf4BwacuizwIySZNsPC4DsdoGgOnxJHjvqkoS1VDJ5p2kKoPTGsqEfYK6/Oo/WWjw2XiFZLdwwwBE2HvrLPyBhhOi+0VtjVRVnRbEwpa1Dic7WE5bIYqEaK5uvIdaGxCHks/gIvV+aoAMV20S6DAKBry6MwaBK5gw+JbdvUYMNrFTbm41D7i6jdKbTxc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:05:40.9402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f85be5d5-4f7a-4824-906d-08decc2e1412
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SOZBiohS/rQDZSTndwO9vOGereqyikI2lcfFle9XYk=;
 b=png3CWa0pgiFmcwTcqSs/TrZ++KQkEcCh9Q/IdgjgBIqP80QeClv9rKsujQtyrep+FLDUBgPgoKEz8577sQZbdztnQ0Bx2gOL6bEP+pxT/GWPXcSL1liV/GQ6WWygd69XStxUZvXMV12yk3ZhkQSEX5MvD80+1DzK6X3IT2ZQnY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=png3CWa0
Subject: [Buildroot] [PATCH v1 02/10] boot/xilinx-prebuilt: add
 xilinx_v2026.1 hash
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

Add hash to xilinx-prebuilt for xilinx_v2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash

diff --git a/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..4e82561cb1
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx_v2026.1/xilinx-prebuilt.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6e02391f0dae67a46efc260729901da9c110b956880d0ff2617701f8b6cf0e1c  xilinx-prebuilt-xilinx_v2026.1.tar.gz
+
+# Locally calculated
+sha256  e4a8315687fbd55fc6bf0965c968bd95c8b73b8a957bb10b2ba618d5390b0e3a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
