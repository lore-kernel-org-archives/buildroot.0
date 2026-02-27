Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02CBFEFB6C
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 15:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8120C60ADF;
	Fri, 27 Feb 2026 15:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSGgUw9QQIoX; Fri, 27 Feb 2026 15:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED6360AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772207253;
	bh=HkbtMPzDaGr/0qVNBRXkqFVgBVAm+sWNcWRyunVaKMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hjULjG5Utom10pwVMbvseYoHE5erqByz69GisGDb1Pn7h3w+tjHf7jTRnByUMgTHZ
	 ghDCacpVcBDFQoWIyixEQ1R61VrwyrwdWxlULwPs8a2JDtMGXUMFo780kfmFlIMo+o
	 xyTOS+NDCXi3q7xH2Q0qln0f+xF2WQFOfrXhbfMPVCnxihWlNrpkktY3TKwq2BsKqz
	 bK3pxRE3+Jd7reYmNrx7aQoPX+WJKP9UUrNMJeO2dKoyRsv5vyKP+QL5Kpn5nTqplV
	 oNJ3MdsANm+xHgQk6a1D13gRG/SbNG1MbE3wuiCShwhucCw7ePQnOl4W1W+EsMeq6l
	 pi6e8nNSKOZHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED6360AE2;
	Fri, 27 Feb 2026 15:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED6EB204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF05960AE2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7u8lftID1WN for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 15:47:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C32F60ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C32F60ADF
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C32F60ADF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 15:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOibbWuO5jXEXFIfFmsrYKELjGRdxOkSz8GmUqJTr2/RUgOIQsXwa5V4MrZEObfw1gqxdYw6rGynttNSUfD0z6EKoePZCQIC10rWjqqFUePpDxQmoEDSNEiKyh3g1WigCZ0OP/5jUz1C2rakcNW/s53+K03MP3lR8H0+7SgD2Ulj4nNiVxDUDsZHUv9kOeEwMeIHfN5VsxHm+h9+r1LrJMyMOeMBz4hEyklTnmDqQCtF0qjhFNt6yioUfVDoK9ihGqNe1yUitiioidbw/VYstTWuoaRF3iP1NE/MZoZBVqPPetqaI2Ijk2nemw2fSmsJfZSMDAoaSrmW0PBr5F2xoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+ysozqqoYwf4AeDnp5ZBg1+E5UrzBCAlxiD5vT3XXQ=;
 b=ds1j4BxLRwxdBFec6HrsfH7pNGMDKZL0KvRpv5f1wStS1Xtqdeqh4ACuGX396GLU1Nl354XvgqKwDC98UW7dn4Hs630GCfAurb272xfTZUZEwvlR3A+fJJiVGwLNG3SlgBqa0kNwiPVGJMcv7nHDMQ2whGXeQrDSkflNzKkaRp41kLUW26H9ZVRCyXzDoGiG6FhyEfLPAe1UZCSoRavDfrLomeDtkuONSr34pi2F/4f9oOwsMl9a9yC7M+ZGc+IKimyprVmz8aFWVrm6gbr0kbMhhlrR2HhveQdBIfGcFiL39YvFJhzEkjCAOyyMR2cCRZFDnTje62zwhLKKC8kVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB9001.eurprd04.prod.outlook.com (2603:10a6:20b:408::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Fri, 27 Feb
 2026 15:47:25 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%5]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 15:47:25 +0000
Message-ID: <7952c8b9-0069-471d-ae1c-dd021c4bd63d@cherry.de>
Date: Fri, 27 Feb 2026 16:46:27 +0100
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
 <a980f4f5-27bb-4ae1-94ee-69f7abe96ae0@rnout.be>
