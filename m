Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2250D1073C8B
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 10:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C513E82207;
	Wed,  8 Apr 2026 10:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaFrLdA49VRJ; Wed,  8 Apr 2026 10:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D6882208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775645137;
	bh=6u0QEqs1IzleYxZPYJMysFVifGLhTWCjyQBlJV0A9v0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=imwsAhkPoA5Exww/qGPvW33P6mRKdPO+oL2/3ptSvDVYLYJzZKg2PPTNiCZfrRRer
	 Q6R0midj7M35CAnKjUbiU+5ec8DQ2P9zETwojhMSqRzpzLym6DScb+j9NyhHCbGkfw
	 Jcw6A4Hod6L85y8pnaqchSfcqPawBBs6xQN7zSPBz5rekNn4LtmgpTj2qwf11LuTtI
	 QpsV7ii2bZbUHABtVtd+ljWJ3qtFQGkWZDUqb+lU8wzRiPtfNjAXPQ53/Br0bDu6bF
	 pYOcKb616P15BozyDjVkOX2gshHEEtIMoRdbdwHDYPQkIT2m9hFyBLZA8ybGPe80RT
	 unftcO43IhK3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D6882208;
	Wed,  8 Apr 2026 10:45:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4721237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A62C282202
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCLrm9xc1g_a for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 10:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 738DB82208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738DB82208
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738DB82208
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5VpANqqb4SrbTDrWrmimoiV5oawdVsBEXfK37pXxrwhpI+4plP4bdaEBv4Lu2m6JDYW2a6WYIFuSO0zrxZeQK3CMgU8oQWTCbp3uX2UixDPovvURbI/ASvrPh43KXUwI6ztoV826Df6Xaqc/Iy6dmoFE8wUtd+cDhgLg4D/cDVCTgVJNYB3Kk5+vRC0ky+wOuiz8BmctXwVFbAA6hMxNnT4A/iEnEyJNVwXXPBcqxKM0QLB1yKzojtAFQRzKsY8oKtrKKf4rS9y6nGVa9Jk3b4xnRUeR4Q5xrXlhFXUBureN30xPgwd9HBSGVoKyqwx1Igl/tXWE5E0Cjw/qY3p4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdoFEdWtOrBtnhjr82+4EtYW+5jdcqXfNKQUeVKfYH8=;
 b=xxj//odvS7uyBXiXpeFwMOfIbWESURR/+Nm5avhOarF62AWiz3rzapmrt0grXTdyq91kPQ2rJRxvxIYuPCidIVmseelL6pnK8u7XyP2JNHhmpyMQnQl/Sl8D+8kNVgxT3+RNnNhb5oXN6G5YhawCQU6JnoXefC+tRpH5moqWJqRYEuQZ05vgMciwivFMNJcw9USXuz7uSBE5yvGbYvMpNcdqVEQnx8uAdO620q3rY5HHWQafrfTJ2gvCxJAe7hAxsLZOYUv6PajoH73xwAkT8gJ51beTjOrsqPCf5F6xekhDAM3nfPEA5EE1e5VFdcUNgk4iTHRwi0BrkOjpZd+2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV2PR04MB12087.eurprd04.prod.outlook.com (2603:10a6:150:304::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 10:45:24 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 10:45:24 +0000
Message-ID: <dff355c7-7539-4eb5-99d9-446e01cfeafd@cherry.de>
Date: Wed, 8 Apr 2026 12:45:23 +0200
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de>
 <27a01177-9b40-4a03-8f8d-626fd9fa81fc@rnout.be>
