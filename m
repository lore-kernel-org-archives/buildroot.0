Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8831C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6D88408D;
	Fri, 12 Jul 2024 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxYzu6a5mFtO; Fri, 12 Jul 2024 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4CD84505
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4CD84505;
	Fri, 12 Jul 2024 19:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 621DF1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B40460659
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9iAsn3wIKy4 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e1a::70a;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B120A6064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B120A6064A
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::70a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B120A6064A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+C8XRQj4BAC2m5klPDjp5GPNbqcyLN4n6hFoyX8Rm0roCOg5JcC/iEl4OiZQqS17RHd2EwRxHYxxESAQASR620Wd3X8UNKi+yBDkG0bZOYKPPAJkM2sYp9YYDhfZQyfdUV0u1WUlcDkyGj/25hhzbGZZxJslKOQoTyer440SexMFyqYPBwr0sDw9KfPJBlTOZtmPzScFeGBuKaTZTRglmGUgJwSmoGz4+la8CQjbNiMDrg57bU9G8jimO3XbFvTfu8ZAgPSAd38tOQ88e0AsVar4EvsuBXDB4DMfxYyEMfZTY4gBLkGue8Runk537ZWFr1suOGuulgj+G6teE22Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiglrFzZukhrxeEpjEBTODy9j8BdCWWFRjstFLRgsHM=;
 b=KFCtTcyuuYBiMNhYeBHAZE5m7BSeCvL9NNT8/XyYtCkFHT8MzTP6Dd/4o1ITS+HCPURmPJt2ITBOU9WUuCd+lq9Ub3KKtx/iqJrWeKFaJMiENJvZ30FbpFZYLwX6JAmjmRxRomyi8POkH9KZ3Eah4yBd1fxZwwHHLgoitWkstfAD3hoNHmLX51XRh/oi2HCsCArnpYp3LYKC4hoI4lxDIhDPn2DqZPb3g1WzLdIqMIsMcttAgcydeq5RJIQa6LjgCzn307PMDYYDpK7kgN9CuXiQdVL5xsRA/UJSd1XglSlkOzlZwmQn5tXBlYOTwfXCOSMlfWNb4cJk5+kZVTaYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rtone.fr; dmarc=pass action=none header.from=rtone.fr;
 dkim=pass header.d=rtone.fr; arc=none
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com (2603:10a6:20b:47e::6)
 by AS8PR07MB8341.eurprd07.prod.outlook.com (2603:10a6:20b:440::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.8; Fri, 12 Jul
 2024 19:52:03 +0000
Received: from AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5]) by AS1PR07MB8902.eurprd07.prod.outlook.com
 ([fe80::24e9:651d:fd3d:9ca5%4]) with mapi id 15.20.7784.009; Fri, 12 Jul 2024
 19:52:03 +0000
From: Gael PORTAY <gael.portay@rtone.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version to
 v1.20240529
Thread-Index: AQHaxDLu9E1l0Blby02DoBXulSGRNbHSwYAAgAPLmmWAHL+ngIAAPzs2
Date: Fri, 12 Jul 2024 19:52:03 +0000
Message-ID: <DB9PR07MB889372428A0B3B34A5CA5EFA82A62@DB9PR07MB8893.eurprd07.prod.outlook.com>
References: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
 <20240603230940.51746-1-foss@athaariq.my.id>
 <0f36a666-274b-4980-aa08-e738f0fccb79@mind.be>
 <DB9PR07MB9104EEDA904AF785C1A5205182D42@DB9PR07MB9104.eurprd07.prod.outlook.com>
 <20240712164837.214641d2@windsurf>