Content-Language: en-US
In-Reply-To: <a980f4f5-27bb-4ae1-94ee-69f7abe96ae0@rnout.be>
X-ClientProxiedBy: VI1PR09CA0119.eurprd09.prod.outlook.com
 (2603:10a6:803:78::42) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d70f179-db46-40bf-1eb0-08de76178113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: F9ivEA7bdn6c7jLz5xQcQqwSmWhUdFjbQLfm9Udp8Sybwn2MTXYzzECtKG4DgMt6hg3cTndtEiBES9c6MDQOSz3SnabPCRb//23xiEkLeaQlvQETZ6oiBKqjztPmwp0dkFFtdsq9Dbay8vwYjGu1BLWPB4+9OSJ7xJNuLplRBjvavFBJBR0gBspe2i/8NrZZCpKY4+1wyI6MhkMVm8n7hp9zz4sl2OWcUjcC6fHnFhaCrsnCDXuPzUuokQkrQ7j2S/4ygPOMrr0rVjVsoJkCniNfgzinqSt1fqh37CPqfBO1PTKjcyVT6M0A9Zc+xyYvQLD5Ky1cndVVg5EZ4kUGAYINUGOjedM33YKQNkd5R0K4g34OxIdZN7ZBPqv6Gc/+URN3b/pTb+zz8JKC+1NsNBUKAaqsLhqzU2BwPNP0DWWtsF4XvgPc6Tad5bI++yUnzSWBDet04cluzYFh2fl2u0b0cNObfxqYPCw1gO7+hqJmFxbUdMOnGy56pyctpbZO3IILGcuJFDxNgT1GVsEDY/L98dH26u0xiXCQrZfUlYW2sY5igGwNEw092DhKSwPhNVxRwEMnQSH1p1wtQwzya6Cs9pUk19ooMsAYSjBf9zZ9raIcBkeoSugGZuORZBVvpSTgG+d5CJ4ewkJFdryGlmI39E9cTehudCPWA2+FD5ZPy8d/ILr5o7fxSp6ie2a967PaznJJ2AojNPW7FOzAtdTccT5MpqvtTJtJwva2okg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHZYQzlocllZVk5YSUF4TGhFWEZLRFRnSFd4UG5pZ2xRSlQwVFRyQ2xyWXBt?=
 =?utf-8?B?MnlFQjE0ZHVaNGp0MG1LeTMyM0lxK29WMUNQSFpNeG15bjFzWmd1SzMvbGtj?=
 =?utf-8?B?elBiQ2twcDlPdGZmNTBiS3VRVVRrZnp0a21YUHFKVzVzWmp1eldLRlBUblJ0?=
 =?utf-8?B?SzNkRlZKN1hZWGc5bTZNaFRHWm9tNGRpbjQzMUdxVlIzTjh3dFdFMnhiNWQw?=
 =?utf-8?B?UzBMa3VlOG12OVFUSWRFTlE1amxyZWkzN1Z3THVUWEtPT1dST1djK0hlZUVs?=
 =?utf-8?B?TWpSOUpLa3ByVk5tUmpCU2h6bDNHMFhmZ3BFSmdKdDgxTXV4NmFJR0NjbVhy?=
 =?utf-8?B?YU44R01hdmxiN3FDNXY0MElsdXlCVkVxRmwwTElhMmc2aHVRcGNQTU8zbWpr?=
 =?utf-8?B?enltOFJidjJhNE5aVmdHYTZMeTM1TDJQekhpVzBQUmtjZkg4eWxwb2N1Z0hX?=
 =?utf-8?B?UnhCSXdmZzRvbWtIWjk4Nk15MHNGai8xdWc1b3ZtNThnc0lsc1RFdW5xaTVE?=
 =?utf-8?B?cldXUUdLR2p4RUxZSGxsYmo5SWJ0RDkxNUw3SkgyTTZHT3paaUhtemRJd2Rh?=
 =?utf-8?B?UUxDZDNZUEx1VTVXa3FvbXlodjV4dW9ETFV3eHNZbjdxVWRYWSt3NnNsNWlo?=
 =?utf-8?B?YUtEV3hwaWo1RFhBamVjbzFmQW5vcHlLcG1UNjhRMXdheThQQWV3eDlKUHRo?=
 =?utf-8?B?Yk1oMytxNUtCMm9GYytrRGh3ZFUvNzNIdnhtSGdiUjJkWGJsSTduTVhlcUxY?=
 =?utf-8?B?Q0xkQXY3UkVuOUlrcHVYdHJZR0FjbUFuZnRTWUp1NTN0SlR0YzJKbmFBczB5?=
 =?utf-8?B?MlNXeDBtVjhmZ0JTSDc0VlFtZ2crZ1dvK2c0VUVRWGFPZXhURWZXVi93RW10?=
 =?utf-8?B?MUtvL3llZUZmbmx0UUU0dmVKRjdsRHFsb2F3S3NFUTdRbHhteE9TN2cwdzVm?=
 =?utf-8?B?UjRIVE9iTWFZQ3BOY0V4V1VqSzRRVGo0VUt1dnJYTXRQaEt5TG5pcWxUUVBY?=
 =?utf-8?B?RFFyZnFtMzVJM1gvZVMxbE5FY1JuV3Fnbi9WOXZWcUdMNEpVeWpkaXpFL1NG?=
 =?utf-8?B?Y3pkR2lWdkk3aFFwU0tJTWM1ODg0R0l3cTVUYXVJQWtFdGdJTk9hdzkvUTM4?=
 =?utf-8?B?N1p6REM5aGxRVmdqMnYvS3RNaUJBQUFXeDJobDhsd2oycHVNSTZCc0xZaFRZ?=
 =?utf-8?B?bi9EY3pYQzhuNWRObE5DYTRTRlFHVG83NXR6cFQ1dzFMd2toQnR4eDBTVDI2?=
 =?utf-8?B?cGpGc0tkU2h3d1hQTDgxQU9laTRMb1VzcWh2QVhyOXRUbWxyWWg2QlFybEV4?=
 =?utf-8?B?b0hXdmtKcHZWZ0tCTFkvQjVQdWhqc3diTURGRUF1WjViTnhpekN4NzE3WXpk?=
 =?utf-8?B?SmJhbm1FSXlrc1E2dVlyaUw3dGxiTlBNWWEvdHNVZjM1S2tXWXpLTk8wcUJm?=
 =?utf-8?B?RHRpcVUyTUVEYlZRelU5Ukc1N3VBMmUzVkNON2NCUk5xMWRFUUJEZHJvSndX?=
 =?utf-8?B?TFN3NUlwQWxDbUFpbktjUDlUU2JBWGhjUUtpRGRGQzNrTFBIL2I5Rzd6YWRt?=
 =?utf-8?B?YTgxWStFL0J1V0QvMktBVmprNS9rRGgycUpCb00rTEppNkR4QkxUa2VJc2lY?=
 =?utf-8?B?a09IMGNUKzJFM2RnbkdqbzZzRnpkSlAyQjltc3FpU3VBZEhudThNdUZBVWhK?=
 =?utf-8?B?NEVCUzI1dFEzWjZUSk1vWWQ3NVpTY0dRV0lZSFJyRU9CdUVrY092Y1FIak81?=
 =?utf-8?B?alNGd3ozZmNpc0srRDUvVjNDSHBzc1d0NUFSVGFaZ2FOS1Z1L21hNjM5U2x2?=
 =?utf-8?B?M2o4bkFZRHJ5TFYvd0ZvV2I1V0x2TVVWaExDUEVkdkVTZGFTMHFQTGt3a29V?=
 =?utf-8?B?TWRkTUZ6dGpNOXJNWmdOaUN6SjJlaHpiZDZpeEpITFQ5c0RsL0ZDd1drZ3Jw?=
 =?utf-8?B?WlNGaFNWSDdUQVlmbU5qMmtWUFowNk5GQ2RqWlU5MkJzbjZwUG5hWjRVdnY5?=
 =?utf-8?B?QjYvZUVPYVdQMHpqNTM5d05aUTZkUXYxeUQrMFRmYXVGblpueE1YaFpTdjBx?=
 =?utf-8?B?b1ZzSmxVL3BBUXNFSHlDTUJTMWVtZmYvOE5vMDRyNUR2cVVEckpLQ3VvOVA4?=
 =?utf-8?B?Rkw5OUxCNnI2c0c4M08zaDF3bEJEZXJwaUdxQ1h2TE1wV3ZtVjJDRnJaa1dN?=
 =?utf-8?B?YXJvNGIrRldJa3VrM1pGZDdzVE9CM2dycnlDWHBDVmgwamdBbnBtMlFTSlJ4?=
 =?utf-8?B?Q2I4SVN4UzRZVmFLZDJvMm03N1lOWW5Qemd3OWp6Y3RlL25BK3JJNjRVSGt2?=
 =?utf-8?B?aTA3MVJMa0tqUkRRdXFrRDBFZlpBL0djYmNTdWthY3RWWnE1MkxLUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d70f179-db46-40bf-1eb0-08de76178113
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:47:25.6400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtFkZwbm4du6/Ehyh1PvVske4MAMdrM1lyhBshsM4u1HRTaaI69NPOS1KrUU6lnowEq7o8b+eMn66GAmY1G/1eJAgfyEnCPY63MO4Ym6DLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+ysozqqoYwf4AeDnp5ZBg1+E5UrzBCAlxiD5vT3XXQ=;
 b=fF0N+THLaNXzoNkuPvKSSpnvMknp5WReHczAKyn/0lyIKeQYx7l18wYKwJY4dhivc+ZqbKL8+EujLtno47Xs3KtNy2LiPyNQ5LSvv0wGKlW25aRqvxI90Q91PdT02q+xHEeMxYIBKY+Kcdqq051DjHXB2/ntXttVZMHLDq+JCyM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=fF0N+THL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib
 dependency optional
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

