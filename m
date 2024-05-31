Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49824C25B7C
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 19:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC5822C3;
	Fri, 31 May 2024 19:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5LHrFou-wfL; Fri, 31 May 2024 19:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F230824EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F230824EE;
	Fri, 31 May 2024 19:04:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3A301BF293
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CECE5413CF
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrBnzeiD81Vm for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 19:04:21 +0000 (UTC)
X-Greylist: delayed 934 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 31 May 2024 19:04:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8984E413C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8984E413C3
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::71a;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on071a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::71a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8984E413C3
 for <buildroot@buildroot.org>; Fri, 31 May 2024 19:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=BCfL+bcISLThi+WiMJgMNuLb4TQYVyKJMoxCx1LgoRc62vaA7Th+f/r0ZkZvivfFNo1Un58reenlP7zuIEWRJXnFRNInNjg4jTLbKeT2P6Dk29sv4JtJ0dWsSXNPiEqt2BMlGTKRUj7+v5flKyRfzwH6VpWOi1q99x0agBqpoxkl9CQt6sT9iStkAUITHyotBt2KjcU2OfgLHK7K4J4XtEpoEhO7OepatQWVlRy4fISqGLvt6FeBGIVk7awk/GcdfgdqjJ35Pna0+Jwz0T+7qEAh4ZRBfjgCsRVkPTHXs27fqbdZp/oVoQMHPTJNxfOp3s40CO1lzPCedLDIb05/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPx6bTPHTRryljaF6s3hgzcLejZFuD9msYoVpNkeA6I=;
 b=GwZBX1wie6pvFsFrPN7J4ssuVhjFx3/+iRwlUtzz15albQ/vxOJ3DjuUCziH4HLdD1fcUx/iFkF9Q8B4sQvsDRWr/84NqPmXaySeGwHLKRUDmfSC2UBVGbJ51HkmUvBF/2s09vNf/uNkZGdriraunSt2mwSibpcE2nfyIudNF6cK6U7FrEHp3wycuu4ieTMXJXuXBrICsdEqYPKbBwdjMraw3Yp+aqgBF/o72jvhCQWehe3slAJpVy6lhA0NHFKq2M0F0aALh0rsYwrpOUJc52UbbsarlZlRQPk4q3l5lhtesNxdY/V+blCgXrxoGnj6tJMRrwE4A5vjPV2VfVVSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB0988.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 18:48:39 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ed2b:bdfa:4e6f:1437]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::ed2b:bdfa:4e6f:1437%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 18:48:39 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH v2 1/1] utils/genrandconfig:
 switch to async/await format
