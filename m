Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D0C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E544881334;
	Tue,  7 Mar 2023 09:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E544881334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srGL8S76pYi7; Tue,  7 Mar 2023 09:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215D681311;
	Tue,  7 Mar 2023 09:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215D681311
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAE371BF255
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1C2380E93
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C2380E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oI__wPryhq9 for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:19:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC0F81311
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EC0F81311
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 09:19:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,240,1673884800"; d="scan'208";a="329331522"
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 17:19:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqnHr4p9pTR07fGLDxkB7bVr7ARFcRkEFTY8aEuIY1V7dYEWilPVXytANH3ZGZ19J4spKdbV6V7SJvCT/jr8TO31URO4n3USFlGdmIZRYLuIXEgx/GZigckyYxcnDCGo4uLxPPadzgpWrLJNdBtPLIapZyDiBOG1EUGSN78q4x/LUvBSouaEbeQesS9mA6wt5skV0nKptaBQXBOX8Ee0WHQtmjgkjyKmZ5j7EG9islVzY/a2Qf53QjpRtenAuQwhmcikt2dDThrvpmVXiIhzN3XKOF/3t/+oOLURsESVvPqVSOurTiZvA5UkOlDa7TrMGwlp2ebQwm6Da1jqJi7MxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dY8gzYnY8ao97biE4F143w72OlaaF9fr9LQD5WIyiw=;
 b=nM9iy0hrcgJ9/vhWAdzsmLrqpcnZKGHHc0Yl+8JosIfa1br3xUDo9HZMZChFn+ayFxDIbQlo8/RJZWQEQto8Qb0CQO+/P0piVnFkk+HFMBVJ+uxNA0bkyacBzbjPQFuNYReRBSBHfH5eBYbMIIQVHNS6izZl8K9AjgnL154ZLWZpxN1BUzGKz7AuVUcOnBtm9VY1LJVT+zvMTZ0fzlYUFMKJkYmCO0bKRdz1uCaGhynNpE+mIM4eN7Bi9//IE/FvFzEmwT4CevhzIouEUMiVZqfesY+eFXL5EOc9aC8psScWW5CncygHDt62mgPKPQ1LfzSCV+oy6l28eW6bJKmSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by BN6PR04MB0514.namprd04.prod.outlook.com (2603:10b6:404:97::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 09:19:22 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::4fcf:ae46:b9c4:127a]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::4fcf:ae46:b9c4:127a%7]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 09:19:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Romain Naour
 <romain.naour@gmail.com>, Dick Olsson <hi@senzilla.io>, Damien Le Moal
 <damien.lemoal@opensource.wdc.com>
Thread-Topic: [PATCH v2 0/3] misc aarch64-sbsa cleanups
Thread-Index: AQHZTcrmnqzEG/qRwU+iGnvqmc2xUa7uA16AgAEM2YA=
Date: Tue, 7 Mar 2023 09:19:22 +0000
Message-ID: <ZAcBmTbMs6+R+zhO@x1-carbon>
References: <20230303122251.3392998-1-niklas.cassel@wdc.com>
 <ZAYgE/KtpjD+PCby@debian>
