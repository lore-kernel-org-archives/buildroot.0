Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B198FCA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746B340581;
	Mon, 12 Oct 2026 16:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 132IPwrUTGYZ; Mon, 12 Oct 2026 16:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90A9B40613
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791821826;
	b=RPVDWm7Q6ei68NlOMsvWCRZ2SqCIm+pUjnz0umLwn1l7TvzesLicc9bu8+nOszBMaxOh
	 3iXNklHt4sUGsGuRrbeQMJZo6Kyqad+qwST2pQ9pxNAAQxjKyWTiTPdd0wabytLR5tCM7
	 dNN7lwFwEvTwvU4HsSRZh75COEpOzxS/OjVdjZ8+X+dXju+dPfEu3IbK8wzQBwMIcdaV0
	 WJTJ7mXyteC9WlWAXVDPHBxjZpBIonFcsAga4yr/bGyCasZwSKq0uSzcInFnJ++kw5Y8Z
	 40xuz+ksz8WN9p0Vg0WaJ6+cwLDBqY1qacAOmKH0Q7DPq7s1QfS7GYeJWa1n+Wbgoqw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791821826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=t8dgKy5G9h5olKDQr2j5ZjXBvrjOhOg3qyUpY0GhG9U=;
	b=kAv9iitJ+8/VB9rKHkLGJWaXLV5SliVM5PqEckMUf2524jjfQsr1WexqjJzUeJ6flzjS
	 g9C/cspXlKrPGFZ0hGVR3CPkzfXh/jaXt8Q7sdCSztvhpYfRWfFDLUX4m8Mf5TQlIoOcD
	 ekxjauKCGvPuaaImZ9Sx2fgZ9b/JnxIpJxEQPDdFbcZWad1MZOUt/fiz6rKvl/LNON9yr
	 mRhlKZRLgeJew2In1M4xwlPNxfF+v5c2bLHxquaXgo/IARKl73OQWodiBcztApS3CSHSw
	 oUCIGgZ25qm5YQQvvzYdxuEjSqVsj5hhHSqY8BCFu+bXeBLrQ9FonDp/xyxoTxERszg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791821826;
	bh=t8dgKy5G9h5olKDQr2j5ZjXBvrjOhOg3qyUpY0GhG9U=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ws/hz1q2ukdt2CCycEAbocuQh5KCb+gte0i2jVTN/bRV5axMqH8/J8TZV2Cdab4Dt
	 Ui8K3sQivClQ9K6Zn6RE4Z2L/IkSonENIafgud4GeKz1HwsgHs49jRNrHxHO7yL0Bk
	 HDYYCf/6yyfiUi0GcicwsQmmp/q5a3RDQiT2DX+ICUodC0OGsJNYbVgbe0dEiy3eEW
	 WlKX4yo0/NqaewR89O1SwhXDh9TfYonZceWRLDCI4pyVk6sFui+83+zE/bYGwr0F9r
	 hDHXEM5Ul59CqOhywNdPe0jY+yEO1xuguZUsmYhZr8PQl70fkx1kv19sK263n7WOc+
	 Wbar+8GsAPS9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A9B40613;
	Mon, 12 Oct 2026 16:17:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09AEF105
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFAAA4020F
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXW2K3Gerpqm for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 16:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F3C2A40201
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::1"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791821824;
 b=HXuN0rMIxF43XqqWpqnj/9jB70NhUWRSipTo9aS3ksLGj2xqseb9JTnnGURQi6CVSvzU
 FodVPeC+1ypD6338cSwK/m2GqGHC3uvfVOo20/Gn5bXpcxfNaZxDklUU4tA0d0AQjU06D
 BkfXH/AjNywz6/W65byGxsHbUnlfQytVi4vUzjPtfyIIuJl8h/VkdGEx2QMQp7lH0W/ES
 gzulKBNGfH6nA3vut+FR5JBNPq3/614OuISKtWjWDVcwXQFN4lL3ieJ27vgBC0VwCDkNT
 s5ZMB9//+P0QJCX1RGiO/Sul1Krbi5OtywzTr7OFLYr3jKYO+i0LQh7CPB7zNKKZY+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791821824;
 h=Received-SPF:DKIM-Signature:Received:Received:Message-ID:Date:
 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
 In-Reply-To:Content-Type:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=BXuOWvTvgrlGBr76obad6GfWvNAJMRSS/Y9HSQt548I=;
 b=c18MALgvR1Yn4k4iihKk2ROj2GBstTzkLTcVQeyj4+r8az1zfG28LKBKQ/wLsylI6tZY
 sCIWrWh8hpfs6zk52Sh2MXIt0oSPmE6lBUrKMIhBM+xXTEZeq7Wb19bh6mC/RM65VUZWS
 uaBb4ZuZsvcpqj15LNth8lCXwd0hugy+zm58vbHbUTyhS+d2SdpyZ6bZR+4liOZJproeG
 /x5o0kARSoxP4HKWBgxfmOEc4+1ZyVhk6mK5GlhniojE9jG/YWZY5aZku4m6s8hHBy97S
 cdml4hJkYI1DO7g2qwm9GNU+48OBViycres5fXXvgIhfo0p00mMfFrUv/wCFQP0NANQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=KllsG5D1; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=KllsG5D1
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3C2A40201
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 16:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPOwhzrH6ITP7YDAeQz3edGiUOidYfZRoWVH8NUcsoqW/bPJBXwD4sTFViAv+tgeHMPnXhiywH+cHmoImsvr8z3pgvu3coD/jSoEtsjxq0qlR3/tvMbJWhLaggJttPD/uSp8j+uj9eyGvmkMJVzDiJQQSYKtbM48hrm34x1L342TIIRDhmo4BuNkAzE/i/f5i+NsT7jZb4aIvmi5qqS+fG9PsV9rpPmwFm9VSOspLsH65rMFfc6B1e6V2OgZHbKa1wwGshNBs1k8pTBzQ5Tf7VHX4b5QpXvbyQSGMIBRcPmbFq5mpRNqD4YtlMBlsnphAootKPKsqJwCBP2RPlDT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXuOWvTvgrlGBr76obad6GfWvNAJMRSS/Y9HSQt548I=;
 b=DNoNn/DCpoPfVAzWPyhj5Ae6GKIVEbjPBD45op5z4zLZXb3weITwJoGNrp1JFmwd5tekZLzmOZTFFKoxvhmiJN/W3FU8xy7UlAp9vToAZNlOOH2lP6r3txjqvwspwxKa9QqTf5LCik1WwASNxQF1qdRKo6IJ76pYmtNCEX11WAXXr6/fzkSSA7RRUgL8Sk5sxEvspVTeU01c/KBsvAi6esZWGTEcEh9pEQ2VJdlcC3SJcc7hXFdxoeIGsTL7/KaFG2gHUAe5tdfoN0u7oKmKWgkC+vEACqg2Dasy877dNTR/y4QGGr/GBv9uyRAZU03FL0KZe4BOT3hON8ESvbz1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXuOWvTvgrlGBr76obad6GfWvNAJMRSS/Y9HSQt548I=;
 b=KllsG5D1rVambQ9wHNLUtp1WVMQEfqRKNgP/kFXX19oAwYUoYSsxB/wR1dq8nY87qlGJxc+AZnLfvpSVvv4z5xKOyJBOtwTjrSYAeMewVOBh3wbSQLTl8FhEZc7APP43rOrLAAcEdMhtDEMcPeitgVLGvJVtnBYzdaNit7Gnrh34leb3D5eXrXHFQFJL262TdqYifillERxg55GSN/q9Xk1r+LFIRurA8XAkTwlZibkKgg4TyZnnY46Z/xon7uHWSB0IIcqGrQOrGDixz9REjlLzQTobce2chYTCknzneEkmSt0bBvfb0QOEM531FI4JzlkkRv6sCPBgQFqsM/H0XQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB352865.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:375::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 16:16:55 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 16:16:55 +0000
