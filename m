Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F7DC61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC29605E7;
	Tue, 25 Aug 2026 08:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD3lfGiwRsI2; Tue, 25 Aug 2026 08:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787647053;
	bh=7rr+1nwTRmNy0kHaJg8Gx59KCqzwGdA6B4SdktPl+r4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+z9njsEOPstb+rbN3XXkqoMfTKY3c198j14E35RxgZUDhEti05eUhxHVuTAR6b81
	 vhLH5go7vxRT/PCyNsMBP8Hrvcfbe2lJ/W7f84rnZBHMIa/t+zUXUvUekmDLMLIRX8
	 GGypEm8R27+ac1qWc3Ma+fMpjdLrhUTAHM/qqLP4IHswruGqBinL390ExeYJImdUi8
	 Wfcr7JrobXe6aHeIbHzg+jxnnwPwdtUbVPRJ/9EgK3JBqTRqGxCK/CbqXimQst7IA1
	 5uv3+zmwJsnZs+6Z95Og5E8FzcbPpt5c2qoz6R7jD6XHdgpNFeoy6QTRvvvEHoVInY
	 Auv1tuKemfr4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8EA760606;
	Tue, 25 Aug 2026 08:37:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F19DA279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2B3E40068
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dkhRiL7P3U1 for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 947DA40064
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz56jfEnYHuph90TEs0tMWFrMlGrbIAMkz2VXuarWGleaz3gIMvAZ63ToWwkxkSZ4bDdaDZ0Pf7JfMsm0cvJFCBMNK2Gg1W6zqyh7G0N4OyWiZvadvJ650FGfx9Ag5tySOqnceZshSjC+ozrYTWpegE1metSmi4ioRpdk6OxKn5jDxzTsFMk9Wrx3uG2tP3Pu9PYvrDkJ1/lFO3e5pX2W8QW2zDUtTxU/J6OQQO9E4sYx9vtQu5UQLp+LJn5aBnjuknznecTkhyUEQC89NqtYfWlEEn3qkFb4hHuyF0Yaqs7xUjPEl4WyUvID6Rr6xqh0Q06rmUZPcsugo/CC6rkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYdYx2V7luo6JQWZoNblXFT9G1/hTwK3PyFQL36ju2o=;
 b=dl5/Qz/XvYtEYVQJ+peAGFpEEZrNHWe1cHkpWfCRyLZHdQ8ueJk25Ih8Tdbvoh2BKG0IONC2FlhG+XVFZewNrvEOaE5rHkknMxYVDkPyIyk4pb2u4o+BHpgxAcU9fbmLx4Ku3+Pk5c2Y/Ht7YkYwmyna8NkNk9YWeQAko9vWuPomeCGctZHv5Oj32+gCt59YIJlluh8iwhMgUk7jfX548FMhiMkQz1PrcCHRYo/YRNIJzMgvXMoD+ipy7eE6HwRn9AFDvDtUrUBVImWfMbrq3mAapplOVCvcqGPCU0+0lc6zWgEq5TokEaMyijPA+FHZK2k+0phftAKnTr1JUWM3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.10; Tue, 25 Aug 2026 08:37:21 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 08:37:21 +0000