SGkgQXJub3V0LAoKT24gMi80LzI2IDU6MjUgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYXJub3V0QHJub3V0LmJlLiBMZWFy
biB3aHkgdGhpcyBpcyAKPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0KPiAKPiAgwqBIaSBRdWVudGluLAo+IAo+IE9uIDI0LzAyLzIw
MjUgMTQ6MTAsIFF1ZW50aW4gU2NodWx6IHdyb3RlOgo+PiBGcm9tOiBRdWVudGluIFNjaHVseiA8
cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPgo+Pgo+PiB6bGliIGlzIGEgZGVwZW5kZW5jeSBvZiBl
eHRlbnNpb25zIGFuZCBIVFRQIHN0cmVhbSBjb21wcmVzc2lvbiBmZWF0dXJlcy4KPj4gVGhlIGxh
dHRlciBpcyBkaXNhYmxlZCBieSBkZWZhdWx0IGluIENNYWtlIGluIHRoZSBwcm9qZWN0LiBUaGUg
c2FtZSBjYW4KPj4gYmUgc2FpZCBvZiB0aGUgZm9ybWVyIGJ1dCBCdWlsZHJvb3QgY3VycmVudGx5
IGVuYWJsZXMgaXQKPj4gdW5jb25kaXRpb25hbGx5LCBtYWtpbmcgdGhlIHpsaWIgZGVwZW5kZW5j
eSBhIHJlcXVpcmVtZW50Lgo+IAo+ICDCoFdoeSB3b3VsZCB5b3Ugd2FudCB0byBkbyB0aGF0PyBJ
dCBhY3R1YWxseSBicmVha3MgYW55IChvdXQgb2YgdHJlZSkgCj4gdXNlciB0aGF0Cj4gaW1wbGlj
aXRseSBvciBleHBsaWNpdGx5IHVzZXMgdGhlIGNvbXByZXNzaW9uIGV4dGVuc2lvbiAoc2ltaWxh
ciB0bwo+IGphbnVzLWdhdGV3YXkpLiBJcyB0aGUgaW1wYWN0IG9uIHJvb3RmcyBzaXplIHNvIHNp
Z25pZmljYW50IHRoYXQgaXQncyAKPiByZWxldmFudD8KCkkgaGF2ZW4ndCBjaGVja2VkIHRvIGJl
IGhvbmVzdC4gQnV0IHRoZSBpbnRyb2R1Y2luZyBjb21taXQgCihodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOWIwZDc5ZWE1ZTEwZjQ4NWZjZDM4YzQy
MjQyNTdjY2RhMzkwNzgwNikgCnNhaWQgPDEwMEIgc28gbmVnbGlnaWJsZSBJJ20gYXNzdW1pbmcu
Cgo+IE9yIGlzIHRoZXJlIGFub3RoZXIgcmVhc29uIHRvIHJlbW92ZSB6bGliPwo+IAoKU28gdGhp
cyBwYXRjaCBwcmVkYXRlcyBteSBqb2luaW5nIG15IGN1cnJlbnQgY29tcGFueSBhbmQgSSBkaWRu
J3QgZG8gbXkgCmpvYiBwcm9wZXJseSBhbmQgYXNrIHBlb3BsZSB3aHkgd2UgbmVlZGVkIHRoYXQg
aW4gdGhlIGZpcnN0IHBsYWNlIChpdCAKZG9lc24ndCBoZWxwIHRoZSBvcmlnaW5hbCBjb21taXR0
ZXIgaGFkIGxlZnQgdGhlIGNvbXBhbnkgYmVmb3JlIEkgCmpvaW5lZCkuIFNvIHRoZSBqdXN0aWZp
Y2F0aW9uIGluIHRoZSBwYXN0IHdhcyB0byBub3QgYnJpbmcgemxpYiBpbiwgYnV0IApldmVuIHdp
dGggdGhpcyBwYXRjaCBoZXJlLCB3ZSBzdGlsbCBoYXZlIHpsaWIgYnJvdWdodCBpbiBmb3JjaWJs
eSBieSAKb3RoZXIgcGFja2FnZXMgKGUuZy4gbWVzYSkgc28gdGhpcyBpc24ndCBqdXN0aWZpY2F0
aW9uIGVub3VnaC4gVGhlIAphbnN3ZXIgSSBnb3Qgbm93IHdhcyByYXRoZXIgdGhhdCB3ZSBkb24n
dCB3YW50IHRoZSBleHRlbnNpb25zLgoKbGlid2Vic29ja2V0cyBpcyBhbiBleHRlcm5hbCBpbnRl
cmZhY2UgbWVhbmluZyBpdCBpcyBhbiBhdHRhY2sgdmVjdG9yLiAKRW5hYmxpbmcgZXh0ZW5zaW9u
cyAoYW5kIGJ5IGV4dGVuc2lvbiBwcm92aWRpbmcgc29tZSBraW5kIG9mIGludGVyZmFjZSAKdG8g
ZGF0YSBiZWluZyBwYXNzZWQgdG8gemxpYikgaW5jcmVhc2VzIHRoaXMgYXR0YWNrIHN1cmZhY2Uu
IFdlIGRvbid0IAptYWtlIHVzZSBvZiBleHRlbnNpb25zIGFuZCB3ZSBkb24ndCB3YW50IHRoZSBh
ZGRlZCBzZWN1cml0eSByaXNrIGFuZCAKYWxzbyB3ZSBkb24ndCB3YW50IHRvIGhhdmUgdG8ganVz
dGlmeSB0byB0aGUgYXVkaXQgY29tcGFueSBmb3IgZXZlcnkgCnN5c3RlbSB1cGRhdGUgdGhhdCB0
aGVyZSdzIG5vIHdheSBmb3IgcGVvcGxlIHRvIG1ha2UgdXNlIG9mIHRoYXQgaW50ZXJmYWNlLgoK
PiAgwqBHaXZlbiB0aGUgYnJlYWthZ2Ugb2YgZXh0ZXJuYWwgcGFja2FnZXMsIEkgdGhpbmsgdGhp
cyBuZWVkcyBhbiBleHBsaWNpdAo+IENvbmZpZy5pbiBvcHRpb24gdGhhdCBkZWZhdWx0cyB0byB5
LiBCdXQgSSByZWFsbHkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBhdCAKPiB0aGlzIHRpbWUuCj4gCgpG
YWlyIGVub3VnaCwgdGhhdCB3YXMgbXkgZmlyc3QgaWRlYSBhcyB3ZWxsIChhcyB5b3UgY2FuIHNl
ZSBiZWxvdyB0aGUgCmNvbW1pdCBsb2cgOikgKSBidXQgSSBmb3Igc29tZSByZWFzb24gY2hhbmdl
ZCBteSBtaW5kIGFuZCB3ZW50IGZvciB0aGlzIAppbXBsZW1lbnRhdGlvbiBoZXJlLgoKV291bGQg
eW91IGJlIG9wZW4gdG8gYSBwYXRjaCBmb3IgYW4gb3B0aW9uIGVuYWJsZWQgYnkgZGVmYXVsdCB0
byBlbmFibGUgCmV4dGVuc2lvbnMgKGFuZCBzZWxlY3QgWkxJQiBkZXBlbmRlbmN5KT8gU3VjaCB0
aGF0IEkgY2FuIGRpc2FibGUgdGhpcyAKdGhyb3VnaCBhIGRlZmNvbmZpZyBpbnN0ZWFkIG9mIGEg
cGF0Y2g/Cgo+ICDCoFJlZ2FyZHMsCj4gIMKgQXJub3V0Cj4gCj4gIMKgUFMgU29ycnkgZm9yIHRo
ZSBsYXRlIHJlc3BvbnNlLCB5b3Uga25vdyBob3cgZmxvb2RlZCB3ZSBhcmUgd2l0aCAKPiBwYXRj
aGVzIDotKQo+IAoKQW5kIHRoZXJlIGFyZSBvbmx5IDI0aCBpbiBhIGRheSAob3IgcmF0aGVyLCA4
IGhvdXJzIG9mIHdvcmtpbmcgdGltZSA6KSAKKS4gSSBzeW1wYXRoaXplLgoKVGhhbmtzIGZvciB0
YWtpbmcgdGhlIHRpbWUhCgpDaGVlcnMsClF1ZW50aW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
