Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04904EA3C4E
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3310606DF;
	Thu,  9 Apr 2026 13:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htfT14Ut1EOr; Thu,  9 Apr 2026 13:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE8860FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740937;
	bh=ti7LBUfyI+lk+05ic6e+GdXtf84WZibzJDx9nDRsNiw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nM47LTv49CIDPkWNaJ6w5l1W5conME9YbgRY6l9ugdNiN+jTvzkW22kRXi6N0Roee
	 svh8j4uzyOEnbBMgeXKjzmPk+4WGi+bt+MJmcTv9uDSA6hcCJ/I/U5ecjn3cLwv1hT
	 FZIXegsA3NHNuU4p5/URwRNlGGBzLKzTWmDZvr41ylIQIUJ91dwT/nIDBvPUhYpEBn
	 oC6dVzDPoKOsAulNxzaLcmiPdkSvCklX5QDrr3zvV8Vmz9UxM/ew+FbduxxgdkO7FY
	 8uLHQ69PxBgoAFOqsp/lpX7oFQZwgWqnhX6Krn32cV9IFW4VNE7yGUx+0mj90BK5m2
	 u7mK/f9FahM2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE8860FBB;
	Thu,  9 Apr 2026 13:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55EC61F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BC6D81DF6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcvfCxTmkLyj for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41DD881DE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DD881DE0
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41DD881DE0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2mn4cSA3FHZdY6mckAskSigH/qUSHosGU3KRxcvzf+FrYPucX3+1SbjCVxSw4r7L4XBVk8JJ1BuhjlFkGTXstySvxhh7J/KY6saDvVHRmZBGzAHhs2V+4ZCaSykSPxDGRDhq7MYe8ovBaJkpPNymcAQmi6D0NfgmgvBc8bISwP9hWNrFWkiLuyBrx7smgZpH3z+jcyn5FtCIkupbfX8psUgv6e1AR9KQLB07c1Mr0Gx5ypKcb4bIGdw0yqh49i2iZ+9fP1GKue5O67OoWdObkq4xYYszuiqR6MFhCGZHi9898RiaRAsPPfXaNHC3LM1jUgV1+LtO9Ma+OfcXFTPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyZRBNdqWuWZtAREevckW2h9YoqF16iF1FbFrSoMtjw=;
 b=mTMQcwDDCtmBGIexlr+zur9z+dCo6d2iQKXseMYe8rxiii3/K3nuiAL9fR1ZrfOFoAmft/ePlpbaG0FCGABvfELrfRfKHviORrFqOeyVvIRcgFWPiTM8CVWkYfkZrV0zcbBSoqKhLQvlaYdELbwO0SFhHPjIc7OB2Zs4LukWaGjG/2FT6tpTI7APARsaZtEYh9oAvXGB8df02gNYweO13wMs4XN5aHwNk1X9fHbVMGLQkIoU2y4fF9k0oiEA/c4BHH++5Cb4ayIURPvDKWnxX8ZmA7zgH79l/1TW8ZTKD8XaUzauJo/GEA0IEZJLwEDid5kPcfY5Bmk31K8vjDLHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10465.eurprd04.prod.outlook.com (2603:10a6:102:44a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:22:10 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 13:22:10 +0000
Message-ID: <8a81626c-cac7-40c9-adb1-56d8ef8b4067@cherry.de>
Date: Thu, 9 Apr 2026 15:22:08 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260311140457.140041-1-thomas.perale@mind.be>
 <20260311140457.140041-8-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260311140457.140041-8-thomas.perale@mind.be>
X-ClientProxiedBy: VI1PR03CA0044.eurprd03.prod.outlook.com
 (2603:10a6:803:50::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10465:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd58a33-2492-475e-d58d-08de963b0138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tjGAOb4QJUTRrJJaX66gxy+bz7NjXSL9ImPmUsHHhkQuhoSwcDcmUy4zryuasGo8S/PQ4NqIT1QlpJxO1G6ROykASlj3y/faO0S2fKkm0FaQmMD4HEXNHbE0jbh+JKctq+KrmSmmIH25cuH7pmftn5FKNvXClClLpZ58hNO1iQaTBoLj6sjhRPcBnoZdPolD1kLjw7tGgHejep+HDbp2sh9miWD840rCTYU0EB9kNW6JAkvlKowRI1mCrffMl7tzQ04FDQUb+jG/Q/aEmSZ3k7aakHUobpB4mXFfY9rkXuSculPwQNOZQ9RBqUsId7P+I+bmTz5lNr4n0PgaAd+aF240FHIRlyiolm6tohwtZ7dt6zEq/3NgVpIiNBuyO4Bxdtjr7mUOIEyrgeQyzXA9yTtspVNdkKqGF8t8OQwzQQh0IiFjNMb+Cta9UDay1k/ftCNlvwZR4VRlDS7BfdkskfTRDYG9j25dNsLvmYLomes6AJPb6vWFdsAR01glgbkvIsyWCzu4aKrTkGEe9mLtFUujqJYrJSfZYuGSsdvkA2P5yqx3lCsF3DRlV54CRV9231ZKPzy9jmX8jW9CzVraxujcVMEACADGxT5nrY+37+CC5dVDW/1Ze8+HdXUtzIdgU2s6/v9TiwhsamoY1W6Q03d7AWH8ntN266MR8/lFdagAdpdlXEGKMuuukh6U2d8YYuFytTMiEve9HLlLLyCW9Z91NvCj97iYkHxFAXlt4Q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5ZN2twRmkrekZCSC95VXREMFhUOFJwUU00dlVza1QrSWxMZXVzQlRWUnpr?=
 =?utf-8?B?ZFRzV1NiZnhMclcwTk80VUpKWHkvQjc4WXpnelpCRnRCNWpFWnhPdW9BeHQ1?=
 =?utf-8?B?WHJHNDhEQkJBUVRkaUxLdWpMTDQ2elk4V3kzd0dROU1aYUZ5dS8xZS9xcHNl?=
 =?utf-8?B?SmdSdlBNckFEVER0ZlVYOTVlWjg1UE5sZjE2VHRXME9FN0RyR29hTkZhc0RL?=
 =?utf-8?B?WDdNM1FjUXRMNXdIWDFCeGtlanZRbUJvZUR4RTZ2a01SMDJ3Nkp0UG9DWENS?=
 =?utf-8?B?MXZ1VkhGUzcwVDBRd1NDa0dpcmFHbURFbk5DQjEzUVk5MnZOaGRMV3czdVJC?=
 =?utf-8?B?V21NMWpQSzhkRmJ0NWtNUzlQZ2Nva25xcEZMYUViVGJaaUVRbGpUeXZzWTE4?=
 =?utf-8?B?dE5rNkJucHlSdlUrNFJyaEg5QVpaek40ZERONGRMcjlxazBoWFlOeDFsL2NB?=
 =?utf-8?B?cHJ1eEkzN2l0SCtiL2JDNDk0NlREckdhVEZOSmgxNEdCei9uQ2oyOHFiN1ND?=
 =?utf-8?B?U09HUUpndXRyak9ONlBXVEliT3QwaG1qMmZ0Y0Z5bHEydFJtTjRjdlMrNEl6?=
 =?utf-8?B?OTNmdWJ1dnFML05lTHdTTW5pMHRoRHc0MmY0bi9IKzk2cDQ0d3NLcUVQTFVk?=
 =?utf-8?B?NERJaHlMZDJLTkpSVXlSdGdJNjA3eEFRditaZlBmWFEvdDY2Zk9tbFZyQStH?=
 =?utf-8?B?dEZRQnduc1ZtcjN3Y1FyYTZZcWZXOEhjMUF6OXB4cGx3V1dObVFJWDk4ZElw?=
 =?utf-8?B?Q3Bkc3ZYelJLYk82OHdkZENOWHFIbWR0THdzV1hTM2VySzkwNE5yQlF2ZVZB?=
 =?utf-8?B?WGNKY3E0eThqUkQwQU51OUlEcFFJMjRCZUZtY3UyMVhBTXVxK3R5bTc0a1Y0?=
 =?utf-8?B?OXBhNzd2WGh2UGVZQkw4UmZ6V0lETGN1M095OFUvSjN1RDg4WDZjQTlXL1Vh?=
 =?utf-8?B?S1JweVJWMnBOT0VFNlVzN1VnRnB4RitEK0hnd2hEdFFyNFRhODhJeHp6VHZN?=
 =?utf-8?B?SkRGSVJNSXdodVp0QlpIVkVUNkI4b3FOU3U5VE16N0NYZ1FpT2d1aEFQVXho?=
 =?utf-8?B?SEQybGYrNTRUSjNIWFpCUCtEV01wODExeFFnWUI0L2R1dE00bExoZTNhdEI2?=
 =?utf-8?B?TlFpZ0lJM2t3QVAwa25aUnR2R2YxQm1sTExwYm96RjNkMWMzdFdtMXFvR0Ju?=
 =?utf-8?B?Y0thMmRtQWZyelMrMW1KMmw0VnI3cThnVEliZmt5Zy9OTHdDSXl2KzBXckF5?=
 =?utf-8?B?eURSOVp3T2c3OUlrWkRjRFpPSnY1VTNBeUJteUNkTTR6OXE3bEFWUVE1VVR6?=
 =?utf-8?B?UUFhdFlFWDAyYmIyQk9nYzJTWWY4bW1MWjRmUng5MFNIUTF6ZEtVWTZDM2dE?=
 =?utf-8?B?R3RGUkV2NG4wZ1lxVTRDSCs2RkRoSkdHc1VUcVA5UjZ3T1REVVZrRWdZSXU2?=
 =?utf-8?B?aUpiS0JmT0ZCRE4rQnV2eDFZdHFnOUp1anVuRDlQY0FiS3RMMDE1aVR3Z0FN?=
 =?utf-8?B?YjREYTV1RkxQYXc3RENOZmdWNzk0ZDRtenBkRDU5UnZGKzEvdDhqaHRJUU84?=
 =?utf-8?B?Qk82YitKdmxRK05CRzN5bWFpMWdzTmJMbmZubVFyRmRRY1o4Y1FGK0I5ang0?=
 =?utf-8?B?OFU3WXJhcUE2ZUxLaTNqY2ZJNDk1QWdCQ2dhRVpXQkN2SkF6SzJ0WlB1VXFu?=
 =?utf-8?B?K2owT3pHeDZrdDRzb0xPTkpNRmpLRlJ3UWJVT3gvU2JvNEdCWXNZbWNQV0xG?=
 =?utf-8?B?ME8xSGJhQS93NHZCRlVia29DWXM2TUE2MWUxTkM5Y3RLcHQ5L2RuSThmTFdW?=
 =?utf-8?B?Q0xuSDJoSjl4UkNTQjZrZDQzM3d0dll1d244T0traC9NYkR6OThoY0I0OWhS?=
 =?utf-8?B?UDVwcHBSNkJaN3dnWXZKa0pGUUFxUU9zdlg1MTZzZkxDVjhMWnBzMzYwR1pH?=
 =?utf-8?B?QnF6QS9tdkY1YmV1NTc1bWxVNFozYUpzYmFMNVJWMDF0K3p1dStuY1lQZlpp?=
 =?utf-8?B?bXlMNkl1Zk51c3k0aVI4Ni9adkxkVHFZQk00QW8xcUhNdUV4UUQ4SEN3SEVY?=
 =?utf-8?B?RlppR2QwTDZ1Y0djdHhHck9oTUc3R2M0NTJLL3BJbzVRVGRIb004dGIycGR3?=
 =?utf-8?B?U01uaVN1Vll0ZktnRFRvZHNwem8wWnYvallPVXVaazFna0VxeFV1OTRKck1p?=
 =?utf-8?B?b2NtT3IzV0pKWGIrQmhIQnZ3VmRwTk02L3BjejEyTU1PR2ZZREI2b3ZOeEFY?=
 =?utf-8?B?ZUxPL0xRSjhoaTQyUFNFb2ZGKzJuSFBoWi9zem9wTm9XSHdzVnArV0tUeElK?=
 =?utf-8?B?cHZ2YW5MNjFLcVJLRlBLQlJWTExMRWtCMmExb1Y4S3V3Mm04Mk0xck1QRmgy?=
 =?utf-8?Q?GFhjMmytbLCSEKkTTtAaYKthEdOc5Dpfn+sx5?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd58a33-2492-475e-d58d-08de963b0138
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:22:10.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: km2w9DnTcMxUxED7S7F4FPlfK8Otgl76vUyFl/Ixg8wTrFLq9jyMp+LJ/Gtvkxt7LAgiOqNTIMkFaVotgh4nBsMOp2XAWL3KAy8sNRv0RLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyZRBNdqWuWZtAREevckW2h9YoqF16iF1FbFrSoMtjw=;
 b=QvpBjB3eXMAZowjw3q1v/hVIUxewOpyjlcI0bbfrBRInVKQbL+msHNVRFj3g6q/BXFfFFeSL4IEO0d+VuGwDBB6biDv7okMGfGbiHEhdhZijxuJ7eeQ6+dJzo7BmLchtsHb7Pim7htsRn30P7tIjc9qlxrTxi8w8NKADAAK2qrw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=QvpBjB3e
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH v5 7/8] utils/generate-cyclonedx: add 'id'
 property to resolves
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
> The CycloneDX spec defines the `components.pedigree.patches.resolves`
> object [1] as supporting both a 'name' & 'id' property.
> 
> The definition provided for the `id` property is the following [2]:
> 
>> The identifier of the issue assigned by the source of the issue
> 
> And for the `name` property [3]:
> 
>> The name of the issue
> 
> The `resolves` object was introduced in commit [4] and only used the
> `name` property to link to the vulnerability it resolves.
> 
> In example [5] provided on the CycloneDX website, both the `name` & `id`
> properties are set in the security example.
> 
> In the vulnerability context, and more precisely the CVEs, the `name`
> and the `id' are the same and thus the value can be duplicated across
> the two properties.
> 
> This commit replicates the behavior documented in [5] to improve
> compatibility with tools.
> 

Are you aware of tools that were broken before this? Would be nice for 
the commit log :)

My opinion is this isn't v1.7-specific but rather a "fix" or 
"improvement" that we don't necessarily need to have in this series. 
What do you think of having this as a separate patch (or at the 
beginning of the series so the series can be applied partially easily?).?

Honestly strange we have id and name for seemingly the same thing. The 
introducing commit was 2512eb835a46 ("#21 - Added support for patches 
and unit tests for JSON schema") for both and 
https://github.com/CycloneDX/specification/issues/21 doesn't shine a 
light of why for either. The only hint is 
https://github.com/CycloneDX/specification/issues/21#issuecomment-625104801 
where

```
             <issue type="[ defect | enhancement | security ]" 
ref="7bc2d01f-a0e8-4ae2-a274-7bd188f89926">
                 <id>18</id>
                 <name>LDAP Injection</name>
                 <description>blah blah</description>
                 <source>NPM Advisories</source>
                 <url>https://www.npmjs.com/advisories/18</url>
             </issue>
```

With ID being the number assigned by npm (though you'll note that the 
link is a redirect to a CVE in the GitHub Advisory Database) and name 
the title of the CVE.

The example in the same comment for CVE on NVD sets id and name to the 
CVE full number, so I guess this checks out with what's implemented in 
this patch, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
