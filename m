Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2758CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 12:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4C8812C5;
	Tue, 19 Aug 2025 12:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIOO_Ka_mpK7; Tue, 19 Aug 2025 12:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903AA812CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 903AA812CA;
	Tue, 19 Aug 2025 12:53:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A4EE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7940240A67
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js3TmMWk4GXC for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 12:53:14 +0000 (UTC)
X-Greylist: delayed 1090 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Aug 2025 12:53:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52F96409E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F96409E8
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::62f;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062f.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52F96409E8
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ti8eWyWgtWN4h+QFFMYRD48H0tP4Nsu8a+jOtLioY5f/Chc8/Q2aCKAw4TGKCpPRfoYx1GQI3tg0fVroxRIrKC2q8MDP/rFteYVxghoCfhJ2vXw/pxLwBj2eTgswRneSmYDOgpHRm8jDiDeepcP1iFTmXFuhc0m5LF2iP+K+b38OjhyZZvZQkbKYMtV8A0BvS96gqdtgwYPn6ZDgEc5kP/OEgLtIBZ7yOdlCkjGXJlhrRmBEaUFpylIBNOCCgZJgsg678cExk8KvcYdUIUE1bNZ4W30FeIenGqUsRzvJMPCQeECIW7+UkIXLP9v/74hl+qeGAW3oUeVh+NfK3ivYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEHn8oreNA67f4wlnkIMuiBdil9mKOKVebvhCy3Iio4=;
 b=HMBbmfDJmW1W8yinl4jgRVmW4ksBsjrdC605J2TIg03qOx/Mu169mm3UwNfsrTuzKzPhoPwc8xFW3Ry7ZUjoKScTBRRHBIOmXdvjU+ucZzN4bIL1JmKRi8McaKSjiwHvs0kbkn99HQpIh6Q7gs0ZnDCJqn/e+MQhU2kc4SC++Vx76uy8j7XGNCYXaqQPiYvy2U4zqdiSJyI+35oFm2XiREQHj1KID9eh85R9/nFLiWDarUb+5c254EUv8Nfv4IXGwv4QLjO3Z2XqEbD+PakYLv3OqivnRfq9yOMtPMbbmKjjikB+dT2ouOBDKSSSCK/rGsSmRJkwWuvHElG7cvED5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BNAP110MB2253.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 12:20:47 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%6]) with mapi id 15.20.8964.033; Tue, 19 Aug 2025
 12:20:47 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [PATCH] package/python3: drop !uclibc || headers
 5.1 dependency