In-Reply-To: <20240712164837.214641d2@windsurf>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR07MB8902:EE_|AS8PR07MB8341:EE_
x-ms-office365-filtering-correlation-id: 66364965-d058-410d-552c-08dca2ac19d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?JUSdrD8iYdJbmogu8FvmjzZQOVz0U3MAr4EwWa0S0on0bRtRZd3ioMsfIV?=
 =?iso-8859-1?Q?hprrH+GQ3CmFxUsNJlBNIQ1undSUy91Vfh+rppdkL/m9ocb/7aw5gzzvVQ?=
 =?iso-8859-1?Q?IfWQ9Xdh03FK/oJAsufi/H7yTxp3i8vRbfcggdltZogng+t/pbtW+iZFnP?=
 =?iso-8859-1?Q?khoWvLoVFuZ5yMaTiW4dmucF/ygUOAq8iDuERlwUKvwFeeB3EjuUL6Xd0W?=
 =?iso-8859-1?Q?uP99s5Ga+I7T4lTCuJo/Zv8sQ9RkH/wFOh6t9swPmexPwX1E3FaaHz4xkY?=
 =?iso-8859-1?Q?oODvvRX4tMrctx3/rPfaKabyUyTELOz4wMKvQjWdBhn8TMUpzWVaesjmXN?=
 =?iso-8859-1?Q?fJEZlIJaJIdMs47yOpJ81LkjGTSQByyq5XWwrVjUlQwp6kO5tFAxPVN8u0?=
 =?iso-8859-1?Q?40z86BsUiz0S61ZzDszfGc1VKXjOjbIDrlMYvNI7+48kogw7C95PG+AmiP?=
 =?iso-8859-1?Q?3dIrZjCBZksFTBg+ZgOKBCPsSRJZ74yEC82FiNfkqpMEARs6l7X2ytDsnT?=
 =?iso-8859-1?Q?UgeC8syEZmwl8q9i8kMJaCNjHuSHGXzyVkk0bxfjfkMWbAq2E80X/o9Jvy?=
 =?iso-8859-1?Q?H8gQohdsMz/HvkFn6dNj7/ryilov0PYAn+XjL3yJld5kCS0jR93N8fbXOi?=
 =?iso-8859-1?Q?5xawG+ugdLaelr02FjOOV//Ynli90Y7+TFtSznIJhVQc3eHdAJPHWra7hR?=
 =?iso-8859-1?Q?RwzmZATm0dK3dJaKJOG8YKVl6QTM7oebRE+2euCMjJAnzQaRGU4WFrBGml?=
 =?iso-8859-1?Q?qTWcbJidbeKkytd2FDmM6zU49J6orYWfoPcO/ivN7cUuC2Nvl02OZ5ELT3?=
 =?iso-8859-1?Q?IUUzLCr7sP6QpogqZXYDF7bB2gMZwwsdqU9WzbogGWpa+K+V+2L7c9PQOr?=
 =?iso-8859-1?Q?8ZGimBeJrH+4S10bP1xlv4hA1oMOMcG+BxTJTio5LuIV39MixmP1hpU6Dm?=
 =?iso-8859-1?Q?Vt5AFbd3eIr+bbyXJE1rn5LqfrggoRMqH5uXikgMQMUC8NQyAXHJHrli8g?=
 =?iso-8859-1?Q?9bofXWTz3xCGTh5pD42zJImurRKKwX7oQwYTzeW3Ra19WFit6hNYXAP9SA?=
 =?iso-8859-1?Q?HL7t7lPJftgXrzA5qgs0uUqzOtyYUTxMI3hDZL62A+6coFUbxAVjR7arhM?=
 =?iso-8859-1?Q?sueY/E+3zBb471zcS5Na7L/eN+Xf9/soZ3bQJ5PHp+vtxqd5MLyGUGn1x3?=
 =?iso-8859-1?Q?0TT3azFN12aCH+Z5YDV3O3CVYdypNknSZoHcLxB3totnVaAhSkyII7kMXa?=
 =?iso-8859-1?Q?Dlli048UCzXMe+Ywm3MFOX3ZJV146qI+YBwDTrzfWIBCEdzC6IUvYAZxuW?=
 =?iso-8859-1?Q?zgHsetw9DcZ63zTi+v2qA8HMbfFlRkK+LDkExxljDBD0QDaNkZogckitks?=
 =?iso-8859-1?Q?BiEtY69YWBFMJfFOJez1crB8pFFljaUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR07MB8902.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dnECRXP1Z38EwP6Tr4WoZOmECzhQ73a+no0RyC/0hrdASXobvKyrzwoH7s?=
 =?iso-8859-1?Q?dLp4ytl84KYRgobEfIgpe/Mo+XMvrdSDcbhXd/qla8cPrySX2eTrAg/YL9?=
 =?iso-8859-1?Q?vBZX6uDgkWH2CtIghh615x7rBVYzDpnk2N/+BiBboDwooa6xQKFdS0fU5j?=
 =?iso-8859-1?Q?Ar1d1C0a0daMbHkTepweWDaZkJ+z4/meWYbD6DminI9fiNC+A3DcpejVkS?=
 =?iso-8859-1?Q?kGOthJTXVIhNjfJ+3q6ua05NQUajIoJAuLgxdJE2gf+ePrLiWtVzrEPiEg?=
 =?iso-8859-1?Q?1dLak0Yp7zOvFpcjBdCYq4Lp61HaLyZIEVG4jzNodLgeAkNXYtiDG2SuZ7?=
 =?iso-8859-1?Q?/AJHDeNBsU0KlDY3OuFXe4EVds8CmWjcxJTKbum5WHOwUVbtkMdcTl1pUB?=
 =?iso-8859-1?Q?jOXKI1a9KSpWmWQsH7MkTfy81gqQt93RuFJsQD5C1gcWcptqrNFDhaslZK?=
 =?iso-8859-1?Q?b1p+Njas465o/1AFAmk6wTqM/4CKb+ZB0o+duOoFixA75UMZz9dFfLORA+?=
 =?iso-8859-1?Q?viQH5G6fTYVJ9XDbg2VpFkTLOoosW3mgw+AN9zImnrPVHyrPCMPWR9E9z+?=
 =?iso-8859-1?Q?or7qw1OmkGzCd8hzbD5YVwnUZ9qhiQoNZGo2MDitSYeIipqXU7cw+8dhRa?=
 =?iso-8859-1?Q?IQSBGFwdXFv5EhgpyR0rJHS/QpoQVuorjZiytrQ8vtYQ6Pt9HkXAjO82na?=
 =?iso-8859-1?Q?GWLITUVmhYqd1Fsvzl/y6JVguTFpUuYDf4bTZQEgO+rrWBy/RHzw0NIzCv?=
 =?iso-8859-1?Q?VDug7MW6c4NEdQxhYmtpN31a5pCWNV/kyulIFASMXI20iY0a0U9tJEoAYY?=
 =?iso-8859-1?Q?S1lhG1T4w7zAQcUfA/GuZpB7oWwt+LZ3NyAoe8OlF7bDR2+hzn8V1rCbPI?=
 =?iso-8859-1?Q?k4tb7FBEk4v3a0tcvkA+SkKln0yShIgsMsp/Ykbyd7stYcfs+jJn/r7mqc?=
 =?iso-8859-1?Q?r0YP1xR9J8HzAAi+Ua2oqlD3a4uVOg0cx+KqebvkHNkS6+ob5n5H+/BA9b?=
 =?iso-8859-1?Q?jTByMeS7I/nStWbZnm9ZTAKxph/YJ+l4D+57X4KiGqej4zZFp3IyB9Dhj9?=
 =?iso-8859-1?Q?udgyrKSTjSo4gceoaZ7AqmSSJ2fVjqum9d2nxutO5Gj5AlZ2K8FGcaw+FZ?=
 =?iso-8859-1?Q?zr0S+cdiW+WGV9VguAXS4oKxZa3yY3jNPKz6YrjyxUU3qAcygaR7fs7XlM?=
 =?iso-8859-1?Q?l3bm4QzZlHwvf2d0iXnAAKsf2+QWUhVuoQJbIdYPDncuiuJacdwnGKIkev?=
 =?iso-8859-1?Q?pc7n19qhhbybmxUsGKGGkZdTNjJZmwOKlLlCsUgAoR4m7TWgPO7vQnsnmu?=
 =?iso-8859-1?Q?FOHrZIUUey+G6ZhqxbMD1RoNug9TSazCE5KlFb5NYwip/jFof/y52McAp/?=
 =?iso-8859-1?Q?tYaYB8+9esa9tXjPtd1ZJXQVcLdLEGhz6y2+8NF2XjB91bDIoUotOSV3QZ?=
 =?iso-8859-1?Q?HZXNnRWgaScDhq/JEaB30+gE7+ZM1X5Klw+MxIQ95xk3aWUf2QaQ4gj1dQ?=
 =?iso-8859-1?Q?mmYCVjNbsI5zS/3YJ/xKl0YCwtXtWvXRdKSqzXdyhlNbQu6Pmr3Z6e5up5?=
 =?iso-8859-1?Q?tne6EKSLJZRWbDWCrh+KO55k9SSh7f72dtpTRphbhIdZh98wxjmL0q/K8k?=
 =?iso-8859-1?Q?Z1FXbkpX8x148=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rtone.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR07MB8902.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66364965-d058-410d-552c-08dca2ac19d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 19:52:03.0727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3fe99b51-e7b8-4586-ac15-d51c0df4d4a4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nEr5EWoAO86LcPMewYeTpP+94AiQOWD0kxMOQUy1SplVqCxM30jJsCZZnrgK6+T87RRrmxaSdzAo6NDmeVap3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8341
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=houseofhr.onmicrosoft.com; s=selector2-houseofhr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiglrFzZukhrxeEpjEBTODy9j8BdCWWFRjstFLRgsHM=;
 b=js4Jb2w5t2Fabhs324/qlH0B1kKTurqkc9qMpFqiAPPt+/JviTnbHxOVJaXYAfAJJbYttxpnZEpSFHNW+q+730YI92Ny8TheE+HVQBuNIpHiDohFq8Yw6VcLZ/aWeGmFnMwWd4uGNAgL5cF8Tf5MOux6EFM2UftmMlT1fxNhJ9UXQqGCpEVN2gLPuGo2c3lQ4oaUPuUNvUTUYKhvgsAVMH5oXrWt7O7N5szwkuKLjIoUr9S3FFmX5N3NkmxrKGFtE92TX/1emg3wqfEqUiuMR0H+gP0FsxpMRuEPRgYtfo2T21ZAaR5LQdWZrQJcbo8uUyLgqBCXCxSfFfdzYCPxpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=houseofhr.onmicrosoft.com
 header.i=@houseofhr.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-houseofhr-onmicrosoft-com header.b=js4Jb2w5
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?Ga=EBl_PORTAY?= <gael.portay@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

