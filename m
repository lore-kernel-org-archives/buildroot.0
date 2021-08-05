Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72041C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D963461102
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D963461102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F797402F0;
	Thu,  5 Aug 2021 14:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKby50rAuO_i; Thu,  5 Aug 2021 14:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976074033A;
	Thu,  5 Aug 2021 14:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB59F1BF44C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7ECA404E5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_DEXUeC8m9M for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 14:47:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B01D0404BC
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 14:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdCc6K1KDNXLUT0dEDtob5kZTwQ5tmEck+7W0LAqWMaBUslsRHFuuat/csgM05YFB93RjkezY/mLlvHseqf8OM0AQn1EnN/ZT7YGHV/1Q0WE8iqfPNQQNDBtdMCGOqSgkVQOLBE820gjDuVO8rmauRX6kEgcBfmonbwyZSYl1++T9dzMnHvsvKxiqYsLBpJ5UHbdGOD8pcpWmPavFNlDA4VVyhVzeODiNx9FTx0N2psWXrHo2q6rSNJPCSdC1eH4wYtwNU60LEqAypxTxbKqNjqDaGFuJmMgerhZGCL+pcFGFEV5UKzsqZDP0EYs2jk31nv5ZOLRjQp94rA9zih7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8Ss7EYJUtNerEJSVDZy6O4np2NVVc2S1+n4tBNUdgU=;
 b=Bn7CUKmmnOZan/D1zafQzjWA5oYmH3KFo8oaKv4ssPLJ9qBnzf7dvtQP3rJJNeMSG62ymISFxMveTLx50HzqTYe2qb1XBuKMtHbP9/3WGOSAHS0gj4+Sn8cLztXM8bBqulFiBM9enBRHzAveX7ihT8ajYVBl5i6+j3p+d+1qfV+lLcfbYgJcLZjrR2+fcIFH2xAwlKxdnAN8pqUvR2nv6Ct2z+bBhD90Ws91ut8AhiTwYDKDJYFs2hX0MynB+xsBCx6ehtJpGR2c7xxUCu4TucucAlukTr4sCZjU4TUqe0v9yUPyeWC3pYOGqA4NzB+mi53VDVMMuK0jpXhI+UoYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8Ss7EYJUtNerEJSVDZy6O4np2NVVc2S1+n4tBNUdgU=;
 b=Lr2IniY3ra6hq1FNnCBQxxianM+FegAgxLGs0zmKbV0TCuLWfcpYiHikAgHE1RB0Tlbz7HC1EmKXNzeGoR2ITbWX+jF8eHz00q/3urGK7rCDOtEFTd9qGnxWScuU+aoH8sKK8NC35QMZSrW/YZCon5xRJ3yFJDXhABP0Y86qSic=
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR07MB3988.eurprd07.prod.outlook.com (2603:10a6:208:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.14; Thu, 5 Aug
 2021 14:47:05 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 14:47:03 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
Thread-Index: AQHXidd1p9VJHRrPy0+wuCBstyKOS6tk6M2AgAAAmTuAAAe+AIAAAD41gAACLgCAAACOLA==
Date: Thu, 5 Aug 2021 14:47:03 +0000
Message-ID: <AM0PR07MB39879D2B6747974F28FAA7579DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
 <20210805153149.3b72eb3f@windsurf>
 <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
 <20210805160140.4fcc15ce@windsurf>
 <AM0PR07MB39876E0E73FD0E7059D1D5CB9DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>,
 <20210805161020.5fde871c@windsurf>
In-Reply-To: <20210805161020.5fde871c@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=unilogic.nl;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e167eadc-0ccb-48eb-4270-08d9581fe395
x-ms-traffictypediagnostic: AM0PR07MB3988:
x-microsoft-antispam-prvs: <AM0PR07MB3988F7093D32AB78D66F437A9DF29@AM0PR07MB3988.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T20iB98Q7YYgM9tVraFIT3F6pwuBKC5in3X3qfTw8kT3ugCqn0lSIoLWu53O5FfMFBKi1ITjLnW2yZUhZAHElubxuz5xX1Vx7LM6MM7a8EbIvkjNH0R4jnaS+F6KvfAybPCi9IDln4zDboi4X6WXMYHO0pedSI+bHCv5H87FWd5Ej+BzSjlyoqk/9sp05mqDu0csU04NmnoKPfOxfWjWJ0cDvrQgxoeCfK5a/ZrEQ40JGNI31DN7vP6kJVs+1ii2u+NeShCJJ2ugVd1VbnjXO0A+srtzId4M/KUhpevMZ8BPS6Ar/6guySMdFsbPae/hyVoZwis5r5u7T2RtTdS/7dSn0jCIktHquoxp515R6rBKxEAukQVqsAVy4gp8rafdMAP+ebCPNqBBvjnO3ZC/LxAG7hkwf86l4EWLJ4/4NvPmYKkUrL+SSgvrqSM/2rHC3jBem1LcZe8nrLU0m4pD3B7yu3Pm3yWY0Td7qi87AuSBEXfS+0M9iYMK+cWmobPrtQT8ST0uBKu3ZSprOV8GM71M1MCjeaMZW+vY2zx+qLAZiqNz6oo1Pqxq/xv/A+BFdU/xez7zOJJt2GAFs/TNQDiCgrfX4imRL7SDG13ceahxCAZp7OFlvDIRbOEjpXG/yNrsm+1vBPIiBBjFf546pU4fsdRFzLTmI9cUoH1VkYf0WaxhabI+ON0iwa/HmyiPowvND7axWTl+LYZ0u+1FFWmJsa5z7ybyHO6nKKuMvgx2rLuq7TzqLE0FRWQ4GinlERPmeARoO8zp5GgswWgnPqL51HnHXMQ9mO1s8gf2M84=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39830400003)(396003)(376002)(366004)(346002)(86362001)(71200400001)(33656002)(66556008)(4326008)(66946007)(66476007)(2906002)(83380400001)(76116006)(54906003)(8936002)(38070700005)(52536014)(64756008)(26005)(7696005)(6916009)(9686003)(38100700002)(5660300002)(66446008)(55016002)(19627405001)(966005)(186003)(166002)(316002)(6506007)(478600001)(8676002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RmS5eeK3e2wPwAl79/8R8gIMHR+g5QfPD1dv3L+Wkia+ElAHRF0P30GZrH?=
 =?iso-8859-1?Q?iXJbPHVv+gwpacamaeQTuepQhcbed6p2OMNz+jvvs4Nn9rAgmheZoiSnBV?=
 =?iso-8859-1?Q?5MvaKSWgzEWtfOlPES9d2k2240jQRBxTZ9y7S2uNFkRSaq9e6EvF/JIwaO?=
 =?iso-8859-1?Q?WVoIFRIhNR1aeZgLB6Wf1j30cFo0y5ywWw7DE07cNh2VmZVA2wApce+cPC?=
 =?iso-8859-1?Q?eHcI8qsKu/zqeqps8tENjKz2E7GFN5Ih/AYEvJOXGcexvG5K392gONdueP?=
 =?iso-8859-1?Q?10LlaVdwxPcASwuGh7myREhbUC2E9W9Iq9sIN+cXGPwDB7vMECuyNY/noL?=
 =?iso-8859-1?Q?ZgnQxKGWBNCA7UzsnbNxyRqRtPS7W6GylKManQraXsXukYsMQfvkFzrExY?=
 =?iso-8859-1?Q?cwF7h1sOoX27SYzJy7bfIT5BpEsIlrtrtCjLmoOoV/WuomEx9jkHDZvxk5?=
 =?iso-8859-1?Q?XP7KhTDoFvyAIkaNid5g/Bv+SDB84nJQ3dggPOzpds7YfC6c9akuNnqTqc?=
 =?iso-8859-1?Q?UIqEbv/+QxiMgpS2+HYGfGPzZMKcq1YDe1SR1cj1zuTk30X0OWvc+bJh3/?=
 =?iso-8859-1?Q?1Z0vdziLgcWSpSmOGY4chdSSCOEpUSH16v8ZNckwNEjAZYpvQBK29MaJNh?=
 =?iso-8859-1?Q?NJVCb9tgc/jjpLxTgG4ytHknupb8HIcGH57WMyr1iXiXRCBdDXqpkd8IGa?=
 =?iso-8859-1?Q?ksinKuKRy6T4XOWMrgPBfRX0Wokp/eOt8ROeMQUbKjc5WOxdK2hQq5fMVl?=
 =?iso-8859-1?Q?7AQ/Bdz3AM+kVbPiUOhULsuHrJA+0bZRvSThnDcob6qK+tEcDhSlXpOPzS?=
 =?iso-8859-1?Q?6Rhv91CgEdLJ+84NfzxBHn87E7sIzt19zT1idtttOJKOT8FSyUyovmWbXb?=
 =?iso-8859-1?Q?eCe6rtnCXfmY/lvGOFqvGNbhgKRmsgL78Tr6N+0Ri2lg9X0kA4ftH3jb+E?=
 =?iso-8859-1?Q?GhiaaHetm8qUKbNIb6F2ASXaj8pKKRTvxY6wDMWAL2WzGMoXiUzYn1O2dw?=
 =?iso-8859-1?Q?CNwiaCazmQO+BQpSrG8PDijfsiswzMPhI8K2qBrVy3ZHuAXojbBNmuWdNV?=
 =?iso-8859-1?Q?kqXgLf2xAbnn0YcIkJDaMcajZ+uUWV3Wiuia8sh3UrnH58HrEnVgRq7yWG?=
 =?iso-8859-1?Q?OU4tYCEh7U2B+PxdIqLMk4MBayK37LZytrmk/XlqCk5/rdMIajNNH+LVw2?=
 =?iso-8859-1?Q?+36R5/UL40XCElcMFa2DmW0oBLPUSABAol2DeH/9qiOMye1tSvcY7SR8jb?=
 =?iso-8859-1?Q?KH2QnFb3D3/vb/E5+fduKLSDDVXpnxbhjv01SqyQIMUp+yA+C64gQD3Whz?=
 =?iso-8859-1?Q?8Ry1izJ/icbX4pa9kAvTzHhE0iYNwZYd1uahAPUGmy4FM68=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e167eadc-0ccb-48eb-4270-08d9581fe395
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 14:47:03.2857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vglb7i2oo85KM6veZ0uIUgpyYfqd4GyaBM48eFIxw3yRP4a+yKOxDEC89R+VcR25dhbTmoxURDLxq+9refY4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB3988
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "aduskett@gmail.com" <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7860944527237739357=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7860944527237739357==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB39879D2B6747974F28FAA7579DF29AM0PR07MB3987eurp_"

--_000_AM0PR07MB39879D2B6747974F28FAA7579DF29AM0PR07MB3987eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey,
> In ed355dec (PATCH 2/3) the following line is what makes opcache actually=
 work:

What is ed355dec ? I don't have any commit with that reference in
Buildroot. If it's the reference of the commit of PATCH 2/3 in your
Buildroot Git repository, then it doesn't make sense to reference it,
as this commit won't have the same hash when we'll apply your patch,
i.e ed355dec means nothing expect just to you locally.
I know, which is why I referenced both. So I'm referencing the second of th=
ree patches in my recently submitted series regarding package/php.
> PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LI=
BADD)])

