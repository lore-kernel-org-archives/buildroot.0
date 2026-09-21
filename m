Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB1C982F0
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 12:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78652605FC;
	Mon, 21 Sep 2026 12:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59XisOSNYhCT; Mon, 21 Sep 2026 12:42:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69ABE6064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789994570;
	b=ZV1xtulzRD90Fx+iU6vPKhYe1x7iW0/CthQe/SOg42iGr6uL60r+5TbuDFFNyTefeSiy
	 QNYliiEJ1L68CWznnBFTKdxRfQMwqbH3xw9WfKl5iZMLKAd3w0+wHnQFgkXLeIkcP4PkM
	 9Wms1ROpG/+YiPOTdi2Zi1efr6450al6mlTvOBxp4HcP2V7QwBXAkz7F3DBzLce2pSJE+
	 SIj8kcY58mvxxd6MHm5JXgI2y3e5nctDBpY1p4BafL+2a4tzuRf48FZev3FI1UtbGwv8I
	 sQnQiUDLfxDe4LpGGy/3fJH2V2JCpojUqbV8qIaRCWt/Znxk6MWZySBJah7L7wLJzEw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789994570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-forefront-antispam-report:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DolJbI5dOckV6h28BgnrHi0ds/wiC+1RNk5AeiZsmQg=;
	b=MshTkfffrq+y90DzBOogu5HVgsYZX/UKPlxHW3TVrU8Zf5ixwyc4EXx+A0cGzcaP5jrq
	 HOVc03gf+KUBqGuWIzDrME5DTR7/j0npYnfy/ESc+1OWLRR3arXSoAWk8IK0ArLOELbrJ
	 WQFMzFwmevD3p5vO9LI6ufuXkCZ1Dfu+G2nezW7TErUzLtlZp+/ommU5vBXAkTAIdvil2
	 dAr/P+5ZCoNQEEXVLlFqXAIQTHfd5cW1uQ7TB461ctSbdVruUS92IyEV0LOb1Nnv2S/JT
	 1o8a54LJE9lMbXqX/lO0GNIAsiEAL1T0iHeJM0NR+bxG0sQcHir6ZX6n9Vg+Su70rbA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789994570;
	bh=DolJbI5dOckV6h28BgnrHi0ds/wiC+1RNk5AeiZsmQg=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ML+ublNbWWp2HfXFFJOspgMYCNABfGMt7S8cq6++P+ca0wLXZedxSlfZ6tsauMyEb
	 +lR1eW9G8gix7HyL5Bch8BvtE93pmo/oR4nO2bU3uPC62I+DdIHWbylSaQPu+juElc
	 CFitoDuvewNqKSQ5wN4IfxNkahTK9tiX+M64iFiRdFzjEl1DI0YwF7/gmdKjSO0Y2V
	 lyDiDem2o6AJowl6YALykOGjZNici+Eb3oJhROLElT0BN0iJrINis/ikGqEL6fiBij
	 xVfu4wk1UGjGeUF3e5XyFf5XD89B8rme8euwETJ6iTkERX/y/BoGZ5YNrPQcDsiuEH
	 hlTq3lz7FYWSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69ABE6064C;
	Mon, 21 Sep 2026 12:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE75224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2EB040187
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 12:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jHPua1_Jb58 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 12:42:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 560EE40143
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::60b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789994567;
 b=ZVvCF4mk4Ed5jjXpx0yxmyP5cwsrMFn+x2A8Di8Dt8JMZkQsTcHc4ixh5fomy8uOz0+t
 avAaTNRiZ9Dkz10u2/mW38aPWdctCePKM0S3psLeCweVFvyDhIZLzVonm/aZuTu/rIiyn
 qgrEXtgrqF3bDiv/HYmBVBelGu0SPuK6BgNTIH4inx6NdsaTPf01U3o1C90kcL+SFPu2L
 mWF1I2vuhyaLDh1mNz9K+FsS5XyLcxnvTmVrq05FmFZhLu6vBT9wXUtr+8C2D9aH3sUsi
 lVrFrJipvhIB/mdDYsJC3YUxd/pUMfu+ZragxEo3YDqi9QvVFl9v6b3X914Wb+LqI1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789994567;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-forefront-antispam-report:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=X7JrNZmyd7mEeqFAXAeAkzQeTC870JJU3Jg4xdltqZU=;
 b=AoknCShac6vbLoaYM0K8nCy2xfIXHYXplphAgLT8S67BGxGaXxZXiRNbpp+wPB42zT1b
 Dw+81l5hakzu+UfyLTs0imE4fQ0Zqf2qDS/3HHIUpyAX4c7qIh5usCF3GLeMoUHwyaGkJ
 O/66RQT1+U1J3vboqXZ1/jQ827XJAyflJPvYx1gMJj8UgPjwd43WTMvzb8qkR6PMWvQO+
 zDzao3RVKn83cG4OGNlXdKFcckMgEJ8UX28zrRJA2E6Zh34AXhsvlT84m9j4uCODO62N7
 KFOiRECLbCNgLmopzC2Brfaa1Z3yVSHy7g5A7U1wFHE90svWfq3+AGnT+4O1QP6Wqyg==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b="uOpTGJ/G"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::60b"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::60b;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=uOpTGJ/G
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on060b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 560EE40143
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 12:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GoX67J5BMiXtUlfdWYev21DiWerJzNWHo9ssH5ON4gl5HYdDCKUKDL8oPYTw2INxxoN7Vw5lxk57ZlMZ8sIgzGeAjIS5CBtlW+KF7LdTQ1ywqamkDWmL9ns09b7c2EzLrJ4t8+JNDr0OoB0A6pfTPDtf28lVOC7fx48Zr6ydKUwCeDDMqs7aJ/0YnfbH+I2dwaPub3fDtEb/Ipeb0H+DUGHuo89OvonTpjRiynrPGKuj+I4h7ygsAwZZPUumYSimaXg//Uvqr2qW/Jm27eN4jGsixZ7sT85to39LuLut7nT2TN6HpziPl9+OgiK6xeZ92wo6bM11pJ24tWLKWeXaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7JrNZmyd7mEeqFAXAeAkzQeTC870JJU3Jg4xdltqZU=;
 b=mTi8SIqoPVEO9P97reZC8haC6vqzIb1WbAePcOYiN4YysaT68LO/9509gvlwRDyTQqTMBH7udjA37P+NY/ApZQufU995dxAQvYzgo2aWDk8uUJPUJGqY2de4C45246OGC3CPfj5i4KoKcQ/DMhoSURCwgiQ8Nbz5gYR5SF0eumPJP/PihrqmZqcRrvfdbqnaaAm0SOaY7k0RDE53sIcqq1+vF8JrDvhCZDZ8wZqASbiAr66SIGGQg6uRjWCeREqevtP5RTGknPCMnFRFGZB5BGbllQJ8cFAluatN792Lu0qryH2XczzExb37BTV4b8wFgUqClm5Fm1HscjZnndHXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7JrNZmyd7mEeqFAXAeAkzQeTC870JJU3Jg4xdltqZU=;
 b=uOpTGJ/GAmunEg+EEEJgi4UMwTBlU4pOKX8qDUcV2A2E2rK5FqWNyoCIy1uoOhOK7wtG3Fdk+VXtc2MPyDy26Gfpw9WLUfCM3qwxVHXJH5yQxH0z51KtauQwbBKJVK76dXaFP2hRCRJA/sY8mjHpzXxHNc/KwSds2cOSJPuv3qoENXqaKzzP60x+O0mTEQUv2IU9gi9p58GngAXZjeszdI+/RffgoSXjIL0bHWVGA1/qfj5pWZ0dEnpdMhXeEmiI/8LW91MH7u0ryKRSC5L/6vc6QZrIgi5ASRf7tV9tLgto/JdW60wYxmXVM7T+Lz6W7uNY8JcFj1JLiz0azRPhgQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BNAP110MB2254.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:42:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 12:42:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: "yann.morin@orange.com" <yann.morin@orange.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 0/2 v2] support/size-stats: actually handle .pyc files
