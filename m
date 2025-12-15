Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E5ED5B16E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D66A80C6E;
	Mon, 15 Dec 2025 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqQrQmkNhoEG; Mon, 15 Dec 2025 14:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6414A817AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765807272;
	bh=vOkVrRZnvn5M6gDN1aqBqw9dQH20qOR3DWbBJDNbF1A=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hnIM9wh2321QYnf5M/A6h3AqVCPOOybp0ZI3kbv8jGTJKYiBe3a9kmdJr9vmP/N08
	 0rp2pGOrGjavDck1K4jy3tF8ACFDM9SI0uLy0uC5GXGDhc5qclMTV4XE0Ed4K4u9jB
	 WpmLvOOx5D6b0lbentEHfLzk1oZE6acHegYVEF1Yv7WDLZAwjcX+TTFkoN+s6toxm6
	 Tm9o9ZbRUHbQqk6OslFY2N3ukHtRYIeIPUGV5P7I9kqiK4CgJLK8qLlU0QkypCyCcB
	 VNDqu7HBXGZWlUm0DyaPC1x3fLRpAsnmbxnHykoEqBRZXgNesNcX/xNGcX1TAa6rPx
	 p3s9fJBusaRtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6414A817AD;
	Mon, 15 Dec 2025 14:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB30117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D80260E89
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aN5_iNqgNYBC for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 14:01:08 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c111::9;
 helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=bb@ti.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFE7260E93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE7260E93
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFE7260E93
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfxtrUmHsfpLtSrapgvEKsJL/X+WNQVjSidFxFyLKzcMpibZ18a81ur6eG9XOIDOronbnJNtKhGSGdHupQSpDrcGHjDICVWvzpj63ikKCMMkWPP38f3TEPH9Vlvl64uCJ4g2PLhbFTSbFT49Aa73EgxapUrxt2ZJxtR4RTQWHzri6+Bv8uNMz9S20hdySMN1A8AR/ukhghO5l58wkCvUrP9TVQIRoxyPwF7lV6flvtJaMhWs+CdC5AjzrO8HMsqPSxIzfu5A373sN6LqcskwX/RMzzv/jt9s6/1EHrRBlaI5GvQh36rVKiRyMn3pnXtOZeE6MIsjXnIwrDLK09yXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVpXDLCQ2GR+sDPZZ2So3QwL9e2Ss+b3XBAvBqB3DQU=;
 b=DiIxSBH9MmGoEshY1WKwakK8q+8LHGOP+TY/5YJcJZVMoNZuQxMjJ3e7UB/lNGqTXizqCc8Sz/e8wB3z5MHLabqsOY8b28ToQm8G2DH1+ikUhWhcPbq9fEDwjr1mlI9jXmmG1uYrG4pBXYtzjqF86X1AEem0U+LuISNLO9nCiqWc9NLIk9IoLFDQRBM/mw/rFkpwyqv5VqmL1FicBkaZ4GtnEpS8TEfFyDSEd+S2j230ABROr4tXP/hOoTHFhQx6k0UicNbN1O5+YXYdznXkDfUB2id9dnbpw1sySZ/4771E2paKijDX8tBCCL0P1hNHRdqa/KMU+OjMuGTecG6r/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
