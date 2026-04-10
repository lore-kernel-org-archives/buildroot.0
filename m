Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5D3F459F3
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 15:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED4AF80CB6;
	Fri, 10 Apr 2026 15:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaFHKnZhMnBb; Fri, 10 Apr 2026 15:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D7E830E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775835343;
	bh=tldO4A8R2rxorPj51GXKMpAViYNKN8yrNFQeircLr8E=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ql1nzI0vMhc4DH24Y51Nt1apgemx5j7gE6OXCD+skNOHai5wtxVhHcXif0tgAL2LC
	 SfCJqgJff3uNslP1KP8V16JXnFhqob5tTQuOqgLcssKZ2ooDI9OJc8MttTNNFNAvZd
	 pXmgIWM1W2oEtIC/UTJlTyVLxtxsRL5VkQs2XGFKuOJKYYQVNDOZrXNcvd3pkl6Suh
	 D1pOLxTgq+oeDdNdcaZIB15UyYMOsC0YIDm/WfuFVGxEiesV6wBhBvolYMqMVrznrM
	 0+yOUISqfX0DICghtisJ54Sumleo3uF1AUWlQqU6xti0CDFSgl/+jphLTWFGHn0OZC
	 mPZo2jMTZn0wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D7E830E2;
	Fri, 10 Apr 2026 15:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B76D3237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C05980CB6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gT88xfDx4y-A for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 15:35:40 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::622;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7208830C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7208830C2
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0622.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7208830C2
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mVBR+w4/VueUxUs/kuT3LAmRqghI53dm2FuoKpzZwtmS2qFqpMuM239ZbdE7Yz7PlYI2RYW5U+TCOhcG84wQeHpZI2X5ljFdof8muzQwBneOS8DbMOnlc61Euo7RUKm7sgg41eltSRkh/EAOIgjbHShxpiy1MJxDFeCuXje27jxSud+3Mgxl1P6LFoGVrgSOcUU1JzqfC7NeHRgsrq9l3cLPSY+bPmqlCKLe+lvDFvooR58ZsrtUDpPpXRi92JBnbq8BQzsLkCSXxoIGUPxNbPyPXASiA0jVfkrAxe4T3GRmOCy5SptQnbeQ7UOVgB0V5EC7S4fBv93M1moizxew1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOXzz+77kroHDH5FMOUYMmV60KO0hHo4qA1dq2e2itM=;
 b=qqAtBmVmZmaAivUuiMSuNRRSuarVYSvouHk5NXOkAUFhrzNnTL/BSjjzsWrIjEsNKQRyVZnbtEKSI/sL9cF/GCY2wH9HXuKlni4KDcJes5IqGz7LuxZE8a46y/aQUE7Q5OiphtaQCdHLj8HjqultR5YqWvCmrBhmKUHWCmph5TXq/roZBRDMz7hWvm242qx9f4kOUfct1tW4Y+XD4iDbbyMwwvkx9CMnp3rpnb8mq0igTF9NSFIa1DKe+cHkLu8xqoYs1Wk5NOfSyKPLpJk9qAUB9g0lLtRBFr1JIKaRQnZABHUp7uj4ElUrCTnta+fxMLoy8R2C8f8NHpnnySXUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB1800.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.43; Fri, 10 Apr
 2026 15:35:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 15:35:34 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [git commit] package/libgpiod2: bump to version 2.2.3
Thread-Index: AQHcyP+s4EBQiw+6kUuYnVR2QkoOuw==
Date: Fri, 10 Apr 2026 15:35:34 +0000
Message-ID: <PH1P110MB16034B655437B7693793ED7B9F59A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260410132316.CF960810A4@busybox.osuosl.org>
 <PH1P110MB1603F003E8115D527FAB219F9F59A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <692b3530-b7a8-4898-aaae-3e1f8736ac0a@bubu1.eu>
