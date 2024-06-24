Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34BAC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 08:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FA2406E2;
	Mon, 24 Jun 2024 08:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBmugZaXwobd; Mon, 24 Jun 2024 08:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFCBD406C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCBD406C2;
	Mon, 24 Jun 2024 08:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6581BF5A0
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 08:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78B0D60877
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 08:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndYWnvsnDPwd for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 08:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2601::700;
 helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56AEA60870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56AEA60870
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2601::700])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56AEA60870
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 08:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHpulCJV5nEvik7XxUQKiYKhzj7eKoTw9JzyF0/jG8MexGlWgXw3T9FU9LsvlZMRY4Y7Yx1de1KmaG5iV9JWdlGOR13oi2MlfOwSv0U5HMUWYayavi4tKcl4tkI/j83ZAgs7PjvNCc29txH/j+jB9SB2SEpgoqZMhrCHrQGKd1e2TiaE6qTIXT7OIcCOLiBOpni33gn9kNUKlxo8bpOfVdqj4LcJCqAUpsbzWj6lFiS1UvLK1ziA34IjzWvKFc/8LskmSUddNw8/3PsdJ+7xAZvQoEqpQNWhvTPdaxby5RRwCc2ZX/bXF3MI8y1cYVswr1Eo4FEpQetnlDfehdVCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/m/CLVbVB/MRIU4P2SlEagobJM7jKaMzC0eU5DcJHg=;
 b=Gl/IZP0y9rq3nfaGbfF00bUl6+KKuBEu7nmNnp/how87xDdfid1RIMfUUfNoxKOUb78nqwHGL6Ey7oEDiqLVHKi4IsUtKdrSG0ICyewsHFzIerC7G8m/pGSFWElaMcMoQJQHsXTv5w5Vu4q+z05A8jF1NypcXG1KeOnyGtk7t5iTF+sjE269COP5/8WBW/viST82Dmg9k8zoFtCpcfeqL+RqOihjmK2+Sj3SuY4nDSm7MdGgWEAkoeZuV2h10NQFVNUL/Hw5nm7HWQD4iCoXWqH0YTEqC5MF6aYLucNCr+yBnSGkkB0oC7HloyxESPyrTRQ4IKcQUMuUaxUPqO/Vdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rtone.fr; dmarc=pass action=none header.from=rtone.fr;
 dkim=pass header.d=rtone.fr; arc=none
