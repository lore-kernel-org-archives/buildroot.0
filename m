Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2860CF538D
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E79606EA;
	Wed, 23 Oct 2024 14:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElASAHz272zP; Wed, 23 Oct 2024 14:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C7E607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C7E607A8;
	Wed, 23 Oct 2024 14:04:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 281E459B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165CD40131
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i12pkOoJ2uO9 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 14:04:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=019871083=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C59704012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59704012D
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C59704012D
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:04:10 +0000 (UTC)
X-CSE-ConnectionGUID: JERTdkfeRrqjaWpt1nS2wA==
X-CSE-MsgGUID: IA2a5IxWRICX+GEHLid3Yg==
X-IronPort-AV: E=Sophos;i="6.11,226,1725292800"; d="scan'208";a="29800969"
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2024 22:04:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWJ9giCBERRb37AWtYMfYRfKtGZ1JvLNQUioJli0Aj2QP6fncjoxeLpUXay5C5A95IK3s6wS1hjQwON21yU+l/BcKb7+JAzbpxTMPvo4FYvYPEtsxSeNK5UJYOywcbbQMvwfnMeQN0B/vWUEblPqbGbWq7zKlIxhOG1VOLXQtewfuZCPMdotmJ54kMARS2W1ZUb7pbj9otP6AdX46cHOlcUkElebdnH0Qgs6XT9qRiANwvpRtiPFC0dL1ZuzsiR3LKYPwHAX9wKI/b4riLzKQyBAKMoQYtdULlCwVoGqdzCf931FfcfXIXqHPZEi7Yl26wzUAOfarXwH5h3/+Gr17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBefyKBQSSHjfVAreaDfRwXG1DeRHhKgO1GDWsVtk1A=;
 b=lDm4gmOhOPbbYhB9jKeIPcPtWfmzoU71rmUMFQ3fmKMS1mXTDJdxyXL4j2AE5bQzn4nwQF3n/tk9AIr6ip/eriJC0vwBCG+MPpWZGih1YLAXusIsE270fohQQoOEtdM9lZyeNBc9hRuA34qsNBH8ICDnogJlwdAdnA8+gCM9rfE1iV0IFF+VFl9rwQKSeEtuGg/rruxI//nLLc5/liB7YuM02wQAF3vnwdCmtFxHbZ7t9ovW6DVCJ44AoOaaAOBFfaSUTX5koDheDMjfIQ5QOiKhcSebO70MnhWC1vAabPEx/nO/VdZ93+Qwtl9yRLFPo3/vBdlpYb4lIcazkEmBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by PH8PR04MB8711.namprd04.prod.outlook.com (2603:10b6:510:255::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 14:04:01 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 14:04:01 +0000
To: Michael Walle <michael@walle.cc>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?Ga=EBl_PORTAY?= <gael.portay@rtone.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Martin Bark <martin@barkynet.com>, Julien
 Grossholtz <julien.grossholtz@openest.io>, Damien Le Moal
 <dlemoal@kernel.org>
Thread-Topic: [PATCH v2] linux: add support for device tree overlays
Thread-Index: AQHa/SswIJo1QUCMv0WUaZIAhp9+i7JEb8kAgFA+sQA=
Date: Wed, 23 Oct 2024 14:04:01 +0000
Message-ID: <ZxkCUCUw5bVSlgRo@ryzen>
References: <20240902112735.728574-1-michael@walle.cc>
 <ZtWx2nqI0YTpwb-P@ryzen.lan>