And what is this doing ? Again shm_unlink() is no longer in librt, it's
in libc since glibc 2.17 (if I remember correctly).
PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBA=
DD)]) is executed for non-cross-compiles, and with my patch also executes f=
or cross-compiles.

Though I haven't looked deeply into the PHP specific autotools macros...
https://github.com/php/php-src/blob/PHP-8.0.9/build/php.m4#L1507

Regards,
Pascal de Bruijn


--_000_AM0PR07MB39879D2B6747974F28FAA7579DF29AM0PR07MB3987eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Hey,<br>
</div>
<div>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
&gt; In ed355dec (PATCH 2/3) the following line is what makes opcache actua=
lly work:<br>
<br>
What is ed355dec ? I don't have any commit with that reference in<br>
Buildroot. If it's the reference of the commit of PATCH 2/3 in your<br>
Buildroot Git repository, then it doesn't make sense to reference it,<br>
as this commit won't have the same hash when we'll apply your patch,<br>
<div>i.e ed355dec means nothing expect just to you locally.</div>
</blockquote>
<div>I know, which is why I referenced both. So I'm referencing the second =
of three patches in my recently submitted series regarding package/php.<br>
</div>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
&gt; PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED=
_LIBADD)])<br>
<br>
And what is this doing ? Again shm_unlink() is no longer in librt, it's<br>
in libc since glibc 2.17 (if I remember correctly).</blockquote>
</div>
<div>PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED=
_LIBADD)]) is executed for non-cross-compiles, and with my patch also execu=
tes for cross-compiles.<br>
</div>
<div><br>
</div>
<div>Though I haven't looked deeply into the PHP specific autotools macros.=
..<br>
</div>
<div><a href=3D"https://github.com/php/php-src/blob/PHP-8.0.9/build/php.m4#=
L1507" id=3D"LPlnk">https://github.com/php/php-src/blob/PHP-8.0.9/build/php=
.m4#L1507</a><br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>Regards,</div>
<div>Pascal de Bruijn</div>
<div><br>
</div>
</div>
</div>
</body>
</html>

--_000_AM0PR07MB39879D2B6747974F28FAA7579DF29AM0PR07MB3987eurp_--

--===============7860944527237739357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7860944527237739357==--
