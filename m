Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C384AC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 11:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50E0640F7D;
	Mon,  4 Aug 2025 11:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0rZrHFtlayv; Mon,  4 Aug 2025 11:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4E640F16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4E640F16;
	Mon,  4 Aug 2025 11:38:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B2B91A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 11:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5989640613
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 11:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBL6i-5vgdnK for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 11:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20b::1;
 helo=beup281cu002.outbound.protection.outlook.com;
 envelope-from=hhansen@avt-nbg.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8BF2404F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8BF2404F1
Received: from BEUP281CU002.outbound.protection.outlook.com
 (mail-germanynorthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20b::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8BF2404F1
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 11:37:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK29V8tJGaSe6t7OVXEoeGDG1bTxMgqYDTAKypGu+et5F8vfXj3YCxpwkS2vHJUwb4PnGUXsZfiKh6RcuDvA9jsvfsiUSnDio3JCBCTl7zs4XoGTxgWnCSdPuzFjsBmtJ8hJNzRW7bGZ/Wa/EP/3bOJATSHPap08XqiOjQyU/0J0aPPdNRHBS/aSxq0v7SW1UAT+30qCL5/a+AWCNzgQx1qgKXMsbWQd2RcH0GbW2GpKcpKM3N9MB/oH28X0/3mqCkRY1y92HWAh4w1pRk4ZFrTnbVmNNWvQWrYOOGnQcPiOWB1AQNCyyQVh/7PcPI07NeTZBnaUFjTMXgfQihVckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjnteQajRCrtjnin7FYqKRj5X7x7nxAMMfvgVsYbynQ=;
 b=ay8iCVH41cE9HW3Ww1DJYirWStVUOSdHtIGAnr0qkYOiKPIgILnZ5DXpAt2ZAd0TYR6zXNySs4Q5PWZs4pgt5ru+H+aaPGIpJMhrdt1jIFYUIQU+lQVrSDtqxZ+MHcbf3gpLxmluR5Umlpnlt8biDbVd27I9CQ7fa52rr01cDQGSeLd95Yq8/izNCaYiUUf+fgkIDwx9FXGSr4lMsj9dGh05a0bxcCWjDw6hxr3IpDm+zQPb7DjthLucODS5Vl5SxM26RQLSapqi4qKlPb0y/dePsPYNUVSTVCNx9lvdtcOmGgeaOQ6nt6jr1KKkhrkC7lfovPsQgsdPGp962RiT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avt-nbg.de; dmarc=pass action=none header.from=avt-nbg.de;
 dkim=pass header.d=avt-nbg.de; arc=none
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:191::13)
 by BE3P281MB5023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 11:37:52 +0000
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268]) by FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268%3]) with mapi id 15.20.8964.023; Mon, 4 Aug 2025
 11:37:52 +0000