Message-ID: <dd93f44f-eb98-454b-8061-1589bb9cef63@amd.com>
Date: Tue, 25 Aug 2026 10:37:17 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 micheal.saleab@amd.com, yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-3-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260803145152.102135-3-neal.frager@amd.com>
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To DM4PR12MB6472.namprd12.prod.outlook.com
 (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9372e9-977e-4817-0ca0-08df02841485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: 1e0knIC0MKYNb7fZZhAWKF3Ncj71NSO55JAN00E5uPbLrCidZfJLmyJLdw/iDClvCFFpmp0A68qUt5x0Q03qdhKHirWhgO294ZRHls2GFcW14QKlEXHm1XNED/XWXy758MCZcOac0amEUZ82tKyCm1wQkbNtHZFXiIZA8DiRvFkk/OAYkZO84ybI52HVGp7JcbFNxa0mPHxqTIam+CEEkH8RwZ59hSZ1eZtdxMYkFFhcADrWIoM1q1taxZvPr35d+3Y0mXX/CPRqlRuuHOm5/fi42bruqtTA8Pn3l+Q+5oKCADTw23aDEyyRd4EBBkqf0+E8TnO5//oKv74W2evlW598NbUrKG1vz5j3jNFVYpQ7gIY5ul2qUI5uMjuNtveghnqpMPauNmfvOGoBW+PgI60vtDMb1MYCrp03qJfaC9LExrUTEnYjWoFLQj0Uns9ips0IAktYXfJoSf+0wcfmJoA/lX+3Mk9UDgZMvpr5L3c0IFNYUoXFxVy11MTo7F4JBP92c1LTSbUnmc0g32mviScpBe5zq4EiA0NDHq5JwUByGHQ13AOW1r3gjFwLWOtMr7GNeLftUwgsbXmdOj6tXOiiYLEBxAuOyh87npDoWFJGV0JJyVgxt9HT0jfUwcqhmIsPv0g3an+lg/F9BMqoLLmfJb0qyapCbCAPG0mkDGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6472.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZlc0EwMi96dE9GalFiVjhKSm9CTjU2ZWtCYng4SHJHQXZ0VEJKKzdmSHNp?=
 =?utf-8?B?QUwwc200Zzgzc04yN3RKaFpROXE4Qko4d1dLM0YyUml4R0UwWmY2VjEyMmFx?=
 =?utf-8?B?d1M2TTcyeEE0SnFORm9XVGlHdUZOa3hMeVMvbU9JMUJXZmM0UndiWFcxcGNl?=
 =?utf-8?B?ZzhuSWdoVS9LdDJnWStnYy90d0ducUhZNnplSU8rSUk0NXYxMU5HQlpJMGJW?=
 =?utf-8?B?MHd4dGpua2hWbHoyaHAySFovd1FqaCs1c0VxUGFiU1huSFQvVlNQUmVFd1h0?=
 =?utf-8?B?L0t6REcwMXhaZGtueHd1ZC9ySGdWYS9wQVNOb2ttNVUycGhrb3BIZlVnNmgr?=
 =?utf-8?B?MUt5MzBocFZqTHdyd1NWN1lPbndCYmwzd3d2a1VDUlQ2K1VpOWVxQTNTMkN0?=
 =?utf-8?B?cS9OOXdOM0dVNW1FaU9LTmYrVGlXV2Q3TS9zcm5FN1JnZ0pqYkVadkJXbTZ4?=
 =?utf-8?B?NGd4S0s0U1c2OWJldVR4cWpsbzBRRTJyZnE3Wm01NlFEVHJqQ1pQRDB3VkxU?=
 =?utf-8?B?TlBPbUF0dVpMS2R6U2lWVk13TU5tcXFyQ3h0bC9jdVpGWmZONjNFWXgxVFlC?=
 =?utf-8?B?bzRENWlUd1NKbmVpcS9PT3lnZVN0TFJoL1BUN1RzYjhETWdpT0NKZysyamNh?=
 =?utf-8?B?cUV5amVYb0Z5WnN6WXE0YkFFcW15N0c4UjVJUzlrVVZEK0JNUDhRYkNMQlZH?=
 =?utf-8?B?VlQvMnRBOUJUQkRlRi9kWDI5bW54eGhOd1FreUJiNWpEQW56UEcwanpUNG5C?=
 =?utf-8?B?WVFyWVhsUG9OR3I4dlZ2TWs1ZVdIWkZwK1E4UTNlL3RkTWhUTVVkSTA0Umlx?=
 =?utf-8?B?ZGs2aEVsMGxjeDNYbDhTMnQ2RlRCUWxqVmtDc3ZpdjZyb2lxUXFPTnZwNUxJ?=
 =?utf-8?B?Nnh6aTVWTSsxNytvVXY1OGhkcGdUcHNnanlkbDhSb09IR3dFNkpTRitERmVZ?=
 =?utf-8?B?bG1PbGNoenF5UnR1VUVxNkJWYnVzWHBzQWduZitadVE5aW9PMEtKQTlVdXIr?=
 =?utf-8?B?YitESk9oM3l2cTZ2b2ZhVTJsOFE4Sy9QclV4dHZDQTFVR0FKSXNtZ2lta2ti?=
 =?utf-8?B?b0o2alpWUFk2c3NqT0VqOWNHY3VKa1JIQ0F6cmZib0FDUWh4MThDZVNqMWNF?=
 =?utf-8?B?dVNxcWVXZStucGFPMWdXamI4VlQrb3pUaitPWlZWTTZmUDBzVVlhTXR5K2tF?=
 =?utf-8?B?TlluZ2RMWlBXQWRkdDJZdXlleHAvOG83SDRJVWN1ckpqZ1BEVjd5bFdDeElE?=
 =?utf-8?B?cDkyR2xkYkcvcytoVTcxWVNEOEFaQTVoTGd2dGdFYlpxV3RmNzBodnhrb3hw?=
 =?utf-8?B?ckFsQWdJQ1l1T0V5Z0lOMC9tTEhGWGcrU3dJNHZDK2pCVWNLdUgzclpWVG42?=
 =?utf-8?B?dGV4TzFGWnh6QXB2b2FJcnphM2M0MmY2Y0o3WGYzZjFGVzJWUzVtWFBqNTY2?=
 =?utf-8?B?U3duZ204Tk9PelhaYW9SVEpYTk1GcHBGbHJmZVJRQlo4ZmRrVll5ZHkrK002?=
 =?utf-8?B?NkdjTCttTU0yRDJ2SWZtamZwaHJQWDQvbTdHRTRqc1pXZXM2cWRXWWNoZVJ3?=
 =?utf-8?B?dHBzSHVPTDlJeHlXWmhtOVZyckxQbVdTOGtzWnM4eFBFSVRZQXU2aDFTRXQv?=
 =?utf-8?B?WDkwSU1EQTVFLzU0dVZiOFVxbDZPM2pzYVYwUVJpV3VFWFdNVnpBcHFucVhY?=
 =?utf-8?B?YVFBbUlaMG5LaTlndXhqaGVUUkdWb2pzQjIzZEJhSGNsa0dLOVNza1R3cFRB?=
 =?utf-8?B?VVBkSUpWSzM5MUZyVlRvai82bUxMVDVHclRYOG9OVlF3bG9PR2ZRZDRFZ2V4?=
 =?utf-8?B?c05JaGtVeWh2a2RNSE5wQUdXUXZRWHg5UkswTERtQmwrTS9YVVdNcmVDV0p4?=
 =?utf-8?B?RXhWVm9Ca3M4VEx6WjVueHUxbzdNRXc4VjdQQ1FnT2xhbVdCdFR4eDk3b1Uv?=
 =?utf-8?B?dlFkTmJ0MnBiVVlUd3VqV0o4aUYxSCtDSnhiQ29vb2g5eS9XSW83dll5aCtK?=
 =?utf-8?B?dFoyK0VBeU0yTndJRWNhTHd1dkFlNjcyTVR6dUpFKzdtRUZ2akNOazE3MGpt?=
 =?utf-8?B?U2pjcU5pL3gvRWZBZ0NkMkxDMFpFMUc4azRuc2g2dzI1WWMyWmh3V24xbUhp?=
 =?utf-8?B?QWpQT3NJR2orT0N1S1hWMkJVQ1pQRDhYM1pmelRFakRnY2sreURtaEFZK1Rj?=
 =?utf-8?B?RlZlaXEyM2gwbmdDamNIMExaYU5sd09VVXhPZzgyZzFiSlR4WWRRWnFPbmFG?=
 =?utf-8?B?Um12bHdRcDdSM1IvQ0M5SXpZWU8vUXdqL3hIZksxN056a21lWWI3S092dEs3?=
 =?utf-8?Q?F/ikkDy6MFxzkE9kl/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9372e9-977e-4817-0ca0-08df02841485
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 08:37:21.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxg6VtYI4QsA7NO+ocktnv77Nexx0vZLRY/CphN/i4lqsmC14UxOhqRcTNKYVaTc5Ik3gP9BIScu4mVtj+XdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
Subject: Re: [Buildroot] [PATCH v4 3/4] package/xen: add custom tarball
 support
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
From: Stewart Hildebrand via buildroot <buildroot@buildroot.org>
Reply-To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/3/26 16:51, Neal Frager via buildroot wrote:
> Add support for custom tarballs such as tarballs from vendor Xen trees.
> 
> To test this feature, use the following configs to test latest release of the
> Xilinx Xen vendor tree.
> 
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx-rebase-v4.21_2026.1)/xlnx-rebase-v4.21_2026.1.tar.gz"
> 
> Add to package/xen/xen.hash:
> sha256  03498f51b8daae70c429ace4bde6e2be679b3a0ac28b886c7335c022feef6100  xlnx-rebase-v4.21_2026.1.tar.gz
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> V1->V2:
> - rebased to updated master branch
> - added the line move of the XEN_SITE definition
> V2->V4:
> - merged into new patch series as the second patch
> ---
>  package/xen/Config.in | 11 +++++++++++
>  package/xen/xen.mk    | 19 ++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index e50b232f0a..3726504334 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -23,8 +23,18 @@ config BR2_PACKAGE_XEN_CUSTOM_VERSION
>  	help
>  	  This option allows to use a specific official version
>  
> +config BR2_PACKAGE_XEN_CUSTOM_TARBALL
> +	bool "Custom tarball"
> +
>  endchoice
>  
> +if BR2_PACKAGE_XEN_CUSTOM_TARBALL
> +
> +config BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom Xen tarball"
> +
> +endif
> +
>  config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
>  	string "Xen version"
>  	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
> @@ -34,6 +44,7 @@ config BR2_PACKAGE_XEN_VERSION
>  	default "4.21.1"	if BR2_PACKAGE_XEN_LATEST_VERSION
>  	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
>  				if BR2_PACKAGE_XEN_CUSTOM_VERSION
> +	default "custom"	if BR2_PACKAGE_XEN_CUSTOM_TARBALL
>  
>  config BR2_PACKAGE_XEN_HYPERVISOR
>  	bool "Xen hypervisor"
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 51d51333ac..81568020d5 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>  
>  XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
> -XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
>  XEN_SELINUX_MODULES = systemd udev xen
>  XEN_LICENSE = GPL-2.0
>  XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
> @@ -19,6 +18,18 @@ XEN_DEPENDENCIES = \
>  	host-python3 \
>  	host-python-distlib
>  
> +ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
> +# Handle custom Xen tarballs as specified by the configuration
> +XEN_TARBALL = $(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION))
> +XEN_SITE = $(patsubst %/,%,$(dir $(XEN_TARBALL)))
> +XEN_SOURCE = $(notdir $(XEN_TARBALL))
> +else
> +# Handle stable official Xen versions
> +XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
> +endif
> +
> +BR_NO_CHECK_HASH_FOR += $(XEN_SOURCE)


I'm curious why you're adding XEN_SOURCE to BR_NO_CHECK_HASH_FOR, yet it's
still required to manually add the hash to xen.hash?

> +
>  # Calculate XEN_ARCH
>  ifeq ($(ARCH),aarch64)
>  XEN_ARCH = arm64
> @@ -90,4 +101,10 @@ XEN_INSTALL_TARGET = NO
>  XEN_CONF_OPTS += --disable-tools
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XEN_CUSTOM_TARBALL),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)),)
> +$(error No tarball location specified. Please check BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION)
> +endif
> +endif
> +
>  $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