In-Reply-To: <ZAYgE/KtpjD+PCby@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|BN6PR04MB0514:EE_
x-ms-office365-filtering-correlation-id: 40b21f65-4ae9-4c55-45b3-08db1eed09dc
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DOh1UwOM4f3qEHJOiqjVhv9oaLPR1Ay6jvmdY2C8SgBerDbFBX2kZS2g0q7buRcefL5syM7TIxs7++J3INsxdaeke7kXjl81BPYTXoL+113jkIlC4BVjFw5prImvRU4diu/IgHA4DFNuxypeEYINPNWmkiIM94dQeGeBuAkxCYtqMSvPEKjK0JZBDhgyG2jbJEboEhAf7gLo0XdPKsi11hecOkRPjcpozoQbIEXACVdXMtZF8wDAjo3d7rvEmVRLpwzB9RvCHCkgJHcRcz8O9gy32d1VPi9KF0VFNO6lLuBxpRc7B+epKr9hFxmwqIB7nAfQHn+2K14fTCIaO2va2exPnZXCt/9qWkcgbu/088unJMVddw+gNf70WLnTyLflM+ahzpnImS6JjTEyAVRY1Z2nzayqAxDwEAMMAMFfB7pNO9MaBDPurox/BRoKoc1qfGDOV0oBCV5bHMFj9Cm1a406ioVnL157w6+FOVfPa0n2FTnAUqFN0nY8bg7mM99hI2lPNRr7csR/Y7FpyeoVGW/X7Ov7CDjsj0Xu7KXNiK1schaUzAvMw52G9FpohtJ/DOKJKpNhWKidiTtW7Ljo1roxM5T31sAZJoOsgzcex00q9J7vudnhy2kKfvq//mN5jKPiZcoRLilsO2B0g00EKvCMXCtqLGZHa36CAgdEe+1Eb95gdGjEqAisCyWlCafH5H5nw0TfHJtQ1wxameNvcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6272.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(2906002)(38100700002)(122000001)(186003)(26005)(82960400001)(9686003)(6506007)(6512007)(38070700005)(91956017)(66446008)(66476007)(76116006)(66556008)(66946007)(478600001)(5660300002)(8936002)(6486002)(64756008)(41300700001)(33716001)(71200400001)(66574015)(110136005)(316002)(8676002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG9laWV2bGRKZEdHUTcyblRwbmZXSzZBbVJ3VkxGR0Z4M1dMVGVsbEJxZ1U5?=
 =?utf-8?B?bHE1aXlPSlV6a0ZDR0RYYTNVVVdrVjd6Y1UzSGw2Tmx1b2ZkaWU2dmI5OER1?=
 =?utf-8?B?NWFUQWcyZnRpRmJrTThmR0hGemx5bldZYm5PWWZIaUVjYWNKanJzVnhScnVM?=
 =?utf-8?B?Wkx0UXpqWEhBOHdzV1RNaHBONzlRYktMUHVFbnVCektsWUxpT1BxaHRhVEIr?=
 =?utf-8?B?MWlMc2EyR1NscTFCY0JwL3FRWUt6RG9LNnpuenc3TEZIWUtpYXJFU0lhUVJE?=
 =?utf-8?B?aENJQ3RSNFhvQ0tzRnFFOU02NHZVUzAzSFYyM042ODRDZGhHYzEzMnh2a0NF?=
 =?utf-8?B?MmRnWmpLYk01WmdzRTU4T1ZGeXhkVDE1V20zdFhITUJvejFxSDhkOFVDeEph?=
 =?utf-8?B?b09PUGNFdk1waXdyRFd1dk8zT2tQWE1vVHc3dUFUN3lHQ2JDK0pIV21kc1V2?=
 =?utf-8?B?SVY0TGx0aW40YUVBeTE4dDNFeHl0WVBuODdUT1ZJUXprbEM5TWtXbktmcVo2?=
 =?utf-8?B?bENPZjdGNEdjUkZMQjFPeTkwZVFkVFJJY2gxaHo0S3dvcDJyM1ppN1NKMHBi?=
 =?utf-8?B?VFVKRWkrZmJOelE2NXJEcFN2djNoQjA2NTlEYnd2NDRUV25IMmxEQnlpUVBX?=
 =?utf-8?B?TXZiNUtSU2MzNlpEdnEzbkhtY0lzdTlXMlprTi9ka3hxcjh3RWdJYkYyL3pI?=
 =?utf-8?B?RGFvcDBjbmNlc1o0K1FEMHFRN3oreXpDZ1JTVkZGM3hVRGJxQ3pDaEl2OVZs?=
 =?utf-8?B?Yng4RGNPZkJhSmlFVEtmUTRVVHJ4S2ZZSEVIbkZrTk5sVG5xTzlVSzJUeHcz?=
 =?utf-8?B?UEhkQ0c1ZXdDTjJKdGlmbnRvb2pRQTNwdTZHbUhEaGo5YnN5TlNKSjNUNlg0?=
 =?utf-8?B?VVFpTW9TSmN4QnluaXJOY0dzbkhPb2I5M25HUllkOTFzNUxpamxLS2tuN0pk?=
 =?utf-8?B?Skxmb0NpK3dqQjJQeE5PbUJ6RWRUSjNBcVBxNUREOUE1Z3hpV0tlbS9USFB3?=
 =?utf-8?B?Uk9oSzd2dy9naFNyUzFTTjN4MHREeVJjMlg1MVZXejRyTWs3eGpJc055U0FJ?=
 =?utf-8?B?aEF1Qlh5UGJkbWtIdEFDVWFQdUJYeWVLK3BDcHFHeEJSZUJEK1N5MGR1Sy96?=
 =?utf-8?B?eGM2c0VJbDdGRSt3RGdEYThqSmNIWWdCR0xzN0tNWUx4L0JtUEpCRmFYMEM3?=
 =?utf-8?B?WW5xd1J4aTJxcGR3SHUyY0pGWlJ5dnJKQUVSL1F0TGIyR2N6cjhKS3pLU0tJ?=
 =?utf-8?B?WlZMemhPSzRScDE5bUNiREU4cG9hUmxkWDJsU0U2TDhBMjlrYmduM2djUS8y?=
 =?utf-8?B?UkoraGN1eTBpaGMvTmZDb290R2RqelV3eVhWbW4xSkg3Y2g4YWhzSzErYjhJ?=
 =?utf-8?B?b1J2ZnVBKzhzS1BjWFU3UXcxTll4Z2dqVzhRek5QNmpXNUF5Um5VdDdySmFT?=
 =?utf-8?B?a1ZCQ0Z3YWZwZzZxM0VqZUdra1FmejZOK0RSTmY5RTNBQXN5RFpsSnphVmp6?=
 =?utf-8?B?TldtQ25BLzZUOWdzOW85dnFBMGJjaTFnZHRCNnJZMnM2LzdtOUUxUllxRURQ?=
 =?utf-8?B?cHl6TTVpa3M0NHp6c1B0a3V1OHZZS1d6SVBlNzlLK0F1TllwWjFKNVA4YWpi?=
 =?utf-8?B?TVQ4cEFyV2g1b3p0cXhXVFFTWENQTExPNjk0bE5GSjJleE9wbUIxRHZEdkVT?=
 =?utf-8?B?UjdnWC8wbk94cTFocVpnbThWekt0RG9KLzhqMlp4L3ozVytHQm40VmNrZUVJ?=
 =?utf-8?B?di9qb3pmSkdWUmhDajUwWjVDT3lreW1FVE84aWFaZ1c1WG5uWmhZMzRLWlZ0?=
 =?utf-8?B?VHZxSHlqOEt4bkR3YWd1ekgzd3ZUQnBuQzdCeStRMEdhbGowVWNKbWRYY210?=
 =?utf-8?B?YjFvbVRoWmcvSGc4Z0xQbndtZDhaUEUwRmVKVFlzUWhMc1R5VXVmYm5iSW5j?=
 =?utf-8?B?SGZaUjNDRXNKSCtXZU1ZUUFmN2g5TkdoQlA2SmQrTmN2SlFLeTl5Sy9nNVpr?=
 =?utf-8?B?ZTRCWUFQREpPcnJqclc5YittbFlNZTIxNGx3ZUhWRXVrbkVKK3l3ZEVRM3dx?=
 =?utf-8?B?aXZDa1R5b3ZrTXNGaFZCMFM4dkJKa05YTCs1a0FucXBReUtwTVV4UzhiTVVt?=
 =?utf-8?B?bmgwYk1TaTgva2tyU2sycm95UWJyUlVFeW1wMktJajZjcE9yVjFnSldjcS9U?=
 =?utf-8?B?Znc9PQ==?=