From: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Buildroot with Advantech EIO-IS200-DRIVER
Thread-Index: AQHcBTNxKSIr2Pk5DkClUIVtQdWYqA==
Date: Mon, 4 Aug 2025 11:37:52 +0000
Message-ID: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR5P281MB5078:EE_|BE3P281MB5023:EE_
x-ms-office365-filtering-correlation-id: ea82aca1-8a21-4823-bcbd-08ddd34b58be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|19092799006|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?6J/xNyd4cG3LT+2bAmRIF056+R7RsSflukioFber0R8pdIMChKYy7YhYxH?=
 =?iso-8859-1?Q?S7T94A6EWgia2OHGxPyMAKDvAnaVQ3Jyd8DugGuE7wn56pjP6F5OCE56z4?=
 =?iso-8859-1?Q?qCY0DYrtYe93DxHsBSj9n+/nj4Xw10bpdTDlwx1GjOB0LRkmCsT9yLMQt4?=
 =?iso-8859-1?Q?zcFkhIw6WdOJChoTOCNHp2CRExQFY2OIKJCH3OQazV8Hl0iFiLuxU0A/z6?=
 =?iso-8859-1?Q?k/G9aQZ2XOxhYPkt9PYybMxYatvxgBi9/BY8HPZh0CvZtFtiTrYNoj3QAS?=
 =?iso-8859-1?Q?DUKsG9w+pbqukYnIK9wlcE53m0orxTDV72oUzV+da8XiNNv8gpOuS/xydJ?=
 =?iso-8859-1?Q?5QgGT3OJ8Y5YdVZ5dKLi8VgUBbmiMM7g94FPaNg505kZmJWTtDsU0PTFTq?=
 =?iso-8859-1?Q?mg5BYBmeuYukVNEPUrpVxWoObP6ZCueEk+eQozbP8CaDxI3JCjFJ3fZs8l?=
 =?iso-8859-1?Q?wB+IgM38kCg/d+u/HGvaq/2kMWZ7yjSxr8yKZnHAmgmJV1TkySAKSrCpiX?=
 =?iso-8859-1?Q?Uxpj5056eFAkocogipvpC7TvL87Mt1k1RWq/1AvwnBEK4e0/tEb5ezhYaJ?=
 =?iso-8859-1?Q?zzao8Gs4AOjT1kU3rNHXEIzocrpswVv5EBudMhkkPIf+OaHUbOfv5BmIQo?=
 =?iso-8859-1?Q?mOvCo6+lBN2uSsgIM4H3YWJ84kmGITKvndLHJkjCa8CMOOwZbpIBKTvdUZ?=
 =?iso-8859-1?Q?PE+gnP6gzkf6UQDeD6b7r4fNe33n3FQ9uowL9iY3TV0tg2tCOI8v2zUzjS?=
 =?iso-8859-1?Q?QHxKlIutAnJAMX3H8mYs/3eGGETJgZKLSae6phppjTstBmL7HVRrx0X/U0?=
 =?iso-8859-1?Q?5HknrtTTbfGdk3FDCCUKyk6SZguu8lFLbVxhIkDOtWXgDvpGwa2c/XRjCD?=
 =?iso-8859-1?Q?NrERGSxq9qCk4oT7mX3GY45O9dBTdhyQ21R64YreyqFi0HUJkH1CE1+anL?=
 =?iso-8859-1?Q?i+LHUTf1k91E1RD/g0qTUSbBtwQBLFAoO2NQtMuO5gh7HCmeLELiFkuQ4n?=
 =?iso-8859-1?Q?PuiJk4DRvOigmYmh03BL40naVbb6JX2Li2V17DUVBsbr6Dya0/PXJJr73o?=
 =?iso-8859-1?Q?dmTpqjzcIwu2TuTH2UR2Lrb1ioPEPwrB2QRVKhsJr5/Sh0y9Q/c0ZtZXXr?=
 =?iso-8859-1?Q?CWjr9XlGnHbeeCJ1gr0rIRmEcPrTe0J06QfLXTw4zHztO/uFZphRICwq3q?=
 =?iso-8859-1?Q?D7AvcyvUPoz04EyEqvY4KWav/HVuNUEEFx/Gn1Hj6JZYAEUoqlVp9a7GLs?=
 =?iso-8859-1?Q?682tzyr9YsimeMbzJXr0EcJ3zKU9qbNIQm0rVEvpyJTLkNwnjtpLWailYs?=
 =?iso-8859-1?Q?r94rMzCB1frdNPEtIzrefO+FpDPUJEjXy5LnFe/C4nQwjPxIyCpnTv3YSu?=
 =?iso-8859-1?Q?Ns01wHj0uJB+6kRn8VsOm92e8fdDewJ8zPEFv02a80klRGWQ1tNZ3NCFeP?=
 =?iso-8859-1?Q?5FApYlv5JE6Bjy+RbGPAjKg2zbi5uRhmCjFHFXR3s+ODJGWhzLMgv/OSSX?=
 =?iso-8859-1?Q?2wEg3fiFuewReuj6MW7Fz0YYm3KiCnvc92rsv97eWP2BEvkAjdwPs/dr1H?=
 =?iso-8859-1?Q?TcepNTU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(13003099007)(8096899003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QcaAfvPOqiV07S3WY7DPRtpZuP8Xq1o7t90z19vO42BzpD5phz41QYCzsA?=
 =?iso-8859-1?Q?wyHE5/je6xAjHtVTkgg+1n2l4hJMJ8eKIVNe4yjw+oNEVploGIbtFZQTUv?=
 =?iso-8859-1?Q?g9s+b6cqZEGoNrP/B68Q2KOOh9suQL2W45qZI67YFSx+tUFl2LaMA7AfG6?=
 =?iso-8859-1?Q?mtb1mf8PE91/mpiRO4yq/v/iGjAwADxoNq8ALE8mjA+AU9I4HzXNOx88Uw?=
 =?iso-8859-1?Q?xZCyXSjFaHH/cdv36GtKnTnCy05j/h+u3fOiTHIZ2plQZXVXN9Xg6yEf2K?=
 =?iso-8859-1?Q?cWlD3636noDvpAzSmr9+Tbpr/HxzupjklTMytFP9pJDGDu8OlzLLfHoX5f?=
 =?iso-8859-1?Q?hkkWA4nA0MGpdHQlYYUuXvuqfp2gtWcReTXYdj/EykiWhFaGLLssivd4iy?=
 =?iso-8859-1?Q?ddXFMZEZDFBsvW/DNOZa4/nLZpm1yhDXrypPFeaaQxauhJZWy36mwxgSvv?=
 =?iso-8859-1?Q?QEAr1Vrr91UEqvRkiPlz9vgFSPuLowqFxHy5sCTO8MFpRGbXzTsmDAEJbD?=
 =?iso-8859-1?Q?CfgDqmfTDT3LFKzv0vFCwrkvZJxBP+Tbf9Cl21t4lWIZMnYyYgCepdq9Q3?=
 =?iso-8859-1?Q?Wn3da5Pj0cR7wnunUvo98uvyzVUZF3zHFIRSm7vOOMS1cguaBVxUwllWVp?=
 =?iso-8859-1?Q?DUqM0yQ2yCZzJmylIfGnuC/pYQH7raQISEMHfbPEYaFZl9eXeFj19U/GjC?=
 =?iso-8859-1?Q?F1l0Iqq85DngOtHWFK0mvZGTW17d/dKZ3+bQaxa127jHEiEXe9lLWpJaRY?=
 =?iso-8859-1?Q?4t0PUlnCvfdoxZhqJEbhIIndhElB/7WfP1wfNGvLb9VNaMTP+YAnhFyYAg?=
 =?iso-8859-1?Q?rzyo6sDFCqMM5ZtMi1Z9aF5G+gM0ipynd35wQtwc9EyOMkPK0QZZHqaNY1?=
 =?iso-8859-1?Q?KClvxCRGBNu0W3zs3KxKGJDi/nSpyEcu6CMEgMiE6j2s/nJ+e0+bRV38/P?=
 =?iso-8859-1?Q?6NwpFo57yHNzgjLYU7vnr9VSXR0PnPGjrEsoQBlrJ5NgjSqOL1ECng7p3Q?=
 =?iso-8859-1?Q?v2mO9hSUNM4Jl/iu/t+fT2RIhhAZDXVcUUP0nrnSDgbaFyjk1QWDghVYcT?=
 =?iso-8859-1?Q?RtSIKjzb9OjI2as88Yc8QNosIdyTLLBCwant+ut7cWQyd8zbamPLF8svMg?=
 =?iso-8859-1?Q?43Hxbfj/tF18DFOGPje8FrSYVApPNt9G+ahLO4lzJFztHw8kV8h10jOMtI?=
 =?iso-8859-1?Q?YlJhl/xKrMKpbW0KBg5kAyEzumWPlWFsLFe73gMqGOfdidUXum6DkHYPCM?=
 =?iso-8859-1?Q?mog/IyRij3aXlc5VlnygI8hcKP4V7/ncRxbxtkBIz7Py9e1GU9XTwNCd8c?=
 =?iso-8859-1?Q?hZ3BrTS9hmTmB59Wy/SHvffgDBodWUTlJhuA/HUfu1oXXlb9TEJ2HZ+NDW?=
 =?iso-8859-1?Q?PbBCIDoyz1e/0zYfFMrrUgcGVCxHJnCY3CpGEcxZ8QYdHOyljeXDNC3QIc?=
 =?iso-8859-1?Q?ZoC2BlgpSUUk+PcC92a1esJLkyTscsCAF7RM4E3bLh6fB6acNATYSH5GRG?=
 =?iso-8859-1?Q?p6oLNF0g+c4hsg+DufbtqqZ1rBD5xIYVXfe6J5e1Qwg7NEBeWQvqON0+Sp?=
 =?iso-8859-1?Q?c5McO7obptMBXfYhORhcp6co/4E9NnLy0/Oe2BrBjShmfFp5G8wkWEgpe8?=
 =?iso-8859-1?Q?DLaMS3vZWfhnA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: avt-nbg.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea82aca1-8a21-4823-bcbd-08ddd34b58be
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 11:37:52.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: afd236f4-ec47-4463-84a2-069e92c28673
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BbH5LeS0v17d3v2K4WCH14rvVUgyLSgKudsO+DJ1SWQ6o+UHPx/KGISuIjc4kw92vzRxDCpU9/PWkp4acNAIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE3P281MB5023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=avtechnologies.onmicrosoft.com; s=selector2-avtechnologies-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjnteQajRCrtjnin7FYqKRj5X7x7nxAMMfvgVsYbynQ=;
 b=e0rnvUq2rbtbKuEMF0lzw4NCerCeyTl+aFQxLwA+RhZdbzqfQzR0mVwwxruEOKQyNUhokGrSJxgX9jJb+d2Ok8xabu+nTtnTe2bEDrZi5iA03CPjKk+dp3aukmi/B45d7iR9L6J5c6nieu09CNef2A1YgxjmSm/66ty7WBlw8oU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=avt-nbg.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=avtechnologies.onmicrosoft.com
 header.i=@avtechnologies.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-avtechnologies-onmicrosoft-com header.b=e0rnvUq2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=avt-nbg.de;
Subject: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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
Content-Type: multipart/mixed; boundary="===============8462787899970284285=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8462787899970284285==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_FR5P281MB50782986E33353F9AFF80C468723AFR5P281MB5078DEUP_"

--_000_FR5P281MB50782986E33353F9AFF80C468723AFR5P281MB5078DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is someone working on Advantech EIO-IS200-DRIVER (https://github.com/ADVANT=
ECH-Corp/eio-is200-linux-kernel-driver) for buildroot?

Best regards,
Hans

--_000_FR5P281MB50782986E33353F9AFF80C468723AFR5P281MB5078DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Is someone working on Advantech EIO-IS200-DRIVER (<a id=3D"LPlnk657585" hre=
f=3D"https://github.com/ADVANTECH-Corp/eio-is200-linux-kernel-driver">https=
://github.com/ADVANTECH-Corp/eio-is200-linux-kernel-driver</a>)&nbsp;for bu=
ildroot?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hans</div>
</body>
</html>

--_000_FR5P281MB50782986E33353F9AFF80C468723AFR5P281MB5078DEUP_--

--===============8462787899970284285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8462787899970284285==--
