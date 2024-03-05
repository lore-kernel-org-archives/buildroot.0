Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A36DC54E49
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 01:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3804608B3;
	Tue,  5 Mar 2024 01:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVzpzkfeGtif; Tue,  5 Mar 2024 01:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34E6860A3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E6860A3A;
	Tue,  5 Mar 2024 01:37:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4779E1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3485C82125
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcscN8wmIH9m for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 01:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=787b0bca0=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86F0482105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F0482105
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86F0482105
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 01:37:29 +0000 (UTC)
X-CSE-ConnectionGUID: gULpU2kqRguWxoodjkpTnQ==
X-CSE-MsgGUID: wbUBfDA3RU6wdgB+s4lqUA==
X-IronPort-AV: E=Sophos;i="6.06,205,1705334400"; d="scan'208";a="10775644"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hgst.iphmx.com with ESMTP; 05 Mar 2024 09:37:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibAlDMBOcqPfosrE8D9PczSyXfAzInJ3Sr0EjKDHOVom0QokTswv9X3Rkj8RBvXxHhKBU4SY/f6ARUh0GQXHuru1KbqtxZlUW/OSgNEu4eQUaS4OoZZpk9EqjwC1fXWwDSIPQ0lQZZ5dtxndyuBXwP6s912fNLc3CxX3orDIQOQXGWMBZmGgrm33h21NU6+uObvlKsty4tA2aA44Rx9JxVjpP/D10oY01spVJqdJ8s03/6GTf7EUcy4HoRDcRQFAo0hZzC4BL1WjCBE96gBQpQzWLnZxNufbrkRh/JNZ5WOnlW5N/hmfGycBcM8aHa8B34akIT+S1CE+/3SJMonVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iizen8zqRlFXXhGLwhvf+jvyKruY3emvmMIsEkQNRas=;
 b=VCkn44O67TRWyjN37wNcjXhHJCrWeYu0Z97jXYLUIbeqKpSy9Qa6ugd/zeI+4qJ2YMNxGbM9ZBTna4B+gRR1WZqPhbJXAxPufh7E3PxMg9lm91+I2CtmQXtBxQSiZLhWRsS3tBG3/VHagTZEb5+wlqU7PULVJkFxTVkG+H727fhuCsSc2qboofj3AVqJHHqhrxwb2zk9JTEnjpCET+Kf2FmglgzSIBsOVNi2yzcv3VCTQehL3TbYDcQTGetAv3bAnOcwLbT1TsEDC166JT0AK8Lm1HQ/+FGO5jxMewDfcjXiwY1nz/t1dPtcu26x0WpeVIYDe6t7ffud7OO6AGfCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by DS0PR04MB8651.namprd04.prod.outlook.com (2603:10b6:8:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 01:37:23 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 01:37:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/spdm-utils: new package
Thread-Index: AQHaZroF8jDOclgNfEiFvDNIIQFuDLEobeIA
Date: Tue, 5 Mar 2024 01:37:23 +0000
Message-ID: <3193922b558df0a08790c9f81ea428c17ea03639.camel@wdc.com>
References: <20240224003958.21174-2-wilfred.mallawa@wdc.com>
In-Reply-To: <20240224003958.21174-2-wilfred.mallawa@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|DS0PR04MB8651:EE_
x-ms-office365-filtering-correlation-id: 22dabf6b-67c8-4b26-2488-08dc3cb4ce4a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BaFk581UnMfaMfFkSo0zQuvZBMBVcUCxhYmjP7zLGPEjkHOmgh6Nns3fRosnRAgtiqwyMCh+PIjAaaA1bGLKb+dE+oLboNWpH5DaqEuYOuJD3W5z/Y4YE0FSb39PkpkqA9MesDddgzcA02LBCiQg0/Mm/TWXM/1/586RyrDjOfv4d32sG9KrJMxbwoNEBRLC1qG6p9SpOhU9hFqWaAhSUYltQWu7PdaVLWK+XpwCM5ELhH164H2CEVV7ML3IX1UiXr7s/wypH2OYYtBHf1Oq6ZiXTR5K/4tSZfcso7FbKIBHmDFgGanBioAjSFtHTqp9IMhI8Bq68PhTeVrHnut+6DEjJV6IcgCewH2JGW3fWcU32i/9GLhlLQNf+qArdGqPh22kki9Sgs017bjG756iWdmtedXMNQIZeyhdB21rQjBuSAsDQP3QE2kFIr5tcHFM/Q3ftOW9nV2l57CXxs7gE04TCd63d03vf5tZ0lNhyWcU2oh+aCaexRs0+S+WA4Q7KdN7rc0i/+DkDiydcRBE8v4Z+ZWPus4mpc3SHbPsFNTCDofPomrxrPnKa2wFKFa8yFdSXkHVyT9dM5tZKhz1v50gXNH/fxnL6QtGKgGA5sVxKSNsN0jh43nv1n030jR/yNIqxHL4vsfQ9XxHpF/c82pBux6Bvfl0Vg6pxYfHKW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzFocjFhUzRYd0Y3VDRRTWJDVjFiKzhuZVVadXFyZFRvREFLMVVxdVIvNTdH?=
 =?utf-8?B?Yk43cnBjRnFZNU1TL2Y5ZkhwRXRkaEVPbldKc3B3eXZ6czZubHAxaTZkMWNK?=
 =?utf-8?B?Ymh0aWJnYXdtZG1JUHRXdDhEOWswMTRTV3FqSHBtNkhNQ2hTTUR5UFVGTm9U?=
 =?utf-8?B?c3ZZUFl6dktPN2h4MFA5NURPZE1GaUhHWVd5WnFNamJFNkgwUlZacjNzMUdi?=
 =?utf-8?B?NnN0dG9STHBvUGx6VXVkN1Q4N2k3SHFwd3dacTVyOHdvSGdDY0RwaTJ5L3Jm?=
 =?utf-8?B?bWxSVHlzWVZiWksyMnllWlpDR3dlQ1lkMnhRbnkyaUVSUDI3K1JyVzVsNWxG?=
 =?utf-8?B?MXcvVVNsUmllSVlmWHY2TURJb3FjMlZIMjluMTZ1UmJLWUNUU0VtUzlrSlZC?=
 =?utf-8?B?akNnVCt3N1dZbzZQcloybFdFcmNVd1UyYlkrY2dxa25abWIzTk9qRG1DdTlS?=
 =?utf-8?B?K3NTdmV6WHBQb2VIcXlpQUdUYng0bXI2OTYvY09rcmxJZnN1MzFpeGl0V3E5?=
 =?utf-8?B?MS9RVWhtSTkxK1BFZXVzUDR0dzVIdDNEcUdNd0gxYm54dlBhUGFnaGxYNGVJ?=
 =?utf-8?B?TDZJeHdHUVI2UjlHZGVMREJiSTZuWG9EWDFnZGo4VlNkNlZGTFlYaC8wTmNP?=
 =?utf-8?B?aEEvUkxhT2MzUDdib1lQU0RCaDB2dHA4SjYxQ0F2d0xGM1VJR3pGSXg0QWYy?=
 =?utf-8?B?WmZvYk14bTN2TWd0ZkgyR0pBaXJhSWZmODZmSG9MQzJtc2o5Rk9heWFJMUNS?=
 =?utf-8?B?bDdpZHhBbE55aDQweUJNNHdMb0thOXN0blptY0dVK3dIU2IydDJvU3FoTDVK?=
 =?utf-8?B?Y2F2T1Y2OVNrMnZGU3BjWmpaaU5DS0ZOV01QSVV2Vjk5UmdPR3dQaG1BVmdT?=
 =?utf-8?B?UE13VlFKSmxQdVVEendBcnN5cTExcmE2ZSs4aUxTOHZPV1I5SEVpN1diRXlp?=
 =?utf-8?B?S2tkcTFTdmpXZkRqSXhwNERBZEErQzZQeXViak45QVNMKzUya2xaTnM2NXlk?=
 =?utf-8?B?M1Y4SzArNThDditJUTFxNlNtdTJ6Z1RXYnBtdVBlVEhpbE1ZRWVhS2FoMzZJ?=
 =?utf-8?B?b0h4QjFjc3R1c2EzbU1LZjFmVFdxQkF0d1pMZzY2OTdPNGk2TjA2RDYzNGZR?=
 =?utf-8?B?Rk5BVDZTcEtSTlp3RUpKU3FBNnYzZm9YVXR0ajR3VEVHdnZsNTJ1RHFrZzRF?=
 =?utf-8?B?VzJxU0FvYWJ1bEZicFN3MURGUThIaWZDTFdsOGJ3eGxJS3JVWXlrRk50VjQv?=
 =?utf-8?B?TGVsRTVTRmhzZkRnQytxTGpFRTM2SnpRcDhPMTRTdmtPRzhoMUhKTFlyUkFD?=
 =?utf-8?B?M0h0VHR2OXArOFpjMXY4emtYZXdBa0VRakJ6cHBHcWh6VlFTeE1nWTBVZmVt?=
 =?utf-8?B?ZUhBNmxsYXVrWnAwVWpDbFJRdUkrdVNiSytSSSsvSTZiTmZUSFdpblhTSW51?=
 =?utf-8?B?S1ZFQlBhaGJabHI3Ly8zUkZId0J0ME4xb0tqMHd2R3hZSjZ3YzhuMVIxMk5L?=
 =?utf-8?B?eGVva213RGVlNm9kSWZTbGNFNWIwbENUZXd5R0xmZHRQTXFvUXVSdWQrRmpk?=
 =?utf-8?B?QVFkNmt4YWZwTWw2L2JZQmk5V0EvU3c2WEhMWW1hUXB0YkRDSmhNQkVhMUFl?=
 =?utf-8?B?SkVYV3B6bWZzUloydUQrK3BqTjJIY1JBU2RBZFdRb2NYeDB5Q1BCUFQ3QnpJ?=
 =?utf-8?B?Zkt6SDY5Rng4N3JRUytuZjdObFl2SWVmajU2eEV5emU1U0pTWjNuQkNGZ0E2?=
 =?utf-8?B?OEZTUEl2MGR3RlgyUHdQQm1UWHFnUG1HcW1mTEloMEczMkNJTEQvaXhsN0Rr?=
 =?utf-8?B?U0lmN0E0Rzl0aDZyMHRqU3g4S1c1WEs5NDYxSWpsQkJnWEdhSWxnUjZSSzVE?=
 =?utf-8?B?bFM5NVNreGttbG5laklMTWRiQnhTZVFmc05CUGpnOVJIRUQyTGV1aVljVlBK?=
 =?utf-8?B?NGY5YTFlallxY2lHRFVwWXRmRnNZY0QzQ1dDUm1xcXNzUldJc3VmTnRtWEpM?=
 =?utf-8?B?azdld0YyNEJ2Um9kNmZ2Uys5UmN1ZG94cjhPMVJMV3lkLzFtV25hZXdTOVBz?=
 =?utf-8?B?dEYrajNYMmprK2lwRFFJV3ZQUTNiOTJSN0JITW8ySzgzMnh1L2ZiMzlNYTEy?=
 =?utf-8?B?aUR1dEhKV3BlNG55QXVxb212MFUyZUlOdHpXdTJENVh4SzZRMDJJQUdKQ0lx?=
 =?utf-8?B?eGc9PQ==?=
Content-ID: <FE483AFE8785DD4D90AA6799D22B8784@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: flCGy8ikcToLI2FA2EnKGzAzD8Ij/Hv+6vALwxSnQygnaITj4vFkprDY3Bt7b3toxilhBH8Vn1qJniVFxzDplixza4M2QE/T4C5qN2EnfdA4so065B2UBsg7mL1TyT0HboTYlg23XmtDR6iNr0s3lxfPWxG5kAUErB/r5iHl0j76krtHkQ0UScTOgvQ2MFs5KrlfLOtVgvPGJGRyekLtUUy4PcItGKOZp26MTQqG24eOcP3JsLnplqnEM90zvNALg9VXhIGjf6rlAvQQiLp3WTlBAMblqSFh0n13Tm7nOJCn9lXsqHXHeMt94FD83nmR9sEdVPDPw+yQbZE0JFeSpFmsO3VNEQyYnZZqa4zrkvssDWD5w7BsBJUgRxTcnwHuotcnr7xc2rdBD5G1HT7HfzZZIVFXFwt1B4ZBKm1c0Mw4q7q5zaHUvD+OARJVrSaJjIBGe5D34ogpTq1f/NALtRbfcWQgB2EQMXYSZ9bTOixqIWgcXFpDB710RIIDtCaMIFaMZNGuowaFJAByD1uLimuLf2gyefAaRSZNDSMWllXqJqzPsnOoigJA8MCqXxOjUVG9Tqgog3FuUBZG8kaZUYGH6o1YmpqgEE4z7Kux7/yZ/yvr9myRB74LMugDsdHS
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22dabf6b-67c8-4b26-2488-08dc3cb4ce4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 01:37:23.2031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TkQt1oPEGwvYD8qY+yLGhRd6Xs7dfbyoM+ilvpWIqqlXA4UX9TRgZY1wtZzWWxZnjZfkGxSMRPjV82MM8/Ol2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB8651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1709602649; x=1741138649;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=iizen8zqRlFXXhGLwhvf+jvyKruY3emvmMIsEkQNRas=;
 b=kmFv5Mp4K6+BBC4mKXV80+0aW2OC55pc4BBAeaoz+a+XctEsQIIY+9e9
 9y+cU/Ck4nsObmigAcE1eav4wP9mmeKKv52tZwk+fMH+4EtiduWzYo8VK
 2EsYl5TOwkZr+16zKlo5ZXZ1lcNq0kF9UkcP/jCJ9UoAP143Eg3zhz5mm
 ZW34jMcRv42s5C7+01sOL6Ynzx2TWMDSSC+iZdQ+SbDdO7FziCrv7v3tm
 CiDT6WY/LCWSsI8DHRbkxzVT+U4haI8E9nfZuoCUhmDsjsILUN3D2ZcIC
 vh8awvonT9nf7Kkecf3mpdHY1vDIx9V23RAadCEDFNNj9jwhfamQVpOCG
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iizen8zqRlFXXhGLwhvf+jvyKruY3emvmMIsEkQNRas=;
 b=XCbWFPdtx/RkWPeZRNuDUwAki1tpg6bXanEMb02I569DTNjHt9jaJ6VeLWBNFDiXGooJdUD2SAlE1WDD9r1GXp8xsYUCu37OrCovWmfclkOYGSrCD7SnzaPRzzc1NUb/HOTxfx4ICCxD2roz1BwvuStslZ4uJuSbWrk5y+SwWko=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kmFv5Mp4; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=XCbWFPdt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGluZyA6KQ0KDQpPbiBTYXQsIDIwMjQtMDItMjQgYXQgMTA6MzkgKzEwMDAsIFdpbGZyZWQgTWFs
bGF3YSB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIu
ZnJhbmNpc0B3ZGMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZy
ZWQubWFsbGF3YUB3ZGMuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiBWMjoNCj4gCS0gRml4ZXMg
ZXJyb3JzIGZvdW5kIGJ5IGBjaGVjay1wYWNrYWdlYA0KPiAtLS0NCj4gwqBwYWNrYWdlL0NvbmZp
Zy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiDCoHBhY2th
Z2Uvc3BkbS11dGlscy9Db25maWcuaW7CoMKgwqDCoMKgwqAgfCAyMCArKysrKysrKysrKysrKysr
KysNCj4gwqBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5oYXNoIHzCoCAyICsrDQo+IMKg
cGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMubWvCoMKgIHwgMzQNCj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCsp
DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW4NCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMuaGFzaA0K
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5taw0K
PiANCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4N
Cj4gaW5kZXggYmYwZmUwNzhiOS4uMzM3YzY4NzI1ZiAxMDA2NDQNCj4gLS0tIGEvcGFja2FnZS9D
b25maWcuaW4NCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4NCj4gQEAgLTI2OTYsNiArMjY5Niw3
IEBAIGNvbW1lbnQgIlV0aWxpdGllcyINCj4gwqAJc291cmNlICJwYWNrYWdlL3NjcmVlbi9Db25m
aWcuaW4iDQo+IMKgCXNvdXJjZSAicGFja2FnZS9zY3JlZW5mZXRjaC9Db25maWcuaW4iDQo+IMKg
CXNvdXJjZSAicGFja2FnZS9zZXhwZWN0L0NvbmZpZy5pbiINCj4gKwlzb3VyY2UgInBhY2thZ2Uv
c3BkbS11dGlscy9Db25maWcuaW4iDQo+IMKgCXNvdXJjZSAicGFja2FnZS9zdWRvL0NvbmZpZy5p
biINCj4gwqAJc291cmNlICJwYWNrYWdlL3Rlcm1pbm9sb2d5L0NvbmZpZy5pbiINCj4gwqAJc291
cmNlICJwYWNrYWdlL3RpbWUvQ29uZmlnLmluIg0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcGRt
LXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3BkbS0NCj4gdXRpbHMvQ29uZmlnLmluDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjk3ZGJjNTFjNmQNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9wYWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluDQo+IEBAIC0w
LDAgKzEsMjAgQEANCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9TUERNX1VUSUxTDQo+ICsJYm9vbCAi
c3BkbS11dGlscyINCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VU
X0FSQ0hfU1VQUE9SVFMNCj4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBldWRldg0KPiAr
CWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUw0KPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUg
IyBldWRldg0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDDQo+ICsJc2VsZWN0IEJS
Ml9QQUNLQUdFX09QRU5TU0wNCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUENJVVRJTFMNCj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfRVVERVYNCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OMw0K
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTUERNDQo+ICsJaGVscA0KPiArCcKgIFNQRE0tVXRp
bHMgaXMgYSBMaW51eCBhcHBsaWNhdGlvbiBkZXNpZ25lZCB0byBzdXBwb3J0LA0KPiArCcKgIHRl
c3QgYW5kIGRldmVsb3AgU1BETSByZXF1ZXN0ZXJzIGFuZCByZXNwb25kZXJzLg0KPiArCcKgIFNQ
RE0tVXRpbHMgdXNlcyBsaWJzcGRtIGFzIHRoZSBiYWNrZW5kIHRvIHBlcmZvcm0gU1BETQ0KPiAr
CcKgIGNvbW11bmljYXRpb24uIFNQRE0tVXRpbHMgY3VycmVudGx5IHN1cHBvcnRzIHRoZQ0KPiAr
CcKgIFBDSWUgRGF0YSBPYmplY3QgRXhjaGFuZ2UgKERPRSkgQ2FwYWJpbGl0eS4NCj4gKw0KPiAr
CcKgIGh0dHBzOi8vZ2l0aHViLmNvbS93ZXN0ZXJuZGlnaXRhbGNvcnBvcmF0aW9uL3NwZG0tdXRp
bHMNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLmhhc2ggYi9w
YWNrYWdlL3NwZG0tDQo+IHV0aWxzL3NwZG0tdXRpbHMuaGFzaA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4wZDQyNDkxM2YyDQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRpbHMuaGFzaA0KPiBAQCAtMCwwICsxLDIg
QEANCj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkDQo+ICtzaGEyNTbCoA0KPiA0YmI1YWM4MGNjYWMz
OTI4YTZiNmQxNTI2NmUyNjBiYmMxMDNkMDdjNTQzYjA1NDY2NGFhYzQyYTU0NzJiN2E2wqANCj4g
c3BkbS11dGlscy0wLjEuMS50YXIuZ3oNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGls
cy9zcGRtLXV0aWxzLm1rIGIvcGFja2FnZS9zcGRtLQ0KPiB1dGlscy9zcGRtLXV0aWxzLm1rDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjc1NzRlYTliMTENCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9wYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5taw0K
PiBAQCAtMCwwICsxLDM0IEBADQo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAjIyMjIyMjIyMjIyMNCj4gKyMN
Cj4gKyMgc3BkbS11dGlscw0KPiArIw0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gIyMjIyMjIyMjIyMjDQo+
ICsNCj4gK1NQRE1fVVRJTFNfVkVSU0lPTiA9IDAuMS4xDQo+ICtTUERNX1VUSUxTX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLHdlc3Rlcm5kaWdpdGFsY29ycG9yYXRpb24sc3BkbS0NCj4gdXRpbHMsdiQo
U1BETV9VVElMU19WRVJTSU9OKSkNCj4gK1NQRE1fVVRJTFNfTElDRU5TRSA9IEFwYWNoZS0yLjAg
b3IgTUlUDQo+ICtTUERNX1VUSUxTX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gU1BETV9V
VElMU19JTlNUQUxMX0NFUlRTDQo+ICtTUERNX1VUSUxTX0RFUEVOREVOQ0lFUyArPSBwY2l1dGls
cyBsaWJzcGRtIG9wZW5zc2wNCj4gKw0KPiArIyBGb3JjZSBQeU8zIHRvIGNvbmZpZ3VyZSBhcyBh
IGNyb3NzLWNvbXBpbGF0aW9uDQo+ICtleHBvcnQgUFlPM19DUk9TUz0xDQo+ICsNCj4gK2RlZmlu
ZSBTUERNX1VUSUxTX0lOU1RBTExfQ0VSVFMNCj4gKwkkKElOU1RBTEwpIC1kIC1tIDA3NTUgJChU
QVJHRVRfRElSKS9yb290L2NlcnRzDQo+ICsJY3AgLXIgJChARCkvY2VydHMvZ2VuZXJhdGVfY2Vy
dHMuc2gNCj4gJChUQVJHRVRfRElSKS9yb290L2NlcnRzLw0KPiArCWNwIC1yICQoQEQpL2NlcnRz
L29wZW5zc2wtYWxpYXMuY25mDQo+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy8NCj4gKwljcCAt
ciAkKEBEKS9jZXJ0cy9vcGVuc3NsLmNuZiAkKFRBUkdFVF9ESVIpL3Jvb3QvY2VydHMvDQo+ICsJ
Y3AgLXIgJChARCkvY2VydHMvc2V0dXBfY2VydHMuc2ggJChUQVJHRVRfRElSKS9yb290L2NlcnRz
Lw0KPiArDQo+ICsJJChJTlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0
cy9zbG90MA0KPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2ltbXV0YWJsZS5kZXINCj4gJChUQVJH
RVRfRElSKS9yb290L2NlcnRzL3Nsb3QwDQo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2aWNl
LmNlcnQuZGVyDQo+ICQoVEFSR0VUX0RJUikvcm9vdC9jZXJ0cy9zbG90MA0KPiArCWNwICQoQEQp
L2NlcnRzL3Nsb3QwL2RldmljZS5kZXINCj4gJChUQVJHRVRfRElSKS9yb290L2NlcnRzL3Nsb3Qw
DQo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvZGV2aWNlLmtleQ0KPiAkKFRBUkdFVF9ESVIpL3Jv
b3QvY2VydHMvc2xvdDANCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9wYXJhbS5wZW0NCj4gJChU
QVJHRVRfRElSKS9yb290L2NlcnRzL3Nsb3QwDQo+ICsNCj4gKwkkKElOU1RBTEwpIC1kIC1tIDA3
NTUgJChUQVJHRVRfRElSKS9yb290L21hbmlmZXN0DQo+ICsJY3AgJChARCkvbWFuaWZlc3QvbWFu
aWZlc3Qub3V0LmNib3INCj4gJChUQVJHRVRfRElSKS9yb290L21hbmlmZXN0DQo+ICtlbmRlZg0K
PiArDQo+ICskKGV2YWwgJChjYXJnby1wYWNrYWdlKSkNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