Content-ID: <6C3EBCC943C47A4AA5196BB58A2F68B2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JvuhxiaIj105s7c5eQ+heKZ3lZXLWHuSweIoN28abIJTOHngdO6Z4G1o8VydSGQXVSX1UW+Zatl4yj6WWCPvwsurTdVD8yaCWUtcGYoi3kfYczLCRNvWCCA8YaqGszxx2ey2qluTA0ArSvqfPKEPSk57vbuOcboEnw6BMWWGnIoZMQ4z+SbperUq33wR4/mFZ9yliyLCJhJ9mkWHOl09nCDXM4/UHZ7/pov02OQ2MZ9msrA+/zzXH0slKuf0sLOv8MCe8NwNWVKEW+bJ7OK2Rm01eQUCNYlxA1yaHh9zYZfP5rNxLrShbCdFPEYOjlMjq6UyWxoEJvFUyc36kNOQdmQgkO0OowVkmivztVLhGskKVMdZOm9V5UFnNUvBAjereDfesi4yKlbWPr1XqoMM44ywhJhoS+Ni/eKjZtiJP9vWkhuPZzvWmJdutk/x48fQIeaCQmvoOXOp5fsLZpzJY+kKBHWhJAUCFL25rCgO1YMhjWKvAW2zaUUIGpAsUcmNTNPL4M0kKAYy90lnUf0m1XR1d0c78JLetH1JapiQDLlDgVBeEImKdWnCTk/NZckOzo0+/hglfTwoh+viq8CwrIab+k4A2b4pjeVA5aMeYOEl9h9K36GZVJ7uujhow8h2/yDfQXZMH47YKX6SiZM2CZp0PjgI5preu+zMnmIDji0NLscn9SF8VCkMetxxRc5uvAG7m6oBlmQWdMhaYfFIYTnQ3p8ehIuK0kZ/v0vvMjmtXt1a53NNyfnuz0YgfLg494cS9acDODVnOy+dqjf+SccGpPPXevFy11W8wb8jAu2Ap4lLWmlTQJac0AIouLbCo5E0dYYAW2aUIO3k7QLeSQ==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b21f65-4ae9-4c55-45b3-08db1eed09dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 09:19:22.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJGLGqCe6IxgOAJhqBnMyqRqBFhJivYWFAMSGVgLPUca9sFbMMaeOalyesT+kUB/9S2PQqYTVdoBCaap8EOqHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678180768; x=1709716768;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+dY8gzYnY8ao97biE4F143w72OlaaF9fr9LQD5WIyiw=;
 b=NiW3c3TNpBhwDAHrTg/3kzlVFzblblg+TZvy5vNUIrrJDjdgNYx6Bn0h
 K/kdfpTvMnD59zJepZd5NKuFnEbF64obRbJ7mblaP9gT/iSFo7/6hCyeO
 ar+AZnU/GbDAgp7aHlGZ7nxEfpebm03DkqNejFy9hKk6uEFscYtig6g7t
 0k91NqBjnREhnRoKS8d1AsWD7+a+9knPXRTmj+2eiw99Fp6hzxQanBySR
 WxsgXFLjl8gR3kO+Ck1r/xm06EVjizNBCnepXS2jvAfkNOHKpHzv0vv0x
 dCIpZn3Xj1lQxLFvkCbSGWTpkeiIIauSU3au8Ou6Ie78AKt0tlUi/kuQo
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dY8gzYnY8ao97biE4F143w72OlaaF9fr9LQD5WIyiw=;
 b=zKBRc8WKviTwTniAJPXswN2pJyNpLmjPeyHBTLBZDv6dTrTi//u62LeTmUAcXs8ZDEVlQURGfc0Wlf01UMNNeuGVv8jlhCdHbXUe+AIIuZsW0XiKFcqP1DM4G+uKdgqJeEpdUsVEMy9VheEmKV2Pi1JWpGlBrm3mj+G97T4gSx0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=NiW3c3TN; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=zKBRc8WK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 0/3] misc aarch64-sbsa cleanups
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBNYXIgMDYsIDIwMjMgYXQgMDY6MTc6MDdQTSArMDEwMCwgVmluY2VudCBTdGVobMOp
IHdyb3RlOg0KPiBPbiBGcmksIE1hciAwMywgMjAyMyBhdCAwMToyMjo0OFBNICswMTAwLCBOaWts
YXMgQ2Fzc2VsIHdyb3RlOg0KPiA+IEhlbGxvLA0KPiA+IA0KPiA+IEhlcmUgY29tZSBzb21lIHNt
YWxsIGFhcmNoNjQtc2JzYSBjbGVhbnVwcy4NCj4gPiBQbGVhc2UgY29uc2lkZXIgZm9yIGluY2x1
c2lvbi4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiA+IC1Nb2RpZmllZCB0ZXN0X2Vk
azIucHkgdG8gdXNlIHRoZSBzYW1lIGtlcm5lbCBjb25maWcgYXMNCj4gPiAgcWVtdV9hYXJjaDY0
X3Nic2FfZGVmY29uZmlnLiAoVGhhbmtzIFZpbmNlbnQuKQ0KPiANCj4gSGkgTmlrbGFzLA0KPiAN
Cj4gVGhhbmtzIGZvciBmaXhpbmcgdGhhdC4NCj4gDQo+IEkgdGVzdGVkIHRoaXMgdjIgcGF0Y2gg
c2VyaWVzIG9uIG1hc3RlciBhbmQgbmV4dDogdGhlDQo+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNv
bmZpZyBhbmQgdGhlIGVkazIgdW5pdCB0ZXN0IHdvcmsgZm9yIG1lLg0KPiANCj4gVGhlIGVkazIg
dW5pdCB0ZXN0IGlzIHNsb3dlciBkdWUgdG8gdGhlIG1vcmUgY29tcGxldGUga2VybmVsIGNvbmZp
ZyBhbmQgdGhpcw0KPiBicmVha3MgdGhlIENJIG9uIGdpdGxhYi4gTWF5YmUgd2Ugc2hvdWxkIGxl
YXZlIHRoZSByZWR1Y2VkIGtlcm5lbCBjb25maWcgZm9yIHRoZQ0KPiB1bml0IHRlc3QgYXMgaXQg
aXMgYWZ0ZXIgYWxsPyBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBleHRlbmQgdGhlIHRpbWVv
dXQsDQo+IHNvbWVob3csIGJ1dCBJIGRvbid0IGtub3cgaWYgdW5pdCB0ZXN0cyBsb25nZXIgdGhh
biBhbiBob3VyIGFyZSBkZXNpcmFibGUuDQoNClRoZSBjb25maWcgYWxyZWFkeSBsb29rZWQgbGlr
ZSBpdCBpbmNsdWRlZCBhIGJ1bmNoIG9mIHVubmVjZXNzYXJ5IHN0dWZmIHRvIG1lLA0KZS5nLiBD
T05GSUdfRFJNLCBDT05GSUdfRFJNX1ZJUlRJT19HUFUsIENPTkZJR19ORVRERVZJQ0VTLCBDT05G
SUdfSU5FVCwNCkNPTkZJR19JUF9NVUxUSUNBU1QsIENPTkZJR19JUF9BRFZBTkNFRF9ST1VURVIs
IENPTkZJR19ORVRfU0NIRUQsDQpDT05GSUdfU0NTSV9WSVJUSU8sIENPTkZJR19WSVJUSU9fQkxL
LCBDT05GSUdfVklSVElPX0ZTLCBDT05GSUdfRlVTRV9GUy4NCg0KTm9uZSBvZiB3aGljaCBzaG91
bGQgYmUgbmVlZGVkIHRvIGRvIHdoYXQgdGVzdF9lZGsyLnB5IGFjdHVhbGx5IHRlc3RzDQoodGhh
dCB3ZSBnZXQgTGludXggdG8gYm9vdCBhbGwgdGhlIHdheSB0byBhICJsb2dpbjogIiBwcm9tcHQp
Lg0KDQoNClFFTVUgaXMgZXhlY3V0ZWQgd2l0aDoNCi1kaXNwbGF5IG5vbmUNCm5vIHNvIG5lZWQg
Zm9yIGFueSBEUk0uDQoNCi1oZGEgey4uLn0vZGlzay5pbWcNCndoaWNoIHdpbGwgZW11bGF0ZSBh
IGRyaXZlIGF0IEFUQSBsZXZlbCwgc28gcG9pbnRsZXNzIHRvIGVuYWJsZSBhbGwgdGhlIHZpcnRp
bw0KS2NvbmZpZ3MuDQoNClRoZSBidWlsZHJvb3QgY29uZmlnIGRlZmluZWQgaW4gdGVzdF9lZGsy
LnB5IGRvZXMgbm90IHNldCBCUjJfU1lTVEVNX0RIQ1AsDQpzbyBubyBuZWVkIGZvciBhbnkgbmV0
d29yayBLY29uZmlncy4NCg0KDQpCdXQgSSBhZ3JlZSB3aXRoIHlvdSwgaXQncyBiZXR0ZXIgdG8g
a2VlcCB0aGlzIGV4aXN0aW5nIGNvbmZpZyByYXRoZXIgdGhhbg0KZXh0ZW5kaW5nIHRoZSB1bml0
IHRlc3QgdGltZW91dC4NCg0KSSB3aWxsIHNlbmQgYSB2MyB3aGljaCBzaW1wbHkgbW92ZXMgdGhl
IGNvbmZpZyBmaWxlLg0KDQoNCktpbmQgcmVnYXJkcywNCk5pa2xhcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
