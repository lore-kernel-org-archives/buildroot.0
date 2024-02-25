Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B3C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2F9B81959;
	Sun, 25 Feb 2024 22:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9K2x_PIGCmVH; Sun, 25 Feb 2024 22:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 712C98196A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712C98196A;
	Sun, 25 Feb 2024 22:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0E7D1BF40F
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E5E74066C
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVfUQOvC2sys for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=77804f0f4=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E5BC4066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5BC4066B
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E5BC4066B
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:57:56 +0000 (UTC)
X-CSE-ConnectionGUID: k+8CX8HMRDCAnqDdLUqneg==
X-CSE-MsgGUID: GmzSV4d0TaWOzlGmSpdLtw==
X-IronPort-AV: E=Sophos;i="6.06,185,1705334400"; d="scan'208";a="10016877"
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hgst.iphmx.com with ESMTP; 26 Feb 2024 06:57:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDLUnC9b3+yNT3hh7dG83b9muy1HrdY9E4UaSYC4am2VIGStZoGHAt6DuT+lCTFOv9Q3O5wr5eLou82MbPV6QHhB3k5kolRLI9O3GKNzxdw6lWmXfjHZpMFhcuXh6nXVDFATKy0h8Cyl9dQn7NlocKkhVLLdP0UoQ7LFekfePUUW+6jU16np8VbYPnc97cDHE3WyZ5opQE1ijWLDNvSjGPYQMynaIx5CI8dI8WO94cdcusHZ+7FklZn9qTPTaB4egcYn82drpbaX/5BMcKc9/RTa4xaDgLhB1CIiP6yt1VjWj4DR2xvImJFqM2Fe/nXfVJVpgCu4KT5kmY/RN7gpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsc2S58x4lcr62ITG5zojGPVORr83HjAQIM52GEkQBc=;
 b=eJbKSNLNqdkEyKzGs9CuMGE3mK5zaSarTNjSlDGJBXVJRpCXMd2FZ+EflsftNYynuNrnRbOHUAZUVAytN3jpi63fZh82katD9sllz+ikRvaljhiGlT6mV/poctLtb8pSjrhl80cv50cOwErSnTEbhLacGuLnSBYlmsyxDzymgQyj/MCJnEz84XGQfqhWlUAZ5aOoLcOK5GWCo49oSmtdhNrLrHcklyV7aPw5i/8HZAk9zXSYo6dyMT7r/0m2JgnbLNT11FnWF8+JQ63nwY4V+2SSnA8XVKqWuOfaLyE6uhD2mTx0/D6VOeWJzcY0XS8h/w2qMryQRzxjxQGFSiuKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by BN0PR04MB8208.namprd04.prod.outlook.com (2603:10b6:408:144::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Sun, 25 Feb
 2024 22:57:53 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::683c:8dc7:bbf7:1560%7]) with mapi id 15.20.7316.032; Sun, 25 Feb 2024
 22:57:53 +0000
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.2.0
Thread-Index: AQHaZF8asLkNcT4zKE22KAQGdlcUmLEVFCeAgAafOgA=
Date: Sun, 25 Feb 2024 22:57:53 +0000
Message-ID: <d11787201c6f11dfc67aa33d30bcdc07f7ad48d5.camel@wdc.com>
References: <20240221004400.27429-1-wilfred.mallawa@wdc.com>
 <ZdY34dDgt1oNPx5n@landeda>