> ________________________________________
> De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Envoy=E9 : vendredi 12 juillet 2024 16:48
> =C0 : Gael PORTAY
> Cc : Athaariq Ardhiansyah; buildroot@buildroot.org; Arnout Vandecappelle;=
 Martin Bark; Fiona Klute; Mahyar Koshkouei
> Objet : Re: [Buildroot] [PATCH v3 1/3] package/rpi-firmware: bump version=
 to v1.20240529
>
> Attention: Il s'agit d'un courriel externe et pourrait =EAtre malveillant=
. Veuillez v=E9rifier que vous reconnaissez l'adresse e-mail avant d'ouvrir=
 les liens ou pi=E8ces jointes.
>
>
> Hello,
>
> On Mon, 24 Jun 2024 08:31:57 +0000
> Gael PORTAY <gael.portay@rtone.fr> wrote:
>
> > [I hope I am not responding in HTML, I have no choice but to use a new =
e-mail since today].
>
> Argh, your HTML e-mail is a mess.
>

Argh, I am fighting with that e-mail client...
The good new is I send e-mail in raw format, the bad is I HAVE TO format it=
 myself (prefix every lines by >).
I have CC'ed myself with personnal e-mail to respond with an appropriate e-=
mail client in the future (saving my mind at the same time).
So this is an utlimate test (finger crossed).

