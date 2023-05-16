Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA57DC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 864BF40529;
	Tue, 16 May 2023 05:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864BF40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Shnpbns6-9v7; Tue, 16 May 2023 05:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82DE640191;
	Tue, 16 May 2023 05:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DE640191
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71C511BF34D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 338C960F3C
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338C960F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn_TvRuK0Meo for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF06160EF3
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::624])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF06160EF3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr0c9buZRpOaTY0HkHLckP300PRn/UFvPN1iXzkDDiR5cOs18MUrqrgDa7UyiEYk/4u9OJZWUDcPVgZiHBdZnNOdEvip0gaWVZtmEQWbi9AIA1C5CZoeHBTDf0PEjCpM1Gc4Rht1vyu2OxOPtD8pTYRkLD786HmOVPZlKHAii7b/nnjPwfDbASTHhTAO5IPvmfLpym5tuNkA4SjsNmvJbJNVjL/COkmzuN/ajK9jQELbeAKZx62ish810leirQE6XoxXry5/c3hcpzzh1CffBmFjm+f6tUnUNzPgP0+YN9x+a6AmT2300lVknS3oefHK+4o7PpTyu9cSPm27Luc9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coqZsO/RjqslKkXjZKX1h5xDf3078E/cwznHab2nn14=;
 b=fG8kE4TAOf2JnnGLgJi7HRgeby08WAUaKTVWFBFjFb4jF0FbL8CF/NieWDpkaAJuc5V9CXu9719BM9mTomkV10XUqO2XAvCsWrrnrwhz6azQlzj9sU8SS5TjVIy7GBbX3gIxOhvV5ysqpMzSiorsqqSLvYITVAfLMIlV92Kpfj2EAkzmbB1sxEDjcVAZNz82ApXsaeNg4+Q0z2QN8oGRdf7jl3zl992CPy1wvK2KkTVAvXPLOc4M4CQc8Jf2NRYlkmnlE09lhuXYy49AMv4epYIgQsbd8Axn10r9/+V2XXwZ10LNgHyPzg4SIOHa6CLSS39y8qYiUumlRwCEaJF3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB6688.namprd12.prod.outlook.com (2603:10b6:a03:47d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Tue, 16 May
 2023 05:17:19 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 05:17:18 +0000
To: Baruch Siach <baruch@tkos.co.il>
Thread-Topic: [PATCH v3 1/1] package/bootgen: bump to xilinx_v2023.1
Thread-Index: AQHZh7Eli1UDO/edIkmATAXtPAMGD69cVDAAgAAHTE0=
Date: Tue, 16 May 2023 05:17:18 +0000
Message-ID: <CH2PR12MB5004E6CADE6B17221F5A6DC6F0799@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230516044418.21419-1-neal.frager@amd.com>
 <874jocc22f.fsf@tarshish>
In-Reply-To: <874jocc22f.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB6688:EE_
x-ms-office365-filtering-correlation-id: 3b501255-17f2-4047-27cf-08db55ccd1c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+YoxouLBEAmwu1uvZ4JshtfM3k1GhKvFDOvhqB5dQ28P9wqA0iqwO2TsvOcG/2dBuLU2cneGw291AbAZryKBB+waBMEjpwiWqYrBk80JWQ9mGUcCzfBZ2cawANBhiR7YkgrJjt9pvpSqZbS1ddPsfP43qv+2NYQkWl+Zh+4+G5m+lYXGxeiSVnZAFui+PSPcQ78JVRi6TmDr55em7opyDQhPsoGvlEvLxc0tZd9E/6JeH5AX4cp/c3SPhxNr7tL4JmJKYbaBuJogT36vAQWebvexMVyp2CI45an8GgKre8E0IWHCWBXAAL8ExklmI74lnimN4Rd/Rak3RkYGh9MCcVFopcMC/Www4O6y8Ptb+oYMNgi0GqBUqo/snOYgfMMHop4sugqPVYbcNBpcTnxFBFPcU39i6Z0Chcr6JKdymorQOrYnUWrrWkHqp85gOsZLrp8+Pgl74Ddk6i7d+GacwpD0emMuNcdKsm3Zz35jLxJzPLoBsuy3lYXP5R4maEJsDpT5YVVCpem0FtM15W7Zrbm/TK91MpMAJUDLHx3w63kNwmV2AUpVotDcwIkj4JALuxgWLsBxPwCwywtlHwtzDFXXAH7DL/8Pnt2vUAb+zI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(55016003)(4326008)(66476007)(966005)(64756008)(2906002)(83380400001)(478600001)(76116006)(66946007)(66556008)(66446008)(7696005)(91956017)(54906003)(186003)(6506007)(8936002)(52536014)(8676002)(26005)(9686003)(5660300002)(6916009)(316002)(71200400001)(41300700001)(86362001)(38070700005)(38100700002)(122000001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wjHz9fwEo5tJ58KiArE0Ufegc807Cigd4O97E6y4ZrQ6c943Toz4Y4w3Px?=
 =?iso-8859-1?Q?a+K86mL4KRvfsbLdtJAi/an8nqzXyu0FC996GKlCtJq2W9vzXsJYKFLMN3?=
 =?iso-8859-1?Q?FBCyKfjOKbnIXoJSAjI0LTEmZgAEVqe3OIN4rbHeeCnEed6AgCKq76puEE?=
 =?iso-8859-1?Q?pkfRbU8YTZAt7bXyEuCvLr2FLaXe3qxstqcpfK3I81BWYb32py7S/v0kst?=
 =?iso-8859-1?Q?ZQRQNHVWVUT7XTzSP/nT0gNLKkDMnix1tYDB9eZr7DOilzC5VNoxKkW457?=
 =?iso-8859-1?Q?FYEq7cvCjCdxDJgbgLwO/ms/LMEaUEhbd7gRqfr+tYThbTMJjjb9Je4u/A?=
 =?iso-8859-1?Q?6B1s5hkjCqqjPOrrq6r6rPwHS0x+A7UhzCrABxh93Wn5cRYnDXh+/GLSzO?=
 =?iso-8859-1?Q?Clt/AEWrjLf9tjmDV/4nxi0t/JmFPy/QJ61H8CwxcWH/Kwh5zqEx86yrkS?=
 =?iso-8859-1?Q?ciLWBxeMH1DiICCH/bvdiySaxO7FPQUMDF/rgjWbW5oz9FQn00LsfCoWsK?=
 =?iso-8859-1?Q?2PG1p+dwX9dLfY/qNfpLVxwTSq07t0oC6/ZXBELm8seDnBnGydfr0xP7/W?=
 =?iso-8859-1?Q?MOT//FrlfV4DNeHW2xlIVO8mTX7cq4006nExutrSb1iyzrc0PTKR3oa5xG?=
 =?iso-8859-1?Q?TTZggamjTUn6c4kW2C9v9Ej11RxZKWGu2rOCr0NgPulpxG9yBRU2GW/oiJ?=
 =?iso-8859-1?Q?7aJzAN+w5ani0OFNVycCS7XhC+lXciCPRU1kQYvPHagPU5Vmd61TD8oAMU?=
 =?iso-8859-1?Q?LQTp5wfPpn+yVWwYg6bugzsS2d8v4i6aAfXLdDObKkNcfon7XYFAAtWYF2?=
 =?iso-8859-1?Q?nzAb0r7fEAf5J0VfQC5yxsULowDkjHQrmfpCeeUswfBGZPrBKfEd3MinNM?=
 =?iso-8859-1?Q?CuMXKdOKYIYQLkh7Qjr9ckG37h7jVL+csOC2YWz69vaYV0IrrXd0wmn3c1?=
 =?iso-8859-1?Q?HursQnYSkMq6tFTcra4Khx67f1yYtKqdnPp0YRV44iSEn+B07Mc+vGHeQx?=
 =?iso-8859-1?Q?+ZiAO2F9yRa0CrdQNEbQspcvlau8kILO2Es3/biNY5orGoOSWuOr0q3Igb?=
 =?iso-8859-1?Q?7qtk2FM1mX34VXg/54cGS/pWzg6YHjXUbFF0oBwTS6n2/7HoeT3VxBlo9s?=
 =?iso-8859-1?Q?aOH4SmyKQv5w69+hJzrLpNfsyWMpwrd/7tpwo/jf0X4rCPFN/Z33Wvp9y8?=
 =?iso-8859-1?Q?tjYWHr2eAylwXiAXaNSp04rwCyQLekL756aIkSW583w5nyAW8rxuff8Y26?=
 =?iso-8859-1?Q?0DD+LTVVslsvTvS9CD86YEFY8vp0EHriJGIkpSefkRTQ9kBdeXqTjxteEw?=
 =?iso-8859-1?Q?lHE0YPXdEnVbj+MVQ9igJ0By0tVBv+XO0OkpYU1rvV3xC+o/aTCKSHmrrx?=
 =?iso-8859-1?Q?x4kJhHl79L0FeEoJMUBXyR4gJxjPn391xjdVRHT8GLXlJDBRVaB24BrmAg?=
 =?iso-8859-1?Q?QrvYEmgrqtLOf8XZq0tK+vOQVTfDf8NuBQuRPLM/8TDXyy9GyGq9j4EMGe?=
 =?iso-8859-1?Q?9vvNelohAK/JYsxaC22r3c6X91I7VByTr7SOvAkj7MDCqUvhS4XNei5t3L?=
 =?iso-8859-1?Q?XkK2UnT/iYdZAdaMTKwkvOFy3LeYp2VqcIkIZI2cugsKtoqMTjseKpTisj?=
 =?iso-8859-1?Q?QY2aNTiCw6dfw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b501255-17f2-4047-27cf-08db55ccd1c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 05:17:18.3673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihpldPrIRwP6Fb74AfW330KCI3ob/d3adlcgZ6/vttldkhXWu12dfJdYqvLElDhg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coqZsO/RjqslKkXjZKX1h5xDf3078E/cwznHab2nn14=;
 b=Q9/O04vkBxKUSV5Axn517Zb+HyJwZb9OMb+rwv/0UwwEOsuURNR4T6Y/G0mfdHpNy0fJLQPYEvB8dciM5xQQy0XO8GhO6L8f+EwC9KHvDa/bGUf0ZpmUl2qq6UGSyzjlW3a/o5IKeyNLSz+JtfjNWU82Mcxjx6pO5ei2UduoJmE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Q9/O04vk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bootgen: bump to
 xilinx_v2023.1
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

> Hi Neal,


> This patch bumps bootgen to version xilinx_v2023.1.
> The patch for build machines with modern flex is no longer needed.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>=A0=A0 - Added patch file remove to commit
> V2->V3:
>=A0=A0 - Fixed file name in bootgen.hash file
> ---
>=A0 ...x-build-on-machines-with-modern-flex.patch | 133 ------------------

> The patch should also be removed from the .checkpackageignore list.

I was not aware of this list.  The list is now updated in v4.

>=A0 package/bootgen/bootgen.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 2 +-
>=A0 package/bootgen/bootgen.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 2 +-
>=A0 3 files changed, 2 insertions(+), 135 deletions(-)
>=A0 delete mode 100644 package/bootgen/0001-Fix-build-on-machines-with-mod=
ern-flex.patch
>
> diff --git a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.=
patch b/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
> deleted file mode 100644
> index ea82f5e70c..0000000000
> --- a/package/bootgen/0001-Fix-build-on-machines-with-modern-flex.patch
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -From 7251dce3dc974c7372e7024ade3e8a455266cfd2 Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Fri, 18 Mar 2022 09:02:31 +0100
> -Subject: [PATCH] Fix build on machines with modern flex
> -
> -Bootgen embeds an old version of flex, but uses the system include syntax
> -(#include <>) to reference it, causing conflicts on systems with the
> -development headers for a modern flex version installed, leading to build
> -issues like:
> -
> -../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanne=
r::yylex()':
> -../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=3D' (oper=
and types are 'std::istream' {aka 'std::basic_istream<char>'} and 'std::ist=
ream*' {aka 'std::basic_istream<char>*'})
> -
> -Fix it by using normal local #include statements by:
> -
> -sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Submitted upstream: https://github.com/Xilinx/bootgen/pull/20]
> ----
> - FlexLexer.h=A0=A0=A0=A0=A0=A0=A0=A0 | 6 +++---
> - bif.yy.cpp=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> - bifscanner.h=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> - cmdoptions.yy.cpp=A0=A0 | 2 +-
> - cmdoptionsscanner.h | 2 +-
> - reginit.yy.cpp=A0=A0=A0=A0=A0 | 2 +-
> - reginitscanner.h=A0=A0=A0 | 2 +-
> - 7 files changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/FlexLexer.h b/FlexLexer.h
> -index b115b5d..1c0386f 100755
> ---- a/FlexLexer.h
> -+++ b/FlexLexer.h
> -@@ -33,15 +33,15 @@
> - //
> - // If you want to create multiple lexer classes, you use the -P flag
> - // to rename each yyFlexLexer to some other xxFlexLexer.=A0 You then
> --// include <FlexLexer.h> in your other sources once per lexer class:
> -+// include "FlexLexer.h" in your other sources once per lexer class:
> - //
> - //=A0 #undef yyFlexLexer
> - //=A0 #define yyFlexLexer xxFlexLexer
> --//=A0 #include <FlexLexer.h>
> -+//=A0 #include "FlexLexer.h"
> - //
> - //=A0 #undef yyFlexLexer
> - //=A0 #define yyFlexLexer zzFlexLexer
> --//=A0 #include <FlexLexer.h>
> -+//=A0 #include "FlexLexer.h"
> - //=A0 ...
> - =

> - #ifndef __FLEX_LEXER_H
> -diff --git a/bif.yy.cpp b/bif.yy.cpp
> -index 7dd0841..9e09267 100644
> ---- a/bif.yy.cpp
> -+++ b/bif.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - =

> - #define yytext_ptr yytext
> - =

> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - =

> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/bifscanner.h b/bifscanner.h
> -index a6ec9e4..ded78da 100755
> ---- a/bifscanner.h
> -+++ b/bifscanner.h
> -@@ -28,7 +28,7 @@
> - #if ! defined(yyFlexLexerOnce)
> - #undef yyFlexLexer
> - #define yyFlexLexer bifFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - =

> - // Override the interface for yylex since we namespaced it
> -diff --git a/cmdoptions.yy.cpp b/cmdoptions.yy.cpp
> -index 6ee80de..1acfcce 100644
> ---- a/cmdoptions.yy.cpp
> -+++ b/cmdoptions.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - =

> - #define yytext_ptr yytext
> - =

> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - =

> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/cmdoptionsscanner.h b/cmdoptionsscanner.h
> -index a48af09..e02c1f1 100755
> ---- a/cmdoptionsscanner.h
> -+++ b/cmdoptionsscanner.h
> -@@ -29,7 +29,7 @@
> - =

> - #undef yyFlexLexer
> - #define yyFlexLexer reginitFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - =

> - // Override the interface for yylex since we namespaced it
> -diff --git a/reginit.yy.cpp b/reginit.yy.cpp
> -index 8422867..ff088f9 100644
> ---- a/reginit.yy.cpp
> -+++ b/reginit.yy.cpp
> -@@ -379,7 +379,7 @@ typedef unsigned char YY_CHAR;
> - =

> - #define yytext_ptr yytext
> - =

> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - =

> - int yyFlexLexer::yywrap() { return 1; }
> - int yyFlexLexer::yylex()
> -diff --git a/reginitscanner.h b/reginitscanner.h
> -index 4e78af9..23177be 100755
> ---- a/reginitscanner.h
> -+++ b/reginitscanner.h
> -@@ -29,7 +29,7 @@
> - =

> - #undef yyFlexLexer
> - #define yyFlexLexer reginitFlexLexer
> --#include <FlexLexer.h>
> -+#include "FlexLexer.h"
> - #endif
> - =

> - // Override the interface for yylex since we namespaced it
> --- =

> -2.30.2
> -
> diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
> index 5d77c164f3..937509c859 100644
> --- a/package/bootgen/bootgen.hash
> +++ b/package/bootgen/bootgen.hash
> @@ -1,3 +1,3 @@
>=A0 # Locally calculated
> -sha256=A0 7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acb=
b3=A0 bootgen-xilinx_v2022.2.tar.gz
> +sha256=A0 2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea=
8e=A0 bootgen-xilinx_v2023.1.tar.gz
>=A0 sha256=A0 4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a5=
9aa3=A0 LICENSE
> diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
> index 88bc73b604..d83980d925 100644
> --- a/package/bootgen/bootgen.mk
> +++ b/package/bootgen/bootgen.mk
> @@ -4,7 +4,7 @@
>=A0 #
>=A0 ######################################################################=
##########
>=A0 =

> -BOOTGEN_VERSION =3D xilinx_v2022.2
> +BOOTGEN_VERSION =3D xilinx_v2023.1
>=A0 BOOTGEN_SITE =3D $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
>=A0 HOST_BOOTGEN_DEPENDENCIES =3D host-openssl host-pkgconf
>=A0 BOOTGEN_LICENSE =3D Apache-2.0

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
