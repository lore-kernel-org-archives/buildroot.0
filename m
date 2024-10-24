Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8CAD0BB79
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 09:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79DE4811D5;
	Thu, 24 Oct 2024 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wyCDWFlP3GH; Thu, 24 Oct 2024 09:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B7C3811CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7C3811CD;
	Thu, 24 Oct 2024 09:04:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A36E25A5A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 09:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830AF40081
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 09:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZLjB1n-J4GG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 09:04:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2608::70c;
 helo=eur02-db5-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCB3640089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCB3640089
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::70c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCB3640089
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 09:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmWBuF68PbtNvxIqbVqrnJXcgSJ51d8FCgSDAneEElg6amN4xBx+zBtJaxzLyaldeJhWvwJnHdGfuHtruZmfEaFNc6LZYbFNyxcs0jI0jxBMy825mA/V+buu6X26OtuEtPfNzWB33rF7Vz5a5S+ATwrrF4bL/UhyFXqxqEYSf3KV495is+w1JAUImzkB10g5/KTtjLigl95/qc/mpYQi2t2t42EAJvsfmol1KXDnED7/QOCQiUtbJsvJPEF6wVqmrH+O2L3ZhUH0kfF41qT5Mzyg0q+65u8ByyXoMqkBAQS8Aj6EB2HBRcJ/SeSHZt5Z6+miF4yd7dpYgx7NEcwBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Zqzb+RpGzPsE1IXT7YA6EaRq7NpwHv+oToGFXL1xqk=;
 b=d+JXiPCOf1bikaionJILneBK1/kH80Z3rLRR6UFaFk2sXc8qei5nZzG47pdaFEr0je3T5iPkmZ0qaxpLcMi7Qipc3PCcp5+qOocQLWJwcNJ+Fsx9JwwU6Hf6GtV/t7O7b0TvH1N54ReBjc2OEEM6M1GHDNa8deMty/MoOVCNf7kSbFvZoiogoDv3byf8WWOkqDgxrfHeVeT9W9oSu5GYw3NzuSJ6KZqHuRUBkWOi2lIw3elgXIVQ1W8lqL45ae3KUuiE10N84r3ACvxIvLqlWLBbNeGuoTDPm9NTPPNreMv00ekTnvZgdcxqOR5p/T0WQD7fZonm1sy8g91HKvODjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by PA2PR06MB9735.eurprd06.prod.outlook.com (2603:10a6:102:413::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 09:04:27 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 09:04:27 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
Thread-Index: Adsjrr0VZCNu9HOzTAColIJnvb08jAB27NgAABoc5dA=
Date: Thu, 24 Oct 2024 09:04:27 +0000
Message-ID: <VI1PR06MB89264486CFDAE541386E7431AD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241023223046.448ff10a@windsurf>
In-Reply-To: <20241023223046.448ff10a@windsurf>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|PA2PR06MB9735:EE_
x-ms-office365-filtering-correlation-id: 6f436b6a-8d8b-4bfb-b1f5-08dcf40add20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WdGEjltZwfil/JrXFLuEfBAE/frP4toplPzy+qYTcZqrfyEKHwX5ssXr+a7t?=
 =?us-ascii?Q?fYkkYGpMy4m8Cju/gi7BGW+GFwQPTn+UmOyi1d7Q9A2F/WAYAnCGPeWlALE5?=
 =?us-ascii?Q?Sgpem0MZosTrMLApah5J6/gBdkB+YDQG3CD2zfzj0WlblqWJDv2Y3maRgrE/?=
 =?us-ascii?Q?OIJU00WMmxZRc5P8pz7g1FpmlqhrELVGzATxHDWe5BfyakCTGqh7tiRVUThs?=
 =?us-ascii?Q?jKHJ0+6cUejz9v1WJtvKbjmo0fwNVeAwJxH2koN6fQMPV34OD7e0YBh2/KLt?=
 =?us-ascii?Q?SVcgsgk6gnvdJP9xX/VZ/o9Zeyp6X+ABW4MZmTMSx0qUQqE3xY3CKaTTjbig?=
 =?us-ascii?Q?6TkDJ+eK3nEvjp40KzB/amsFHrWzqFYdmTTZuYKWQOJ5rJuWFJGI/SUtzb+K?=
 =?us-ascii?Q?98FGa9k/xxqixoMFlF+48njiaFlHMEUgCgdRnHWu4jPg2b4NRJQj1oRo4Nc3?=
 =?us-ascii?Q?BFumdeCJaIRYOiHfIP50wBaPEefv7EelSIh3RP0GiBwsf2TdnYvj49GJ8qPk?=
 =?us-ascii?Q?bU84onxZ05obmmaZG0RODkl0dL7PrtY12iqAWie8eX6Sv5JKLQ8Rof3kB1W+?=
 =?us-ascii?Q?55XB+RRmd9XNggivp5eviI/jZEv/FDEUoYBj+mEQdRUjJQUtYQwfteewxQEK?=
 =?us-ascii?Q?SSZGf0ekIEV4WSOJRmpl19BsVlKBxRpO3QE9LW3xqdKIOjpKHUXGK8Q9WekU?=
 =?us-ascii?Q?H05YaBZdBHA3bhL4tt2NvPXlwUzwiWzeV4/CFmQSPCzGLEjupC718zkh0Jmc?=
 =?us-ascii?Q?rw9rsAVmvzLFb5TFM/Ro60NWTpT+XHIKsLcHvlaSuQfhZlc6+oFbcgcvikeY?=
 =?us-ascii?Q?F0BQexFujrlYF+qW3dgendZ29dTTWtMfm8B5BtSlPUGYExndW4/82zfBOMeI?=
 =?us-ascii?Q?Qo6szRijrDGBSVrGXSbKkoy1Dp5jNz1pUOBgffgzzoFi8D/RTniYEqWf8Yd3?=
 =?us-ascii?Q?YSdRvzez045BP+qh1Ocd0OpfDqtSlh8xDH/3XiXZFl9CZo9qsu+hVtOYEHRu?=
 =?us-ascii?Q?RuY4luYjhV2/wu8qx8YSXeh/w03E/OaAuFfQU47HCmc1WDhPPoDX5SjASNEx?=
 =?us-ascii?Q?PDzBY78uGEoXN/M4eGiP6TUfa7jZyg58CVsNSKKCUdl1Pa24x/AiGdGuDUnH?=
 =?us-ascii?Q?tI5fHLv8cB4gOhKpn8XUNPSM4jVNyy4JBls+1ujnSN0dj/gz89K9FaM21dMv?=
 =?us-ascii?Q?+ZIO2WBtfJUTpRaGVmNIbVBB1MomO4ipPuvGb5ielRykYOSjUJUbUgkFZ7fq?=
 =?us-ascii?Q?WEUoYRTpankekREomiN8viioSoqPBGW75ir/2/o47IALNGdSrgklxBcUYKbd?=
 =?us-ascii?Q?nexkFTO1Kln3wkj2qA8jykSx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HI3xLV+QNc958UynmWTeMFhI5364pZ7P4dWW+5ctWh+AzjstZGusOzLB/Ujx?=
 =?us-ascii?Q?6ua6hdtD1aFaNxH8bLxldYMxi/Qb+2NvWGBsix2QOdB9p8ZSlOogucJzGnj/?=
 =?us-ascii?Q?19FAbg5ntgoHGqpnXrlZiwTPtb8Poat924YBMO6vzbztTJEj7BhCUsSh5b49?=
 =?us-ascii?Q?Iukk4V2r8l81+00czvr9YoLjoBZoXo1VwoXVHDACjK2QjWr0Rmj+i4GqY/dV?=
 =?us-ascii?Q?CnphLzCoiyfa3TAzxaaK009ifcsgBwNqwAAFpKMfSnRwwsVXvlxuvaApvatn?=
 =?us-ascii?Q?pbTE0CvOGZXUvhEv4NXv5npbkmTqnYScgo63b3Vc90sGVZNuiYbloLoKzsdn?=
 =?us-ascii?Q?uNJ4ZyTdywN5KAOiQJOL4AUUzcTEH/fZytMcIMvyz1pbmOmIt6KhXMRWkf04?=
 =?us-ascii?Q?PB+X9ZnD1Ku2jmA2KUHft0MERPSjeVwtplx95WlJwaqCoepXRawiXBR9JuHi?=
 =?us-ascii?Q?W02vUIw3JjTWy1TO20h/tnINHqfem1TTk03ykEuK/S339GnWaq+PyJSYOy3x?=
 =?us-ascii?Q?VixKt0nNN37gByPj8VKXun0DzwIvfIApkJJWmzet1HegIJbWQT/h6iljprPt?=
 =?us-ascii?Q?5fgAgfDQmyXrDwFZ/wFmPk/iOWiRxAidY17zAUjIXpYFKeUZoKHdPotvYTHM?=
 =?us-ascii?Q?rAuUDbto1cYpiHZruC11aDpRxIXYcdOdDgua573HtCcrIU6dsBUAWulwutTT?=
 =?us-ascii?Q?llvxAsFxp1ewULWJT9j+6xTTW0QjnEVAk1EGy3FnEt1hWIxyuqcui65ZAPVR?=
 =?us-ascii?Q?N4erYCuXcbpGsvfSYo9lI2mNgoC95vZaSa6ZeivIHbGFkmMBkZyPdNZ67M0V?=
 =?us-ascii?Q?lMuIf1xiDWLlSX2TLhy+6z+4x9Y+97TCTTaTLXRdm/7TfUqILn77cPAPAOJW?=
 =?us-ascii?Q?SSWVlOIX7Z1etYvoZVWyvWnUOzOO1v8D/6LN7kZfqK2dqqNOsiISSqKXj7lZ?=
 =?us-ascii?Q?CWUa2iNEU58B0XbWSBgI3hQ7bPuDNEU3qMu5Al0YCqMqT4KH0xlY6lsNe2tS?=
 =?us-ascii?Q?mzZFs17AQsYcbpcCpVKEp2snBna0E20lsqOYmLRGFRcu1/8plPVJbDVebZQc?=
 =?us-ascii?Q?M2Zj2FgGaBzC37ZzSLUyq+m5QAqpdDkQLZIePWEzCaGrp97bZlxUy0CrwgZF?=
 =?us-ascii?Q?sTc4JU/O1F7ECqJIXr/EHhwZdp8T9bVaCcdT6tKK0SOS3kYR9PYzdSYw+2QN?=
 =?us-ascii?Q?OYYLeswsf+8wMMCbR7VjDjETevBMJvMGwoBeWSSrP5lFio/lRTA0f0hzcuo9?=
 =?us-ascii?Q?QiDYCAOInh8fD/U37Vdk7uB5ZCzR1nPwYyawycP/O3atKQolXzum7LWmwTZ+?=
 =?us-ascii?Q?PyBA/tKPpw7MUIIzvYa4To+J+sXr2oCv15lnACipujtmKa2jXJvtOA79LUFK?=
 =?us-ascii?Q?5T3TAAIjDQNwADr2XWXPl7sYsL3R9DKrMfitukpfpUKwS/Ontn1hiwTUfpVW?=
 =?us-ascii?Q?+BPjuOPuytxoTkGdzwcLklqTYEuUloJX0rnsByaNpV4rq4LzhAWeK8NZV3ag?=
 =?us-ascii?Q?7uw9+I+1YyPRu+eiu0D0R4BDo2CvMlKn8r9R8sC3yQbTOQgFPBTT7LejjPOc?=
 =?us-ascii?Q?ELVgdzrkIMPBE1cHrN4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f436b6a-8d8b-4bfb-b1f5-08dcf40add20
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 09:04:27.5976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9Gy5IquqrBfGBre14YBv6+duhiw5G5vQUF30UqEuKiKMAUcr4a1EE3jsC9RJynxv2MDifvM8Oz4jS2E+ozXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9735
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Zqzb+RpGzPsE1IXT7YA6EaRq7NpwHv+oToGFXL1xqk=;
 b=HWa081poN2N88XjyFwJ0c8k/kJXp+ErEGWLFqlk1x2+IZ7P4RwYDL3kGx/q1NTmTcYL4RgHgvCZMNcPrKMKmAASDGRABUG/GfPMgnNxyKF8D+00BQ1J4HogPXGWGpfUAuKq8dVgiaNBBxXPYpp9+oal/quLz8TscAVwdJPnrNH4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=HWa081po
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: Re: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
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

Hi Thomas

Thanks for the quick feedback.

> Hello Ayrton,
> 
> Thanks a lot for your contribution! It looks pretty good, but of course I do have a small number of comments.
> 
> First a very minor one: the commit title should be:
> 
> 	package/libtevent: new package
> 
> On Mon, 21 Oct 2024 11:46:27 +0000
> Ayrton Leyssens <aleyssens@idtech.be> wrote:
> 
> > This patch adds support for libtevent as a standolane library.
> > Libtevent is part of samba, but one might need it for other packages without the need for the whole samba eg. Certmonger.
> 
> The commit log should be wrapped at ~80 columns.
> 
> > Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>
> 
> Could you fixup your Signed-off-by line to be:
> 
> 	Signed-off-by: Ayrton Leyssens <aleyssens@idtech.be>
> 
>  ?
> 
> > ---
> > package/Config.in                             |   1 +
> > ...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++
> > package/libtevent/Config.in                   |  16 +++
> > package/libtevent/libtevent.hash              |   2 +
> > package/libtevent/libtevent.mk                |  58 +++++++++
> > 5 files changed, 193 insertions(+)
> 
> You need to add an entry in the DEVELOPERS file for this new package.
> 
> > diff --git 
> > a/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protect
> > or-opti.patch 
> > b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protect
> > or-opti.patch
> > new file mode 100644
> > index 0000000000..839479a3fa
> > --- /dev/null
> > +++ b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-pro
> > +++ tector-opti.patch
> > @@ -0,0 +1,116 @@
> > +From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 
> > +2001
> > +From: Fabrice Fontaine 
> > +fontaine.fabrice@gmail.com<mailto:fontaine.fabrice@gmail.com>
> > +Date: Wed, 20 Apr 2022 11:16:52 +0200
> > +Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector 
> > +option
> > +
> > +Allow the user to disable stack-protector through 
> > +--disable-stack-protector to avoid the following build failure with 
> > +libtalloc on embedded toolchains which don't support stack-protector:
> > +
> > +/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
> > +talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
> > +
> > +This build failure is raised since
> > +https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4f
> > +b3c848fa46ba371 because stack-protector is enabled on libtalloc 
> > +despite the fact that libssp is not available:
> > +
> > +Checking if compiler accepts -fstack-protector-strong                                           : yes
> > +
> > +Fixes:
> > + - 
> > +http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd566
> > +63296beb15
> > +
> > +Signed-off-by: Fabrice Fontaine 
> > +fontaine.fabrice@gmail.com<mailto:fontaine.fabrice@gmail.com>
> > +[Upstream status:
> > +]
> 
> Convert this to the new Upstream: tag, as such:
> 
> Upstream: https://gitlab.com/samba-team/samba/-/merge_requests/2493
> 
> also, please add your Signed-off-by: line in addition to the one from Fabrice Fontaine.
> 
> 
> > diff --git a/package/libtevent/libtevent.hash 
> > b/package/libtevent/libtevent.hash
> > new file mode 100644
> > index 0000000000..990998e6d1
> > --- /dev/null
> > +++ b/package/libtevent/libtevent.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256  
> > +362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e  
> > +tevent-0.16.1.tar.gz
> 
> Please add the hash of the license file (tevent.h).
> 
> > diff --git a/package/libtevent/libtevent.mk 
> > b/package/libtevent/libtevent.mk new file mode 100644 index 
> > 0000000000..636a6abbe2
> > --- /dev/null
> > +++ b/package/libtevent/libtevent.mk
> > @@ -0,0 +1,58 @@
> > +#####################################################################
> > +###########
> > +#
> > +# libtevent
> > +#
> > +#####################################################################
> > +###########
> 
> This whole file looks exactly identical to libtalloc. Is everything exactly identical, and needed for libtevent as well, or did you just copy/paste? :-)
Indeed, mostly copy paste.
Since both use the waf-package system and the sources come from samba, they are quite identical.
> 
> Final comment: since this libtevent package is needed for the certmonger package, please send both patches together in a patch series (libtevent should be PATCH 1/2, and certmonger should be PATCH 2/2).
Will create a new patch series with both libtevent and certmonger package.
> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
