Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF1CE95374
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAA22607F0;
	Wed,  4 Feb 2026 10:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkVSRnhOMlL6; Wed,  4 Feb 2026 10:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C20D960A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200023;
	bh=5nPtkPvraYOAOsU543bU9GvPDO4T84Ln5vE0Aw+vDWM=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1D8SdClmSz22G+9Qkt0WHdy/a4/P4QOd8pL2GI+mGqnZDdbAHPIYsXsNsNosQOib
	 Kc5CuzejBlL1oZkIOtJjG7UmiWBQedOebIuAufk/QYW+ao4L2fmPiV0ZQLHQVXVSpX
	 AuYimBotNwsFoyRJhrsK4JSC3ZMw9Yfif1lk91lYnbUFzSZQhmD/ts9RjyzinE4Pog
	 cxJbP059rZnop7owU59u6xZcYY9BPA4C1h+tfadHvlTZdxpGwjLI3DBd+9py6Nxqva
	 7w5OxjvsuNAmQZAvy0neGWuG3z299CnPvKEL4kkVUR22rMn33APs+atSE3y8gRdgFb
	 9lb/3OHN1WutQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20D960A41;
	Wed,  4 Feb 2026 10:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3205EF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148F560A41
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYMGw94-aS96 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:13:41 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::630;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CD0B607F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD0B607F0
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0630.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CD0B607F0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=bsXRkVs5O1buyq1bE2rSAHeWEnkVOkQsyA6xY4d9GdkwjvHl8YtuL1WzezRggPep+y/AH4eeHF/wn7hg83GNf74GRgu39UF7REj/JgZFbP9foiFiw9xV3zQiGZCDq6qEKTBIs+wgz8awZo2Qs6zVHSLA837X7q0pCYmPS3vtdIo0ow8lbOaGd5rKPQBpJWi7hTdhmG9XXo5h/9d/MqSDJzcXooFYqJwfAAlbE3XcWMC0ebX92FrRNQ1b+EwX0mkfk58Fu/f+0t0EKPieIbQKZOxDPh/dD5aoEfmeRmxZGoSRlDv/ynkWEbdDbDbZFpU534fR6wr9a6D1ahNM38IImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8gorfWB/elPxhyl/Ge+zTQRQfqTukRspzyC8gFhMkA=;
 b=Zdp1jyvy+lBot7snUzBbYEv01/fP9DbB967bg3UskSnZ9dXwiXn9HERBVil1eIUF/mefv20aduCsALgGAatoAQryMwe1NJK+DlVUHoisV8xiSus3ELrJIpq97leiXrmUyrQOlzEI2CZVQtWXpx0LKeeydYcC8HLjhijFz4gSCcB0iaVGr3xNjXnZdoz/YZdtxNF30B8hvlxKwrpFBjbbIEk0Ni+XcC5oGb8dKqqsRq65K7u8vuRJIsfgneawEiQxOTx59yMKDACG4qLc4nn9vubbbOlLb9RJ7ixEQxnhkEo8a5aOv6/ZUryypL+abqspzwnzNuP04it0GS3kQ6mjuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2364.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:13:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 10:13:34 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.1.0