> > Arnout, I agree, that symbol is unneeded.
> >
> > However, BR requires that package to install the device-tree to boot
> > the system because of the device-trees and device-tree overlays.
>
> Apparently, not in the case of RPi5, because the patch from Athaariq
> has:
>
> +BR2_PACKAGE_RPI_FIRMWARE=3Dy
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI5=3Dy
> +BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE=3D"board/raspberrypi5/config_5.txt"
>
> so neither BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS nor
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS are enabled. Therefore
> the rpi-firmware package does not install DTBs or DTBOs.
>

Indeed, you are right, neither dtb, nor dtbo are installed by rpi-firmware.

The current raspberrypi5_defconfig sets BR2_PACKAGE_RPI_FIRMWARE=3Dy to ins=
tall the file config.txt specific to pi5.

The BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is unset since the config=
.txt does not need for overlays.
The pi5 has its own dedicated console, and thus, the miniuart-bt.dtbo, is u=
needed.
Thus, there is no dtb-overlay that is required to boot a pi5 for hackers.

The dtb is installed by the kernel, and BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DT=
BS is to be used for old kernels <=3D 3.18.

        config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
                bool "Install Device Tree Blobs (DTBs)"
                default y
                depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
                help
                  If you are using a Linux kernel <=3D 3.18, you should say=
 'y'
                  here.

                  If you are using a Linux kernel >=3D 3.19, you should say=
 'n'
                  here, and enable BR2_LINUX_KERNEL_DTS_SUPPORT to let the
                  kernel build the DTB.