In-Reply-To: <ZdY34dDgt1oNPx5n@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|BN0PR04MB8208:EE_
x-ms-office365-filtering-correlation-id: b2c5a733-e0a0-46ed-c338-08dc365532bd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RP4aHJAIWiefis7Dhnd2Qqdkx1P62Fium5fzxeqimyFju3lCbAcCvMxPrN2dToKdfySzIWUHO7adFOQVjwt7o7PlzlAiBzJIiSOlArYqTkdrEcfEl1+J4qrPP86IM6JebgQ80njvF/DJZrIJpVt0/TsiuO5cqFiopJ7Rm5XuN9Zp/ikyzhJSniUCD+Jf56uGf8GOgqHaJ8ftr+j8NIC4RW39qpFj0HDNG2zaHKzmtM+r2BtwD5stsXNJcdQMqfwdFqShPPXpb07njvisJTwSud6TPdIUP24jVHJQPUOs9yXKflFRSlotCb0ZtetEf4ZGgBLGNUU803X6wfnFglqienUbddhbVmlrtphxvwUiWrj+k9WtY9689KHSsDzIGc5mD2f0uglH9Bmt5ASutbHfuBC+Ke1gODtWFOWjZZkXkYnZdY48vE122ugrJ1wcFxyNjdjeurmrXjkQHWLy/3bpJOHcTV03TxuR+2vIPTpnckfeGxMg/hC4PTaqTlMM76Hp0FxlnNhreRWtRppPZD97RSI1lqFJSS67kJuUXfxMDA5mET8md5Ks47Y1JHh3c9grzR9/s5eVIgP1d3CCPd18Va2h5UekWGm/m75A8G+h5oqSgTVOEU0MVyWsEw5eQhRyLL8w26Hl7Zx0P+qlkaPQu9tgXBJ6aZs8QBqqmJRxoGdSfcpjyxlYLl3kFS0VPiNU7hyfzBJsxboShV0udxPOkAFiHbVXEaz2DM4lV4JG7b0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009)(41080700001); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1ExTExtRUhNb0xuMzFDaUFoMnN4ckZ3dVNwb3gyVnIwREg2enhGUXZFVWtm?=
 =?utf-8?B?Q011MUF1UzVWcEYrU0Qza3IydnVSbjVBY3AzaTI2WnBPZXBNaEw2NFV5R3hP?=
 =?utf-8?B?VDBuZlhiYXlORDhuZ1VpdWlsaWhWNVhlMngrR2hKU2V5akZDUFJhYzhOakxi?=
 =?utf-8?B?U0c2VDBWVmZaWmZSeUh2dW1jZFVESVJ1Qk5FZUtVSFpNUnk5VXdpOXg2L2NI?=
 =?utf-8?B?Qk0zclBmZFlJRmNmdTZYQ3JrVkllT1dVN0tXbS9SZGRTMHBDbUYwWmNxMnc0?=
 =?utf-8?B?THExVzlXcm5jSnFLQkVlMC9PUWdua1hBSWVYcENSendqd2pwTGhOS1VwSWNB?=
 =?utf-8?B?SU96UWF5dURYdUFpSHJDcjRDV3llRGhQMEZmNHBoRHo1dHZYRWtzbm9FVnlq?=
 =?utf-8?B?ZlFtVUhGYVJuVjRjTHZtS2N4NnU3L1d6WmxhZitQRjFHMk1ZbGRTSUVVNDdB?=
 =?utf-8?B?ZEJMYmxDRDd5Vld1NEhjbWR0MTdEVGxPemhYWklWWERjSCtYNjlmam9ETTc4?=
 =?utf-8?B?TGRiQ25JRllPZ0FIWmZub2tyU2Y3M2F6OGRHTVdjaHFwUmFRWTVPNjZDYi83?=
 =?utf-8?B?d05ISTRPajFxSnVJNkhPYWNRU05lMzN2Mi8wWjJsN2xMZjlvZHJUN3FoYzUy?=
 =?utf-8?B?NkpSL1NURG1hMFBaZHZWRFppVUdlWkFVQ3Jra3UzcGRHNkFvK2hpenFVcmxv?=
 =?utf-8?B?bU9hUU1XK0cvbHhtVzUwRUdFcmdRdVFMWWUveXhmQ09ZSzhHQWxoN2tuTHhv?=
 =?utf-8?B?SmZaZzA5Vm9UeHQzRHliWnZQM3RGeTVnREc4dFY2cCtiYmtnNHIvMk5hZGs4?=
 =?utf-8?B?K1hlUFN1YzdVdTQzQUFIREI3Y0Y3eDBhVG03KzFIVWIyS3VaUzFFNE93SXpF?=
 =?utf-8?B?UkNyZmdXTmtzeDI5ZDU4WXBnSlRYYlljNFd1R2d0UGtQTVh5eEdmUkZhTTRC?=
 =?utf-8?B?REV4KzRzd0JJZ1JDUk9Wa0ZwS3B6MnNaakhGQW80Tm41dWtOZFdjaU8rUHBw?=
 =?utf-8?B?anpiTVkwTk11Qkc2MlRXOE9WT2owUXdYRVBtdmtnRGdmQk8weHRGc3JDSkRx?=
 =?utf-8?B?NkRqTkozYzRVUndEeGc2Y3Y5VEIzT0F5TkEzZEdraEJMaFdPbWNQYytTQUw0?=
 =?utf-8?B?dVBFaDA0NlFyb0t5Z0ZaSWI3QStkeXhPU2xzSWk5R09yeFZFUXpTc1BEZXdo?=
 =?utf-8?B?akNhSG9HZ3BqV0hiekY1bDNLK25Kc2xkOGN1V282YXZmZFpIMStnMVdtUXFr?=
 =?utf-8?B?VFFaSkE1eG5iRVRvVWY3ZjYxdFkyR3FIK0dmYjJ5a2NzakFZUFB4UDJWb1lj?=
 =?utf-8?B?M3d1OWxCQWxzQVJRZVhXRmdLbXhCclJSbU8xcE1PVlZCOVcwWDNUMi9Cbm55?=
 =?utf-8?B?S0pVQ1NUd2Vpb1lENFpuZ2FjR1lnR0UrdS80Y3VXbHRld21uMDZKaVAyRCtB?=
 =?utf-8?B?djIxWUIvbkZOby9jbjMrOEdUUXU3Z1VYL1FaWGcvMEVNZzMyWDFNQzVKeklp?=
 =?utf-8?B?RkZmY3ZRRHZFR092SWhBSGhvWDlBcVIzV0UyZDhrMUhrdW1heHZlVktnR0NM?=
 =?utf-8?B?NThDMmJFQzhPUWxEbWFMRU8zMEoxTEpZd09Ob2pMdzNreGNCOUJnU0Y4K2tH?=
 =?utf-8?B?azZjSDBWTElwcDdHYlFTSW90Q3krQzNybDdzNzkydU45RHhVMGd5eDdrMU1L?=
 =?utf-8?B?SnB0VjNCSHBrQlpSVmN1U3dSVGJxcjNhZXJQcWZUYS9GV2FGWHo5QWZocndu?=
 =?utf-8?B?MGFaV05RaXpxS1lxUVBTUjN6L3I5WXF3OTZxZkVBdHJiWE1iTm5meTdzQTdN?=
 =?utf-8?B?NDN5KzdCTFE2VC85Ly9BYWxiUW43c2xQRHU4bnM1VzFVc2IzQVVuTnArVDZn?=
 =?utf-8?B?aEViVUVJR0VKQ01KdnhCbDZ6U3BKSEdESlVOWFRnbkJjNThvd0l1OFNROHN3?=
 =?utf-8?B?TDVQWXorSi9NTzZLMHY2aEw5MktpZy9LbU9GVTRtKzZ4MXdqUDNoaXFoL1hN?=
 =?utf-8?B?NlFzVmlXbmZzWDl1UHYrQmZBNjZxeDJ6c0hZR2h5Z3h3L0xvOEZDL1RFOXkw?=
 =?utf-8?B?VFFNeW1Va201cmNoemhabUdRZFd0UGlpbW9vTDUrVUFMUENpSnZhM0lmOW05?=
 =?utf-8?B?Tk1QbGx1WXFkNzRvWmVjaExkV2hCWG5kR25oSFArcGdnR3ovWmhVRm1idXNn?=
 =?utf-8?B?Wmc9PQ==?=