Received: from CH2PR20CA0024.namprd20.prod.outlook.com (2603:10b6:610:58::34)
 by BN0PR10MB5173.namprd10.prod.outlook.com (2603:10b6:408:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:01:03 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::3e) by CH2PR20CA0024.outlook.office365.com
 (2603:10b6:610:58::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 14:01:01 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 08:00:51 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 08:00:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 08:00:51 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFE0peJ2468419;
 Mon, 15 Dec 2025 08:00:51 -0600
Date: Mon, 15 Dec 2025 08:00:51 -0600
To: Sadik SM <s-sadik@ti.com>
CC: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Message-ID: <20251215140051.om5xtszi4xumpdjh@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251215132425.136858-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215132425.136858-1-s-sadik@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BN0PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c83bd18-b78f-4743-54b8-08de3be26188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm9JT0tFc3JSSS9GMWtvTEthdG94WFpBeHB0d25SNUN4bTk3ZC9jNTNzT0VZ?=
 =?utf-8?B?Y2V0ZW4xelpGaUlRS0NIdTBmbytZSzhvdyt5Y2JMMGVPRHo5R1MwdENNOXd2?=
 =?utf-8?B?TGRMRXlNdVU5T0U5b2VjL05JbWx4bENBbThIZWdTQ1lzRm1pUHVIS3RBWXpy?=
 =?utf-8?B?cnloaXVYTU83ZjNBMnpvUjR3ZW9VRUFONzE4UEQveUJ0TENDSmkrRUZGeFlr?=
 =?utf-8?B?bGZzdHJOTmMya2RNZWlRelZPS2RTS1NCVlJ5STJmd09lbHluaDM0c3BWVWRn?=
 =?utf-8?B?NnBqdmprZHRHMTFCRXMwc21DSjFFaGErZTkxMzJXN3locVdkc0R6ck9rUW8r?=
 =?utf-8?B?cjRGTU5kcVplY1dqb255bTZERWQ4MzhFNU44THFWbUlkOXp1cDk2Zm9zUEN5?=
 =?utf-8?B?MGN5dndRQlp6bGNDWjJTb2RTbVhNYVh5azNNUTF3V2xDMXdlaFR2bnc5Z25n?=
 =?utf-8?B?TzlLeW8raHR4cEwyeWNKUm5TMHM3d1hHMTRjREk1Q29WRFNrZ2RkSGpNcE1n?=
 =?utf-8?B?SWZVaXU3OG1zakNKendVRmVXQXo4RGlldFdSN1BMN2pkOFkvbDhkNU9zSUZj?=
 =?utf-8?B?MHB1c0JsSkFRQm1iNjFQZXVtRVB0RkNocUt6Yk4zM3dpaktJTkRsMTJFNmdy?=
 =?utf-8?B?NklrOXVPQXptbkJGTEF5NmJrRG9QbWdaZU1YT20zSU9DRzFuOG9FYXlVL1hR?=
 =?utf-8?B?YUhvTW4vTU9tSkw2VmhyeXlzcTZibFQxUi9qQ1JNcmdUT29GUE02ZjhJRzdr?=
 =?utf-8?B?Vm5KU3ZvNTRUR1NBaUFQMTNZWFZmNW5mRnB0S2pwcEJHS0pmVVVPc0doR1E4?=
 =?utf-8?B?WW1YYWg0ZFNUN0RlVllEblozNWFteEdaUTB5ZGJGS1ZEdzZhK2JIOVBGNFQr?=
 =?utf-8?B?S2ZWdm5LZTlEeXZQUXNISWN6QVpJVStUbzBLRm9QWlpHNzNtZmZnV2VqczFL?=
 =?utf-8?B?dFRiakVjNFYwcG5ZME05bUtrMVFWci9HVmFwVW5OWE1SaXAyS0FDMHVaalZX?=
 =?utf-8?B?QkVRT3F2YWhVdVZwTnRnK1YzMXBpVWcvYjJFK0gySUt2Sk8rOFVFRlYvSHd6?=
 =?utf-8?B?LzhqQS9JZ0lBejh1Tk5HbDF0UCs1UXdMaFFzaFhyeUMvajhHR202QllPdmpV?=
 =?utf-8?B?L3Z0WDBETXV4MEFaazNQZUsvZ2g2K1ljQ0ZuWlhVNHN4OXIyRG9DYzNpSmRO?=
 =?utf-8?B?d01oQlMreS9PSEFTVW1LNzVuUm8vZ3hiQTN6c1VRWGtyb1pVOC9zNERIQ3Fa?=
 =?utf-8?B?bmh0Vm1UYUI0V2l2NktlckxlZzQ3K2RhZ1hJWTl6U0Q0MHNPaEo4NTN3Wk5V?=
 =?utf-8?B?Rnp1TGFGUjI5ZmZxV3dHVnNicmswa2RUOEtHYkFaS0hBSURoMnVkVWM1QXZt?=
 =?utf-8?B?eGxZZ2d4b2ZKWHFtVE5jbmh6b3ZKc29MWWV3SE9qSkQ4V3dMcUlhTmpTRVVB?=
 =?utf-8?B?T1UrZUxWWlhEVEx0SUdGMzNaYnhSbktrWG1rNFpqZlQwUks2Y2NzT0lYd0Rs?=
 =?utf-8?B?TWVvZnU2ZktkU012ZURmOVdNSWMyK0h0ZFRQWVNrOEwwd0dCeklIMmpldUVa?=
 =?utf-8?B?MnhVWWszWVpqTlV2TkdJdXpIT3J5OXlWeC82c0I3N0hacWJzcHBBbkN6Y1Nm?=
 =?utf-8?B?MmNRenNOR3RlRmZPVzNZSVR5MkdWdFNKeHFhRmJaZDJ1RXpiSUVqVkNHYU5D?=
 =?utf-8?B?ZWtwMG9mQVNSSVRxTkxQUXZidUtTbjU0c0VoWUUyQTZFSHdhUm1VQWZuZ0Jl?=
 =?utf-8?B?aCt1WmR0aGxsRld6Y2N1VjhrWnVnWDJOV0VGMHpKNTRLSHdHQnN5d3lNdVND?=
 =?utf-8?B?R3BqSU5PSDV0UFhnZW9QSG5jOS81RmxtRHJvTTdqRExsSlBRd3N6QUtjbmhz?=
 =?utf-8?B?Z2lpaHpNWm1oTmZweVg4L204OGY1UGpnK3lSdS9jR1ErVHdSUWNWRW1vRUlt?=
 =?utf-8?B?d2FBUjZ2YVA1TndENmVKYm53ZHNkTjgvb25samJsbjg3aGpKZHUwZjNVRzVz?=
 =?utf-8?B?MXRFTVZveU1xam9zcGN1YklNUUMrUDhON29RL2pLUS9ad2cvUnVPOXdQczBS?=
 =?utf-8?B?ZkNwNVVQbnNKSTVZVWxTVDhMS21UU0N1aHE1QVR6eUxhb2dPZVdPdVBDbXNH?=
 =?utf-8?Q?6t2Y=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:01:01.7708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c83bd18-b78f-4743-54b8-08de3be26188
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVpXDLCQ2GR+sDPZZ2So3QwL9e2Ss+b3XBAvBqB3DQU=;
 b=b1lUNn9X1E7+Zj+MZ3GpVViRESS0FbfwluK9JVAUgq/9iJYk0EFIgyO3jH47Cp/mCXIoJSn6zUsLJsYBeLpGT2OzFwrs7HCAdl7TW6D1mB3fDPUHec1YZy5mSJHK1y4agMCDkck2pABAOyWyPuhDGjT0JiZU2sXXVCfmyp2/JzQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=b1lUNn9X
Subject: Re: [Buildroot] [PATCH] package: new: add k3conf tool package
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On December 15, 2025 thus sayeth Sadik SM via buildroot:
> From: sadik <s-sadik@ti.com>
> 
> add the k3conf tool in the package section
> 
> K3CONF is a Linux user-space standalone application
> designed to provide a quick'n easy way to dynamically
> diagnose Texas Instruments' K3 architecture based
> processors. K3CONF is intended to provide similar
> experience to that of OMAPCONF that runs on legacy TI platforms.
> 
> K3CONF currently supports Texas Instruments AM654, J721E, J7200, 
> AM64x,AM62x,J721S2,J784S4,J722S, AM62Ax, AM62Px, and AM62Lx devices.
> Along with the BeagleBoard variants of the above mentioned TI SOC's.
>

Works for me! I wonder if we should call out the kernel needs to provide 
/dev/mem for this tool[0] 

[0] https://git.ti.com/cgit/k3conf/k3conf/tree/common/mmio.c#n39

> Signed-off-by: sadik <s-sadik@ti.com>
> ---
>  DEVELOPERS                 |  3 +++
>  package/Config.in          |  1 +
>  package/k3conf/Config.in   |  4 ++++
>  package/k3conf/k3conf.hash |  2 ++
>  package/k3conf/k3conf.mk   | 16 ++++++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/k3conf/Config.in
>  create mode 100644 package/k3conf/k3conf.hash
>  create mode 100644 package/k3conf/k3conf.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b27df9beb..396452f261 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2962,6 +2962,9 @@ F:	package/agent-proxy/
>  N:	Ryan Wilkins <ryan@deadfrog.net>
>  F:	package/biosdevname/
>  
> +N:  Sadik SM <s-sadik@ti.com>
> +F:  package/k3conf

I think we may have some white-space issues here

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