In-Reply-To: <692b3530-b7a8-4898-aaae-3e1f8736ac0a@bubu1.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB1800:EE_
x-ms-office365-filtering-correlation-id: 46fdb72e-8f28-4be8-1778-08de9716ceb6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700021|55112099003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: PfNSujk9nLvatQJwCbkCfNqoAJ2JOoJWUs7KZdPauZ5zUuKWqkO9HLvqsGZCcsBdXAmIUdP4MNB9aH3oAbBQSJqmG8Z84uZh2ilAv2aOUVRa1NfI9qai3zFCNlZf9zRUCMUWCzMN3uC53AMQy6Cpec/i4f8SDWjBqTZyI2eFawb2+merJpuw1SKrklstFCIsgMvvNtruXlSOvB2S7u4YwLnU9eqQed0XK78tHZRRfJTzXCzo+wK+zbmhfdTCPsYI7OIMIlGd0FvDOr0sqegRS+CkOYG7glOYxq/YyBWHSs+oAPWd4V/jXA/MEXZTFT7iuOuzTLBi7yVfqZfSjQ4bzR0WJUt87S02mIeyUKUHk73qqo1J2A33eQHQU3WDflOuA/Ez3YWPrNd3gMdexnV+P3Qh1DtbcqbZlpsXQHzYtm32StFs5RfZUXYVPLy0vr5pzzZlfjinXJjQnf0zveQJ7JalfDCNcm1tbtiHePss1o+E0ESUlrVcfmzs0WWlT6x1nmpra/gF2iNuN3iXDc8U0ZyevvtPWYTckAbAM3O9C/fPyzR2zfpzvC9YIGZ62hkKwBo6HzkO3p8XQjStR0b5T62w5Dmf4FJ435wErmRHs3lPWvb50oo2fFQ9CyvQO4QlE5938YZCOxHK9WGNYn+CVV5cISmAHciQM9dnFmd1fRfA2vXcrvaTq2cHsVfvCgAOVmVJ0aUcESvaMJg7dqvAqtwB+f5cuWIiLTB/93URyZFddSVmSWIp+JUbYYq0QhZp4YRnXvghDAqPmLKHaozTB37YCkCl5xpQXJoBDx2BFpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700021)(55112099003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWdyMit6MnphTzA4SXNsZG16WE5BR242RHkxN3RIUlJYUnJObnBtV3pBOFNh?=
 =?utf-8?B?cForY3ZIZFFXL1A0K1V6Y2FybU9QZm9laDFEZHZPSHNJSy82UXNFcnpNL2o5?=
 =?utf-8?B?ZnpwWVAzMnlwa1lCNDJrbEI4Vk9yYzRiNjBoeWMzdVVIUkMxVHhhUVZqUkx0?=
 =?utf-8?B?bkprWmhBbUFjaWYxVXRiS0NnellVb1FScUFSUk1pN3Zjdkcwa05xMlQxZjk0?=
 =?utf-8?B?ZWpYeXlmalRUZk1qYlNlUGlCNGdORUF5VzZCNlJiZUQ0cTVuV1BFNE5JZUFO?=
 =?utf-8?B?K01vNTkxRUd5eDQ5SlczSFRDbDU4cVgxcDQ0NFo3ZC9hRmluYll6QWZhdU9I?=
 =?utf-8?B?STV0VXoxbkRZWE5LakFTSFRqamJ6ODg5QTR3RVhjSkVnTlJJRGxpM2RkUCtX?=
 =?utf-8?B?bHM5UUEwMFp5Qlh0QUxseEt0d2NWSVBKUE5lb0ZLdXpIVGVBdXZYN3RycGwr?=
 =?utf-8?B?b0VPclEzdWNlV0xPQzdlMUIrSml3d2ZCbGY4Mng1U0t0VUJBY2ZPdHUzWjUz?=
 =?utf-8?B?T010RzJHMkhCLzdSQ1BqK21ISG4wNmJaUVA4SEhUN0E5a2NrYXdjL1BrVDVO?=
 =?utf-8?B?UDltN2hZTDQrMjkyWGZDbTMvYzFhVmhGS21rQ1I0aVVTMFZyVkhKeFFTcHdF?=
 =?utf-8?B?RU1vL3g0Q3B4SDgvMWwxdWorVGRRNENwV011YWtKOURRTHloNVEwOFAyeFJq?=
 =?utf-8?B?byt4L1c4Z1BRWUhWTVJNekVOUlNHYlVtMk9SUnFpVStlaHZPZ2dKckNRSis4?=
 =?utf-8?B?NEhoa1NOVTl5ME5IRi81cUsxV0tBTTYwRUxORUhmYVE1b1Y2cmhjM0xoRUZK?=
 =?utf-8?B?MWRsVzZuS1IwMzdUTThtVVRhN0ZxaWpkNDY2U0Z2VG1SNkxHREhFdFhUVkhI?=
 =?utf-8?B?d3orNW50Y0M4TlNadXRhSExKeW12ZXIzdVR4RllIdTRubkJtR3JBa2gvZUkr?=
 =?utf-8?B?ZUxwR1F1TTNjemJCdUc2RmFEek5yUC96SitkRldRblMvYjBPdnZiRW9qY2tu?=
 =?utf-8?B?QWtBZ3dUbWh5N1dyMkhCa2FNK0l6VGZFWWxKQ2EzMUc4Q2wyUERiTjhsSkJo?=
 =?utf-8?B?U3VXZGI5TzZLOGxRMnJBbEhhUTlJZVN0M05hZlpGZTd4TndxM2VDbE8vdXpW?=
 =?utf-8?B?SkovbHZuZ3UyV0JYV1ZhWGV5ZFVGaGREUzZxcGNLaVBkTGh0NUlLeFppdi9H?=
 =?utf-8?B?WXFuMEpzRFdnUThOdGNHV084RlcxVHZ5Y2lDZ01vemR1UDdHTGU1V3ZEVWNv?=
 =?utf-8?B?R3F0WlFEZ29JbGc0NE1EMkRiODdCVzI4RG5PeTJSTERPalBlcWltTzRGbHFU?=
 =?utf-8?B?WVd4SnpEdXg4YlduV0lwbXZlMTBYeURpcHhQUHlKaXUrckFCSU96ZXVvV05V?=
 =?utf-8?B?dmJIQkcwMFNyVy9PVHhIL2xEdDhtV3hjS2VqcUpLUUtaSmlRVWhFaUFXUk9u?=
 =?utf-8?B?aUx1K2h1WDFMMGR2eDU0UVJDRDlpK1ZhVGpmd2MreWVaa0laU2RFMzVKNlJG?=
 =?utf-8?B?L2o1U2ozRnJ4VnZLOE4wSlZqUzJ0Mm9RbGt1bUJJblc5cXljRlpBUnU3aUZK?=
 =?utf-8?B?MTdnbDczMGRpNE8wdHl2L1N5OGJST3YvZy90QzhvYmx4K3l6dU54UTJFb1dP?=
 =?utf-8?B?ZTg2SVd0eWtVeEJ5WlRRZzhzRjF1ZVhiaWZpeVluNjRJN0tCdWlIT1Z5TXV0?=
 =?utf-8?B?S2xqNzdyRjNWWHA4MHp0dzUvWW9FZEUzdmNEL2RjZjZOZGZ5THBGby9MQy9M?=
 =?utf-8?B?SThobG14VlZTK2Q1aFNFQkl3bmdLRmI0RnNHSDZZbStUVTMrRDV0UDRyR0or?=
 =?utf-8?B?c24wTGxwWkxkMDh4L1NWTTJ2VFhjNVBxblQrL3poaHdaL1laa3RCeE4vd01V?=
 =?utf-8?B?aE9EYXo1aUYySmp4eURpM1dYT2lzaUY4K1QvY2VqTFBiZjVrQzdxNjJ1dnlv?=
 =?utf-8?B?aE9MRk1qWHQzREMzNWJjMmhTdmpwZ252S1Z4cms5aXVPWlNzVEJOUjd0SDhO?=
 =?utf-8?B?dHBZS3BIditsd2NXa0V6cm9JUkVGUk81a1hzSzg4R3JaZGZGc2lIMHRQV3hU?=
 =?utf-8?B?amRMZDV2OVN0RU5HZFdYZVl4dlBSZ1JCNU1zZGVQN3R0bTlMelRhK2tJWUdT?=
 =?utf-8?B?aUhDZ0pZQUZmWWxJT2pxYm4rOFJ0aEZ2NHNmV09ya0wxZXYvS29mdlpJbC9S?=
 =?utf-8?Q?ayfTOGJ299fTcRhy6IPZeXJRvqecuUpb2BpG/N6qV5Cw?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fdb72e-8f28-4be8-1778-08de9716ceb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 15:35:34.6152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB1800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOXzz+77kroHDH5FMOUYMmV60KO0hHo4qA1dq2e2itM=;
 b=n/UEkPV0n3te0BDVZXm+u4yBCAM4TrNRwc8MH7/e/2jD32k2sKL7i6wMSu4VFYDkywVuWfobt5yP6oDHktRAc8nFEJkWbbmiB1HqRf7YlHO3Kza31DEtRrNA2MuXDBTvT//dzUFlHu1U852n6+R80cIWzVnc0KliTeDwZdHEZjQ18UHWs++ZPDH7dF8PFriL1RlbOD2Sd+cELrNkei5aJYC1QkotRyo6scXQLxKdB5EnANEwBhutismmEoMULLWFslkJX3wN0cmag+YKpqr2dk1vMOQp28t8dQjjzmjHCi18Hyr9nTgXSE3G5AniuJ3VAXrIyxn+digaGcQCUU7mPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=n/UEkPV0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [git commit] package/libgpiod2: bump to version
 2.2.3
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
> From: Marcus Hoffmann <buildroot@bubu1.eu>
> Sent: Friday, April 10, 2026 9:40 AM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [git commit] package/libgpiod2: bump to
> version 2.2.3
> 

Hey Marcus,

> 
> Out of curiosity, is there a separate release notes/changelog/NEWS file
> for the python bindinds? These do follow a separate release cadence and
> versioning scheme, so a dedicated changelog would be useful, I guess?
> 

We (I) do not currently maintain a changelog for the python bindings, but this is good feedback.

I'll try to add some process around this in time for the 2.5.0 release [0]

[0]: https://github.com/brgl/libgpiod/issues/177
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