Thread-Index: AQHcEHzWgjP6K8qiz0yyv4bXTzxMY7Rp5dqg
Date: Tue, 19 Aug 2025 12:20:47 +0000
Message-ID: <PH1P110MB1603D70E2572FA031575F4FB9F30A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250818201444.3210542-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250818201444.3210542-1-thomas.petazzoni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BNAP110MB2253:EE_
x-ms-office365-filtering-correlation-id: e2fee3f8-d25e-442f-fa05-08dddf1ad3df
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gMf9/7mhCgmQKqIFJbi5ew0KzQLMX2jxjvMSXL6cPHXVkbE0HlDYfEpqsb7J?=
 =?us-ascii?Q?yR6UpS1rlqzGUDqIs5ueHuU1pKHTfZYrJ1eTt7StqTPY2N2O7vy66xNNFGGO?=
 =?us-ascii?Q?fPZj1FOkPqgTNaX8IOj335Z/LLNJZgeDnhm/WOEaX8ewHnSy6ZkrOojZmGDS?=
 =?us-ascii?Q?eTP4XvYcZu5t7AmXgambouZiu08on9/rNG4anrdLko5Gs0AMa+49n/IlrSk7?=
 =?us-ascii?Q?pqLwQfkhi5Rv71N/p2FmPArRIvDnNvqa7/jdP5NkBgkjqxrGNQkY7Y5BVmqJ?=
 =?us-ascii?Q?L7Ip6cwrpK4EDaTIahHbQNPUsZGUZoSB2HMWvFBJcYaxWYAwkIILOTXgE4Ma?=
 =?us-ascii?Q?TIqNy5KwGxoOamayJquX6rcwdbPovAim8+KhRcynjrYsrnH/n6/yfwg308q+?=
 =?us-ascii?Q?mnwtuIFN5ZSTPLv7tY9t0ap0Q+C/+I8Rc/rLR5YY4XnaxEo+a6SuC/PdlRvX?=
 =?us-ascii?Q?FZGAbXlF3qtDhoXhabNTMolJgxoQtnG8gVUnPqz8DWaLQozmFbbHx3WMifCh?=
 =?us-ascii?Q?6+fjjQFGta6ZB0R75p5pwSlZAgl/wXcwhp5w9qQfupb66oC3F0J2OEa2hFrD?=
 =?us-ascii?Q?C0BhktwerjujtG3Z7sfzmyLnKCzjpl/yzT0Vp++Z15giMfvXR8Lf1qdMnx70?=
 =?us-ascii?Q?fPHQyPIyP04KPM6xXqZxuaJF4dTUyax2AfbVsh4Zj4+7hyB6mB2Hboq97qPs?=
 =?us-ascii?Q?hcGPLjxQ9g7/5A+ccawU4atXcSDxm+egkvRN1WSAdLWPai0GrJ1PmHsqUxUI?=
 =?us-ascii?Q?7McorJ3Z0wxlbH5suCMsqaJGAaoNJRB40NC3l0HulOUgOlb5NeBcHAcHZe5M?=
 =?us-ascii?Q?zUHc+Yo9xp+7yhYjwT/kT/bKVlzmnl85ShxwioxIMxec95ZqHdWnaYFTlPgu?=
 =?us-ascii?Q?GqJEY5s5uTqaco38HSFvcuAi7KMz/pYztYS/mKiIHK4M/BJjsdAFUgaPset2?=
 =?us-ascii?Q?/yLJmrIAFlQM78SD1R/VjWBirErIggUpXGqkj4fIBXyCtUdlMaCEOg/oEFaS?=
 =?us-ascii?Q?hQe9LdUMccYs1tlOgtAveEfES8D6U47U/9oNsBCcBzFcFTg6GfFS3pMiro80?=
 =?us-ascii?Q?JUNTCyeK4lc5XQ878eJ6cMQtukEOU/mOHJBMYJ9+M8Kp3U44rfGQ6GX9ToGh?=
 =?us-ascii?Q?ArjrJ54XrFInp66Jh9hqK10Y93LbqyP86rd5K0TYLNL7yjWrEaC22xbyDzbN?=
 =?us-ascii?Q?I+DFS1D3xFJxZj9SVM7065dGmEmeHzMklXnzRPfd4ydtW3O4rLA0rkhRq2LN?=
 =?us-ascii?Q?bt3+nhKUaH0Q+U+uchBnr/8S0wc1JxRdeIaWV05u5L11PxrgjHqNiw7N/f10?=
 =?us-ascii?Q?wdOC5+Gh+EcXpjZnEQcSPaKzcbJnNg6PBGvzgG61cDIakl0gNnnuJE0r0n4/?=
 =?us-ascii?Q?qGZkn3POj/3zRvpqKLBrtbMHwIVlImI2kM7iwi94wJQYQF8b7Z2lnZmWRmJk?=
 =?us-ascii?Q?a/aWkCyYuCM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uVfkzfQCQwrFDgWMDE0vylTJGDndWsxco/jpL0QEAzv/XQw1x5IjKyVZtHve?=
 =?us-ascii?Q?dXhPe9h0V1ESm3zbR4Iw+beGiSOTcwOXIXMx7USckQ/GBk+GtrAnUNNGUjCx?=
 =?us-ascii?Q?snePwkZwcI4aaNSzVoV6lujYkhoE87iiJrsD0FBV6kmJzCIJGuFJZ0+/JQa/?=
 =?us-ascii?Q?lTEhebN456c+F+FdPq4VRNdI22obnLDwErxSQyu5Zc5WWFa4VuoDFCFdAFK2?=
 =?us-ascii?Q?iNQdlArnQlyleIOfIgbpkAUliJmpUxJFnpmqpZQ+qDmp27sw1wQQn2mCuCGH?=
 =?us-ascii?Q?TcJbv0QIwXy0p7kdLlN3xQS5ScvTAdhVxaTakfhTTLyTWmSs5ElflJVuFSQ3?=
 =?us-ascii?Q?+2M4cXIHbdVk2DcSftLU/H4TYh2+lmnjNdMpMF6DhELGXaZnEzBNkfjN+zF7?=
 =?us-ascii?Q?pIOKqkGT6VWI/emjlKbMHL6YIsRpzXt7kZWx1V1708H5xtBPnHJwhilQ3U3G?=
 =?us-ascii?Q?zacr29cJ5kEZpa3/FgI4v/crPI5wVxB/VbCT+pRa+ES/melxBsAa9L0rPUtr?=
 =?us-ascii?Q?Z7o+8NcDjyjkv02g/8Z0f9p9/jWYZA/BqEC6EbpyXYseQXkUiCjwQ2B8Saev?=
 =?us-ascii?Q?mdkfwnZjPtRgPsC03o/jRAHgElQaWV6Lm7bV29Fvdf7q50wOdXQCGmRDXn07?=
 =?us-ascii?Q?1X5J4j//qkEKsl1lZbSEvVqv+frBsi5qtTcj8nBjcrE4VBS2Vmc5LwYfppTh?=
 =?us-ascii?Q?rEjboFADc7Usu2ewXIrnehLtKvezhgUcmVuYYI5o3LbUXGwOhQYLTCobOtvx?=
 =?us-ascii?Q?ojhvaFmoR5J+J19nK1f0dP2xtktrMsJ9OZCKc91ObcLTi/VzwP+t5yLzIb7R?=
 =?us-ascii?Q?+dY/Kh+pwYpKR/qX3mY469rzecoOxzkyNwcjsAmS+nB7I2Qk3c3rcarNWU8c?=
 =?us-ascii?Q?H2BtjW9eKaWgH09iQzzMtrebh+TYMO1ZbRlxD/v7Ix0pP4vX9RHTybderNOI?=
 =?us-ascii?Q?35AVzer69JBgjYoxLqZwbRGwuXy+64yDVchdM6J/tJx32+nwZSRVDPEhC+IQ?=
 =?us-ascii?Q?fI2Tq8LNENLqWtD/Vrajm0Bd/amh795whqEAmN2JmKuZmhD2DVJOfy7f7K2e?=
 =?us-ascii?Q?gsGcS0llLpDuusLN53Fo66wCvqt8RLh0SUfdohQIg+Mn5mHzPEIl5f4acOYV?=
 =?us-ascii?Q?4dWyVEcvd1/ncryGuC5oDJvsOmsbZmS3TkwsVMbbkw1yuyWPPE5CDGBtjYZq?=
 =?us-ascii?Q?IaZFjHXxR2UIiNKYCKGlRza2nud6Ajy96nXKTYhBpBZcTEaN1xY3sqk3tGck?=
 =?us-ascii?Q?1wnr+Kegps9F2tKCLCAarxE8ka8LXvKKs8F7HWKwsBOXqHuzqeLV80DFDWiw?=
 =?us-ascii?Q?CGT4u4YtWRelSGlZ6gCb/GK0K+wAmcuoOxWEgdf4MkMo+VukGG9yN5FkSfJl?=
 =?us-ascii?Q?IlzfeqrX/GezMsbU9Meb5uQBvnL+9HlZFGsb7PDGsmLQlv9yjO3CWo/1NiFO?=
 =?us-ascii?Q?4GGYehHRfEjkfgxZcK3/wUOXx53ElGKpVsUyUqa2Z6SEbBoRvvu1HzdJMG4F?=
 =?us-ascii?Q?DlhtVyp/1mh8Fzc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fee3f8-d25e-442f-fa05-08dddf1ad3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 12:20:47.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2253
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEHn8oreNA67f4wlnkIMuiBdil9mKOKVebvhCy3Iio4=;
 b=DD85bMZwu2VT5CHzRxNBwuI1zMtdSOJHSYrDdwCZy6ZkeOMKLC2SlK/hTKBJk4CDF+IYYkCvMI0bthxk4XoTPtiDhnlx4BeDvLdwafN2N0qZNgY2XODiP3iKRq8AG0qGe53S/6H/lJeFhTECnbp1EpyajU8T8vTVZGoVK12O96hkpgaBOWVqMPsqUAzJdEIICrbq70GDoz0p9Q3UhG9nT0EUhR+2QHVkMnuOsFGaAdvowoF3/JKCtvG1cUUBKCM1Re5UFu1wIN27CyDo11Bc9iRDlYUmpaMwy1MJCASzYzf7pQyflq5WPeTZDl6ry32PJgNW55RcLHP/wa2X+20iRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=DD85bMZw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/python3: drop !uclibc
 || headers 5.1 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Monday, August 18, 2025 3:15 PM
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Vincent Fazio
> <vfazio@xes-inc.com>; James Hilliard <james.hilliard1@gmail.com>; Yegor
> Yefremov <yegorslists@googlemail.com>
> Subject: [External] - [PATCH] package/python3: drop !uclibc || headers 5.1
> dependency
> 
> The following dependency:
> 
>   depends on !BR2_TOOLCHAIN_USES_UCLIBC ||
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> 
> was added by commit d63e207eb869063f82c867658676c2903beb08cb, which
> bumped python3 from 3.12.9 to 3.13.2.
> 
> The commit log states:
> 
>     The package selection logic has changed to require time64 support for
>     uClibc by mirroring the logic from uclibc.mk (kernel headers >=5.1).
> 
> but doesn't provide any additional detail about the issue encountered.