The patch from Athaariq introduces the config BR2_PACKAGE_RPI_FIRMWARE_VARI=
ANT_PI5 for the pi5.
That option was used by the former pis to install firmware blobs; the pi5 h=
as no more firmware blobs.

And, it is **unused** by the rpi-firmware package.
Instead, it is used to disable the packages rpi-userland and raspi-gpio.

IMO, it is inappropriate.
Instead, the packages should have an _ARCH_SUPPORTS config that depends on =
the pi5 CPU of whatsover (BR2_cortex_a76_a55?) .

Note: The config.txt in the patch from Athaariq is more complete, the curre=
nt one is way more minimal. It is a matter of taste, I do prefer minimal co=
nfig.

> > And I agree, there is possible work to get rid of that package for
> > pi5.
> >
> > BR could provides its own bare minimal config.txt for every pi, it
> > can be overriden by menuconfig.
> >
> > Also, I have that attempt to install the dtb and dtbo from the kernel
> > package instead of using the ones from the rpi-firmware package.
> >

Fix: the rpi-firmware **DOES NOT** install the dtb, unless BR2_PACKAGE_RPI_=
FIRMWARE_INSTALL_DTBS is set (I guess).
the rpi-firmware installs the dtbo **ONLY**.
(my bad, sorry).

> > https://patchwork.ozlabs.org/project/buildroot/patch/20240412140945.162=
6579-2-gael.portay@rtone.fr/
>
> OK, but for the time being, I wouldn't mind to see a RPi 5
> configuration merged that works in the current setup. Then we can
> improve later on. We really want to have a RPi5 configuration in
> Buildroot soon.
>

Note: Remember that dtb-overlays is a downstream feature, so it is a bit we=
ird to enable it in linux.mk. I have no alternative approach for now.

FWIW, I have just tested it, and I can boot the sdcard.img correctly.
I have probably missed the issue... because, BR is actually working on a pi=
5 :/

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com/

Regards,
Ga=EBl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