Thread-Index: AQHdScavL40iKiKgBkSEtMGbDN2Fhw==
Date: Mon, 21 Sep 2026 12:42:38 +0000
Message-ID: <PH1P110MB1603765BCE9FB646BAAB37F09F84A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1789706718.git.yann.morin@orange.com>
In-Reply-To: <cover.1789706718.git.yann.morin@orange.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BNAP110MB2254:EE_
x-ms-office365-filtering-correlation-id: acf8ad4e-7a6d-4262-e9cc-08df17ddd1c1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|41320700013|366016|56012099006|10067099003|55112099003|18002099003|22082099003|38070700021;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(41320700013)(366016)(56012099006)(10067099003)(55112099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acf8ad4e-7a6d-4262-e9cc-08df17ddd1c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 12:42:38.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2254
Subject: Re: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle
 .pyc files
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
> From: yann.morin@orange.com <yann.morin@orange.com>
> Sent: Thursday, September 17, 2026 11:46 PM
> To: buildroot@buildroot.org
> Cc: Vincent Fazio <vfazio@xes-inc.com>; Yann E . MORIN
> <yann.morin@orange.com>
> Subject: [External] - [PATCH 0/2 v2] support/size-stats: actually handle .pyc
> files
> 
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Hello All!
> 
> This small two-patch series properly associates .pyc files to the
> corresponding package, to account for the PEP 3147 layout.
> 
> [This is a resend of v2, which did not end up on patchwork.]
> 
> Changes v1 -> v2:
>   - use python's cache_from_source() instead of open-coding the
>     path  (Vincent)
> 

Look OK to me.

I think we can specify the `optimization` argument to `cache_from_source` in the future if it becomes necessary to account for different optimization levels.

Acked-by: Vincent Fazio <vfazio@xes-inc.com>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