Received: from DB9PR07MB9104.eurprd07.prod.outlook.com (2603:10a6:10:3d7::20)
 by AS8PR07MB7301.eurprd07.prod.outlook.com (2603:10a6:20b:23b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 08:31:58 +0000
Received: from DB9PR07MB9104.eurprd07.prod.outlook.com
 ([fe80::2f9a:30bf:6636:ec5d]) by DB9PR07MB9104.eurprd07.prod.outlook.com
 ([fe80::2f9a:30bf:6636:ec5d%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 08:31:57 +0000
From: Gael PORTAY <gael.portay@rtone.fr>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version to
 v1.20240529
Thread-Index: AQHaxDLu9E1l0Blby02DoBXulSGRNbHSwYAAgAPLmmU=
Date: Mon, 24 Jun 2024 08:31:57 +0000
Message-ID: <DB9PR07MB9104EEDA904AF785C1A5205182D42@DB9PR07MB9104.eurprd07.prod.outlook.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
In-Reply-To: <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR07MB9104:EE_|AS8PR07MB7301:EE_
x-ms-office365-filtering-correlation-id: df449407-4f97-4abf-564d-08dc94281ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?FmN2vf7mNOG3LIUHOk5XaEZCfC0Qgg3obl1qOt0+nX4VEJZfWFwGxo6SX9?=
 =?iso-8859-1?Q?DUxxrbynfmpquQDBgdeZPxqrUlKMaoiCw3SdEx1R4eEsleDsUqGqYopKsf?=
 =?iso-8859-1?Q?6Dn6IprO+lDe8uVorHQ458Ger1kcBK6y8xXjCfFpcicCTvZJ+WCRiQdgUC?=
 =?iso-8859-1?Q?ZMqdvn25iY9cJ8DNDyCvoKcvrPH7IbbTJwFs8ZZpmEZprf7T6ezyJEsqYF?=
 =?iso-8859-1?Q?6INgd3F+j44eEB6nj7thaNmaOk2PwCceSS5KnhhtwRlXaTwlZE1Pzc858n?=
 =?iso-8859-1?Q?cNq1Byl1BwFDdk0Ol5hFNz5G33zK13zz81j60g23ZUlSHuaAWzkYENa/su?=
 =?iso-8859-1?Q?zd4/Jgq+5KmWAR+C64WSKWKk0jaRD1ny9zyU9JB87W00wDnMXImx4wInqm?=
 =?iso-8859-1?Q?jC1fbjYTiYyrHnWav9LGugwslbiuDHYh8Q6XOZBfaLSENIXCAcZQVsdrur?=
 =?iso-8859-1?Q?bCXoCkN+u6yOSzHCpMDbSA9Yt7UN6jc7i8znt1rsqrK9hDeuzUrb7jBztg?=
 =?iso-8859-1?Q?ShzsHRh2XvJ/CeAf9ukXUjNnzKPl/+vjy9gTjHGX9GKOEjSBWjAR+Z/zlC?=
 =?iso-8859-1?Q?Qym9TpwO5CCrDjuRB0yUP1z96svZW3S3zGYXMPioapFQAKx93KhtJlGYBt?=
 =?iso-8859-1?Q?m3Jr+RuklyWz/HGA/7qNGC1rHHeI/noaqd7U3bqoNsVKeKFYP77bSiDOxA?=
 =?iso-8859-1?Q?aj7oQzjKDVojpN1/i8MYisos1pljAFaF333rPmvW/R1vi5j6KRf4Iw2n/Z?=
 =?iso-8859-1?Q?RQ0NCQ5kKU7gR8VQgtzysKxZO0lNENkovM1++g8fsum182yPvMHBQd5q48?=
 =?iso-8859-1?Q?CVMAZ8w+SeMByZP0tVbOtr5rjl8Ij5v3Zijc2A2ZhhWZFTCa6qtdsjt1eu?=
 =?iso-8859-1?Q?upwptWs/P/EnV3s8JXfLv5FqlJBRvTrRGEIU3nBrGwlCh3+KPybU5hwuQe?=
 =?iso-8859-1?Q?eR1KqZE7y0tX8WqP6ZyFcslzspxZzAFgN5Oxa9dESja6uNl+EqtXoqbWzP?=
 =?iso-8859-1?Q?m9Nz1h0i6ylY8T9TE2ocPM3MGaAP/gAiz4v5i9byfPkSvHKF/89xh97lc3?=
 =?iso-8859-1?Q?aFsZ5j8xI9aJOdhs+1OU8ODsMmZu8DOeEnCWkZzmuJldzcvcUvYTFh778k?=
 =?iso-8859-1?Q?YNELjt0GXpz6A55YKU+9vd4Vcm4ka9uPfeei8B7RPqBfkZvKdISVT3cLrn?=
 =?iso-8859-1?Q?+d/nYNp7C5TVY9/E+0YWcCVReFnF+L1WgroI/2S1T2lQd5jToO5MPmH92O?=
 =?iso-8859-1?Q?ZENBfLTcbJvlO7ug5gTq3bOQUCg+4CEOn2VrB0KQf6c2kNYgT0yKze9Yr+?=
 =?iso-8859-1?Q?0mRDPJQX0mWO+9/njjCWUjTy97lIbtBgHgIWfa3j26Ib0hQnpik+vvYAOP?=
 =?iso-8859-1?Q?6fJC6HTgtuRKmd09+Mw1FbPXUx/FQVRRUSPIs4mqksVfPpNaEbtGs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR07MB9104.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cydRdT0ShWcKUdcbAiN6xdtuGV/I7+Gllvm/+dQ9PcZ/0kqgllmr2stSK9?=
 =?iso-8859-1?Q?RBgjtejBunFHI8+marn8+V1ntCpDPX10kmLzx4+BcZT1VJUAEZhtacB3qR?=
 =?iso-8859-1?Q?HqEC409Lav87aMJeWpBNEvbik5i/+BeV2xnLBfmULso4QVEc11UwVUxJrZ?=
 =?iso-8859-1?Q?8sX5aLMZrJnNZRARmQPEMVA1FtXsiMNgDltcCf8FfXpfgGL6l1Ke/kQt+g?=
 =?iso-8859-1?Q?sIN/aaJ74nBVLuzLaPoV6jezT5skKNix08Kcrl43f6PBCVb+Oz2eV7K0nd?=
 =?iso-8859-1?Q?mqbNp5466hpTXcoPU5JqW19NF5O3HH09EbW4rbFRB6Wn70YzFUmrjl1tVR?=
 =?iso-8859-1?Q?DhsuZHbChc5sjWNFbWKCMf5uilkWjnHOnyr1fnQAKpqQ2DYVcFi9UhLF9z?=
 =?iso-8859-1?Q?ARVh63jGUtO/uD7fI3O7ccCelH7Fycc3uLK3A9280ANnaKBVN6/w/HT4vE?=
 =?iso-8859-1?Q?lzkCQawAs/2PmAcm0dZuE6wm4b3yRpWAuqD1NtvzebVhvFIYW2+bndFriz?=
 =?iso-8859-1?Q?TtaaTHwxFHRYDUAJf0aGCNEKoUkie3spD06dpYBVefMHxIIQkK0BRwcFsF?=
 =?iso-8859-1?Q?boKqPk111prNgCuUM1xAZYmaMKsBTIwXPCKR5lWra60YtugNmLSty4zoqU?=
 =?iso-8859-1?Q?f4ojVN8WJFI6EsHiIRwnyiIKHNx2u1d5WZg+HtLzKUN8YFc4i0F8GRgkEO?=
 =?iso-8859-1?Q?IR0tpfQEZ9mWKWW5YkYasQxebM4I5OCJSQE2cs2HCa2Zf3ghHldpGpq8QT?=
 =?iso-8859-1?Q?ArxG7vRBlzMITjsl9rrya6Dkt/+ztu7VyF4iOPx+3POargz22DrwrMfgH0?=
 =?iso-8859-1?Q?At1tjX2OIZzPcQ3+y11ES3OrLWHS7E5PfULoCJtzgcQhUZXzJHQvlFbKEc?=
 =?iso-8859-1?Q?HfTep/q1cVrdY3CAytu/3tVqKSNpn3uea9TM+hwcXYGU9CZc68ix4u1Rkj?=
 =?iso-8859-1?Q?npyCb1wMtwDtUMb7u9o8ZlUEWFAreKMUGlgYg9IavinR9Qf6Zt4ER7XmUS?=
 =?iso-8859-1?Q?G06Zff9VgKyWX2N2dO3gmztWbiqWr/8o6qh2vQkwt/AyaXgjQD7mazQI8o?=
 =?iso-8859-1?Q?qC5W87odBRZ2/20TOLN02ZWHXUIEyw8527VUCHh0rS7gUtcFrLmuHek1v3?=
 =?iso-8859-1?Q?Z7W0+Bky5fbjQVzhIOH+YNYwsX7W84N4j7jRAEdg2kauQkK5lscEQGSNGd?=
 =?iso-8859-1?Q?bzcuNit4dmMMHZMftK5T5ZRODT8ycoEQSPhL0Oj7PfooBNaQmSWFAmZGs3?=
 =?iso-8859-1?Q?SVPYOOydvmOe8rxsuH9r603tPDpAc45EaxdtR0esFtN+I2v/x7eN+0roPq?=
 =?iso-8859-1?Q?MYamsm1Q4PQozudEirAen93kVZZmfSkHy5CYju3vYfOV+UIC5vL+YJXd/B?=
 =?iso-8859-1?Q?5dYSbr7ncd6OLBBnYZxe4dlSmMudfJsOb5rvBtGY6pv6uE4jeA2cKmeYu/?=
 =?iso-8859-1?Q?HpgIpS5hSrB7D0PGEu7wCgobDFtV8YCmC3xa01g3LRFX2xZueYQhbYzdLH?=
 =?iso-8859-1?Q?dpi3rH3BPijv+4tz0H51sFt2Jpx5vX5woc50V+dDK7quh4cDF+GOeQz46o?=
 =?iso-8859-1?Q?m0jooyX/VGSpxvHLnotMF4OlqiUgySPjU42ysyC8ngZXxlqBjbHUD3l1k1?=
 =?iso-8859-1?Q?phPI05Krt5nMg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rtone.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB9104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df449407-4f97-4abf-564d-08dc94281ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 08:31:57.9578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3fe99b51-e7b8-4586-ac15-d51c0df4d4a4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOCnrA9vQObWZjPufarJhfgnktD7yuipd1X55Y9nHa+GwDmgoySyiL+TfHzygeQkQ3w2VjW34Hl77nzNGpNtAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7301
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=houseofhr.onmicrosoft.com; s=selector2-houseofhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/m/CLVbVB/MRIU4P2SlEagobJM7jKaMzC0eU5DcJHg=;
 b=d+kT/GZbX/FeWFgo2utg34TKUyy9PQTTg+tw0rqs5XaKchU6mlS4ydpIDDjPRMOV1uSnzS7EGC8ooJm1yxuy8UHPYvndLHiIOGd6OgjQv19RHnjUALQM5Hg4sbph0cGIXeVsO7Ve32gr0eocZqxQgL9XYkr9WvFUAJ4OTjcIUkq0oWn38hXTCblV2ZwiTdPiSF2yfMlzIH/AT4/wsG/AaGfPt+m+3OB/tPMzvO1mq3GpdqUZDqQOt1Z39h7q0rjnthKfqbFFFg/Ym1umGSi+diRHugGSTUA7587gsLlaTDHHQRnZ0+iiStpkcIslfzwuPF+q3bSTN7NlKDfsZDXblg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=houseofhr.onmicrosoft.com
 header.i=@houseofhr.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-houseofhr-onmicrosoft-com header.b=d+kT/GZb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rtone.fr;
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version
 to v1.20240529
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
Cc: Martin Bark <martin@barkynet.com>, Fiona Klute <fiona.klute@gmx.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

[I hope I am not responding in HTML, I have no choice but to use a new e-ma=
il since today].

________________________________________
De : buildroot <buildroot-bounces@buildroot.org> de la part de Arnout Vande=
cappelle via buildroot <buildroot@buildroot.org>
Envoy=E9 : vendredi 21 juin 2024 23:49
=C0 : Athaariq Ardhiansyah; buildroot@buildroot.org
Cc : Martin Bark; Mahyar Koshkouei; Fiona Klute
Objet : Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version t=
o v1.20240529

  Hi Athaariq,

On 04/06/2024 01:09, Athaariq Ardhiansyah wrote:
> Latest RPi firmware already provided support for Raspberry Pi 5.
>

The raspberrypi firmware is embeeded in the EEPROM.

That package maintains the bootloader for pi, pi2, pi3, pi zero, pi zero 2 =
and their variants, and some videocore files for all pi at the exception of=
 the pi5.

The bootloader and vc files are external files loaded by the SoC IIRC, few =
tips in my initial serie for pi5 https://lore.kernel.org/all/ZawN46u8W5x-Mj=
-T@landeda/T/ (and tell me if I am wrong).

Note: The bootloaders for the pi4, pi400, cm4, pi5 live there https://githu=
b.com/raspberrypi/rpi-eeprom

So, that comment is misleading to my eyes, unless if by firmware you think =
of device-tree blobs (required to boot the system and shipped by that packa=
ge).

> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
>
> ---
> Changes v1 -> v2:
>    - Fix missing description due to terminal issue
> ---
>   package/rpi-firmware/Config.in         | 5 +++++
>   package/rpi-firmware/rpi-firmware.hash | 2 +-
>   package/rpi-firmware/rpi-firmware.mk   | 2 +-
>   3 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config=
.in
> index a9aeaed745..e4de5ddaa3 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -63,6 +63,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
>       help
>         The debug set of files for versions 4.
>
> +config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5

  This symbol isn't used in the .mk file, so what's the point of defining i=
t at
all? These variant symbols are not part of a choice, which means that for
variants that don't need specific boot firmware, you don't need to have an
option at all.

  In fact, AFAICS for RPi5, no firmware is installed at all... The only thi=
ng
that gets installed is the config.txt which is copied from board/raspberryp=
i.
It's a bit silly to download a 185MB archive and then not use it at all!
Wouldn't it make more sense to handle the config.txt in the post-image scri=
pt?

  So, I think this symbol should be dropped, and I think that probably we
shouldn't enable rpi-firmware in raspberrypi5_defconfig.

Arnout, I agree, that symbol is unneeded.

However, BR requires that package to install the device-tree to boot the sy=
stem because of the device-trees and device-tree overlays.

And I agree, there is possible work to get rid of that package for pi5.

BR could provides its own bare minimal config.txt for every pi, it can be o=
verriden by menuconfig.

Also, I have that attempt to install the dtb and dtbo from the kernel packa=
ge instead of using the ones from the rpi-firmware package.

https://patchwork.ozlabs.org/project/buildroot/patch/20240412140945.1626579=
-2-gael.portay@rtone.fr/ =


> +     bool "rpi 5"
> +     help
> +       The default set of files for versions 5.
> +
>   config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
>       string "Path to a file stored as boot/config.txt"
>       help
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmwar=
e/rpi-firmware.hash
> index 33e05a2f4a..57afe3a1e5 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf=
  rpi-firmware-83dafbc92c0e63f76ca2ecdd424> diff --git a/package/rpi-firmwa=
re/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 33e05a2f4a..57afe3a1e5 100644
> --- a/pac62d56489d1c77.tar.gz
> +sha256  a116479e4e8e3bae354860d00321e5df5010cdbe10a3db9e59c81858a0aec84d=
  rpi-firmware-3590de0c181d433af368a95f15bc480bdaff8b47.tar.gz
>   sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6=
b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/=
rpi-firmware.mk
> index 11177aee02..5eef3974d3 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>   #
>   #######################################################################=
#########
>
> -RPI_FIRMWARE_VERSION =3D 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
> +RPI_FIRMWARE_VERSION =3D 3590de0c181d433af368a95f15bc480bdaff8b47

  This version comes from the stable branch, while previous versions were o=
n the
master branch. I think that is a good idea in fact, but it should be mentio=
ned
in the commit message.

  Regards,
  Arnout


>   RPI_FIRMWARE_SITE =3D $(call github,raspberrypi,firmware,$(RPI_FIRMWARE=
_VERSION))
>   RPI_FIRMWARE_LICENSE =3D BSD-3-Clause
>   RPI_FIRMWARE_LICENSE_FILES =3D boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Regards,
Ga=EBl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