Thread-Index: AQHasQIe+ZetThoaa0uEJiS3GSfx5LGxszHw
Date: Fri, 31 May 2024 18:48:39 +0000
Message-ID: <PH1P110MB16030571E5C304CE30C24CF79FFCA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
In-Reply-To: <20240528132218.2307479-1-james.hilliard1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB0988:EE_
x-ms-office365-filtering-correlation-id: ad2f613b-de65-43ef-22c2-08dc81a24980
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|41320700004|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/jVnSzS2B7ub2c7lZ4n3c4uA1DHsQCpqBWfnW/fbR/GqZWMzmINrZSH0B98t?=
 =?us-ascii?Q?YhlLC5/lykE8snfBUK/FGTGSelI92Y9CSY4mIWSsHTsABfsTsrROWiTzlIXZ?=
 =?us-ascii?Q?+kokzJi/ex3Inr6ruwLE6gZ0PDGFmBT2v6o8WPgP01ByXjp+6FEmcVJV2UnK?=
 =?us-ascii?Q?u+TTC0TbvbOTR69d6+MKxge/9bWNLzQ87rv7eKU536wluByvdDJru8Ma9XUg?=
 =?us-ascii?Q?df9a665vILtAKoFfbC1RsU5+sGRgtfkP7WMw4XTzxepUP4XVuilGMxc/cBHK?=
 =?us-ascii?Q?5MRO5MDHHTDSSNelXLJwhMSUGvEpWWNc8hc3JviwZB04ASqkWV6KNRKdb/fz?=
 =?us-ascii?Q?MBfIlwwetwUf1yA5Wtcv2idC2VASOSPOnZGOBrxKMMN47T0eUN9/mxZI2UI5?=
 =?us-ascii?Q?TsFRC+izE0NOhFjhvHRvW2MN9fvdqkhKjfOD3FDadC9rcJfsTNKRsXuxE9Rh?=
 =?us-ascii?Q?gievryVWdw2+fzbK1xPd3s14/IOTH+cKUFjF99RYcHaekzcJRypBzi8sEaby?=
 =?us-ascii?Q?Romk2qk731JyLYtnvEN7v05/o3jWxxzUQXq81z4ZRa3Hiif36B5LR7PUTmcm?=
 =?us-ascii?Q?CVpop+FPf8JqidQ4pCY6ciWg4IRyX5/QW4bdfsrDMkpxY/VfZ6Y1KAMtZteX?=
 =?us-ascii?Q?yhTvWZCMkqmkc8OfuS1EJsBTS+59Hfo48HByCXGT9ByQsr0xBBH1jwJ6qxRK?=
 =?us-ascii?Q?QA38ECa3Ql5seMX0R1vknf2DTU/AKr3tBhLRRToSEev2nOk9gbzIA24nl2eS?=
 =?us-ascii?Q?nFJXDnXDCxPjloTArJ/b/JsveAM/62KW3ESQwdZUUDecpkz5YFdTwvhYbAxL?=
 =?us-ascii?Q?dr6Q5VZpkRR8Aajla7e1Vid3bkgKMyZUDu9XFk1VNVaOLetepJ00uKpSSguE?=
 =?us-ascii?Q?Qr2knGXktiebmScRTK88AB2Caam9Vb8xBSetzPhlWp/77JvITxfVCHUYa8Ms?=
 =?us-ascii?Q?fYtCBCjXF6fjmuN6uMkR0Xyo3wiSbo+ZMJUYT+Pln8n+gOWS+hMdtlRvfDZK?=
 =?us-ascii?Q?Hug3NVQNrUKnyQf71wAhOMqEumZx5oCq4k0zGrqoCZxJ0lMT6+ylpWjvMvZK?=
 =?us-ascii?Q?rVUOUAeAZjwcyTxPSaKizo4J/ZkBT69pm6u6y+aKgAeOmkSrVMd9xVTCBqgs?=
 =?us-ascii?Q?Gk/okTOmylAsGo6hROuAnQO/t07nUJcky1YD6ijUVfcJ/vw0NuyRYcana6tp?=
 =?us-ascii?Q?Fvh3gRiQgzrdRtl/rJbafutaE3sPnhEvd1NS4XLzPmkNnHXSEEmCQpv3zkzK?=
 =?us-ascii?Q?EiDpgU6DPbS8jBOVZxj6R90gF9LrMOscgXbrAG1mCi+dPWFssg4uPW2A2dDJ?=
 =?us-ascii?Q?XJcp5sumAd2fyNFkP6iz9bbSZJ0wle1f6DaCkMzoamQehQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(41320700004)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q9FXn2Ps3omhEFDnRl0DM7/3uxiurMyWm2xdPLkJUITz+ZjKxkB1of4FEALV?=
 =?us-ascii?Q?wNEEvXWVWaZG75LZGee83g1086R4KL1pOKBMQYTTEkDkcXSy90f3M+CzqLIe?=
 =?us-ascii?Q?VGB2VIpeun7VTA7qelsTYjj2VMHdMAwHukwCfhBq/XKCAgg93W1A5MMa9lhu?=
 =?us-ascii?Q?g6nXKVcl7VBXWtXk+UW3CE5mS6J6vWtkvz4wwiBK/rGJWbf2ieYX0wBDjYua?=
 =?us-ascii?Q?qjLG1LXtHZRMh6F4ZBgb0echgrxBG3jMIfLvVWr1rOGKp1r9/JgqEXfx1AGE?=
 =?us-ascii?Q?1aQd/iFb8KDn3lhBOx53sqtHF6+aTzanV6EVzo3Q6ih11FAcEl8Yir+NznpL?=
 =?us-ascii?Q?woi4/KxOcHh6c7J759KmHVtnRe49VEa4KLiP39VbvoJfCN5qooSAkYS8Q9SG?=
 =?us-ascii?Q?Sivs59WQb9YfcyjSE4HGL4xhkh1jBN/8WScR2L7ogeBUR2T50fktBro27u2L?=
 =?us-ascii?Q?awWFW54rcqJ8Oa2SjQypHbfkB8/Dc+fy7eXqiJv8lBICjJ7B1mhv6K4hhsqA?=
 =?us-ascii?Q?uG42+Gep3cHkXaLOAAWohQ9z6pDGOeL7rc8Ihzs6L9wFWHcE4HcQjU38FEns?=
 =?us-ascii?Q?AHXCxCOwx8JoiY7GzPq1EO/Luh3LqFlc5sNknqbvBjDwfuzNU/22+phl7+jf?=
 =?us-ascii?Q?63ROZea6A5RIjoUOMDRBTN9cu2+Om2KdCyqpnk3sgIJ9qXfWcJSx8hZXRFco?=
 =?us-ascii?Q?imdwq81jFHWZsrTAvX22lIlTdqyYAC8crupWX0u83p2rFwfPZGK6H7smR14N?=
 =?us-ascii?Q?BCPG/pURF7UFMRGQgKlRg7Z1/347l+3SNGNl6Mar3X/0spnX0X7HXFfhngP4?=
 =?us-ascii?Q?RVbUJjzeSh1QHtcmbRlPHlI8R9ftNa1ggokzdyFTxQGr8DWgFRkSQkTAKkzP?=
 =?us-ascii?Q?yGvhveZeSvIB0PuCJN2cg/ZV2hemFjI1UvOhI+PxOSoEY4dG59CczQ9D9eBy?=
 =?us-ascii?Q?PokeKpGz2kXV/5K3GJHurKyzw2I4MLZhCLNUEAA/eD4dVLQazHVUjMw95n1P?=
 =?us-ascii?Q?OOVcp5vSFZD+7ZHst/kRgANENBc3TOtYW2Fi18nnN9+9tLhc5tG5hQ457b8o?=
 =?us-ascii?Q?BkFLMhp7kFy0X85A4i3t13haf6xgKui2C8ItL30XX0RxWcbnDGZaM4+M/V2d?=
 =?us-ascii?Q?X5KpI+pK2gE+HsspcVamIE6NJq+HOEiFYI2/+/dxBG025UTEQItEJYew/Ihl?=
 =?us-ascii?Q?TwywifIQrPoAvaN3T8Lj5xJO0y8ZkN5XHPvb21N5p6nPgBXFfAZzBbCgFNOj?=
 =?us-ascii?Q?u/YHZ+AEEp5xUe5Y6CUZbDXO0OlWD6imftUGDnLGZ0XG87bFgUnPMAIf1c2M?=
 =?us-ascii?Q?jX5IAWy+RAoxFqvuzpiPrUbf/1qiO28LjuU4JPjXc+54jrsinJO0jthFqm5/?=
 =?us-ascii?Q?L7YloWOH/Fsd4fmkCa2mzb1nJSLUFudPU7bMNxp1rJ2tegzhp4lEETlOmVGX?=
 =?us-ascii?Q?n6mSe03Z/XnAb0E4T7hMgWh6azmJH8QobWfvpZj3GfJlLon6kid07vb03WIQ?=
 =?us-ascii?Q?vaSyuGzhiyiglHI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2f613b-de65-43ef-22c2-08dc81a24980
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 18:48:39.7188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB0988
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPx6bTPHTRryljaF6s3hgzcLejZFuD9msYoVpNkeA6I=;
 b=G2PQK7Ttw8dwfidF/SylLDGLcpJxudpaigIRsTJ1qCJlgK5SZIN+1ysUhhrthVQzO6mjuiPYJeK3HwiQSvqSV/Pm9i/9X0BN9KwZtWticGbB6plsp/JbZZwz8mBLrdfeK4GOelFrGSo6uNcc/08sdZ8h1whvAgEuVuG1E+0UxV1jWz8gerZBIvOgfhzNTI1lAUu6jQ9Ycy2yKi7lWlu3MaD6APEbuQW1yvzmO8Z1tsUkpMcsTj8y5uqNGOyBt/tONZhKa8nE4ParjYBuWnRBMLvQey/orrMMxrcEPUjJ7bQ/+2ZHbasQJEmjWl8yXeIxbmowASooGwWwqnn8P90+lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=G2PQK7Tt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH v2 1/1] utils/genrandconfig:
 switch to async/await format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of James
> Hilliard
> Sent: Tuesday, May 28, 2024 8:22 AM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Subject: [External] - [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
> async/await format
> 
> This requires python 3.5 or newer but is a bit cleaner than the previous
> coroutine method.
> 
> This should also fix a python3.12 issue:
> [Tue, 28 May 2024 13:09:05] INFO: generate the configuration Traceback
> (most recent call last):
>   File "/home/autobuild/autobuild/instance-0/buildroot/utils/genrandconfig",
> line 833, in <module>
>     ret = asyncio.run(gen_config(args))
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/asyncio/runners.py", line 194, in run
>     return runner.run(main)
>            ^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/asyncio/runners.py", line 89, in run
>     raise ValueError("a coroutine was expected, got {!r}".format(coro))
> ValueError: a coroutine was expected, got <generator object gen_config at
> 0xffff7bd822c0> [Tue, 28 May 2024 13:09:06] WARN: failed to generate
> configuration
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
