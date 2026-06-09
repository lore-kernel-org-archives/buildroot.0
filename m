Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855C6CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 08:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0777685480;
	Tue,  9 Jun 2026 08:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OtIpl9NyOfi; Tue,  9 Jun 2026 08:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FD484EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780993302;
	bh=AfZK19Cms9SkUnVzBRLl1mkweJHBaC42nA5fcxhIUPg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PkRqx56Lpsi09lNsM5h4tXuj55jO+6cxdeSaMuBuJeRWyHtipjVN+qM7SF6TIhGaE
	 DcXeydEPxsXNvAW70zKB7f36CxfsbAmeylxaS2+b3JJW8TJw4NPhCZXKrOdbgs1TZx
	 64OOkJHHMe9Ieb8Db6QKLpIYmN8TMLXe3NpdnK+DMuKBC5Gt/4xXLiYO2fZr0xvO56
	 zU688hEj473FY1myyRu45aeCI3HgebA4VMDX9ujFADndhjY94xgVW3D7VOKRJAIw4V
	 /eFO1bUufQ2Zc11ajbx7iAbbhc0QDe5tj4jQNRNYEoQZh9olV9qe0ADyrRaIPOEBTd
	 Nw8Y2lYPr9Saw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FD484EFC;
	Tue,  9 Jun 2026 08:21:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A47EC
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 08:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5734048C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 08:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8UxukH2mpSh for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 08:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=jan.kiszka@siemens.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0593C40280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0593C40280
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0593C40280
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 08:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlATMwFwzyrELQ4PjXBcupGLIZbZdSjBi5alDHZeGmjDdCeH5pvR4rKQ9czUotmwhP4ye7JpNagPqJ32dJ+rwIejZYuYAGhfVBW4VQSDDuzjwCpqjeRvBvS0x83/nEmsPbjd9XD2FeSksljIAz9mrK7aPT0cyU9VFXjOK/WISGgALv8IRO0F9k2/ac/iVUnj+i+9Icd850D6uBoKbNKUs98PGjlt+NOTvwrWK/jeWENgmtpJqMizcpH19Pw90qQLBQY0ed4K1CQEJi7dF4WTENX5ewraek8cE2Clc+JsMnYQdiMGkj4/2UZoXf/LtDrzBOkvtYAFyUZgpGHIfIcLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmWTFk7jEHCmSSelf+afetrNuVEoRqWp3Q8N/QZFS7w=;
 b=Agd8SPs3G/rsNAZhREyZ9EohIqjjfMQlzZ5p7NQBPbKN9gVkTVjpcy2N/X/xL60lrSYq8oLFPb33HFw2v/DbSg/KjIb54qDz6SekRGi8ynIguQZjMToSoayGFOKO0RzH0Ye62o5EpmVqzlt+VPeVazBaNA2C5mPfw2AobRxlD26nJ5LjYZcsS5Kqd6xr9PXZigZ2W5Hap0p4ohuzbF4+AYVlHaxx60xmwQkkX4CiwmcbejInecS9r2Be1Uvqu6oCj65ceNrQNnI0wLgRhRyksBwlw9ZoaNsa+m5CTvvcYrrDjS0bkE3b2qfj/XfBqriF07bm0FXhpOAoYtUkEMGukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS2PR10MB6847.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:21:33 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:21:33 +0000
