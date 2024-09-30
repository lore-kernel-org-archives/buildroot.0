Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09416CF649D
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 09:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A685D80B0E;
	Mon, 30 Sep 2024 09:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLMbpW3VXcZ5; Mon, 30 Sep 2024 09:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B049980BCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B049980BCE;
	Mon, 30 Sep 2024 09:22:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32F6B1BF955
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 09:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D518404C2
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 09:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEe5ziAxdGuK for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 09:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260c::60f;
 helo=eur03-vi1-obe.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5685340180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5685340180
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260c::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5685340180
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 09:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4F4TvZ+LwKEGccJHW0WwWoGWu1n0wCodTT17TTnBVh6/X9p718KUinNBRVQk0sRD8XgWWfIFeVtObFO1rcBldSJDuEl6JzPJfL/rz2fhiQxOGniFI2UKkuwIF6OCZ0WiA0A4y2snSvG2iXE+CwNNuiPteV6rRysZBIypSAg/9cw+90DfAmg6SZeFLmv5BukWpRS8FKouqhdo9cUaXZHL6zwiAOiA3I7W5oPkA9M3hJQlWH9SO+g6HsHv3cEioHt2QaOJ0Jd1i8zYb3caWNB7FUh/3yQH7iYdgQoYaGofxRpUDftrVJOphAnvDUGiNdxgLmr6CYPohhDuYb3E98cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ysz6hb7EHtZAgi+q8Y98IiYzqusBMvARXh4tI15I6iU=;
 b=xcsGJrXjLnEnCt9CCIyEE1ZA4fgCTK6AQ6MwL5JQWQciGy2Kh2Oez/e4l/nWmNsYtdEKiQl2cklPVLbdMA72h8OUVyo5mft0o14AvvFYbc4lTtRT/hgnjPHxVa6XhxP5qSWIcyDlu4wEN6FengUK9YeDpjllJ4gefhRyUiJjejbVSmbYuUUWsKdE6r6TiVFBbJMNsS7fS6PeMdiwn7kiSiXgSyB2XSxFcQETCkyF7cTmwU9u0JwCrXmr9dUiO1Szfky/yiBjkL6uOqHAvuQy+Xe3wHv2WScIi78aJCSjQpPQu07p9051PNIsZq5m/gziO59d0BT6eVE43PNO1bPaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM7PR04MB6886.eurprd04.prod.outlook.com (2603:10a6:20b:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:21:54 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 09:21:54 +0000
Message-ID: <2460269a-e521-4add-ac09-6bd1b0a7a872@cherry.de>
Date: Mon, 30 Sep 2024 11:21:54 +0200
User-Agent: Mozilla Thunderbird
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20240929151124.103921-1-kilian.zinnecker@mail.de>
Content-Language: en-US
In-Reply-To: <20240929151124.103921-1-kilian.zinnecker@mail.de>
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM7PR04MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0ec56c-39c7-45d4-6c58-08dce1315341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2ZTQ0d0Sm5mc3VWQmVDRS85TDZGMlFRdEt6VldvNnIzQTA5ck53SFdZT3Bt?=
 =?utf-8?B?b1M5bUV2bXNnYXh0V0hOMnlLUkhDdStjVjVMUXFRakRETUpPSjNWKzJCK0U3?=
 =?utf-8?B?Wk83MHFXYmovMHREc2ppQTdraWhUV3N1a1VJeWlrUEsxU2l2OFh3ZStKT3BJ?=
 =?utf-8?B?emk1amVlNk9PdkMxTHVKY3djaTA0b1NCQ2xZUFo4MFE0eHZwS2N2bldRTE5G?=
 =?utf-8?B?UW1qeWx3UGhOTmdyZC9WdEZSSHloaWpVRkF1eXUzS0NhZmxZTE1sM25yZTlp?=
 =?utf-8?B?YVN2VW1BMUllU1ZhMVhLN2JQSG1IdTJjSkJ1enpXQWh1MDJVa2lEUzd5L3Zr?=
 =?utf-8?B?VytNV3dDUjhzY0dKNnN1RWg4MVR0YWdiL1VoYlZXOFVYTUZmYjFoSHplNGtC?=
 =?utf-8?B?NEhXZFJNVEZTT3RTMjN4RE1SM0dZbzVBVXFUWGVJMkl2QW1qbHNDT29ueE5X?=
 =?utf-8?B?Y1JtWCtmYmdCMVdEVHJpUFArRGtISW9aTVhjQjJZa3ZqbHdwTVhQOUUvSVpv?=
 =?utf-8?B?VEE2UHAzZlVVZ3NKcStlcGRzbEREMXIxMzNiMlpKOTRSOUxSUGhGZXFXcmFS?=
 =?utf-8?B?Q3lMUkovYVliUGVsZ3JpcEFjV1FBY1ZZVk5ETW5wY1BSYlVzc0FDMEE1Vkt1?=
 =?utf-8?B?M1l5cXlvN1lBbG8zWWtuVks5VUsraHhDSVNyZXpQVnFROStoRWIrR2FRRmps?=
 =?utf-8?B?L2Y5cE9Fc3hJZWNPcFl1WS9zQVYvcGpxQkJTbTRUTVliRjZmVEFzaXdFOGs2?=
 =?utf-8?B?NWVpL0xZOTk2b2FjdGZudDExRUFIRmk5ZHBrZUNpZFRsTDd2aHNLZkFrSDc5?=
 =?utf-8?B?TStaRDRXaHZiVExmTDg2ZFliVmdZZTVnb2FoS2lnNHNpem9OOFpBOGhsUjhv?=
 =?utf-8?B?VmxObHFzQkNUWWU4UFYxZnA1elZNRHlMTXkySkV3WGV1R1N0ZHphN3F6azcw?=
 =?utf-8?B?TjI2TUdaazByUTdJZnlOQ3JCaHBZenN2ZTlKL1JtU0lYZ2xHZGlrMGEzRkJ2?=
 =?utf-8?B?dVIxRkdHN0xiQlMzeGpxL2ZaWmc5UDVxMVJOMzY1ZUc3YWxtV0w3UVBJZUVP?=
 =?utf-8?B?cFhranJxUk1NYmFmRUlHcndGTWVlUitiZnNCTHdLUnFZdGwxV2VGVS9EQnc1?=
 =?utf-8?B?UmJZbVJkSHlLSTlLa00yaVF0dGdwb01aOTJsUHprRDhWNnlDRit1aWIxV2tP?=
 =?utf-8?B?N2JLS1ZuaEJNanhuVlNOZXE3bnZIc2FIOUQweUJESFdiQXVLSllrU1BMNWt3?=
 =?utf-8?B?ZHNjellIVFVtNHZrbnZELzFFd0EycUpNR3lUU09CMURhdEJ2cndJUDkwMzRD?=
 =?utf-8?B?d2U5VWlhS3JydFNlN0ptQVFEbjR6OHNHaW1OUisvTS90OFhnYVB3Nlo4U0Fn?=
 =?utf-8?B?TXZiaHdVdmE2TVBnWVYvK3grWFVuNWFhTHdJL0JLOEhpQ0VxQ1lxcDZoNDUw?=
 =?utf-8?B?N1RtRjN4cjRGdDVmVzNESGpRdWZsYkpMOXo4ODhSZDJVcDFkTVFYZlR5RVly?=
 =?utf-8?B?eFF2Z3JQY0F5QVJ5RmZISUh3a05DZi9tWHZSQ0t3Y2NwUXFVNU9lamNWREY3?=
 =?utf-8?B?TW5sa0RIbGp6RzJxODhGMWdyY0dBRUdVRTdHMCt3elV5MS9lc21acXhzdXFs?=
 =?utf-8?B?U043bFdVMjM0aERKRnlvV0Q5NGxpb0pvM2MyMWlEYnZjd3lkZ1o1cU90WHlS?=
 =?utf-8?B?dXU3UWlzMnFSZW9FVjZoNXZGSVczWUc0dDVqQmJKdHVyRldTVFJkb2ZLSTlY?=
 =?utf-8?Q?OVLONpwYvxLZwuTM+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8906.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThEVVYzbkdYaGhwME9ZZ1VibmFzWlN3dnFCVGV5czZHbVdlMFhPWG0rWHlY?=
 =?utf-8?B?Z0s2ZTJmQlU2K3JoYjV0MFM0MysxaHh5ZndjZUZ5WEMrWmdFNE5EYWpKNEV3?=
 =?utf-8?B?Skc1Q1NnT1Y0aWRHbG16SmY2bzNUU0lRemRxQXkrcG5saW5MRkNGSnBibjlp?=
 =?utf-8?B?SFIwWmlJTjY4MkRiU1poYmliNnB0UXlWSHVzMnhtYmdYZVNCejZjaXRPeVBT?=
 =?utf-8?B?ZzRoTGZFallEbkMvVElNcFd3SnRJODFqeXV1Vy90WjBmYXUzZmUzajNOc2s1?=
 =?utf-8?B?OHF1OFFKOE8rcEN3MytDbXZVWTRtb3JvTDI5MkZtYVNDdEJFdHZpankwRTFl?=
 =?utf-8?B?QW5meC9SaklCVHhFVGNZWEZSMVkrbUhZUEkrbmxNSkNQZnExdHpnQU9hV1F5?=
 =?utf-8?B?cWx0V1BhVy9mMmxNaXNPb1M1UWM5TlVGQ28yY1oyOGtzWVRlaXdxZTZQbEZ5?=
 =?utf-8?B?TG9iZlNYMXdSVE9XV3NIcjUyQ1E1R1BuTkVlOVZlTFluUWdXRFhMY0kyQWlI?=
 =?utf-8?B?SW5xdTZQTWpmdDdNOTVBdC80VnJkZkErUnF3ZWlxMlVBcDBlT1lvMWNaditW?=
 =?utf-8?B?S1pBUEh3Z3NzOWxBSUFrc081MjlVSmdId01oanRrcHBKM3Q5bGR6TFpIQWN1?=
 =?utf-8?B?RXIyZ3k2Ulhyekx4NFVUWEF3cEtWeGZjRHRpTkJ2N0J0SG5rMXBuWUNZV1VI?=
 =?utf-8?B?TWdOOWJzUTVVZEVQWHJRSmFpQWJVRkFGYVAyS2VucWJIZDhleEp3eVZBS2tj?=
 =?utf-8?B?d0ZVSlB6OGVDMmNNL0tGdFphRzV0TFVURm43a2xMSWF2enpDMTd5eGVPS2h3?=
 =?utf-8?B?VVJ0eGNUNG95U1NHL01kelpXMndIc0dTOUdNUm9zN3VHZ1hYODZKUUZvUkZ6?=
 =?utf-8?B?NXFvUGJWZHN2QnZpaENQaFg2Ymt0aHhwTjR5NStkV1NTNkVDQldGY2haMXRN?=
 =?utf-8?B?M0oyQWd2bnl3WHVQNEIxbi9ZaWIrQWRCZE82TUJwd0FiUWVxU3RjbkdFUEU2?=
 =?utf-8?B?TXJpTms0Y3BWd0c3TDRwS2ZFL1BwTmJxWW9pK1QrL3VDS2VXbnh2aUhzbVVL?=
 =?utf-8?B?YWZaVDFRMUdiNXdFSDVFaXhUS3lYM0RlN3hBbzg3N0s1MGwyQlBhTUVFQktt?=
 =?utf-8?B?UThZNGoyU1J2dTdRNlkxK00wV0JTcHpnZWpIaEpvNFNnM2hXM0huQXVvNlJV?=
 =?utf-8?B?Sk1RTGY4akZlazU0cGhUcnQ3eUJmSkM1b1lBRlBqVHJpZDEyUnlTN1I3UUE5?=
 =?utf-8?B?N01LWTBJZ295Q0w3R21ZRDZpTmhpRnBzMVhSbklWNTMydGNZV0VmYmFNa3E0?=
 =?utf-8?B?VTNiRVBpeWRjT3U2UWFlSnVqTkQxNzM3TEFJOWc2Q3RvUDFucERvTE5US05h?=
 =?utf-8?B?RGdMYlZ0UlB0enRCdHNVajRkMnQ3TE1LR0RXZ3BrdVQ2UGI3OFhUL0NXRTdL?=
 =?utf-8?B?eFlIeXhPOW1TUjdTL01UYjBueXhnVlExZmNDd1pHaW5HYUt0QkFtV1ZyQXZ0?=
 =?utf-8?B?RXI5SHBaQkJDb202dEFMNjd2N0RYeklDcHNqakhSOS9iRnYzcjBnVGhvcDdZ?=
 =?utf-8?B?S1pQYm1SdnJNYUpQdFdKU1BUT3pNL2Ezeks4ay9TWGlrVGJ0VThpL0E0a3JS?=
 =?utf-8?B?aHlZMTdBclpPOXJ4dUwyM0NoeFlacTFqSHowUzZvVEF1bi92TCtwTWJnYkI3?=
 =?utf-8?B?VThhL3h4MEg1OWM3NnZIRmR4a0s2UUs3UXpjeXJhcEhRSDN1R1NtT2hrSlNU?=
 =?utf-8?B?bnh4T2VJaC9XSVl4TzlBVFRyWVBMb0RIcGtFdUg2cFlkcWlRei9PYmdWRTVl?=
 =?utf-8?B?V1R0L2lrUWZ6Z0tMaDNFT29uaXQyTWlDUXNTZXVPbTUzVkFxOHZJUjlFY3Q2?=
 =?utf-8?B?ZGdKeEpTMXg5cFV6WUFSSTFtWEVWMWtYZzEzY2ZGci83aXJSR1BzcGIrck5k?=
 =?utf-8?B?L0FQZ0NNNWNtSHdOWDBVbHpsTUhGblFOSVMzb2s4ZmUrcURhTUhYZHovOGYz?=
 =?utf-8?B?V1dXSUpvL2xZSWNqanoxekdZekhxTUU4ZnllNEx0R0JESWNtbVZsaXJTdzBI?=
 =?utf-8?B?WlhoaXkyeU1RNnI3bE42dHk1ZURCWU5QNFJKYTFVTW4wOWlLaFpQeDlBSG1B?=
 =?utf-8?B?ZW5uUzdCLzIvZS9ha1VhNUh3TEJIMkVjNXdDUk9WV3NCODdFd1pYUXVQSCt0?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0ec56c-39c7-45d4-6c58-08dce1315341
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:21:54.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPijbdDiRo430saf1Zz/6/qahba9B2NZ7J/2wLK7rc39HJ9oekJ6/wmo+KfISQB4V9YT9e6dI9b397mg0yRV6JMQF8HLykZL9Ap9tU0Edwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6886
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ysz6hb7EHtZAgi+q8Y98IiYzqusBMvARXh4tI15I6iU=;
 b=iPw/hfQ2Qlo6pzXCus1xQK9V/PwEjXJpfz+wWQ8UNEWCostdHcCsV1l9dUaT7XKIF87LP11B28kDv8D0o05udKDKZvUTYHdpv8I+N1dAFihDpEKSSrx8v5WvbCrEo+H/RyzO/5r5R6wJPS91N3iHU4/PybGPn1SsO6iwiW5wlns=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=iPw/hfQ2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: Switch to mainline
 TrustedFirmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hi Kilian,

On 9/29/24 5:11 PM, kilian.zinnecker--- via buildroot wrote:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> The Rock 5b board support currently uses a binary trusted firmware
> blob from the rockchip-rkbin package. Recently, the Rock 5b's SoC,
> i.e., the rk3588, received mainline TrustedFirmware-A support:
> 
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/21840
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/29363
> 
> This patch changes the defconfig from using the rockchip-rkbin atf
> binary blob to building the TrustedFirmware-A for the rk3588 from
> source.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>   configs/rock5b_defconfig | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index b88d8c5da3..8dc2053cdf 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -13,17 +13,23 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
>   BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>   BR2_PACKAGE_ROCKCHIP_RKBIN=y
>   BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
> -BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
>   BR2_PACKAGE_LINUX_FIRMWARE=y
>   BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="2975ad055bd6e1ea3fc4179e8b785266785f0398"

Is it really reasonable to use a random commit in the master branch?

The v2.12 tag should happen somewhere in November/December if it follows 
the release cycle of the last few releases, shouldn't we rather wait for 
that?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