The issue was not at compile time, it was at run time:
https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811

Since we had the discussion on IRC I have not had time to dig further into if the bug is really time64.

> 
> The problem is that this dependency has not been propagated to reverse
> dependencies, causing this kind of kconfig warnings:
> 
> WARNING: unmet direct dependencies detected for
> BR2_PACKAGE_PYTHON3
>   Depends on [n]: BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] &&
> (!BR2_TOOLCHAIN_USES_UCLIBC [=y] ||
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 [=n])
>   Selected by [y]:
>   - BR2_PACKAGE_AVOCADO [=y] && BR2_USE_WCHAR [=y] &&
> BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] &&
> !BR2_STATIC_LIBS [=n]
>   - BR2_PACKAGE_LIBSIGROKDECODE [=y] && BR2_USE_WCHAR [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] &&
> !BR2_STATIC_LIBS [=n]
>   - BR2_PACKAGE_OPKG_UTILS [=y] && BR2_PACKAGE_BUSYBOX [=y] &&
> BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] &&
> BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
> 
> However, propagating this dependency to all reverse dependencies of
> python3 would be pretty annoying, especially as the dependency is kind
> of "clunky". This made us question whether this dependency could be
> dropped. And in fact, we could not reproduce any build failure, even
> by using a 2018 uclibc toolchain, based on gcc 6.x, headers 4.1.x and
> uClibc 1.0.28. This can be tested by building the following
> configuration:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/download
> s/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-
> 2018.02-1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_PYTHON3=y
> 
> It needs to be built in an environment that has libmpfr.so.4 installed
> as the pre-built toolchain from that era did not include it. An easy
> way to achieve this is to build this configuration under an old
> Buildroot Docker container:
> 
> IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/python3/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 7491067140..cfc08bad86 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -1,6 +1,6 @@
> -comment "python3 needs a toolchain w/ wchar, threads, dynamic library,
> time64 support"
> +comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
>         depends on BR2_USE_MMU
> -       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS ||
> BR2_STATIC_LIBS || (!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 &&
> BR2_TOOLCHAIN_USES_UCLIBC)
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS ||
> BR2_STATIC_LIBS
> 
>  config BR2_PACKAGE_PYTHON3
>         bool "python3"
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON3
>         depends on BR2_USE_MMU
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
>         depends on !BR2_STATIC_LIBS
> -       depends on !BR2_TOOLCHAIN_USES_UCLIBC ||
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1  # need time64 support in uclibc
>         select BR2_PACKAGE_LIBFFI
>         select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if
> BR2_PACKAGE_BLUEZ5_UTILS
>         select BR2_PACKAGE_HOST_PYTHON3
> --
> 2.50.1
> 
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