In-Reply-To: <ZtWx2nqI0YTpwb-P@ryzen.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|PH8PR04MB8711:EE_
x-ms-office365-filtering-correlation-id: a4a59810-f3e1-40ce-1506-08dcf36b8c07
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?AwCurDsp64FsgkBUJ7um17qzh7D6tM85bmK19GzAbt074WuiufE+k453WP?=
 =?iso-8859-1?Q?uw8TDq4MsGl/cm3x5Rh+i7+s1E3m/LBHav5252EwLf12ejlmFdnyO6BIbT?=
 =?iso-8859-1?Q?GvtlzvS3cn34IfWxclRuBbhoNFzOjdfLcVQsmBbjxVeuz2DqeQiPxImmmM?=
 =?iso-8859-1?Q?XUuf7VLSfWXn2DDSl3XcJNy+eFYadgdHQTApIv5mXJz36oARQIC/AELpHF?=
 =?iso-8859-1?Q?8tZMjqwTKAAPuxbylJ8yHG8e8aZpluymG5JEaNdK9joepAikaGeQ0B9XxR?=
 =?iso-8859-1?Q?1BFYXfdQUZnPpisFQDiHGevQB5SmDCBekMZQ/lbLikABebRIRHyO/5eWbZ?=
 =?iso-8859-1?Q?T3wQW7X7n8rnrpnlUHvQq8RzR3ameuPJdlzmXE2gI1MgM2GC/5m9Fey5Kc?=
 =?iso-8859-1?Q?c59u9EMiaAQ0E/4tKrlbLAS46ABqfjDRYBch+wFOLojH+MoJK1ghskHTtk?=
 =?iso-8859-1?Q?+GRFMo5+tvyQoibjQ3SGc/whif3HWPU/8uF6dW7GsXZzoSk63I2Nh9JB+j?=
 =?iso-8859-1?Q?vyFpI8HVGQ8W8sePwXySLn8ulBu8rYbJ8QJHe/NLTXCIobAmEssG1yir0z?=
 =?iso-8859-1?Q?3FbpS38GmX2EYMxqwZsl1q+oyKLZeGWbJXnMrmvzaMBYW7kgg+EFuJfJ0o?=
 =?iso-8859-1?Q?KU2xCqpEkWwAczHKkJB2ih0IpFx64Z1AkwPdRwk1LgLB/Gm14siI1cqxMd?=
 =?iso-8859-1?Q?0GdGClNjaN682GJ2RH1rAxIQ/EKGkVPRVAogDNs5jzqVWDf5MmTcqY8juP?=
 =?iso-8859-1?Q?qLQzDC+riN5L84t+VLoSnTLWeU+VcCNN1u+s2q1CTGhhrxYNOQ5f4UGA0k?=
 =?iso-8859-1?Q?O9F2xBQYJRiOs749wfGSQgMLVyp9Lqihn/VU6uN2s6gxAisGn04x7LgVmg?=
 =?iso-8859-1?Q?7UMGZ3189miF+WWdXbDZUVzJVvDjBW9clJND86LTWjyUTm+QGgdIsvvuF5?=
 =?iso-8859-1?Q?fgKcH9VvF5RWnr/WbAlZA5F1QF5y4IrvkIbchP3FygvnWzRKAm8JtGMdGQ?=
 =?iso-8859-1?Q?1oVlLOTFc79Xs5cG1shjLZf7yq/AxAuYJtzOYyZU96jn1Qo3VoivqxfTjT?=
 =?iso-8859-1?Q?bEXSt86jE0EXp6ALGDwBWXGSs0akbmQ1DpVEAbVud8Bxk3qCPFIifVZVP1?=
 =?iso-8859-1?Q?M8IC2pE3DIz6Pz47jRvGiV6S0nhac+CFn+gPfDHFImueGLijkxDEEO14g+?=
 =?iso-8859-1?Q?JEVtpo+k27hqHzRcOTRtT+/t/VgH6+DcVgYUc/IeXx6cP56Pwwk66bes+e?=
 =?iso-8859-1?Q?mmQcxS6n+H8Tu0vC0GoLyerJUVDwgL4KjYNZjBfmc22yL9jGIvJOHdvEiL?=
 =?iso-8859-1?Q?k1BLKTN+mszlWzHw4uQCVO5Po+qiLAJcL7ITUF39xr7kL+1A8hZrHBCEjs?=
 =?iso-8859-1?Q?JPGClZ6+jxp0eke2LMWrtBU+qV8d6bNQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kCBNnA268VwnBlKsF9go+fRPb9Yr9V1lJQcLoZHAS9zJVPQvbA9tbSjwG6?=
 =?iso-8859-1?Q?tHvJMZjpYM9K+7ClgUxFojR0qV1KRGpur1ynz6vCe20skwFlhwooLswz2M?=
 =?iso-8859-1?Q?pd4BqUqHdVlt72uGxo4P2iaNnTri0nI4J0/LQGhnOJDhOdzfJKWuLi6OOc?=
 =?iso-8859-1?Q?EZ/Fy5K7y6W1sUDj9+0JPXm6sQ5dBDNDyz+RXqhupycGn2axJ/8qNDcpHx?=
 =?iso-8859-1?Q?KTma1lCD5xFOKExRaun/A0YBULmuXertn6upX/LjL6yrTQCuDbPREzfuFU?=
 =?iso-8859-1?Q?PaUpn3Op9L30/n8igmgxqYm5if6yfZu0Z3UuvuRKFJuGat+yV5M6ZVJwh6?=
 =?iso-8859-1?Q?R62jQQZnvObjXiP9eminFPfBLe7RZyAwSotKpS/teSv2/+NGWohZYWaDh8?=
 =?iso-8859-1?Q?2PcXMiZnZzotdZFft4vJXrMTXXoffAgYZ6scUVyUDiAzgyKwq2mpEX4brv?=
 =?iso-8859-1?Q?/2IUQk4qYzi36OQ9Yz3T9aIKx6NapAum8qv5MIQ7/7tLLs5C/L7hXpEOPe?=
 =?iso-8859-1?Q?rJZcaYU19uY3g++/NhOY9BHqlNvrnEYgjV/vllTH48suizdw5Eix7fV5tg?=
 =?iso-8859-1?Q?YopEW6H6B3IefpZmtPBKMEga/KgFHyToFXXQCbjpSArCaEt2wnoozwlRwA?=
 =?iso-8859-1?Q?v6ApzBREvJIo0iAZ4pNv2XGfV9WFY5n3Lv+6XtpXCQvFd/IBLTboOlsH/6?=
 =?iso-8859-1?Q?BdlhTioJ99yo03F/yw2z54QoEgUoVHBFAS76JQJUD+/GsumVD1tY9Sy+Cu?=
 =?iso-8859-1?Q?GcJkM67IvCRncMH4cImLfuxqUYHe/ktXMMaJsBIW1zc8nE62gsxxv+FZPX?=
 =?iso-8859-1?Q?xJdmOwzTPn5rzEo69BbQVhx1ZlBAb0YyO+3ru7hSyj9N/SuXLHpnqEuoW7?=
 =?iso-8859-1?Q?rsBA+w28Gi3SthJ1FzRsU0onMn3jLioCxQNLGKtgUjLGepVms0MG8ZwXAr?=
 =?iso-8859-1?Q?xct1Bo+AMFwShDtUPG0+Vw3tUjeFvjh5ZQ8QAnQvhATYjjT3OifgrkyLGd?=
 =?iso-8859-1?Q?t5SPmFAn2dtAeb5vOk8eBZjegeFLLo6C0RD9Zv01gfaNEP8P15K27sYKcY?=
 =?iso-8859-1?Q?VCDzGMMmyqeYlYJhSLgPU3wKIvTi0pmZj6F53kqrA2cNppacsv/g82nyYM?=
 =?iso-8859-1?Q?UWneuPiJWQyCW3V0ViTU1FY67p0q3dNnFVllQl5ha+TJUzoGlq6Pe2aasg?=
 =?iso-8859-1?Q?EFYvGrOaZ2gnTOS6OpFpJTVsEcXPe4tTfUN8gNK0j7t7fuiKb57E4Gm/TV?=
 =?iso-8859-1?Q?RJdJ1y2gxaEEi0V9XvIWiginjCD7v8NJFFfOTgXbD1IxrV291D2TqxPBdt?=
 =?iso-8859-1?Q?4PNBaMfa8gO3jJtxwek++Fmmc94KKGt6PTR8Q/Dck4s0Gx9P5TdoJf/+8j?=
 =?iso-8859-1?Q?SAX5hyt5sK+Idik6lIYfM4JHRIshKbOQXXkj2+R11HqaImYfWZzzdhhd1f?=
 =?iso-8859-1?Q?L5N3iYBZk1PiT8Htuo36ZU4o1gYr7yfT4akQvDZjdEr3iGSNviZL7m3bWC?=
 =?iso-8859-1?Q?mvfUsjorheMpPfz/8T/nRum057riISmLYPqcWwQ/2FIsU6vwPtEjGBZD1v?=
 =?iso-8859-1?Q?0Zanf3cZg0ekdnJaAtEmX2BiJRXe81qJ8LjHIkkaTilj+8EXjiQgFfMJ9v?=
 =?iso-8859-1?Q?jYlMaY67812eIMMikMGeJFsYvonF9Y88gNjDHwdm7BOVm4aBeSw4qEJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <7F3BD7ED61C260439D56C2FDD8828186@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: J5iwf4OQBJSjDWRkum+qWb5wU3bNhslHlmdmbZzrr61Dottnl0DCQ8eVGh9Jv59HPKjIgvoLKyZLkA1cq868UEe+1EgMs1F6StOX3sXClFo2hLgrnFdTbEo3GpKC4Ziattxc+RxRWtyYpB1zUXSLwhGjW8CSiPU7S29pzmrAhCVaBlAJOM0WZ7v8yaOH0rcdhVyldM4ZC1gNxi2R271fuvDbhzfCl3zoMg0D/8o8ysjoGGurs0fzLg1yQrL0yRhVGvsi+uP01XVF0TspCr4edvmSDaaHc3qbq+ReAC5v01UvDAYkCVnCeYGUG8PY19lJfhSBhMn7YJhvRgEeqotBF5rYayPqMlc8sUy91PV4GSFjD8SNNeaCKCEmjFDTnu+OLAIf4jcX0X/W0NFe7GiN+pvX6U51+eln3BdpxssSYK9iQ1CFo85ZOaxHFL2Qso7dUqFQmIUalYiezo2MrB5JWXtJ3ukrmnXdjykNXTUWg368irIGy+tbwQ0/QrCfV35JUUKpWTPlBLDfAxrSBmnE4KeMUPEScYk5keTYlhKnPKWzehUZlpE1D6oa5Fm+ac+mgOdV7Hqtw17DfdWYUIo/OQ8Q/GQSQRRxo7iKUYDJJsvEKoFu5cUJLE/IMfSd+a2c
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a59810-f3e1-40ce-1506-08dcf36b8c07
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:04:01.3839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: etBat4K0yHBH/EKWLak7BnymbTLf7HwPmMZVjzF1Uq8lI+T3u9q3E2lyt8yTOXNaDBz8jOa+1iOOuCpNO885nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR04MB8711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729692251; x=1761228251;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=yBefyKBQSSHjfVAreaDfRwXG1DeRHhKgO1GDWsVtk1A=;
 b=JrzzJkSdg+x3cqPt4Z0K8BE7Y3vxJRB05uoHGWGBWGB0G099DQPltpBh
 jysoiOGv/E//nc7XPc4qAkSx57q2cufGJlVD7WKWF1AvFHVZzdEkFJZZH
 CX9cC2kJrA1+3yvu1aiKfy5FcM1CpJfqK1P+SSkcOByCNR2pZquiccZdz
 XupJVASHhAg/xbUSIRqcaQGoiItCJIMcnEbu0SXYa63RaS1/oNR/o5WM8
 J0um61pTH+WmTA5ToVLjEUN1vm5y2FZaTCRqQQmLlGCgxw4uIx4KESOls
 t5ylSRJP04yI32GBSkBY0PXD5QC8wAfwQod+n7SNyrXi/4qy2hlhQ2aMs
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBefyKBQSSHjfVAreaDfRwXG1DeRHhKgO1GDWsVtk1A=;
 b=g4+sY1lwrN6I4o8Izv4wRFm7r+kXVnofdFU2PmCFaQxdfpshEz6QPAWXm8FoliMkL4GhiT2hnIDKp/F/fqDb7QzpaZxVR6Ow1hQSaXugjjzBlY8mVtaffc7JWHTsTTen/xkirWq2XwcqaDsgcKdMVLn+IfBH5OKPZqMIyENYMo4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=JrzzJkSd; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=g4+sY1lw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 02, 2024 at 02:38:50PM +0200, Niklas Cassel wrote:
> On Mon, Sep 02, 2024 at 01:27:35PM +0200, Michael Walle wrote:
> > The linux kernel can build device tree overlays (.dtbo) itself. Add
> > support to build and copy them along with the actual device trees.
> > These can either be in-tree device tree overlays
> > (BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
> > the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
> > overlay source files will be copied into the kernel tree first.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---

Hello Michael,

Considering that this patch supports both in-tree and out-of-tree device
tree overlays.

I just saw this:
https://lore.kernel.org/buildroot/CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com/T/#u
https://lore.kernel.org/all/CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com/

It appears that it will no longer work to copy out-of-tree source files
into the kernel directory (which this patch does).

Does perhaps this patch need a V3 that drops support for out-of-tree
device tree overlays?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