Content-Language: en-US
In-Reply-To: <27a01177-9b40-4a03-8f8d-626fd9fa81fc@rnout.be>
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV2PR04MB12087:EE_
X-MS-Office365-Filtering-Correlation-Id: 85718ca9-6369-44ff-cc4d-08de955bf0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: GLa2rrXtjAQ4PmSr1HrVDFKiMrErha2HLcL+OaH7aKZ4vZEmYMMQabVhZfP/rRidUIJrCMRFuae5dSzYPZF0/Ks2S0sM8IXxRkXKvOejaUGRqp0ioZIb8DIrqMI5MFHRdLCMGv3UeVJGonIxSuYYXx6jEoaa0in3UD4rP7eLFQ3fcYZ0XN8BsLkpJoW6yR8M0xMzpWZ1O9yLDTQzgnZWsxViiB6t/q4a8HDwovIvVROUaJ3Vj/Le1ilIavSX8zeQscY37M+WR16W1qRVIBBTgpSBuRlTNGMoIi4vFpQVJOUinVN2Us5fSTDMPoQm8DD5iOQQQrBqM0e4oX8Cj5wyhaqx0VLcF9uSgwbljAnod8p9tAUzJ+tgJukAhmEWbnJNaaWebMzcVJYsbhEbTBhxxKyYBDyZnrpKeJIlcOpfAh526wvKGQ4acKwuxv7WqstfDm0N8O8jEyI1H3bFOEZRRca6qzukukuapJk622qMlEs+2DCONBrhTThiMCGqiUg5Wj6VG3lbiZDAlta5dBW/crFUbNeSFuONcTg1pfxNJ9yS3mQfAfLkszjG6Zy2W9hHuxXd6ohUsVg262RaVcTBXLDmcgX/+WtiZeG3BGmrbbVMBYzlp032lfbH+d5Z43kf6Yb8pihDGooxPEnswIanADTC4nCf9ZtrLgEkJrvMuCn7PmHikV6PhzimNSeqQFsnVgThLp4ADjq9YCV3q7ABWAiGePC0JA5w2Kpq77KOKGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzF6QnNaQlNJVXBlaE5INFZyYUZGcE1IMWo4eXczVkRRVG5ST3liTEx0WnpT?=
 =?utf-8?B?cmV2VktoaTNMOHVWRS9BYjZuQ2p1dmtxL0psUmtKUkdXaUp4R0VLcGxrcXE3?=
 =?utf-8?B?clFSeHo3Vk5nQ041dXI2TndBV1M4R2UrUm5yNDhVMEZROXlkOFROcFRMemhW?=
 =?utf-8?B?VFRTaTdoaGJmU3hEMDNjUDZjUEZYb05CeFdQTmxaR1FjNkxoWVhWNWRYVFhl?=
 =?utf-8?B?UVBMRVRMazVtZEFiTmVRWVd4MUt3QWdZbUQzR1hzUnl2eFM5SUxUV0R6a20z?=
 =?utf-8?B?dDlEVGliVTJVczhNRGxmR0Zqa3NnZjl3bFBUbGNjMjUvcnhJZHFCYUw2TWdL?=
 =?utf-8?B?OElMcXdyZ2xid1Ywd0QrUmJyNjNjTXpmZnlZcVd0bUZ1S1FxUGlYRTNQTm1U?=
 =?utf-8?B?eHltMjdobTg4ZnBBZTZsbzJtc01jbFhWWU5VSzl0SnNoWXNkOC9ETUo5b1hU?=
 =?utf-8?B?QlJXVzJnbkc1RDlqMmlnREFSNjlMNUdhamRzOU1TRW1GcGpVWmFGdEUwbGhP?=
 =?utf-8?B?czNnWEQrOFQyRGgwTXI0SktHSWFkeTRpWFhXVU5rZGpwcVEzbjFYeFVPUlp3?=
 =?utf-8?B?SDh1bHJqem9sbXUxa2VXZEtFb284YkhsNEYraGtLb2h1d2JDNVJGSzZ4RmdE?=
 =?utf-8?B?cHJWMWNiYTlneVJlNUNqeXc1ejRhZUtPMmcybUVjaFk1UUdGSk9KOVl2eXNH?=
 =?utf-8?B?VDZ3ZGVIUEo0UFdibVk3UFRhWkcrRHZVOUNGSlpWZUgrSjkwVmk4NE9acGYz?=
 =?utf-8?B?TERReFkzc05FNDZPOGhhU0ZJQkFTSXErcGFEdmhmMkpBbFUyR3RGWmZCTWVI?=
 =?utf-8?B?SUFsejdKMFljdmRMSEtKWm9USW1PSVVhZkhiZlpJdml2RDVtT2lLY1hOSytu?=
 =?utf-8?B?b3gwR2F2S083SGxRcnZNNWQwSGg4RGFOcW8vMXNjNlJRUDRZZWtTc1NOZ2V0?=
 =?utf-8?B?cmtpODIzd1B5T0ZFRS9tS0RSQzltSnJMOU56b2MrbUdMRlF3Z2t2Nmc4YmJk?=
 =?utf-8?B?TXN1M2N2cWVzekZnN0xBZUpCMGY4SFBjOWVSSm1BUW9wNGs2bEYvc2hUVk40?=
 =?utf-8?B?L2NPV0FCTHZMbW45NGVhRmFxMVVyK05XbzhaZE4xK3ZUbCtoU3NWNHBDb1Vn?=
 =?utf-8?B?UDBoMnRXeTVmZ3ZQaTliMjhQK1E3Z3pqbDI2N2tCQ1ZsckxjT3NPdm8rdENI?=
 =?utf-8?B?Rk9YZXFscnY5Tm5IOGRObU5Wc3FaRDFkckJBUXlqY0MyeDZWUk9sWkVlZ2R2?=
 =?utf-8?B?N0VkSHljekw1dFQvR09IbHF1Nkx2d1REWmRpNHhDcHBHT3pYNER1UFp1WVdZ?=
 =?utf-8?B?NjRVbWkyOWFLRXJkdHhuWFdWR2NpT3hqQTBpWWN0eWRyU2NxQmZvbk1uQTVj?=
 =?utf-8?B?U1NuY0RNOEJBQWdwRUZXZXRHNTlaL0lhZC8ySEMxWG9QejdYSnUxeXRwTmVw?=
 =?utf-8?B?YkVVdTJVWW1GOUtFak9GRlVrTkowMkp3eTl1cTBzbDljY09CRWVnbGVlaVk4?=
 =?utf-8?B?WTRQRW5nQVdSUWRGMTJWbGFKZk0xREhZRER0WXdzUEhnNlNxNFZiZC9HL2RH?=
 =?utf-8?B?NG1XYUsvQ3hxbXVpemNWQTB2Vm4vV0xkU3hhVWxGM1lkZzczUGJDVW81d1hZ?=
 =?utf-8?B?QlR1TzRweG1nckJxM3BOQ1FMU0xVNVUveVUwa2piWW1La0Nkam96TkRGaWUz?=
 =?utf-8?B?bzVYK2lPbEtkTk1uWUdhTWxiWU15S2JId3BKLzRuRkh0SWlNdWxydDhXREpS?=
 =?utf-8?B?WUZiMFQ4VEZlanFLU1NvcHNXckZLMTdrcWxXMXRMbm1aU0Zrd0I4SnhHZEMv?=
 =?utf-8?B?U3RheVJRZ20zVFdxM1NvVi9QeHI1bUREblBHT2xIYjJvQjNlMWk0b3RVSnZi?=
 =?utf-8?B?aFNIOVRnRlZUMU5mVnZ3ZTR0QWdwWkI1cGlUUHE2bmhoY2pKNWhFbzJSUHUw?=
 =?utf-8?B?aDlLVnQxYyttYTJJeVNZdVk5YWl2WE82b3BjbW9FNkR4WFFVaWtGWW9lbW5O?=
 =?utf-8?B?clhHR1dFR1dTa2NicmpKdXNOYlZUbkxNdDlMMzVzL2ZGMzhwSkc1L3FNcWdG?=
 =?utf-8?B?Vm9iZER0d3g4U05TVHFqNTRHY29CNFFGZHdBaGd5RktadVc3ek82SzVCVWJv?=
 =?utf-8?B?YlFmNnB1aExGN0w5TC92c1AxVGtVdFVWeXQrSU9VclR0VHd6dWdrS3YwQmN5?=
 =?utf-8?B?V0tQMkxjRjNNZDB0akFBam0rUmxqZDZNc1dYVDF4dXJ2bnJsNGwzek9PVzk1?=
 =?utf-8?B?MTVKcjZnaWFPc1RBKzlSblVNK1lsRS9pRDlPTmlDaHI1RVJlM1lGM1Z0NkhD?=
 =?utf-8?B?KzNDbndpbVFERkJyRUt1OXB6YzJhZEkrRmVLdHFDb0pKWWFrdFNZczVEa0cw?=
 =?utf-8?Q?Z/7SmR61+g+oNZXbICPw5nXNfVvr2SDzUtgf1?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 85718ca9-6369-44ff-cc4d-08de955bf0c2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:45:24.8159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z0PgUwDgT7F9kKHTFwLGTw/4Mo+jcbAc8zq+yTUHfTofAgKGAYf04YAAf9NKOiv1CNVVNLvuTHDtfUrhnVP7S4/bd0FVJwzMMnCuqRGqJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdoFEdWtOrBtnhjr82+4EtYW+5jdcqXfNKQUeVKfYH8=;
 b=fMXt/6D9XQSvsu2SPa80Tjl/Y8QZDfo4MvwraE0xHFRl2G3BkXcwSKi0htOLKtXRRpq9lGTDK9kVVElYLvd+2+sOXKcYH3QXZiEeou6By3NNnh6ZhQ2MDgtSYVDoVrONZcSBlZ69AT1pOU3XcJfMZfJwLr4YrHweRqjFVU348Pc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=fMXt/6D9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH] linux: allow the user to respect Linux
 kernel defconfig's CONFIG_WERROR
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gNC83LzI2IDg6NTYgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+IAo+IAo+IE9uIDI1LzAzLzIwMjYgMTg6NTEsIFF1ZW50aW4gU2NodWx6IHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4+IEZyb206IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnku
ZGU+Cj4+Cj4+IEJ1aWxkcm9vdCBmb3JjaWJseSBkaXNhYmxlcyBXRVJST1IgKGFuZCBQUENfV0VS
Uk9SIHZpYQo+PiBQUENfRElTQUJMRV9XRVJST1IgZm9yIFBvd2VyUEMpIGZvciBhbGwga2VybmVs
cyBzaW5jZSBjb21taXQKPj4gNmI1NmUwYjRmMDliICgibGludXg6IGRpc2FibGUgLVdlcnJvciIp
IGZvciB0aGUgZm9ybWVyIGFuZCAxNzEzYzNjMzQ0YmUKPj4gKCJsaW51eDogZGlzYWJsZSBXZXJy
b3IgZm9yIHBvd2VycGMga2VybmVscyIpIGZvciB0aGUgbGF0dGVyLgo+Pgo+PiBTb21lIHVzZXJz
IChtZSA6KSApIG1heSBvbmx5IGJ1aWxkIGtlcm5lbHMgd2l0aGluIEJ1aWxkcm9vdCBhbmQgbWF5
IGJlCj4+IHJlcXVpcmVkIGJ5IGF1ZGl0IGNvbXBhbmllcyB0byBlbnN1cmUgdGhhdCBubyB3YXJu
aW5ncyBhcmUgZ2VuZXJhdGVkCj4+IHdoZW4gYnVpbGRpbmcgdGhlbS4gV2hpbGUgd2UgY291bGQg
bG9vayBhdCB0aGUgbG9nIG1hbnVhbGx5IGFuZCByZXBvcnQKPj4gdGhhdCBpbmRlZWQgbm8gd2Fy
bmluZ3MgYXJlIHNlZW4sIGJldHRlciBub3QgZXZlbiBidWlsZCBpZiB0aGVyZSdzIGEKPj4gd2Fy
bmluZyBhbmQgY2F0Y2ggdGhlbSBhcyBlYXJseSBhcyBwb3NzaWJsZS4KPj4KPj4gVGh1cywgbGV0
J3MgYWxsb3cgdGhlIHVzZXIgdG8gbm90IG92ZXJyaWRlIHRoZSBXRVJST1Igc3RhdGUgZ290dGVu
IGZyb20KPj4gdGhlIGRlZmNvbmZpZy4gSXQgaXMgbGVmdCBhcyBmb3JjZS1kaXNhYmxlZCBieSBk
ZWZhdWx0IGFzIHVwc3RyZWFtCj4+IEJ1aWxkcm9vdCBsaWtlbHkgZG9lcyBub3Qgd2FudCB0byBm
YWlsIGJ1aWxkcyB3aGVuIGJ1bXBpbmcgdGhlCj4+IHRvb2xjaGFpbnMgd2l0aCBuZXdlciB3YXJu
aW5ncyBhbmQgbm8gYmFuZHdpZHRoIHRvIGZpeCBvciBiYWNrcG9ydCBmaXhlcwo+PiBmb3Iga2Vy
bmVscyBmb3IgdXBzdHJlYW0gQnVpbGRyb290IGRlZmNvbmZpZ3MuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4+IC0tLQo+PiBJ
IGJlbGlldmUgdGhhdCBjb21taXQgNmI1NmUwYjRmMDliICgibGludXg6IGRpc2FibGUgLVdlcnJv
ciIpIHNob3VsZAo+PiByYXRoZXIgaGF2ZSBkaXNhYmxlZCBXRVJST1IgZnJvbSBFU1BfSE9TVEVE
X0xJTlVYX0NPTkZJR19GSVhVUFMgaW4KPj4gcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1ob3N0ZWQu
bWsgaW5zdGVhZCBvZiBkaXNhYmxpbmcgaXQgZm9yIGV2ZXJ5Ym9keS4KPiAKPiAgwqBZZWFoLCBJ
IGFncmVlIHdpdGggdGhhdC4gQW5kIGV2ZW4gc28sIGl0IHNob3VsZCBvbmx5IGJlIGRvbmUgaWYg
aXQncyAKPiByZWFsbHkgbmVlZGVkLgo+IAo+PiBJIHVuZGVyc3RhbmQgQnVpbGRyb290IG5vdCB3
YW50aW5nIHRvIHJlc3BlY3QgV0VSUk9SIGlmIGluIHRoZSBrZXJuZWwKPj4gZGVmY29uZmlnIHRv
IGF2b2lkIGFkZGl0aW9uYWwgZnJpY3Rpb24gd2hlbiBidW1waW5nIHRvb2xjaGFpbnMsIGhlbmNl
Cj4+IHdoeSBJIG1hZGUgdGhpcyBpbnRvIGEgS2NvbmZpZyBrbm9iLgo+IAo+ICDCoE5vdCByZWFs
bHkgLSBmb3IgdGhlIGRlZmNvbmZpZ3MsIHdlIGNhbiBlYXNpbHkgY3JlYXRlIGJvYXJkL2xpbnV4
LSAKPiBkaXNhYmxlLXdlcnJvci5mcmFnbWVudCBhbmQgaW5jbHVkZSB0aGF0IGFzIGEgS2NvbmZp
ZyBmcmFnbWVudCBmb3IgYWxsIAo+IHByb2JsZW1hdGljIGRlZmNvbmZpZ3MuIElkZWFsbHkgdGhv
dWdoIHRoZSBlcnJvciBzaG91bGQgYmUgcmVzb2x2ZWQgaW4gYSAKPiBtb3JlIHJlY2VudCBrZXJu
ZWwuCj4gCj4gIMKgU28gSSdkIHRlbmQgdG8gcHJlZmVyIHRvIHJldmVydCA2YjU2ZTBiNGYwOWIg
KG9yIHBlcmhhcHMgbW92ZSBpdCB0byAKPiBlc3AtaG9zdGVkKSByYXRoZXIgdGhhbiBhZGRpbmcg
eWV0IGFub3RoZXIgd2VpcmQgQ29uZmlnLmluIG9wdGlvbi4KPiAKCldvcmtzIGZvciBtZS4gSXMg
dGhlcmUgc29tZXRoaW5nIHlvdSB3YW50IG1lIHRvIGNoZWNrIHNwZWNpZmljYWxseSAKYmVmb3Jl
IHNlbmRpbmcgYSByZXZlcnQ/IEknbGwgYnVpbGQgZXNwLWhvc3RlZCB3aXRoIGFuIHVwZGF0ZWQg
dmVyc2lvbiAKb2YgdGhlIEJ1aWxkcm9vdCBkZWZjb25maWdzIHRoYXQgdHJpZ2dlcmVkIHRoZSBy
ZXZlcnQgY29tbWl0LCB0byBtYWtlIApzdXJlIGl0IGlzbid0IGZhaWxpbmcgYW55bW9yZS4gSSds
bCBidWlsZCB0aGUgTGludXgga2VybmVsIGFuZCBrZXJuZWwgCm1vZHVsZXMgZm9yIHVwc3RyZWFt
IEJ1aWxkcm9vdCBkZWZjb25maWdzLiBUaGF0J2xsIHRha2Ugc29tZSB0aW1lIGJ1dCBhdCAKbGVh
c3Qgd2UnbGwga25vdyBmb3Igc3VyZSB1cHN0cmVhbSBkZWZjb25maWdzIGFyZSBmaW5lLiBMb29r
aW5nIGF0IHRoZSAKZGVmY29uZmlncywgb25seSB2ZXJ5IGZldyBrZXJuZWwgbW9kdWxlcyBhcmUg
YWN0dWFsbHkgcGFydCBvZiBCdWlsZHJvb3QgCnVwc3RyZWFtIGRlZmNvbmZpZ3M6Cgpjb25maWdz
L29yYW5nZXBpX2xpdGVfZGVmY29uZmlnOkJSMl9QQUNLQUdFX1JUTDgxODlGUz15CmNvbmZpZ3Mv
b3JhbmdlcGlfcGNfcGx1c19kZWZjb25maWc6QlIyX1BBQ0tBR0VfUlRMODE4OUZTPXkKY29uZmln
cy9tYW5nb3BpX21xMXJkdzJfZGVmY29uZmlnOkJSMl9QQUNLQUdFX1JUTDg3MjNEUz15CmNvbmZp
Z3Mvc2lwZWVkX2xpY2hlZV9ydl9kb2NrX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9SVEw4NzIzRFM9
eQpjb25maWdzL3NpcGVlZF9saWNoZWVfcnZfZG9ja19kZWZjb25maWc6QlIyX1BBQ0tBR0VfUlRM
ODcyM0RTX0JUPXkKY29uZmlncy9vcmFuZ2VwaV96ZXJvX2RlZmNvbmZpZzpCUjJfUEFDS0FHRV9Y
UjgxOV9YUkFESU89eQoKU28gdGhhdCBkb2Vzbid0IGNvdmVyIG11Y2ggb2YgdGhlIDM0IGtlcm5l
bCBtb2R1bGVzIEkgZm91bmQgd2l0aAoKZ2l0IGdyZXAgLWwgLS1mdWxsLW5hbWUga2VybmVsLW1v
ZHVsZSBwYWNrYWdlLyB8IHhhcmdzIGJhc2VuYW1lIC1hIHwgCmdyZXAgJy5taycgfCB4YXJncyBi
YXNlbmFtZSAtYSAtcyAubWsgfCBzZWQgJ3MvLS9fL2cnIHwgdHIgJ1s6bG93ZXI6XScgCidbOnVw
cGVyOl0nIHwgc2VkICdzL1woLipcKS9CUjJfUEFDS0FHRV9cMS8nCgpCUjJfUEFDS0FHRV9CQVRN
QU5fQURWCkJSMl9QQUNLQUdFX0NSWVBUT0RFVl9MSU5VWApCUjJfUEFDS0FHRV9EQUhESV9MSU5V
WApCUjJfUEFDS0FHRV9EVEJPQ0ZHCkJSMl9QQUNLQUdFX0VNTE9HCkJSMl9QQUNLQUdFX0VTUF9I
T1NURUQKQlIyX1BBQ0tBR0VfRkFMQ09TRUNVUklUWV9MSUJTCkJSMl9QQUNLQUdFX0tFUk5FTF9N
T0RVTEVfSU1YX0dQVV9WSVYKQlIyX1BBQ0tBR0VfRldUUwpCUjJfUEFDS0FHRV9HQ05BTk9fQklO
QVJJRVMKQlIyX1BBQ0tBR0VfSUdIX0VUSEVSQ0FUCkJSMl9QQUNLQUdFX0xJTlVYX0JBQ0tQT1JU
UwpCUjJfUEFDS0FHRV9MVFROR19NT0RVTEVTCkJSMl9QQUNLQUdFX01BTElfRFJJVkVSCkJSMl9Q
QUNLQUdFX01ESU9fVE9PTFMKQlIyX1BBQ0tBR0VfTlZJRElBX0RSSVZFUgpCUjJfUEFDS0FHRV9O
WFBfTVdJRklFWApCUjJfUEFDS0FHRV9PUEVOVk1UT09MUwpCUjJfUEFDS0FHRV9PV0xfTElOVVgK
QlIyX1BBQ0tBR0VfUEtHX0tFUk5FTF9NT0RVTEUKQlIyX1BBQ0tBR0VfUlRMODE4OEVVCkJSMl9Q
QUNLQUdFX1JUTDgxODlFUwpCUjJfUEFDS0FHRV9SVEw4MTg5RlMKQlIyX1BBQ0tBR0VfUlRMODE5
MkVVCkJSMl9QQUNLQUdFX1JUTDg3MjNCVQpCUjJfUEFDS0FHRV9SVEw4NzIzRFMKQlIyX1BBQ0tB
R0VfUlRMODgxMkFVX0FJUkNSQUNLX05HCkJSMl9QQUNLQUdFX1JUTDg4MjFBVQpCUjJfUEFDS0FH
RV9SVEw4ODIxQ1UKQlIyX1BBQ0tBR0VfUlRMODgyMkNTCkJSMl9QQUNLQUdFX1Y0TDJMT09QQkFD
SwpCUjJfUEFDS0FHRV9XSUxDX0RSSVZFUgpCUjJfUEFDS0FHRV9XSVJFR1VBUkRfTElOVVhfQ09N
UEFUCkJSMl9QQUNLQUdFX1hSODE5X1hSQURJTwpCUjJfUEFDS0FHRV9aRlMKCkkgZ3Vlc3MgSSds
bCBsZXQgcGVvcGxlIGZpZ3VyZSBvdXQgd2hpY2ggcGFja2FnZSBuZWVkcyB0byBiZSBwYXRjaGVk
IGFuZCAKaG93PwoKPiAgwqBGb3IgMTcxM2MzYzM0NGJlLCBpdCdzIHByb2JhYmx5IG5vdCB3b3J0
aCB0byBib3RoZXIgcmV2ZXJ0aW5nIHRoYXQgb25lIAo+IChhbmQgdHJ5aW5nIHRvIGZpbmQgb3V0
IHdoaWNoIGRlZmNvbmZpZ3MgYnJlYWsgZHVlIHRvIGl0KS4gVW5sZXNzIHlvdSAKPiBhbHNvIG5l
ZWQgUFBDIGJ1aWxkcyB0byBjb21wbHk/Cj4gCgpJIGRvbid0IGNhcmUgYWJvdXQgUFBDIDopCgpD
aGVlcnMsClF1ZW50aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