Message-ID: <SY8P300MB004194BE85005EF52E4398F2B59F2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Tue, 13 Oct 2026 00:16:46 +0800
User-Agent: Mozilla Thunderbird
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, buildroot@buildroot.org
References: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
Autocrypt: addr=tfx2001@outlook.com; keydata=
 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
 fzuGP135vumu6wd8+pIuP8kePVnAiKot2NQ=
In-Reply-To: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <7c3e11f4-bfe6-45ae-a100-50891c293a72@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB352865:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c1fc23-cf49-4cbb-3f2a-08df287c3b34
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999013|25010399006|19110799012|8060799015|24021099003|8022599003|15080799012|5072599009|23021999003|2607281247196008|3071699003|3412199025|440099028|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djNrYjZyY1lGYmk3bCtHdVhsNitDdVJrdmRFVTdWM2cwUmVZdHdRQkIvZEVJ?=
 =?utf-8?B?U2RDSFBiNnZTZFJ1U0ZFWGdETDZlZ0JqWnZWOGo1TENReTE5aldOQjV3ekhS?=
 =?utf-8?B?UUZ6RjI4Mm5HM1pEM0dvTFU1MXhZZmxpVnR6VWROK3E5a2NXeUtLb2wzMi9o?=
 =?utf-8?B?M05RYkpJTVRwV0NsS0NCVFFibDgzSkZsam1GTjN6bTJCc3JocDZhc2RSYTZ5?=
 =?utf-8?B?WGRpb053VGV3cFB2cVk5a3hFZkxsM2NuUE55UkxHNVY3KzJhOVhNS0xiUndy?=
 =?utf-8?B?WTBwakxzaDN1ZE53cU5BcEJwYTYrd3BMQkw2c1FVS0Z5S0JCdU9lcHkyZ2R5?=
 =?utf-8?B?WVNlUksvejlaV0srNHVtd1cvdnE5cGhYMEw4N0ZQNFlpMS9yVSs0MUY5NlZQ?=
 =?utf-8?B?MXdRNTBlaGttUE54Tk9pQ2pMbjg5MjhRU3Y5cmVXWGVzVEhLVlVlNllVbTly?=
 =?utf-8?B?Y3I0Tm5xQzM1UzZ1cGZkUWIyWFNkTmtjMGYzN094bWtIOVpGOUgxMzkwODhp?=
 =?utf-8?B?MWk1MUpXUmZLazRaeEhJYVR6UUtPRFgrZG5Sb0lTME05b0hDMGVkQ2JtY3cx?=
 =?utf-8?B?TklySWVTSXkzZkZzLzBwRVc1Z2J1QXg1aDJPazdKbmhZNTh4ZWtWTDVCOFE1?=
 =?utf-8?B?b1c5cGdiTE43VDBYQm5CalpUY3FLc2tBcFVpYVptWDFkdVdHT2JQMWgyZWZD?=
 =?utf-8?B?OXk0MlZ2bGE3eXlIU2FLajlsK0I5ZmJwZDdwRjJkQ2NzUU9TUTZ0Y1VjaTBL?=
 =?utf-8?B?SGpJenRmMGQrVDNwVmtZTFNaSXk4Y1VlOVBYZG5mK2FzTDY3Y2tLQmhJaHlE?=
 =?utf-8?B?b0lpTmpnL21XM3M3azdvMDdJNEo4NCtFNFYxWThCRWM1aTFzWWMxeEJIUFJr?=
 =?utf-8?B?cGVsRlJiTldySGJwL2pNcjhtQTZQQ1lNV3g5ODJkakpUZHUrV29PVHhaTlls?=
 =?utf-8?B?ODh6T1F2NDB2WEJyeHNTc2Qwb1BGK0x2WnlvVUZnUUFjTU9iRWkzSXM2VHl3?=
 =?utf-8?B?ZWovaUZZVWFtZ2N3ejhMbzlJOVpmaFp0Q2M4dHk0NG1ic0hJZmsydmErZWNR?=
 =?utf-8?B?b0pOQW1YVkt5dnBRVENrWEt2VnBNNzVjakVqMHBOdERmZkVrb2trVlJES1hq?=
 =?utf-8?B?UmhyekFXcXltVWxuMVdROFA3WEQ1VkJTZ1Q5WFE0ek85UnUvbVY4bHhmVGQ5?=
 =?utf-8?B?bUNXc3Z3R1FXZ1ZCdGNDTWp4OVA3YU9BdFFvMTFkTHJCN2ZSYnkrK09pRVo5?=
 =?utf-8?B?S1pMK2tDZEhmNTAreXQwdzR2eExxSzNMZldlVm00KzNGMkZLdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmc2U3NsSFJqeFhGQkMyWUszblBrZUMrTmxnRy9FRE55WFZCUVpud2FaMG0z?=
 =?utf-8?B?V1NSRlprVHNoSm1XRjI1dUhOWE9rTEZOanpGY3VQSjdrdXBjQkp5WkZPQ3hs?=
 =?utf-8?B?NVhQempWcFY0SXpWQnVVZ1U2UnNaZVJVeERXL3FCczRRcVJFV2hqNUdDbE52?=
 =?utf-8?B?ekxqbmRpRlk4K0s1R1luMDdGODJKbDA1OXMrbTdaTjUrdHowZTZRWnpON1BB?=
 =?utf-8?B?ajhnU29FYk1ScUhOeGhmVnZ0Skg2M0p6aVZ1TDdnU3hVaTB6eGJLaGJOODd3?=
 =?utf-8?B?ZWU1SE5hbUMvcnlYeStHM1Z2c2xKWVZHVjBHRFkvdFVVekowWkRpUmtQQ3pJ?=
 =?utf-8?B?SE9ueXFqMVNkc2d5VlZCOUVzTHFEeXE4K2QyTExrNWdEbGxPMWswZWNqbDBG?=
 =?utf-8?B?NHBnQVFBRGhqblA1NUc4ak9qWUxURXk3S0pEbWtXSVl3V1FrZW40LzUxSTF2?=
 =?utf-8?B?aVhHam9tV01RWE1WOEQxclk2c25mWkUrQXpzdzJWdkpVNzlRYXpZVWs3aGJR?=
 =?utf-8?B?NGg2R1BxdXlZYlVaQTVSZnc5MUNscURWdTNmU0pJVXRNS2RBS3Q5em9HN200?=
 =?utf-8?B?R1ZCUFFtczBlNG92RXFkUmlEcG0vdG1zRXljTVpMSWl3d3JzdUV6YXp2bm1U?=
 =?utf-8?B?Yk84a1B0YndoVkRGM01LZzVMVDdES3BDL0xMZUVMNFZpODhYSmQxWjUxVTE2?=
 =?utf-8?B?U2RIRzJ5Wk1OSExpbGRxcVIwNjFnRDhVc0hudyt0NHFUci9NV2FUUzJhcmtN?=
 =?utf-8?B?OHVmNWdUK3BXT05kLzMvUnlVQUtaRkRtc3ViRDJ0Mkhqc1cyakpXYTUxZlRl?=
 =?utf-8?B?ZWU3c3Z4NGJZQlcwYzVtWlFReEhiWHNjZWpWVmgweUtOZUdhd3hjSVNPek8w?=
 =?utf-8?B?RVpvdUlnZDJpaGhPLzh0TWZ0aGpMc2tNM1Q3TmkxVHprdi9QNWVkMjYyVHRy?=
 =?utf-8?B?M21sSWVBSVdPSU1VUmxhbnZkN3lBbzhRNDhCdUdMdHNMM1Q1R2RzR3UyWHV4?=
 =?utf-8?B?WnQ2N2dQZlVESzBDK25ub2plWVBrSmVyU3JpSGhJWlRLb1craEU5UjYxbGx2?=
 =?utf-8?B?RHppUXY4Tk9tVnBIUVFZMnNpcXhXVmZtUmlQMWlxbTV1RWhIT1BPbXNOOW1t?=
 =?utf-8?B?eERvUnhoWHZvdjdsUm9CeXZycmpUbGdpOXo5UVppdWlYb1BUYm9vVjd4N0cv?=
 =?utf-8?B?OHBGQlBzaWFXRlRGTjFEUmVUL0tENlROa1lOYUNIM3VRVk85d0JBQkRjT2Fp?=
 =?utf-8?B?ZVJudzAwOXVQMXlHWlJBaWpkaGkyb0pOZVdXcGppenJ3S0hiMnN6UENpenp6?=
 =?utf-8?B?RGN5NElPRHpLQ01wUzVYSkNyN2lUcERJRXpDVUxObWkzdlFkR0tMWFpWZnZI?=
 =?utf-8?B?cUdJak5LbWJ1VDNXdGpaeFR3WklmbURLNGtlSzJzWjI1MVlTanFRYjcyR3BS?=
 =?utf-8?B?bjlNYkV5dlJuamZRVGYzeTgwcURjYVIzRXNBOU9SVS80OEFNM3Uvc1dyYVN2?=
 =?utf-8?B?Q3hhUy9adGhBZnpQZU1OZ3QzRkZCOE05V3hENSttQ0cyU0diODZ1YXRMcStu?=
 =?utf-8?B?THhSVytCNHk3WWdrUmRFNWdCcHNhSnR0MG0wM1plWUdtSWE1OGx6ay9tdlFX?=
 =?utf-8?B?WmRCamMyTzQxZ3ZCMUhXNHNCZHY5UnMwa3hDUjEwb2p1Ymd1dXJucVl4NTQ5?=
 =?utf-8?B?QytRMnhBd2ZsSGFhOHBzQUJJRjdzRTVSeHhpdC9JdE5xRm5teUwza1QzYm5Y?=
 =?utf-8?B?YmdiUEFUQ3dUbEFDcEdJOU12VVlWT1FncnUwZUZnbi9ydDdNdW1LbkdoM0RC?=
 =?utf-8?B?L0JpZjNZZ1pQSFFUeG82ZW12VVlDUkszL3IveUM1UHkzeFJsOWFYVVNtQ0F5?=
 =?utf-8?Q?KVTc2cd9/YZWo?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c1fc23-cf49-4cbb-3f2a-08df287c3b34
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 16:16:54.8772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB352865
Subject: Re: [Buildroot] [PATCH v2] packages/linux-tools: perf: explicitily
 disable rust
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
Content-Type: multipart/mixed; boundary="===============4825317837967094084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4825317837967094084==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4vZFpkBRbz9mUlm73AvU7d0c"

