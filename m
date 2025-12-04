Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD0D1F9C5
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 11:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 388C58070D;
	Thu,  4 Dec 2025 11:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3POrOc47zEOl; Thu,  4 Dec 2025 11:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6770780714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764848663;
	bh=GEU5AxRlZx+O5i2Ea6LHFATpRE7MQt4QDtPH4Tm5Fmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=UcPV3ssMz73oq710+/IYV9LirwrihBtDmhrxGuKW27pkef7LUoFeszJNOip6kJgIo
	 CAcs4KlPYjqAmk1eCnYx4mmG+PqUrHsjP4RZN5EvTrcqmZOHAUzhbe/dj9NtfU6OAL
	 GIqZksaVxgAFEX3vrJQtKzE0xR5aDO/+lLuGWZ5TCI+W+m73ANEXLPK6fyivHbUki5
	 wVzQZUvSh8Vm/JbBS4GP0d4oHUKMjkBRC64xewuAfdpePMlHZeetubyDUHpGOaL5Jx
	 KavgQIR4PAXEtGvBNu270crUOFrLeKmsi0ABmrFMM+1WJ/AimqNOaxpxphtwSKgmXV
	 Wu/JZxOEa+3BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6770780714;
	Thu,  4 Dec 2025 11:44:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A0FD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 11:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A081B80537
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 11:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOWp6jZFpVbt for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 11:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::7;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AED6284375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED6284375
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AED6284375
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 11:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1v+Yjj4g97MukVD1g4icEUYMoKGNEdvGIEM/YBGlFqCrs4X7TCgQkTqjruewbrj9NxCqUm6GHKPUy2Ai01htYDCBhRssr54GWtNus8Tdt/L+sgg2LDr8+weNGecoLp2LyPEuGjyMXbSDmO6zW4OvB7yHiXKyMYSOGCZ/3Ub2rM2vVfqGsmndMhLsgrKDMffmfrWccOI41Dx/srKsOaLfrT8YysBlrYySgSGJj8pTq/QBb1WQItCb4OEiXJ+Vi4dVqWUqIkuK4J/x3h44bW47HAzJ1kgnd0NMS1upd52QrpZyDwDP9Ym8qYo/ucAmBgEPOzbdmHvnN2c1U1ddGC04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cTpDk62S4+bxe0Tuh8Qei2YDmhyeHlFhYkcBcWaAn0=;
 b=rTi2fLUideYZbgx3UuT2HDCwsrdQSeAzOuCXsShBW+okFrkQH1NXaKWwMy/nX6iGKfLoFg2WzO2JA8ZarAh/9H3XOVUoDxvH9WT2vUoTN/Xp9VHenPSDF+TCkTm6wjJ6DrQIpVh+ToAgbu0N5Xdg383rt41QIl0Y7r9aJnIAXieZrwmCBCRrMVp3JLVjoWrIZHPguYXQoLYWchSs0AFi11le6r9A1NlzsZpPqZMNTZ/904jKMqkwPmI1vlBSXmWasZDLPfrgMVQ5p3Xly28zogu8LLEdzBJOS8FNOrDLhfcohnAraOdhYVjT7YZj5qg118Wc2J7BFnHKWQTvzJZMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:208:a8::38)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 11:44:14 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::79) by MN2PR12CA0025.outlook.office365.com
 (2603:10b6:208:a8::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 11:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 11:44:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 4 Dec
 2025 05:44:13 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Dec
 2025 05:44:13 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 03:44:11 -0800
To: <buildroot@buildroot.org>
Date: Thu, 4 Dec 2025 11:44:09 +0000
Message-ID: <20251204114409.3355954-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: neal.frager@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f97410-234b-4f35-6dae-08de332a72b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|7416014|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mYfjFLUK+F1tfMQB//XxIihYsbDx0JtgAqI912wi7epG5nZ6hnvQPpQvL2+D?=
 =?us-ascii?Q?4sN+mvy6bqo1ofgMYUOt+9N+u8LfMfouut5SQk9xRcw/bbTa0ox8h1nUxpPx?=
 =?us-ascii?Q?wGSqdb5xQhvVw58w+hnymgz/BOTkYxjqxGDBhijab+B8GSIkmdcxZJY7tlRN?=
 =?us-ascii?Q?MIUgTKyKoupOefYZCrDDgY5A788x+5Lc0bsgUc9nJsLwO8KLtT7huQE8GD4T?=
 =?us-ascii?Q?5PgPGn1yj68OmExFBHzwqztfc/N+xpSiAThNFk4F+5iDGQWSt3KnqBSprK+a?=
 =?us-ascii?Q?DW89YHMvd77mJXpgOp7WbLJ86Y63jF1NFGaJ+QKw1c60+fMwDPlrNahxrDhu?=
 =?us-ascii?Q?LS91eHBf60qRUOkcVuadBmL0id5ZR7jPG+99r267LbFaDqXHR7SaIwj7nOmh?=
 =?us-ascii?Q?UcC1JD49LeB92goOeCg7fKZ5zCt1pYzogZU8+pxEKqEKq6WFkGtb/OrMyZrW?=
 =?us-ascii?Q?lgoJ795tJ8SnlbEGiKJpO/lhtV3nal03ixuR9ARTETkPyeS5r4uKH/AM80si?=
 =?us-ascii?Q?nRS0+p/yGpyPjHzweF4NRnViuWRBj7heuBLht0KHIGB61rgCvWl4gb3/Bnty?=
 =?us-ascii?Q?2BzW4oyogpprRfOrqxfccYX8gIyGk2BRVzlqboEBVcul/d3wlBIm6wQJH8Dn?=
 =?us-ascii?Q?s+D0/doeuXMoFHAqBlzg2krWjUC7R02cKfX1EfZwbazFmDcdxOd/PiO4XpiU?=
 =?us-ascii?Q?/lo/meplS1Ai+rkeU1T7+/N0LecLQMWrxuM1ulnLhYuML3GNZLVUZhUol47w?=
 =?us-ascii?Q?sUvjddyKJAacDQR7efMhQnvI+hcHNEqQUFKez76cG1boYHkmqnPTInQEhSxP?=
 =?us-ascii?Q?mn1M+miKsHncF3uK6OAJuuzox6eqNyhpwE849f02pkoTUWsH0FLVQM2DoPT1?=
 =?us-ascii?Q?/vQpJKuDh7zS4QDkk9X6n2ZKlk6DB1+W++rVp4V37cWb8bBNYQxrOxrjqf55?=
 =?us-ascii?Q?whDvR99Ye6ayIdBm6kSXE0DhAGt4kSXjZfWw/xRZm4miFHuzTdEqZylpyQEt?=
 =?us-ascii?Q?xrFtA0+6AdUwpYcpyE03JcXkH/Y5lPqS5hlJVBDDpLYmBZ7VvghJAqnQAvDU?=
 =?us-ascii?Q?vppWZzE8/RYALc8WwaRlgINGy/dGc2jY5LpiehGpaPwmyIXwNkN1uc14XNmK?=
 =?us-ascii?Q?lOmuQLgi2mXjldFWXly1gpn4Y8Hi8qUfoFfVhMH5KMsS+53IlOlk+afUkjcL?=
 =?us-ascii?Q?Q75MAzj2kce5VqUcxPXzWxTSGeHcFPZY/YhJB7UaapmzDnKWfeNSzZ0gELAX?=
 =?us-ascii?Q?0LJe5g7kzHfCGx8lMZXFAQE0hCe3r5+fb+4RiRN+JXD2InlTto0vCTvs8/wJ?=
 =?us-ascii?Q?tBygww0nYo0GMkM7NR75kFV9sKeb7YBxYvD/KqP/Wx0sy2NFFVJO6X4ZbMxg?=
 =?us-ascii?Q?EaD2lH/cF/TafR+N4Zx8Zfg2Rw5cx0t4pfQo0XR5FoMi3ZZY2TfnvOgnlTM2?=
 =?us-ascii?Q?YV+11Hi0bI/CCQMaIKyNsRz4BPJvyp8e0ivJ4xp413vkP8iWKMtn2DowFs5D?=
 =?us-ascii?Q?J//2+O15Y8yjHVOvJczJ4yhEKfKzf2WYnoTAJWvYb9uUOJ9fMYTdD7OEuIFt?=
 =?us-ascii?Q?LZxyyenaUaeWzSSmIz4zr+EZF69eqgqNR1SKVhEt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:44:13.9142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f97410-234b-4f35-6dae-08de332a72b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cTpDk62S4+bxe0Tuh8Qei2YDmhyeHlFhYkcBcWaAn0=;
 b=lafmcuhbdZyUpKLzd3nJjzhcFxrP+9C8/pkVApdCQtUX/qyfFEi5PS1mpW77hWcDAlu+YNT+ZJIRHiFsWG6f/+zQYW6D2s+aTzz3GKWsNRLGtd1zQGuv55/JuPlVRHaluEmbGvV1aByTFlf7Dc9kGPgvxibpSGYDX1R545W8zqM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lafmcuhb
Subject: [Buildroot] [PATCH v3 1/1] boot/xilinx-prebuilt: add local versal
 xsa support
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
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most of the time, users will be running Vivado on their local host machine,
and will generate a XSA (Xilinx Shell Archive) locally.

Instead of requiring users to create a URL location for their XSA file,
this patch improves ease of use by allowing users to work directly with
just a path on the local host machine.

BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as either
a simple local location or a URL location for the XSA file.

In either case, a hash for the XSA file needs to be added to the
boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- updated help text for using a simple local path
V2->V3:
- rebased patch due to changes in Config.in file
---
 boot/xilinx-prebuilt/Config.in          | 6 +++---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index a1e711e6cf..7926b6cb9e 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -68,9 +68,9 @@ config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION
 	  file. This URL can use any protocol recognized by Buildroot,
 	  like http://, ftp://, file:// or scp://.
 
-	  When pointing to a local XSA using file://, you may want to
-	  use a make variable like $(TOPDIR) to reference the root of
-	  the Buildroot tree.
+	  When pointing to a local XSA using file:// or simply the
+	  local path, you may want to use a make variable like
+	  $(TOPDIR) to reference the root of the Buildroot tree.
 
 	  This option applies to either versal or versal2.
 
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 6bd16d663a..7433444924 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -10,6 +10,9 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA),y)
 XILINX_PREBUILT_FILE = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION))
 XILINX_PREBUILT_SITE = $(patsubst %/,%,$(dir $(XILINX_PREBUILT_FILE)))
 XILINX_PREBUILT_SOURCE = $(notdir $(XILINX_PREBUILT_FILE))
+ifeq ($(findstring ://,$(XILINX_PREBUILT_FILE)),)
+XILINX_PREBUILT_SITE_METHOD = file
+endif
 define XILINX_PREBUILT_EXTRACT_CMDS
 	$(UNZIP) $(XILINX_PREBUILT_DL_DIR)/$(XILINX_PREBUILT_SOURCE) -d $(@D)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