Message-ID: <d1b13284-144a-47fa-a7a4-98152c5908f3@siemens.com>
Date: Tue, 9 Jun 2026 10:21:31 +0200
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <obbardc@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
 <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-2-47fc8262591b@gmail.com>
 <a994e803-d6fc-4149-9f0c-282435a32950@rnout.be>
 <CAP03XepS6L71fummsB8hA+fm=Rru6hS7vvZf=EjcBQPani-q1w@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <CAP03XepS6L71fummsB8hA+fm=Rru6hS7vvZf=EjcBQPani-q1w@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS2PR10MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 0128f71a-0108-460e-0bb2-08dec6001d6a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|4143699003|6133799003|22082099003|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 8r5Z9y/5nT/PVFe6b8vJ8MjFqXu3+qV5HELG7zgZYN+oCkUDRZnxFA4CfoSsvcf+WAm8e82anSTKym5pcsF7kZMSQIK4Hw5WxJKARB/Yl51zm5n92EGdvaKjerBIA8KOr3rkMK2GPIcEKHnwgYc5vBQB5A/9uUNTqMdMYgEHx4+BnsJowN4RJGk6zJq70o3sWIAeYgm8X3wlP8pCIr99EDCVkoAPhUsvWhzseQMz1zIvKj07WsZbFgRN7hU8vmvQHBYUOC24ZpbJA6aqT373OOt2hWrt0dfxKDs1AyqIbGjd1QFvLYciy+36drqyl8C5sA7J+1hhz0C/g/6A8wFaLD+OOChSnIXLdN4AUB8obTcZCuhubfc7yeBOTmgpAabqMBJEP1nLgV/u+HVUR3ckwcH2qZt0nxIrwQ5FL6/a6twzWoCCxN6ijGFRpiiKZf00KYxOS/WUBKU+RhiR1/cnhp6fPbjWrL+xrMhOBDHm5uCzV3g5598G/9ci74uHjNB6O8/Ozc6j22ZVyiSKlrRqJ1Rwyg4zasciNb0pDniD7CuBeEaYVHbxmiVLZYgpm3J5q6YoVrAHSpFXt/fdnV3xgTUPfbTIJwvbKwXIGlYogfGPyyr/oZmLpW0ukzSJbo9GOREJAEa+a8oAgm+ZtpZlT8GAtgt1OhBShshpX0NGQGN2cirzkLTZuBxupkg/o468
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(6133799003)(22082099003)(11063799006)(18002099003)(55112099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhUUG1zamdUMGVSRTUyN2RReTdUQXZGYWNWbjNEU3pUQU5lT2ZBenJ1YkZJ?=
 =?utf-8?B?WEdTZGxYdHpmRDhlUHVrMUIvMUhlR0YxMmRvQ1hpU0N6WjZQV0k5Y3BTbzBV?=
 =?utf-8?B?ZlFLZHB0U082aTU5Zjd6TEk5WHQ5NWxoSC9uOURncGREUnpibUo0ZmhSOUdk?=
 =?utf-8?B?VFM0d3FYbk41MkxYckhTaXNoRE9zbzVVOU5Ka2xCcGlhZXd2enBDSm5WeTI3?=
 =?utf-8?B?bm5qdVppalpGMmM4ODJlaXd1SVdkTjRnYnZiZzhHOEhLKzkyWjh5V05tS29q?=
 =?utf-8?B?Ym1hbk5HeUFkbTJ3cnhrR1E0UFZtTnJGSTI1L3gwQmhXYXVUTjU2YXluSWtB?=
 =?utf-8?B?cUhFdnNyelVnTHc0VnJCSG5SWXd4RzhXRk1rdktvZnhocWFOVHJTZWFwVUFD?=
 =?utf-8?B?NXloWVlueDFCM0xCL2ZXWjVLd0kzc2RGcUQ0QzFUdS94RG5uaDhsT0VFcEMx?=
 =?utf-8?B?OWl4dWorcGNDSCs2Ung4V255TlRuWEJ6V2VBam42eW80d0I4NWlUVHJIQ1ZZ?=
 =?utf-8?B?VDZlaFppcCtBQ1JBSDdzM20wbzJvYk94eWJvZFJWd3pZRmxiK1B5WXRiNTFv?=
 =?utf-8?B?bWNhOFpiY1lFallYQ2RqWkttY3MrMUNJaXlhT0RBMDFmOFl2MnZpYzdvU1Fi?=
 =?utf-8?B?U3BPTm4weVljWnYxdUE4ZTR6UTFNTDBEUW8vNWhnK2JPWVJkK0lSSzdKWTIw?=
 =?utf-8?B?cnArbmY3OUhhb0w5TDdFVy9IZHgzVTFwNmI3UllhQm9YVkxlc0NqWjlQTms4?=
 =?utf-8?B?aDE4V1I2c3lZZHdwTWM0NEVLcUp2dmpaandCcHByRXBiTzNGSFJtcllzZTE1?=
 =?utf-8?B?VUJKNFRheVNqNUp4MnBuekkzOFAyN0RXbGREaEpmUittYlc2UVZzM1dxQXQr?=
 =?utf-8?B?SUo3aHBtQm1qeDhvR0VYd1ZobTZHOUswTHRIWjd6amk3TTk1bWdiQXN2bGor?=
 =?utf-8?B?VjFQakUrazFLa2hKZGQ3TEZUZHZxdTBXY0M3VGsxWHBKTFVxcUpjWDFwSWJN?=
 =?utf-8?B?WEFRdExnU0l4REk4d0o1NWdmMWRTcWNudFgyaG9WNTR4K1ZmU1RicytkcXgx?=
 =?utf-8?B?TFpzUi9iaGlnVGVySFFNQk5BeG5pMDRiWGs3c2lBVmhYNlZiYytCb0preWZR?=
 =?utf-8?B?RW11akVUN0ZkRk9lNjYraktlMnQvNUZ2TkJPdDZOL1l5cmRoRFo1M2d4N3dv?=
 =?utf-8?B?dWRHcGg4WG0rYmZ3bXE5QnFIbkpjbEJyeG1Cb0dQeW5mcEZqZkRQSHg5NVNq?=
 =?utf-8?B?SEFZSUhDUlhoZWRWRnpIMUxIbXF2SjBqUGhpditzRXk0UzR6NUlUcWJPaGtp?=
 =?utf-8?B?V0Z0K0cyUzFPZCs1eWJ1M2Q1SE9BMlV3Tjl0NmN5Sk9yNkxMV3llUXBRN2dj?=
 =?utf-8?B?WnUxeTIzWjRLOWwrcG1nY01PWHBvSTYrSE0zNkZMWDFhRkdoWDBRVGlLUlN3?=
 =?utf-8?B?ZjA1RWcyK3huSG1RNVY2ZmJuSjlRZDhlcXZLNE0zeUoxaUZpb09mbVJvWUNB?=
 =?utf-8?B?YnNvWk1yZ3VaVFd4akFQQzdzbjAzNmZXQ09vNnhBcFR4UWRSZTFGdUpqZHdq?=
 =?utf-8?B?L3k3c0NZUUtEMk1ORmhpK0JxbzBxM2dzUEhDMUdLMythcHNsTW9DbFVxVFNa?=
 =?utf-8?B?emJrOXdEZk8xa3o0S0tTK2hld2U0TWxtYktHbnhId1pLY2NCUDZLd1ViNzdT?=
 =?utf-8?B?WUFJK3ZsdUppeVlNOG1jaXc3QndrNUkvM20za1Z5R2c5Q0dLMEZoVkU4eDB2?=
 =?utf-8?B?M1BlcGNLNlpiazdYcUN1azBqdUpoMGZmRXlPWXhOS1RWckpTd2dwbVFFWWdt?=
 =?utf-8?B?OXVjeUNqVVBHeitadGVTbVg4WllZV2JLWFNjcDF4K242dElNRkxyWDd5M2Nw?=
 =?utf-8?B?Rlp4WDVjYjlGZHFOcGJWR1RnNytaZFVqV3l1WTZGb0FLaitJYkptZHJIeEVz?=
 =?utf-8?B?SnlPUDBOYzR1eWJabHBaWm5kTFdvUEF0cHFoTmlRTzh2dlFyTVp3MHFaWHZu?=
 =?utf-8?B?NmxRbFR4WUxFWmw2U0ZZSGIwYm51NXRkdGJjZjl4eHVudVhUNXYrMXRyWENq?=
 =?utf-8?B?Q0M5cDBkQVRSY2NiNTBQMm9EL2NCYWJUdWFPSXBCNENOK3Y0a25RRVdNVUZi?=
 =?utf-8?B?Z0RCMmtDaUl3M2V5VjdneHlhcG12S25vN0NJWjNqR0tPbXdaaEZrN0ZrSkdu?=
 =?utf-8?B?NGFTN3MrYmE4UlN4emp2ejJDWEpBbkRZQlFKZWJFb0R1Z2xjTHhTaUlrMDRh?=
 =?utf-8?B?SjZKcWpJWTFBdjRLbEhpbUxrK0Y5SFRtVi9nbWR0NE14RGFiYjJ2SXp2aHgx?=
 =?utf-8?B?cmhEVzZuTWxpaWNvOVZjK3BJSnViMmJjKzVPT1lsYjR3WUhGektlQT09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0128f71a-0108-460e-0bb2-08dec6001d6a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:21:33.1395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++WHwvTjF42sde7WF9ByEf8/hKrhZ8Nc2/cHchmRMGSnjS5kuPt+CL1NBR7UgX3qwVEuQyviMirEknVVI57h4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmWTFk7jEHCmSSelf+afetrNuVEoRqWp3Q8N/QZFS7w=;
 b=bFLkxqJGLRxU/IM2mz5EHr6wk9vps/XY0BtuPWE0j7J1nxfKX5MLnslwr3xHoFtNRltbAkCSeHSbk/OxAvl0CSAVuFw1QSdnZpQcuDqhkOBMDwsoendnwVumLNc2Kv1+euJj701IAYrleiSvpJ0fJBHGlaD0+s25KZMTxNjzxWe3EGObuxQtTyvdFunz97YTFy52Tz2KC1q/9YA6uQlnZwEKpHCtIZClOe/p/6+hBt3mgGKR83HmJYJDqjESSsYde9cYgv4IY8VpSTssjaD1A1k4gy/z3Qg/5wsGKJ9u+dO8AAL5GSi2HKiIABz+np8REDn+3eX7Rku0efaLew8SQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=siemens.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256
 header.s=selector2 header.b=bFLkxqJG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Subject: Re: [Buildroot] [PATCH v3 2/2] board/pc-efibootguard: add example
 EFI Boot Guard recipe
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
From: Jan Kiszka via buildroot <buildroot@buildroot.org>
Reply-To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09.06.26 00:49, Christopher Obbard wrote:
>>> diff --git a/board/pc-efibootguard/genimage.cfg b/board/pc-efibootguard/genimage.cfg
>>> new file mode 100644
>>> index 0000000000..2437a89b63
>>> --- /dev/null
>>> +++ b/board/pc-efibootguard/genimage.cfg
>>> @@ -0,0 +1,59 @@
>>> +image EFI.vfat {
>>> +     vfat {
>>> +             file EFI/BOOT/BOOTX64.EFI {
>>> +                     image = "efibootguard/efibootguardx64.efi"
>>> +             }
>>> +     }
>>> +
>>> +     size = 16352K # 16MB - 32KB
>>> +}
>>> +
>>> +image boot-a.vfat {
>>> +     vfat {}
>>
>>   Does it have to be a FAT partition? Seems a bit... unsafe...
> 
> Yeah, unfortunately the EFI Boot Guard configuration partitions have
> to be FAT. It's probably due to EFI environment not supporting many
> filesystems?

Exactly. FAT is the only driver you can expect from a random EFI firmware.

> If it's any help, the config partitions are not supposed to be mounted
> RW during normal boot and only mounted when modified with the
> userspace tooling.

...which happens during regular updates e.g.

> 
> 
>>> +
>>> +     size = 128M
>>
>>   That seems quite large for just a kernel. Unlike /boot in a typical distro, it
>> will always contain just a single kernel, right?
> 
> Yes, I agree. It was leftover from the project this was taken from. I
> will reduce the size of /boot.
> 

Depends. If this is a UKI (Unified Kernel Image, required for secure
boot), then it's more than just the kernel. If it needs to be 128M
depends on the concrete project configuration of course.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