Content-ID: <E3DE0657222DAF41BB9C7A9A74C2ACE3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9wbTYuVQ+vx9JUd8Mr4BDsZosD3JdIAPYKZy5RQnOOxn+Qss2gGEkJ3tOiZQCcF1XmsE6WiQSzkjfeBt7TsX9XziR7Ux9Bg8jViU6bnJWydcXPv+t9sNwKmJYCQvpsBQoCFM7v6/ybVaqA1IhbetZ0yDkKLrllmW4sfPZOlQwlLb5wjwp7pzm1mU8Qhsoj5eKcl8sYh+S6G3S9QwLtsOCjBqp/9/dEKjnTR4TwiK2yjj1/Xbs3zoDgm8x0UlCpp9zg+uNj2v+o40JnmMq5053poaEVncZaDAB8k+k+uf9Hv2b9Fm0UzXsFBD5nYyWVWmepTjdzzfBuTeiE9yxgFcBLEulgI6DLuEr7yTTQvy1sPx+soWWyWsTBkchDCACP4uZpd/Z5YvTh4aBBLbtyOlnmsg2vYTdIAUW/Nj8Un2sWZ+YmcfKbqZvtCP76zNp5oQx/jAHB1oeG8YuqfeSb0UT4oA4esYl+m5lw0bnUAXUDMUcJLIXqKnF5cR3K1e/0Rm715LQ/xdxiwt9qXXJf+laYYblpIGSO+O44+U+R7BVeKOmfpt0Bjs3RHPmycTyhNxleC/SKh8nrKefLzUqHnzfl+mu7T6zE+dm9rkT/NhgHrTNsmd6z7EqCnsLGBOpaKE
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c5a733-e0a0-46ed-c338-08dc365532bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2024 22:57:53.0723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erfQx5XMny6LMJDJ4TNhK8Cz6kOxjTDroNbvNVrs2SAYaBsuDcNz7XjPcSPewvMoCjG+NJOrY59+ij+aGz/rrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1708901877; x=1740437877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=qsc2S58x4lcr62ITG5zojGPVORr83HjAQIM52GEkQBc=;
 b=HxcEUryOcFl2pSOYF8wOmlx9mfMAkPXWgPi1Mfby1l9hbwL5NE0HyQ/m
 Q1xo8BtWUbagM5Lqtn2dhjjPYrqWI959/39gCQXwbQ2c+xxBOkGYML0SI
 FrHodRPxCk6Bg+5eQqB/lkrZCaBiul4YPXU9sggJe7rn7RfSGRTLHZXtb
 9JXxtMTtX/Mo4TAIb2kFP5p8dzk21/jYMBDbjQ6b+fdUfWSSJFiwUGmai
 8VRTbFlRX1WWfGJUZRELhu6FggLb1uNg2tHpeXpbXHmoupIoLZYfQEHx0
 pOoOnXSp4No4oqWp4un8Kiq2H9sBZyTrG02hnydbLCf8T3nXENgY+gk6J
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsc2S58x4lcr62ITG5zojGPVORr83HjAQIM52GEkQBc=;
 b=o9KUJKI8b5n6bEIvVcTH18USP+l3eW5rh44pb/u7ngVOZTsLuyfnJ4DSbmHLGkpuZNrWaM5Kpdh+0IcNjMzCw6k57IcpVVRAqvOLz2t41D2XXrqBMXX0xO/VflI5FNFryuz644/zZDiBiHGa2vYBpCNsulJL3u1msHaAT7QImpg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=HxcEUryO; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=o9KUJKI8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.2.0
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDI0LTAyLTIxIGF0IDE4OjUwICswMTAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOg0K
PiBXaWxmcmVkLCBBbGwsDQo+IA0KPiBPbiAyMDI0LTAyLTIxIDEwOjQ0ICsxMDAwLCBXaWxmcmVk
IE1hbGxhd2EgdmlhIGJ1aWxkcm9vdCBzcGFrZQ0KPiB0aHVzbHk6DQo+ID4gQWRkaXRpb25hbGx5
LCBhZGQgYW4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBmaXhlcyB0aGUgY29uZmlndXJhdGlvbg0KPiA+
IGZvcg0KPiA+ICJOT05FIiB0b29sY2hhaW4gdmFyaWFudCBpbiBsaWJzcGRtLiBUaGF0IGlzLCB3
aGVyZSB0aGUgYnVpbGQNCj4gPiBlbnZpcm9ubWVudCBwcm92aWRlcyBjb21waWxlL2xpbmsgb3B0
aW9ucy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQu
bWFsbGF3YUB3ZGMuY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uZUxpc3RzLXJlbW92ZS1maXhlZC1v
cHRpb25zLWZvci1OT05FLnBhdGNoIHwgNTENCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4g
wqBwYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMiArLQ0KPiA+IMKgcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiA+IMKgMyBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvbGlic3BkbS8wMDAxLUNNYWtlTGlzdHMtcmVtb3ZlLWZpeGVkLQ0K
PiA+IG9wdGlvbnMtZm9yLU5PTkUucGF0Y2gNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJzcGRtLzAwMDEtQ01ha2VMaXN0cy1yZW1vdmUtZml4ZWQtb3B0aW9ucy0NCj4gPiBmb3It
Tk9ORS5wYXRjaCBiL3BhY2thZ2UvbGlic3BkbS8wMDAxLUNNYWtlTGlzdHMtcmVtb3ZlLWZpeGVk
LQ0KPiA+IG9wdGlvbnMtZm9yLU5PTkUucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAwMDAuLjBkMTI4N2E3NjkNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvcGFja2FnZS9saWJzcGRtLzAwMDEtQ01ha2VMaXN0cy1yZW1vdmUtZml4ZWQtb3B0aW9u
cy1mb3ItDQo+ID4gTk9ORS5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsNTEgQEANCj4gPiArRnJvbSBk
NGQ2YjEzOGQ3MjdlNDg0ZmE5ZDBmZWY0NzZjYTE4MTY4MWQwNjk1IE1vbiBTZXAgMTcgMDA6MDA6
MDANCj4gPiAyMDAxDQo+ID4gK0Zyb206IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdh
QHdkYy5jb20+DQo+ID4gK0RhdGU6IE1vbiwgMTkgRmViIDIwMjQgMDk6NTY6MTQgKzEwMDANCj4g
PiArU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzOiByZW1vdmUgZml4ZWQgb3B0aW9ucyBmb3Ig
Tk9ORQ0KPiA+ICsNCj4gPiArVGhlIHVzZSBvZiB0aGUgTk9ORSB0b29sY2hhaW4gb3B0aW9uIGlz
IHN1Y2ggdGhhdCB3ZSBjYW4gcHJvdmlkZQ0KPiA+IGF0IHRoZQ0KPiA+ICtidWlsZCBwcm9qZWN0
IGxldmVsIChidWlsZHJvb3QgZXRjLi4uKS4gSG93ZXZlciwgdGhlIGNoYW5nZXMNCj4gPiBpbnRy
b2R1Y2VkDQo+ID4gK2luIDgxMWYyYjU5NmRlZjA0YjNhMzYzNjhjZjIwOTg1NDZkNzkwNzc2N2Yg
c2V0IGNlcnRhaW4NCj4gPiBjb21waWxlci9saW5rZXINCj4gPiArb3B0aW9uIHRoYXQgZG9lcyBu
b3QgY29tcGx5IHdpdGggdGhlIGRlZmluaXRpb24gb2YgdGhlIG9wdGlvbnMgYXMNCj4gPiArc3Bl
Y2lmaWVkIGluIFsxXS4gVGhpcyBjaGFuZ2UgcmVtb3ZlcyB0aG9zZSBvcHRpb25zLg0KPiA+ICsN
Cj4gPiArWzFdDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL0RNVEYvbGlic3BkbS9ibG9iL21haW4v
ZG9jL2J1aWxkLm1kI2xpbnV4LWJ1aWxkcy1pbnNpZGUtYnVpbGQtZW52aXJvbm1lbnRzDQo+ID4g
Kw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3
ZGMuY29tPg0KPiANCj4gwqDCoMKgICQgLi91dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFj
a2FnZQ0KPiDCoMKgwqAgcGFja2FnZS9saWJzcGRtLzAwMDEtQ01ha2VMaXN0cy1yZW1vdmUtZml4
ZWQtb3B0aW9ucy1mb3ItDQo+IE5PTkUucGF0Y2g6MDogbWlzc2luZyBVcHN0cmVhbSBpbiB0aGUg
aGVhZGVyDQo+IChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2FkZGl0aW9uYWxfcGF0
Y2hfZG9jdW1lbnRhdGlvbikNCj4gDQo+IFNvIHlvdSBuZWVkIHRvIGFkZDoNCj4gwqDCoMKgIFVw
c3RyZWFtOg0KPiBodHRwczovL2dpdGh1Yi5jb20vRE1URi9saWJzcGRtL2NvbW1pdC9kNGQ2YjEz
OGQ3MjdlNDg0ZmE5ZDBmZWY0NzZjYTE4MTY4MWQwNjk1DQo+IA0KQWggdGhhbmtzLCB3aWxsIGZp
eCB0aGlzIGFuZCBzZW5kIGEgVjINCg0KPiBBbHNvLCBhcyBJIHVuZGVyc3RhbmQgaXQsIE5PTkUg
aXMgdGh1cyBubyBsb25nZXIgYSB2YWxpZCB2YWx1ZSBmb3INCj4gLURUT09MQ0hBSU4sIHNvIHlv
dSBzaG91bGQgZHJvcCB0aGF0IGZyb20gbGlic3BkbS5tayBhcyB3ZWxsLCByaWdodD8NCj4gDQpO
T05FIGlzIHN0aWxsIGEgdmFsaWQgb3B0aW9uLCB0aGlzIGNvbW1pdCBqdXN0IHBhcnRpYWxseSBy
ZXZlcnRzDQpvcHRpb25zIHRoYXQgd2VyZSBpbmNvcnJlY3RseSB1cC1zdHJlYW1lZCBmb3IgdGhl
IE5PTkUgb3B0aW9uLg0KDQpSZWdhcmRzLA0KV2lsZnJlZA0KDQo+IFJlZ2FyZHMsDQo+IFlhbm4g
RS4gTU9SSU4uDQo+IA0KPiA+ICstLS0NCj4gPiArIENNYWtlTGlzdHMudHh0IHwgMTkgLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQ0KPiA+
ICsNCj4gPiArZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQNCj4g
PiAraW5kZXggOWMzMDBjYzgxNy4uZjZjZjE3ZDI2OSAxMDA2NDQNCj4gPiArLS0tIGEvQ01ha2VM
aXN0cy50eHQNCj4gPiArKysrIGIvQ01ha2VMaXN0cy50eHQNCj4gPiArQEAgLTYxOCwyNSArNjE4
LDYgQEAgaWYoQ01BS0VfU1lTVEVNX05BTUUgTUFUQ0hFUyAiTGludXgiKQ0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgIFNFVChDTUFLRV9FWEVfTElOS0VSX0ZMQUdTICIiKQ0KPiA+ICsgDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqAgU0VUKENNQUtFX0NfTElOS19FWEVDVVRBQkxFICIiKQ0KPiA+ICstDQo+
ID4gKy3CoMKgwqAgZWxzZWlmKFRPT0xDSEFJTiBTVFJFUVVBTCAiTk9ORSIpDQo+ID4gKy3CoMKg
wqDCoMKgwqDCoCBBRERfQ09NUElMRV9PUFRJT05TKC1mc2hvcnQtd2NoYXIgLWZuby1zdHJpY3Qt
YWxpYXNpbmcgLQ0KPiA+IFdhbGwgLVdlcnJvciAtV25vLWFycmF5LWJvdW5kcyAtZmZ1bmN0aW9u
LXNlY3Rpb25zIC1mZGF0YS1zZWN0aW9ucw0KPiA+IC1mbm8tY29tbW9uIC1Xbm8tYWRkcmVzcyAt
ZnBpZSAtZm5vLWFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIC0NCj4gPiBmbHRvIC1EVVNJTkdf
TFRPwqAgLVduby1tYXliZS11bmluaXRpYWxpemVkIC1Xbm8tdW5pbml0aWFsaXplZMKgIC0NCj4g
PiBXbm8tYnVpbHRpbi1kZWNsYXJhdGlvbi1taXNtYXRjaCAtV25vLW5vbm51bGwtY29tcGFyZSAt
V2Vycm9yLQ0KPiA+IGltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uKQ0KPiA+ICstwqDCoMKg
wqDCoMKgwqAgaWYoQ01BS0VfQlVJTERfVFlQRSBTVFJFUVVBTCAiRGVidWciKQ0KPiA+ICstwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBBRERfQ09NUElMRV9PUFRJT05TKC1nKQ0KPiA+ICstwqDCoMKg
wqDCoMKgwqAgZW5kaWYoKQ0KPiA+ICstwqDCoMKgwqDCoMKgwqAgaWYoR0NPViBTVFJFUVVBTCAi
T04iKQ0KPiA+ICstwqDCoMKgwqDCoMKgwqAgQUREX0NPTVBJTEVfT1BUSU9OUygtLWNvdmVyYWdl
IC1mcHJvZmlsZS1hcmNzIC1mdGVzdC0NCj4gPiBjb3ZlcmFnZSkNCj4gPiArLcKgwqDCoMKgwqDC
oMKgIGVuZGlmKCkNCj4gPiArLcKgwqDCoMKgwqDCoMKgIFNFVChPUEVOU1NMX0ZMQUdTIC1pbmNs
dWRlIGJhc2UuaCAtV25vLWVycm9yPW1heWJlLQ0KPiA+IHVuaW5pdGlhbGl6ZWQgLVduby1lcnJv
cj1mb3JtYXQgLVduby1mb3JtYXQgLVduby1lcnJvcj11bnVzZWQtYnV0LQ0KPiA+IHNldC12YXJp
YWJsZSAtV25vLWNhc3QtcXVhbCAtV25vLWVycm9yPWltcGxpY2l0LWZ1bmN0aW9uLQ0KPiA+IGRl
Y2xhcmF0aW9uKQ0KPiA+ICstwqDCoMKgwqDCoMKgwqAgU0VUKENNT0NLQV9GTEFHUyAtc3RkPWdu
dTk5IC1XcGVkYW50aWMgLVdhbGwgLVdzaGFkb3cgLQ0KPiA+IFdtaXNzaW5nLXByb3RvdHlwZXMg
LVdjYXN0LWFsaWduIC1XZXJyb3I9YWRkcmVzcyAtV3N0cmljdC0NCj4gPiBwcm90b3R5cGVzIC1X
ZXJyb3I9c3RyaWN0LXByb3RvdHlwZXMgLVd3cml0ZS1zdHJpbmdzIC1XZXJyb3I9d3JpdGUtDQo+
ID4gc3RyaW5ncyAtV2Vycm9yLWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIC1XcG9pbnRl
ci1hcml0aCAtDQo+ID4gV2Vycm9yPXBvaW50ZXItYXJpdGggLVdkZWNsYXJhdGlvbi1hZnRlci1z
dGF0ZW1lbnQgLQ0KPiA+IFdlcnJvcj1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVdyZXR1
cm4tdHlwZSAtV2Vycm9yPXJldHVybi0NCj4gPiB0eXBlIC1XdW5pbml0aWFsaXplZCAtV2Vycm9y
PXVuaW5pdGlhbGl6ZWQgLVdlcnJvcj1zdHJpY3Qtb3ZlcmZsb3cNCj4gPiAtV3N0cmljdC1vdmVy
Zmxvdz0yIC1Xbm8tZm9ybWF0LXplcm8tbGVuZ3RoIC1XbWlzc2luZy1maWVsZC0NCj4gPiBpbml0
aWFsaXplcnMgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLWZuby1j
b21tb24NCj4gPiAtV2Zvcm1hdCAtZm5vLWNvbW1vbiAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcg
LVduby1jYXN0LXF1YWwpDQo+ID4gKy0NCj4gPiArLcKgwqDCoMKgwqDCoMKgIFNFVChDTUFLRV9M
SU5LRVIgJHtDTUFLRV9DX0NPTVBJTEVSfSkNCj4gPiArLcKgwqDCoMKgwqDCoMKgIFNFVChDTUFL
RV9FWEVfTElOS0VSX0ZMQUdTICItZmx0byAtV25vLWVycm9yIC1uby1waWUiICkNCj4gPiArLcKg
wqDCoMKgwqDCoMKgIGlmKEdDT1YgU1RSRVFVQUwgIk9OIikNCj4gPiArLcKgwqDCoMKgwqDCoMKg
IFNFVChDTUFLRV9FWEVfTElOS0VSX0ZMQUdTICIke0NNQUtFX0VYRV9MSU5LRVJfRkxBR1N9wqAg
LS0NCj4gPiBjb3ZlcmFnZSAtbGdjb3YgLWZwcm9maWxlLWFyY3MgLWZ0ZXN0LWNvdmVyYWdlIikN
Cj4gPiArLcKgwqDCoMKgwqDCoMKgIGVuZGlmKCkNCj4gPiArLcKgwqDCoMKgwqDCoMKgIFNFVChD
TUFLRV9DX0xJTktfRVhFQ1VUQUJMRSAiPENNQUtFX0xJTktFUj4NCj4gPiA8Q01BS0VfQ19MSU5L
X0ZMQUdTPiA8TElOS19GTEFHUz4gPE9CSkVDVFM+IC1vIDxUQVJHRVQ+IC1XbCwtLQ0KPiA+IHN0
YXJ0LWdyb3VwIDxMSU5LX0xJQlJBUklFUz4gLVdsLC0tZW5kLWdyb3VwIikNCj4gPiArLQ0KPiA+
ICvCoMKgwqDCoCBlbmRpZigpDQo+ID4gKyANCj4gPiArwqDCoMKgwqAgaWYoTk9UIFRPT0xDSEFJ
TiBTVFJFUVVBTCAiTklPUzJfR0NDIikNCj4gPiArLS0gDQo+ID4gKzIuNDMuMg0KPiA+ICsNCj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0uaGFzaA0KPiA+IGIvcGFja2Fn
ZS9saWJzcGRtL2xpYnNwZG0uaGFzaA0KPiA+IGluZGV4IDIzZmFiYTFjNGIuLjMyNDE1YmNmY2Ug
MTAwNjQ0DQo+ID4gLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0uaGFzaA0KPiA+ICsrKyBi
L3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLmhhc2gNCj4gPiBAQCAtMSwzICsxLDMgQEANCj4gPiDC
oCMgTG9jYWxseSBjYWxjdWxhdGVkDQo+ID4gLXNoYTI1NsKgDQo+ID4gODRkNGE3NTVmNTdiMTc3
NzVjNjNiNWM4YmU2NDZkNTE4Y2UzNGQ1ZDFiODU5OTRiNjE1MGViY2U5ZDMxYjE4M8KgDQo+ID4g
bGlic3BkbS0zLjEuMS50YXIuZ3oNCj4gPiArc2hhMjU2wqANCj4gPiAwZWU0NjBjMGNlNWM0ZDEy
NmNhNjVmOWM0YmRhYmQ1NzI1Yjg3Y2VjNzE2MGIyZDA2NzIxMTY5ZGY1OGYzYTk1wqANCj4gPiBs
aWJzcGRtLTMuMi4wLnRhci5neg0KPiA+IMKgc2hhMjU2wqANCj4gPiA3ZGMwNzJiZmYxNjNkZjM5
MjA5YmJiNjNlMDkxNmY0NjY3YzJhODRjZjNjMzZjY2M4NGVjNzQyNWJjM2U0Nzc5wqANCj4gPiBM
SUNFTlNFLm1kDQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlic3BkbS9saWJzcGRtLm1rDQo+
ID4gYi9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5taw0KPiA+IGluZGV4IDM0ZGJiNDU3YzQuLjJl
YzM1YmUwYWMgMTAwNjQ0DQo+ID4gLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsNCj4g
PiArKysgYi9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5taw0KPiA+IEBAIC00LDcgKzQsNyBAQA0K
PiA+IMKgIw0KPiA+IMKgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gIyMjIyMjIyMjIyMjIyMNCj4gPiDCoA0KPiA+
IC1MSUJTUERNX1ZFUlNJT04gPSAzLjEuMQ0KPiA+ICtMSUJTUERNX1ZFUlNJT04gPSAzLjIuMA0K
PiA+IMKgTElCU1BETV9TSVRFID0gJChjYWxsIGdpdGh1YixETVRGLGxpYnNwZG0sJChMSUJTUERN
X1ZFUlNJT04pKQ0KPiA+IMKgTElCU1BETV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlDQo+ID4gwqBM
SUJTUERNX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kDQo+ID4gLS0gDQo+ID4gMi40My4yDQo+
ID4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcN
Cj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