--------------4vZFpkBRbz9mUlm73AvU7d0c
Content-Type: multipart/mixed; boundary="------------JpsX8nIPuWzgKbbFnFoX32hY";
 protected-headers="v1"; hp="clear"
Message-ID: <7c3e11f4-bfe6-45ae-a100-50891c293a72@outlook.com>
Date: Tue, 13 Oct 2026 00:16:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] packages/linux-tools: perf: explicitily disable rust
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, buildroot@buildroot.org
References: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
Autocrypt: addr=tfx2001@outlook.com; keydata=
 xsFNBGJs49EBEADmJvmGaZt3NYYtLBoKZFQ3ydOA9uFLva2kpgttA9Y8Jp8R32gr057HCq9U
 vkvuygeIIFg0NlJd9Wukt6QOqDgASTii1C4eLn3qi8zuAMOemF8IUQV8DyBxSpJlO/0E3FFC
 zetrsjT8t/CaEZ/TO/D4kpwwXITkL+Ps50E1ua9WnOalL3MXthDBrY7+9IlqBif+VRjeqvz8
 1zBE7xaCmciFTpjbTvRajCSk3K1+sgarRHSWBi/3Lb6ORm5YSlRJn78wQtD+xvOCX0WwXoG5
 BLWE7JbRmYC3gNvXm/4MA6ELtTfNNLp/LinpKQYHKCO2K0IFOPz+Wz5zqYvOVpdQ4QfR3hJx
 NVM5eCRzzSrY+s84r1mBFs4oNET2JYMYVrrDEl/w7PlBe2XArCdd8EVv0i4Kd6Fax1qMJLpE
 VNqeHT6IRTwc2kj4fULCwryH2v0tGpGdS+RvIzGkRAk/0VQjjGQwrIl/gM6LhmzMvFcbNUX3
 4Rk3NJtzdYTMrIQ1e0InqGRBeJ5qgCs+42bjqFpax3gsvNNvTIGGhG52JzsJ31wyr5IOMPLu
 5HpMy7yVzBxjv2gss9CGQu5K/OOBSJtGwj0J4Tqy/EpfIqwhJzuDibTj0JOOLANMzSSdUd4T
 mFop0lGNAGQFS7nuy0q2ZMX33LzSYp8Qm0gZvtG/0aDHvB0EQQARAQABzSFGZW5nd2VpIFRh
 biA8dGZ4MjAwMUBvdXRsb29rLmNvbT7CwZcEEwEIAEECGwMFCQv0MssFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AWIQTMFVTt6ubC4wlTjLLuqJvRNVTKUAUCarFZawIZAQAKCRDuqJvRNVTK
 UAQaD/90YgK7ua5GMyQySZPaFrnLGokkCaFZ0uAGbUcpwL+cvCBP5gAHSaoOjPeGTyPJ60R4
 byirEQgyFR6EIyiTkK1Ufxs9wBmNlOds4/95YGchGgyq8XJq2W2Akl1Fdb58ZcJN5rTslp9o
 ECyIXbo5QMtNkMU0PcOzCdj84GDt+5WDvolMjKE75qbC4Zqt049Li2AG80qaj3IAb92gKcal
 ciBxGLrU8mqFh1YWIKiKnzdp3EF667t7XBiayueXXS+sxGsQPHm4yEPJuoLAynFhrs8YUv/p
 mxfM9q+Dh8HP73G4sHidBBnI9l9LpqxcJSzRVR3oaN/rf/0yr5u+R6SItBkHWp0iawVZ806s
 UrblA8lPvQ647ZOljgzDsPf2w43niChCg85zoqQkFWu7YyYHeuY6SZtRxH/YuE5zpZSdVMFI
 xhkKECvxIwHEAu1w9/zj9zZKRDJV3NKjCNSbb2gYWrodV4D9ECMuq75HT1g4L7orCyNF5ira
 6PCbBcRzqSYiKBJzOQQRBvM5KVh40NL9n7iiUNkSmyxZ6z1YFg5EZPwdo+PkTvrlJFTZbyQh
 m1gthEgcrpGrHD9+cClbxSPI2m8CtDRnN0wvED2Mgfv8gPh+TmybC96EVL0kEJIOF7rxm04l
 2AbOtO4p1nMm291vwpURJDKAhrby1o4MczrwlzdNmM7BTQRibOPRARAAuT6PCbUqKRaBbraU
 LA/txPrWJ1yb9kdmnriUkLZ0MWRIsDMvTBN27VQdzyWL7YToqcWNB9QxSv6J4ljFIiLkCipU
 TXk886ggtf/yfKRijaWzgq7UpWSxu9/7nXfvVvTKHEPM3SrbdXdTonR6NY+REDjuWGC/rsYJ
 jlfZtIYICv6DyaeHrPSsOfTggzLx6DTwWJmH8sBxp7P/h/zUPIPXri1n2AO1W27VTvITMlqv
 ReXfZeqkGPTPdML7TcI5dVlRvyxJo/OqEnT1is0D2DprZZ0axY8XeGx5QIGijxEkxq9mIT4P
 Vn1+8IBmt/ptQlq7Ks7FLfOIbUfjNbjqWBlLj8q0vVBYYN6yv4t8IueAk678UWzjTq/IVWQF
 IbP2x03WYo5Yv/zFwGme241zo3TKp+0T/tIXxZY2hhaMFosh8DBGFmSECM1Lqa6nasyevv+I
 OFDeozazkIwd172jze3EAKgVFLVX0E90OP2JQagZLJpRHiXRT1gxvcZA/vW4M7Nu/N6cD0Fn
 djV3SiN00VgwcrFxGRmaaXSO779iWuB2522VfTp+0zJGOHNOYzQuaFRrHxmf8vuUhOswEeuX
 Mg+GhD78OhhCWompfiQqmqW6sS41Mf8nkiv7c3I54NCBnaLkECGyu+Qucn6gqerEgswB4372
 qBcFanV73nw3hNxI/BcAEQEAAcLDsgQYAQgAJgIbLhYhBMwVVO3q5sLjCVOMsu6om9E1VMpQ
 BQJqsVgTBQkMEWc9AkDBdCAEGQEIAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCYmzj0QAK
 CRAcD62l0/wL2ho8D/kBoMBeT+iJDt/DwNc43Y5yvYhzyCSApOqQH2GzyLhA8Gz7Kwy4i3XW
 Z6Uh6RWZyb8wDb4TK2PtOQanfzABdM8o3RImKgWirPfMGWOw8tMOd2nwpbjhFJkq7Qdhblgq
 q5yw5qp1bBihQWVhmK5BL6yN0DQJapYyInbfEhq2o/sSXRD5bWi2iddlTS3Z69mANPmgksN4
 3s6JVO20zntCZqG3TYTl0gFb2djgO7FbzSYaICdo4BGfrxJMrgdYSzruwGMNV1e/iPrbvfeP
 9sF2PmzMlx3VB1r0RDKOduRcIsDpkCjeVAIB8HFJvM3CQm7zQ58ZUJQXaSUFLRCeWHr12JB4
 IsCMA7rUyXZ5ABngQmIssf6R8wAPK4fWt0P+l63ru+ut+9oGB0jhqpbkXslVTat4ZrkdYTT1
 LFvdPCZ8xrohLFlqWlM6C/3sT+PS9HzHriWJ3/0QXub8nDRUKj/Kn/wwTWhW2bT9fM2dVNGN
 hb1Kp+MBv5GAwMRI0YjVxnkIa9A6mnHfyainFPLGP0kNJU20DlyGg/axUh7Sjse0IX7cVYD5
 cHxhVCjOtKI+FRB3FxEH5sbqc2TK/OQoEzGfgp2AtXlFNG17Mk15VnLmvwRgv1/+58I9758A
 +MKqCUmPI9M27Df05fnhpI8b0G/9UfC37gwdqxP9LoJXauGD8bCnSQkQ7qib0TVUylC47BAA
 tpHRgduA/30GYboIsmb1r2yyDhszuPL7PHT8iZcKRiIEAyj/xCotEVmh5mZdDCkhwBoR8W7K
 7hT51ertDhKHrel0T7+8JpsNivSoLlcpDlrqNCq0vRkR3HIfLFD5oMaJNDNCxdHdYGqvEwzJ
 wxFT+wyfKGDomlmxotils8E/9LFLqRK/MvdRF+7Rbw/BG2FHUJhkH7hntkOSmBEc4QJVaoGS
 JUk6EbpCw+pozpC61UT41OqZ+pJJpn+6CNydsJY38ABXy+Blv1cJkSeN0Bk3x2KQ6V61ujt8
 1FqkoxI3Jkvh+ZpwDa+P9BrrHwOKta4AcC93wqzdz28sJwZALxPxRohY+TWI3c98Dngcq7R0
 tDJG77jDpPwg2rsTlYHJnubVOvTLrmXoshYI8OZbvtgKG3VS9hKAYtxWAK53rya88ncBITjq
 OUJrLHD++SEKydPHnnmJNCOa4OF+3+1i6KxWT7TEzB5DWTagWKr9TRXCCpa5nbMTk7sCvcof
 QErUfd7bJYumeup8jBHexuAF6nDQC4VtA87b6ixKXaycu06V6WsIAA3PWIbQ6dSry+y5wVGH
 9GVFeycvVG/TMDNjR37BticKNMIG8a2hxq1i7F6xuKbEGoZLlGkd9i8CVek8dXyM0ZFjU9Qw
 fzuGP135vumu6wd8+pIuP8kePVnAiKot2NQ=
