Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA07CD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67593820C8;
	Thu, 11 Jun 2026 19:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OTOVf01Ks97; Thu, 11 Jun 2026 19:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518BF820CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781204531;
	bh=B9x77cKKBMp0VlQmr3PJTGHlrawYa+3jkAFWc4aFAcU=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WCrm3Uboaq394x8nE4YM2KvIOgg83jmNgpFh3PD+7ADGnMB/fAd7a70cbkgD8ySMb
	 dVk5LXWomWzCLCwex3VgeKfOUqBj+xGweiizL7Ly2TzaljKwSorx10qLzTQ6iEbJjy
	 kJTELn0xf/AlfZtp1NPviXC8jWhVUMYZmYLviic+do5+yby0xcnHs3v2c1vTSFiLn0
	 lY6+mSwVyUbnwDTQOsZ1VQK3F2e6QfJeEsD8lSJLXgmqqa//YIJsyRsAMVDKpcTx3L
	 93SMxKDvCZ9rCJkH/gs5+CyRZGRedej5p5tz3HmjF7/JjAfpmh4e6x2NmLQsTe6PN4
	 A2EWGGYKOtYxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518BF820CD;
	Thu, 11 Jun 2026 19:02:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3800237
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2BAE820CD
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi8dseonuY_x for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 19:02:09 +0000 (UTC)
X-Greylist: delayed 470 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Jun 2026 19:02:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A7F4820C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A7F4820C8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.144.162;
 helo=clt-mbsout-01.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A7F4820C8
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 19:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 65BIsEmG025217; Thu, 11 Jun 2026 14:54:17 -0400
Received: from XCH19-01-11.nos.boeing.com (xch19-01-11.nos.boeing.com
 [144.115.67.131])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 65BIsAaI025146
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jun 2026 14:54:10 -0400
Received: from XCH19-03-11.nos.boeing.com (144.115.66.119) by
 XCH19-01-11.nos.boeing.com (144.115.67.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 11:54:09 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH19-03-11.nos.boeing.com (144.115.66.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 11:54:09 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 11:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dwc0peo4sAldaXarIT2M6UBvcjLb9zyM+HSRgypXpw7CY7algITTafCUmb58obLV5bCI5/d4865DZHRSHRhBgnuCma5ORqag6cwQeJDI71MXjJ3kWD4dsO/FuLTNgiNIa8rrq0t+sZEbzV5sZBJbvUuRt+pTAgekjetBAnTqx+M8zedJkOX7jIvy3Re03PVHd0/1I54T5a8q2X/87mGBuP94Ub7dj/ijDx7G8s1oqXoLrvfgiKKw6xfvuHVXqexga7LuwjNXdrSbKVSCj1xYMHwP9UYmz/zJm1OxUYGNmFkKb4fAqAba47TlpELVRw6kkSvWzcL+I6f8AS5ypbl6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDx+NUIpjxrt8P7QvZ2nTXRyQ/yk58WPECfc4lLDI3I=;
 b=cII4cXflRVNDNPEK81Z55dJJA61NeHYfkHb4cOvC0oGqx8c3zl868LPQXouTkzuGlSozcTXVFDuxwRvr9dk+sh8GeVU1SasdZ4D9J128LgfPKo0kg8UBx5zUX+vVqMr4K2VoVlnAJmZyn+XkT7kHpa/4zqVPhUxWZ+bGKiWNW5s/ywaesgBOGQLgX76ke+WNNIHA3tXvkr3zW3gPg6QEADWpVjhBnFgU+uApV3++te5/i31EyuUDHl0kCpmhtkZFfuKM2czCjfuemo/tyz0/GOJfROQbCRjH20ngn+d8suyd8Hgix1xcl/W9kKynjsFEqaapkyUzOrmMns9z3lelvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by SA1P110MB1814.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 18:53:52 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 18:53:52 +0000
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [EXTERNAL] [PATCH v1 1/3] package/xen: add custom version support
Thread-Index: AQHc+Yvpi0DDIqg/KEarwFb41sAqArY5s6mQ
Date: Thu, 11 Jun 2026 18:53:52 +0000
Message-ID: <BN0P110MB2067627ADB9804A7CF59844BF31BA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260611101734.1968785-1-neal.frager@amd.com>
In-Reply-To: <20260611101734.1968785-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|SA1P110MB1814:EE_
x-ms-office365-filtering-correlation-id: 4fd934d3-d556-402b-97f0-08dec7eac7ff
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|23010399003|38070700021|22082099003|18002099003|56012099006|41080700001|15866825006;
x-microsoft-antispam-message-info: jRqY+gg4/WdM310x+KUB6/0AjeiRJOnJ5Y5w/rGUud8C/A9QlPlrQ5IGnyBrklj7yfHsjOspo5GGmpf+qyMnopIMQWD9lkLUBiU8m5oiREVV8AdjhBh6CJwRQiEh45WB1kiXgBmDCw/WE4RG0ghJADl/zOOsIiaBtvrxRpirBE0c3qpkFhdywateLkoqd/p91QaP4dHCEkannQ/kMlcOTdcTNBij5eRhixUjFNUbo5jcTdMlYLiNpsx96zYufyVV3Gx7iHIAnX1TZZKSa7PsYkv3+ltk24Xr1gEjz2+g14wXnHT/f7GKiA3MNmrU6W8/5DPQJaKBNdW8uDz/Epg1oqlR6hiORTAv4+ZMTkKCNNW40UfgcGOTEdpPd+pJO4NRGueTCPLJ8m+7XJGCqwQK+pGm2a8FPsN+VJt/8xLkFvG/1C8Tf4sgJaZ6OjpBBatrwLZAF+XG2SMGl6wz42DHn+WjFY2kYd/I3Xy7l8qrZ3LP9ZZjkt89tEr8nsNwO7q4wZ4oqkdSoRPWF0c1/vMngrsEb/XbJO1BtK1CH/73FcyYZrdXwxoruz8kzRPGxHxy14t7WvCF53L2kxx7Vof7PSZp6379kDC1feqraONNJPH6kIz64q/9zQP8Uq4+a0uygJZMx+bzKaR6HllIcobVokBBKCcziMzLok+zgLRmDvgVZZ1n2ddkaFshZl+Q38+Vo+cc6lDNHbE4zwdIENqWFtliX18AI0VB/V0Legrkx7FUOAN72nrXYnqt5U3099WHsfTEmDxVPlU28EKw0cUkvpWHHGct2A9eovj9hwzS9nEMSNYcM5Y0NTEnunlcT9ud
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2johp4YqLwW/fBrFwyqPfPUR6XUh6yJP5zn1x+uuyLJRcxvhYm6CVEEXtMl2?=
 =?us-ascii?Q?PgtpaJYtuCJGPWM1OP5oOYqJbW1E9QW0il2lOiBWHuKZSTJTpQL6fdsJg4YE?=
 =?us-ascii?Q?3x4U6oCZTkDF8+VcUrhhfeE3qbWq0knOeG4hXFvS5I+BmHc2Z31jWD9DwTqD?=
 =?us-ascii?Q?N+b/WNSW/yB7KVhLhwtuPQPstyyZo5vtyHak8of3+r+D5KdP59vYlbrOvgl1?=
 =?us-ascii?Q?gnhEivrZFxkq6OWFlUU0K7Guq4jxidc2XPz0hTJQMElU1803ViafL5G+Xdim?=
 =?us-ascii?Q?DbSm5E7WGaSaBTpJHBgbBNXU7eKu3m9dmAGcm81kNcI5Kxqz58kDs0K5PMoe?=
 =?us-ascii?Q?s9ML009X/XvK2L3HFcPJQCz/18r4FeAnMtvkXDr02JIowODyarZqnlDPgeyv?=
 =?us-ascii?Q?63XUDcT4HjyR9eOD+NjP0n2LeX7HlRElsZMYMwckuOjpLINXUlhzJa8mPWHy?=
 =?us-ascii?Q?1b3JtSsvK5aQj18JyzE6ToIpjaxU91Ym6CPIGV3C33beCRn+KhkfIgi4Bov9?=
 =?us-ascii?Q?31AkynP+wMXsFE74DHpzp2/DBbP7G8SS7RwhUqNTk1S0pr9sRw0SHUoeveux?=
 =?us-ascii?Q?h1/9c4hkKj/1j1CIB0nALxwvGc2TPAlJYsSXCGRb8m1HmA6U0JxjhdvdcI5i?=
 =?us-ascii?Q?zSq6txH7qz91z1HScnh8L6AD/wPedSFcASxUWgeog3HNMCgRZrxhFBNWWfai?=
 =?us-ascii?Q?XLizsw+puMeCLR2AjoYptvITZ3+r8AhNYlPBlv7jcoLDvZibthcZ1EvHEqE/?=
 =?us-ascii?Q?4WoTq77+U6Y6lbSChRg9DI3I0ppRAZGytW9YDfvQgUHOkrDNdA635ci3F3Qi?=
 =?us-ascii?Q?fcbT2zpd0MF28bYeaIhUbDj7wYxhwAF3ATO3BDFf54zBlb3tO/7OW4LBeD4Y?=
 =?us-ascii?Q?sYxvIvjPe7J9tZnoyZ7ZFiQEFilANcHp1l2bDLZ3z4W8PVXd398ZH3A0BtJU?=
 =?us-ascii?Q?iISK6GUqBQM4KoCc5NSbukGP4kFua5s6Ppm7HKy0pzlAZl7BmYFtQfvNEf7q?=
 =?us-ascii?Q?BwkNT3hiwFaz7GNKrv+FtGps0sJHNEbG/24A1fNkfdM1vF7esOdLZn8/DU1u?=
 =?us-ascii?Q?Gm+TGJxiy/Xg+e8ot3YGO3qdlkqoK1SblHsS2eQueEcR/sFeFpoAR2rpEV45?=
 =?us-ascii?Q?dbH6k8TzvG0OF6Knna6yehPFPWY/9HKYojlzBLby12yRzFI3jZ1cooFx87ap?=
 =?us-ascii?Q?GVRPONPRjT+Y5MEp7UwRGVN9pl3J/NRP6hKOOMYTLNpvW6OGpT/DcLBHgmTB?=
 =?us-ascii?Q?SbcXVzJEYPS/8H1g+aByIsATjLWxjk5NiVyRKEVpIN3FKZpX5va5tBgwPerv?=
 =?us-ascii?Q?HC3Ib1GOVFh1mzhT2NLv7IV4KGlfCkZl/Cqt8cU1S2J443vpgu0lBcxLgMpd?=
 =?us-ascii?Q?bb4myuzNUUgNl/iG3VR53dFZ6+YOxKMlZBPT7XFK5LJMuC42pYuUjzdMzCR5?=
 =?us-ascii?Q?MObKtBeonv+KA47Nyq6TYLMkwDTwjIJ9mTFkgZ5UAeRYS+MCDF1WqqxxR/Ga?=
 =?us-ascii?Q?3dMTYd5IGWiaCaSgO6mxLnf6K/JpDhuF2lNXa1Y/HgrKk/JT0uZj5YM013xA?=
 =?us-ascii?Q?ZlqTw95a/fU3/DEySMlwO7D8C1EMskankmkWjDKiM7F8duVdyzSwv/9cHQsI?=
 =?us-ascii?Q?OD1UKGn6k7hTbJXbeSmWrKwsY4Tcaub+sSWU5LOFf0dZa8LlOHfFo6g5EpbS?=
 =?us-ascii?Q?b7WZ7g=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd934d3-d556-402b-97f0-08dec7eac7ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 18:53:52.4377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1814
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1781204057;
 bh=CDx+NUIpjxrt8P7QvZ2nTXRyQ/yk58WPECfc4lLDI3I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=i9Ve8VoBCusngdzwHP1hjuq13ie3nqKMdNi8kM4ZlQTRM+EXVLAF6qutZYktLCfx+
 csNrA54iavBN31GkTtFQjCTsTx83Rbrk/94vvbF5Ioo/j7vsGiEmLr6ak2xB1LH/Ih
 P0UA2Hfk8JvvEwpvtVHpqqBkJlKrFcc4PY+AiwAhOfHdYhRjM6Rzp/LYguALeVl6+3
 DAaOq7cvRubteLIwUMZdg6Fr6D3GHziG7ghI1LTtiW2PE64X2FVSWRC3w8Z1xq+8K1
 bBPYisdkv2oaya/3IAwdkaBw8vRIz49ZM7WBGy17KAiNr/CdSpIYoHL/ntO24u8ZKO
 Vle+LMeoYHrnA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDx+NUIpjxrt8P7QvZ2nTXRyQ/yk58WPECfc4lLDI3I=;
 b=m49uVl3jTLQmo3NWyqQ71gvZ2Z0+Y/XCP20n4xPWVoEA+7OLaHuc3yU3Uv+OIPRhQayfVp4LQWcaOwjI6YLqfRgR1IewMWz2FpH8pJr3FMvE0pV1jSd7btQZk/nN+3hPRFryj1tnq33ptkEJRQ3fsRYy/i6xzuahPN5LPLyuYuA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=i9Ve8VoB; 
 dkim=pass (1024-bit key,
 unprotected) header.d=boeing.onmicrosoft.com header.i=@boeing.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-boeing-onmicrosoft-com
 header.b=m49uVl3j
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
Subject: Re: [Buildroot] [EXTERNAL] [PATCH v1 1/3] package/xen: add custom
 version support
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
From: "Weber \(US\), Matthew L via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber \(US\), Matthew L" <matthew.l.weber3@boeing.com>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "Wood \(US\),
 Brian J" <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal,

> -----Original Message-----
> From: Neal Frager <neal.frager@amd.com> 
> Sent: Thursday, June 11, 2026 5:18 AM
> To: buildroot@buildroot.org
> Cc: arnout@rnout.be; luca.ceresoli@bootlin.com; thomas.petazzoni@bootlin.com; peter@korsgaard.com; michal.simek@amd.com; ju.o@free.fr; brandon.maier@collins.com; romain.naour@smile.fr; romain.naour@gmail.com; ibai.erkiaga-elorza@amd.com; yann.morin@orange.com; alistair@alistair23.me; Wood (US), Brian J <brian.j.wood2@boeing.com>; Weber (US), Matthew L <matthew.l.weber3@boeing.com>; stefano.stabellini@amd.com; micheal.saleab@amd.com; Neal Frager <neal.frager@amd.com>
> Subject: [EXTERNAL] [PATCH v1 1/3] package/xen: add custom version support
> 
> EXT email: be mindful of links/attachments.
> 
> 
> 
> Add the ability to configure specific Xen versions while leaving the default version unchanged to avoid breaking any builds already using Xen 4.19.5.
> 
> Since the version can be configured, the 3 patches need to be moved to the
> 4.19.5 directory, so they are only applied when using this version.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> 

Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>

Tested that selecting BR2_PACKAGE_XEN_LATEST_VERSION correctly resolves
to version 4.19.5 and downloads from xenproject.org. Version-specific
patches in package/xen/4.19.5/ are correctly scoped to only apply for
this version. check-package passes without warnings.

Test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