Thread-Index: AQHclb7rpatCzWqFC0undJRzzfOOaw==
Date: Wed, 4 Feb 2026 10:13:34 +0000
Message-ID: <PH1P110MB16037B417B362EDC1F664F609F98A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260104184134.4078200-1-james.hilliard1@gmail.com>
In-Reply-To: <20260104184134.4078200-1-james.hilliard1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB2364:EE_
x-ms-office365-filtering-correlation-id: 84c4c15a-11b0-4c9b-c37e-08de63d60df5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|41320700013|366016|7142099003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wEoM7Hv+6y/4IQcRB8x81lT7ZW8kp25iCFo5pkEJ6aY8hYXf4JZ1pBhg2lYK?=
 =?us-ascii?Q?rjQTQJKFEe1FXTvuFZEothaOEiNKuiyG8vGPJQ1HUFeKVduMqkQHfmpi1dsS?=
 =?us-ascii?Q?zBKXlaPa+MtOtL/GzGFqzTl5h3N5JyWicqOeLmw57l2wzbKIasp3WkTG0u8f?=
 =?us-ascii?Q?ZlEtM0xy/y+JrBzAMw1IVEJnzpUHisFTcswNqQ7gtvjpfkwsCWXIC93CcIHV?=
 =?us-ascii?Q?Iw06eszGUGxk0g+AH/N60FY923u+/VONlCYYWGhiCGZJ2WBIebh7zGcNWbS7?=
 =?us-ascii?Q?MVPcHFX7C+WEte8WVppJf9WYOWKN3YoWAe7HBUeAM23SM4RgGA34dSoau6eE?=
 =?us-ascii?Q?+UYVPxXmZsG0Faw2TK7/D6Q2kVJzdNfZ/mBrSNXJmCydXnUBzLQClT7ViPFc?=
 =?us-ascii?Q?nSMHxYtnu3xthTD7KBfJQo1ZE82KyE/MWoQ0kNCZdH2Gjf++sFRd4Mi5C7bc?=
 =?us-ascii?Q?X5VlsX2QufbzrswytXhlNBWcAvSHmOvjOrgw7zwoRarizP6MHeOYhWB0EJqG?=
 =?us-ascii?Q?J3HVnNPTCllX6lgLG3mwkkFcWPH7Fh6E4GeFghHE+PJVhs+FLdszF8arVtnq?=
 =?us-ascii?Q?QaTfijjSVBmyStJEMFvTAfvYYpgc0QuPlWsc86/D+su4WqbyFQuWbp/gjFNa?=
 =?us-ascii?Q?tVuCX0L7wST1/FymutwNNX9arXOMJVU0mMkZcy2wr36NN5lcwiiqoXeA+k5v?=
 =?us-ascii?Q?IYQZtl5mYC8dkwV9RXaSPeapnOrZCpbB97eFp15NefZKe6r39pvRPwo9PTOK?=
 =?us-ascii?Q?ldDFKrRkdz0Ei15Nfg+UVdI064rLXGc3xEhDOrs/k+DXRYJqLj30ZuG/MBoz?=
 =?us-ascii?Q?RcRIzo7uunuIrbeWJ9rrcdfSKJ2gPZwTduu+3HjLbebB0Q/sqoDIUaPiIS8O?=
 =?us-ascii?Q?ao4Q31ZLx43u8ig1eKrsdT1VxmyWwpJtCgTRfSqVeyqD7aPwus6RJ36oN58X?=
 =?us-ascii?Q?A8K5NWK7RhDUkK0ZFB0SFTz6KiyR9mVKDZ40g6n3B5o1oCtxf3xImiVbcXO1?=
 =?us-ascii?Q?/el47v5gOiDj78RpOP+NEyPTuQ88xG/BaLydPRYbX7f6Xhd5mGxYfS9MseHx?=
 =?us-ascii?Q?8kE46jabzR7chLEd/kpN86hVQF0ICm/w8XW94VReF8gIVTmHx5zN5OYWeZ3v?=
 =?us-ascii?Q?F+lAXuFcXAhmohLUq9vTL7zBK87g9ZiVX8XCLgZYoOv/zLvrgeywgNzRUZ4d?=
 =?us-ascii?Q?3EYmb1vSyCh6z/vakHfxPPNiPuS1vlAGImsBWNULvZe/cBC7aJynF7MJNw97?=
 =?us-ascii?Q?fdU68LuBEMNAlGfJ7WPc2beedj5aipD74kOqQ6sv11E6G+vQ5viy0NS2ZPh/?=
 =?us-ascii?Q?cdpIIJkElhlrQWrc5Tq8Bek7ReGbT1VNpoAYpXN0Owl5wsG/ha1/mDwaSush?=
 =?us-ascii?Q?752wQsxetZ6UiIg2pk714K9QtldJJrXOAnMnMOmQaOTY2a0f3ijK+K3yWN4B?=
 =?us-ascii?Q?2FuTsxTxvOJWvxYijHCaGJ4sL9pY6AN4mKewmMADkEfjQuSP2kynqt+92h3n?=
 =?us-ascii?Q?Dayd+Ho9DHeETlIgCkATYSz24Li8tAt3LUQOAI9tzGLEjMJAalEZCAQNb8Fq?=
 =?us-ascii?Q?7G11d3dvt3Y7nm6dFE0PlSnW1ONMdfmphj0Nbn6T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(41320700013)(366016)(7142099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nL9sD/bwl0hRKS3Xn4U4+o9RMb1xT4LgS+qTzg3xJmVib/4Xj/1nTfVsUfUp?=
 =?us-ascii?Q?IxVnyU233DHSRwBew77ldXdad2O3yHgRAGY6l7sV7mV2jMidFQ6jNQjnT/D6?=
 =?us-ascii?Q?9awrCwqocymMwbpzoSKrOFN58nX4reTspX6vG9i36Uqv14bOKMO10Z7ENxgl?=
 =?us-ascii?Q?BIqXNqxXYOgq7YHPmUFD22dZZ6EU3+axQrgIuNES/BnujVOvHU+PnCxsJxVc?=
 =?us-ascii?Q?1ZUc1fEXbqpzDOKLS2aC8If4MvIHkEBeJfw+xJ1Zif1a61ia5sOECO79RPZv?=
 =?us-ascii?Q?HzPDDmQMa4CGNFXNm+k47aXdZH8QCyLw3x6tMK0e3F0hBsDc//aZOe5ZxEk7?=
 =?us-ascii?Q?bvb0mQXufTIL9Hc1S8JpmH4QeqRJc1x4jLj8B3AsBwsXY4yEE4pK1YA8G82/?=
 =?us-ascii?Q?7MEwhV6HgIU/u2NyEsvpsx6LJK7O7N3dwQ1EKp32jemP7QU4FI0W3LS675ao?=
 =?us-ascii?Q?ND7SfCD8LTBBh2+FgelD8GVyKCALXenOpzbuu5/HNkGeYOp5G74PXGjWNC+C?=
 =?us-ascii?Q?2MU6aF2nbcBrrtNdnMOGSm57sOAUIav+XPbIMy/3OZ1UuFP0IGv5s5w53fEs?=
 =?us-ascii?Q?0JH34niPP0ux+70xPiwOllfxzGStXQPcPXVl+S7Y8TJcjiOH9wE7trflyGuX?=
 =?us-ascii?Q?fS0/GGw4XkgaM6HZKv12h+IDaIVETvrQ5m6hZb2en9/2kWDFea45NZHFENOU?=
 =?us-ascii?Q?wIWBmZlb//lFyuywSi2xQH2Xp5StTu9f9k5Z9yXuXPZzmZIEAJAIu2s2z3HS?=
 =?us-ascii?Q?lc7MWfL16H6vZLQN0W592akTSxvHGFvKQ/n+yl+bLEUOBAqqMwhf9rV9qhih?=
 =?us-ascii?Q?DCZoHTdjsRxAjwpZf53TOj3576h9qd5sG2eMSpsxJ9/RsPzGJ402+u5lix9e?=
 =?us-ascii?Q?2dNw/ba9A59Lyh3v7KcjuuQpEhwbd6sgIL6FdMGd736XCCOuMMrUKjOL1yrY?=
 =?us-ascii?Q?ZyCwGMMeRzOt+Gr6jd3wBIExQ3O+i70K1+2nzo4wP2hAvZpaYq15haUbjnbO?=
 =?us-ascii?Q?msbdpAZr0UPEBxWVHCPAXe+ZVQzxNgTSVqCAWykcce9kF2cL5bbAGpm1U10L?=
 =?us-ascii?Q?V0WUIsX5M78wVe9BmAbBi5DTd8rxolwd1+P8oUmzFFqsZ2AdxxTDJ1UEIUaY?=
 =?us-ascii?Q?0b2DfOYphDEaGaxEVkBwsut/o367AFlCWAQr4hmuvu3vHh+CJXHVvInNw8T/?=
 =?us-ascii?Q?7mW2dgt1Zrfx3i3exW8L4XiW6G/Pj2dlVKB3pgPxdZAjt/mnSzbM+3pN1gkg?=
 =?us-ascii?Q?TgSXDWeuxCBGIwVmyxIpjs0PvhVboCKNy1F4tSpnfqpgI44PZOdZMbqE7v89?=
 =?us-ascii?Q?mDeRRXxZU/zUiW5mg23vP5OmPD16rpUaUA5fgL2xWyUqv1qzlNivX9bQtENk?=
 =?us-ascii?Q?bofZGWyLr9SOqfvhuTc3PuMNRra3azeauvOEdYvfh3js5QLJBiSDAyha/gC/?=
 =?us-ascii?Q?v93QEK4DSm2Zq0scOhZmJjMjWYpXKZvNmoXSov063/WckZgmh2XTVvl3Hq+o?=
 =?us-ascii?Q?co5/imv/RFB6fuA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c4c15a-11b0-4c9b-c37e-08de63d60df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 10:13:34.1084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2364
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8gorfWB/elPxhyl/Ge+zTQRQfqTukRspzyC8gFhMkA=;
 b=RrjxUbeaZ2UIsNWzJyvgGuiHNEV3P+VQ5jkF29KfpFsyn4EJoa7mcf6+8iu9O3+FF0YEQgFbFjBuloBvp6C+MZHiiANpOrqybkcypY/4RQZlOGpMi3MvQi4HWL+Rzvfqv235ZQJCesc8lp7s/aMPJpOeokX/Hth8p+/z7Hh6wmzDljf+Uxd1/SKLejXxYbcQyifIFz9fTJx+cPyKAS94RQl8uB5zNU0Dcc32a1wuv9CSQXMZcRO2eEVGlNGOw6yFjZ/CM86/MnzhHOM9djnne4vco5kz+RBGCQIOAUvqxs8JoUHSt7sDY5vAas+BpdvA3IvNZSOiyyZwH/bXi996Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=RrjxUbea
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of James
> Hilliard
> Sent: Sunday, January 4, 2026 12:42 PM
> To: buildroot@buildroot.org
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>; James Hilliard
> <james.hilliard1@gmail.com>
> Subject: [External] - [Buildroot] [PATCH 1/1] package/python-pillow: bump to
> version 12.1.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

> ---
>  package/python-pillow/python-pillow.hash | 4 ++--
>  package/python-pillow/python-pillow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-
> pillow/python-pillow.hash
> index 22d1f3fe7f..257be2bebb 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
> -sha256
> 87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb3
> 53  pillow-12.0.0.tar.gz
> +md5  7be15203f5fe63d857814da49a51b616  pillow-12.1.0.tar.gz
> +sha256
> 5c5ae0a06e9ea030ab786b0251b32c7e4ce10e58d983c0d5c56029455180b
> 5b9  pillow-12.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256
> 17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6e
> ce  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-
> pillow/python-pillow.mk
> index 19e3f8e279..4656872fe1 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>  #
> 
> ###################################################################
> #############
> 
> -PYTHON_PILLOW_VERSION = 12.0.0
> -PYTHON_PILLOW_SITE =
> https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5
> 423c8261c858760e2466c79b2dd184638b056
> +PYTHON_PILLOW_VERSION = 12.1.0
> +PYTHON_PILLOW_SITE =
> https://files.pythonhosted.org/packages/d0/02/d52c733a2452ef1ffcc123b
> 68e6606d07276b0e358db70eabad7e40042b7
>  PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  PYTHON_PILLOW_LICENSE = HPND
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