In-Reply-To: <20261012-perf-fix-v2-1-aa77b97ecc04@bootlin.com>

--------------JpsX8nIPuWzgKbbFnFoX32hY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bastien,

=E5=9C=A8 2026/10/12 22:42, Bastien Curutchet =E5=86=99=E9=81=93:
> Since kernel v7.0, perf uses `rustc --version` to know whether or not
> rust is available. If rust is installed on the host, this `rustc
> --version` works fine but then the perf build fails with following erro=
r
> (on aarch64) if the host-rust isn't selected:
>=20
> rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildro=
ot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
> error[E0463]: can't find crate for `std`
>   |
>   =3D note: the `aarch64-unknown-linux-gnu` target may not be installed=

>   =3D help: consider downloading the target with `rustup target add aar=
ch64-unknown-linux-gnu`
>=20
> error: aborting due to 1 previous error
>=20
> In perf, rust is only used by one file of the test suite
> (tools/perf/tests/workloads/code_with_type.rs) so we can safely disable=

> it.
>=20
> Always use the NO_RUST flag to build perf.
>=20
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

I couldn't find this patch on either lore.kernel.org or
patchwork.buildroot.org, though.

Perhaps you could try resending it?

Best regards,
Fengwei Tan

--------------JpsX8nIPuWzgKbbFnFoX32hY--

--------------4vZFpkBRbz9mUlm73AvU7d0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEzO+71qtjATJIBqgHHA+tpdP8C9oFAmrNB+4FAwAAAAAACgkQHA+tpdP8C9p6
lg/+OLhvN0Hu1lD/94mcSxxZXg7217LDVrNe+jznx9Z5p0hTyHIJ5ilP5+MkZI1E+xU4HJVjX32C
fyoxlHC+SWPk4RuhrnTQlWdRrzocHjybuCPhr7MsNzRwTyu55JAgT5ETzmyCviMovyiA0Li9E9Ks
Z7++X9GbWXKRZOe0X3ZTmK3GmdnmKL+okLgrYIeu3Q8iL96enWCI8FsWMkPcNJkvgDfUkqz45jmB
//jTVoGOtR4pBDLBZdfp4QN4nk37RRSqVS5+mWTwQOqx2Q2JU0HjYc63d8GW2Ir0FJwjNgMQBpus
FVe3+lbpDY/ZRJLvOc+voXqxWjBesa/JoUIb+gH5TKaDSO1+8OA/FEdISa80sz5lezbMxqsymrLj
MCJcM6Le4D08bCBiBarqDWOVQpa7KFvL2PzEdPNwFS/NCOqdea18HwZzvKDFotJqogZ8Ps+oGlO5
VGogh2vn/BQg1t4d82tpHuxmVbSscgTJu9JbXllUxcTo/5n6c53GBnh0mIEJREGbxrqiG+zxOkV8
5hd2D+G8ShnXMU0Y78sgQQcMl1nj1ZxIeLlZBDSb9YWqPE7g4+mGFhBhPg+RqqC13/ISH5K1UqBu
WRZ9ZYL80LuPlWADaE/v0AhFH5MJVD4Ca1iAEHO9otu5MHkccRCb5DMb6uNC2yM/+k4S4W/4wYWO
5hQ=
=iZJs
-----END PGP SIGNATURE-----

--------------4vZFpkBRbz9mUlm73AvU7d0c--

--===============4825317837967094084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4825317837967094084==--
