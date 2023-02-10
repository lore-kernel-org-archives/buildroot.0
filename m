Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7026BC636D3
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 12:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057EF81433;
	Fri, 10 Feb 2023 12:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057EF81433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfCuARrRqRq3; Fri, 10 Feb 2023 12:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E75D5811FA;
	Fri, 10 Feb 2023 12:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75D5811FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A31F1BF370
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 12:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB50C4010F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 12:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB50C4010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tb8MD2Xlj_NE for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 12:28:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60D0540102
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60D0540102
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 12:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abTNSiIx7Yf9FJo2Nq6v7ikdjQoqVLmumJG6aUXE4SLIpOXBOMRI8O9Gb60kB1cWJgfRf0MYPIrc7LDrES8mQulLK34yyF74rA5BTnHoS7hw/2yLZDTncQr2t/75U17EyB+sR/2d0tD+jxJGwbknH7B+WPw/mfAoLFd7nSrSTF2P+g03aURycbWs2BXxIh1LyHjrlruVMLigWJLvQRe/FkHatAOkbKd6hDNq9OOFlQvvkQ1GvwQlsLSeablfs1/kAZNHNaa52FDoHzGD5hoXF4YJmedI9liQyDKaucbuMmHosjkfdC+LcLfJgvqhmKThkW0YOzIw10knYw6GRWYoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wTrZNiniHdoGYieedw7PJ6yxLsOlsAIncZGjDxgVQY=;
 b=PqxQfRaSM+yd810pw+nEu3XJt5jvxER7668ukXHtyowLcDyGe7QcIXbFdlgus2gRAQGV7p2bhwzU2e3vSqXH7ok1eXtzosCwwQH/VjhiF6L5nVc0zIIicNJkBOyKxU8EbaW3RFNFulOInMSeKqtD1gORuvXD8a0/AmMM050LFQhI5zHX/NDb8kKY4wJW4PHOiVKuA7KUqpkWUSVoCk0UYb0Qo34c/j4AL08wPGOVD5XcD4NQBhmt354aQma8tQK9+DGc5LEVu6VVp9vQqOAbv8cwFXt9SUOgU/PUYBiJdzxwu6o+zUat5AP90lpmNrhiNUFc1vv00ntgfQt8wQkW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS1P190MB1774.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Fri, 10 Feb
 2023 12:28:24 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 12:28:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/boost: bump to version 1.81.0
Thread-Index: AQHZPUR5a7ML4gm0IUy0FNwSuPO1ja7IGimx
Date: Fri, 10 Feb 2023 12:28:23 +0000
Message-ID: <VI1P190MB0493E0638601CE340D4AEA9C9FDE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <20230210113931.4055853-1-buildroot@heine.tech>
In-Reply-To: <20230210113931.4055853-1-buildroot@heine.tech>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS1P190MB1774:EE_
x-ms-office365-filtering-correlation-id: 3da2a21f-a975-4419-c6fa-08db0b624d52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPk1TdW8ANBYEg8t17l5dUowAHYDNvxzkn6mRT3DEuR+nRS5Oq+ek57CTDsKGHGEg/PxdrmRhoqIsA6aqgEqZSFEpwBvzMA5mqh+BKJQHcy6++Q7eOcaKaJA16PYBCM/mN0RFJoTfw4d4Y/k6QO9OSYq+Rs+VfmXznVjxWyd3LKNLtcOpivsqzB96Yl6K8NVvv+mSF7Fn67Vb7Gwee9ZXYzR/9PQ8LETGE6lsVnB7TkDW2M9Npotyk56Vm87zdAqb8BgJ06EbGJPzBwSjcdRHBEw9h9jjxPQHttTVLv+XbfY6YEedmCJuHEQXK0wilKcp6n9+nHSGhLheZVJDsuKhhaxT2L9CpG6EluEtHvichFWjT7p6yaz+fGaIttFxWHuQyPGCrKCxYdpv/EMUfHu1uKBl05QqPcrYmoPIMqGgAPNAxxrjTzNk58Qs+BcrVjxsl8uDWfHpJzi2Z4icy8ZZby+EORKhhZqOrdfYusUgALl5ypx1Z55ECPHIzIy3D6Zr2HJekPZLwM20BLCg0AH4qGfxuiiKBlPHWdMjN/G6fvHAvuD5E+0imYD8OUx3cwyhkhzO/w9HDlIQbmSFIKnsa3UKTQdfMKehCnfM2cDPJFFWkcUBS0tnYQojYNPJhhxOGYTshUcROV47B3L/o0yDkJAO67VwikRQqIgjn7u1dCXlWePtlxWZLm8hxr4Sqd+1rG+nP5eMeMBE4OQsh82V1QTy1cPpDkeyGwy1kpCc+4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39840400004)(376002)(346002)(396003)(136003)(451199018)(38070700005)(38100700002)(122000001)(52536014)(6506007)(186003)(33656002)(8936002)(8676002)(26005)(4326008)(76116006)(66476007)(66556008)(66946007)(41300700001)(6916009)(64756008)(66574015)(55016003)(5660300002)(86362001)(316002)(966005)(45080400002)(66446008)(9686003)(7696005)(83380400001)(71200400001)(478600001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FTKGgO9kMpOu/EjlpW47Nd004fhQYPjuIYIbj3EejfEZzbar4SeWkAlYrA?=
 =?iso-8859-1?Q?0KQk/2IaLcSk4382lYCFmq8PXZbUi2rDPJqu1OLUqQiKi2H/PLyMRycSf3?=
 =?iso-8859-1?Q?a8tjmoXf8rhllgMd80zx6X32RCjmLlFtnoFf7ezDvJDuW1b8YEvieS6EDg?=
 =?iso-8859-1?Q?T2QcyDPdSLTlsZsXafUz5DM5gYYQfnaAIA2HncfTX7sd1IqvPaITi4Hc/x?=
 =?iso-8859-1?Q?aUAPqU18FZPIi/C65imR1NrbpEiziBoAp87IoORBqucR9HxU7wd1XX/Cz8?=
 =?iso-8859-1?Q?LTsQ7v18PxIEFB5tFPBTxFFOfcypvJ5ItXIcg+yWybNMrA3BGS3bmfC7Ve?=
 =?iso-8859-1?Q?wzfR+NM3lvXdDlC39sT365cSnzz0/OmGrX3SikmQF98kBel5us6SmFmCK5?=
 =?iso-8859-1?Q?F/N96Qlpjgtp2VngoMCI2EwfvNdQZUsuSlhM86xoOg5wB9unotmW9wiFAP?=
 =?iso-8859-1?Q?TQg4+HqkztvNU18hAMb8RHEH40eRfc5NYtbXTGd0j1nqtRYOPWc6PtLGwv?=
 =?iso-8859-1?Q?5aJYg46Q7CPqPDgp2IRYuNXOwxR2ORE3YeWCA9DfPWbNwNchGfh9pl6zmH?=
 =?iso-8859-1?Q?xc6BIiYoYJSzBj0xPna65Nm1yd/AnsLHuPo6w/ewwRASWfAKFQD7wbgbl6?=
 =?iso-8859-1?Q?wyUoB4FpiZYwbDek2kOYHt390HwU5qPqRgyyYgqybKbulO6ZhUBVrGx8k0?=
 =?iso-8859-1?Q?lCo+qA8bzG2uBv6Y0QSFOjtNrkQxTIGv0bpcsKn5o54/ehQiX7xEnXSl6k?=
 =?iso-8859-1?Q?XcLDFaTjgo+vsTfiWRbAj0HmzvxKkTa8EuqI4Eky9I4M/VmvkBHId3oPEs?=
 =?iso-8859-1?Q?vRCEXP4IVGC4qt24qLWkUBr9au7y7rgn5FNAP1lWIWwTAaFUrTL+4qv3Hz?=
 =?iso-8859-1?Q?9N2oRMSzSMSTenlXz27T73eKmbwvdipIS3XczRes5WjBEw+C8intidoICJ?=
 =?iso-8859-1?Q?/DD4wTnsU7wZ/OXECV510kjKEn1P56BWv4+Qj+5S9PsGEdpMb0wl0/JT+1?=
 =?iso-8859-1?Q?GIDZGUY9MfabISgOxHBO+X9XqSQ9XPQoaUa7o/wLp2QlBkpA68xkXRXHPR?=
 =?iso-8859-1?Q?2YvabKTu69Ff3ye3wBS6NNbUQ7PUPXFNiaTbC6eZGceX+0WrUES2VNTk98?=
 =?iso-8859-1?Q?IArYOq62O0G590JAquylTYD40vSxf6ccTmH2f0g44uXIQeKyDXh2vtcy4x?=
 =?iso-8859-1?Q?5yX80kwYfYEHqlzLX35N58f8Ezk5fhhc1a6fbAoqcDFvxHYm7VJ2/FVtcs?=
 =?iso-8859-1?Q?eLZT4UhpCPctYFHu7Lyhex3kXKomCU9E/spkDdvUxKthC2AwUYlI7pGE+E?=
 =?iso-8859-1?Q?KjeJ8M1IGip96ENvgbcFL+8xjAbCYn64z1Vm9fXXsz40QvqFZzlgOScu6u?=
 =?iso-8859-1?Q?T5xP6ZiBxk5TSzmNBt4bgioFI4waL+O4fNLGdPa3n05e35tlabZKU86rmL?=
 =?iso-8859-1?Q?CtFbgi9BjmswPRrwsA+hm+CNj8bbd2DJcnt4fdwharg68Ljf3FHbZo0sD5?=
 =?iso-8859-1?Q?BgBUPnGXY4r4Gyj6W+6oVOkcSayJ4VPwsYfpyXi669zeQqcj2SAuALR/Db?=
 =?iso-8859-1?Q?bgX4CYafLt3fsGQV0Dam1QamAh9fW4QsfrI6CRq+8LN/rEwipgQJz+6rgd?=
 =?iso-8859-1?Q?26PU5AN1KK4yQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da2a21f-a975-4419-c6fa-08db0b624d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 12:28:23.4559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwdEF4qFv2oDEvceZBCPnfl97RSugvuEkzp5cqQon7QzhEr//S3nLWoDkKqDIoNUNI7W0hGjEqk6ReR+7HUD4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P190MB1774
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wTrZNiniHdoGYieedw7PJ6yxLsOlsAIncZGjDxgVQY=;
 b=NxJqrWDQPgF9GuQlG4FdOV+tQsT7gmLRuoqzPKTUGiq7ajGx65Qo4ECqpmZojQYG7yFUiknz6dMHSDpvqjDpO1D8ljZOkquYfKyOAvonrYLpR6Fh+FxHNgWVUuqhMJ4mfWGWKyc5SPUUewX7wTy2tLwXkQRERPUFQoAQ82a7kbY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=NxJqrWDQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.81.0
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

I found a typo.

> - add option for new library "url"
> - drop upstreamed patch
> =

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> =

> ---
> =

> compile tested defconfigs:
> =

> BR2_arm=3Dy
> BR2_cortex_a15=3Dy
> BR2_ARM_FPU_NEON=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> BR2_PACKAGE_CC_TOOL=3Dy
> BR2_PACKAGE_LIBUBOOTENV=3Dy
> BR2_PACKAGE_BOTAN=3Dy
> BR2_PACKAGE_UHD=3Dy
> BR2_PACKAGE_LOG4CXX=3Dy
> BR2_PACKAGE_LIBCPPRESTSDK=3Dy
> BR2_PACKAGE_BOOST_CONTRACT=3Dy
> BR2_PACKAGE_BOOST_COROUTINE=3Dy
> BR2_PACKAGE_BOOST_EXCEPTION=3Dy
> BR2_PACKAGE_BOOST_FIBER=3Dy
> BR2_PACKAGE_BOOST_GRAPH=3Dy
> BR2_PACKAGE_BOOST_GRAPH_PARALLEL=3Dy
> BR2_PACKAGE_BOOST_IOSTREAMS=3Dy
> BR2_PACKAGE_BOOST_JSON=3Dy
> BR2_PACKAGE_BOOST_LOCALE=3Dy
> BR2_PACKAGE_BOOST_LOG=3Dy
> BR2_PACKAGE_BOOST_MPI=3Dy
> BR2_PACKAGE_BOOST_NOWIDE=3Dy
> BR2_PACKAGE_BOOST_STACKTRACE=3Dy
> BR2_PACKAGE_BOOST_TEST=3Dy
> BR2_PACKAGE_BOOST_TYPE_ERASURE=3Dy
> BR2_PACKAGE_BOOST_URL=3Dy
> BR2_PACKAGE_BOOST_WAVE=3Dy
> BR2_PACKAGE_BITCOIN=3Dy
> BR2_PACKAGE_I2PD=3Dy
> =

> BR2_aarch64=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_PACKAGE_QT5=3Dy
> BR2_PACKAGE_PULSEVIEW=3Dy
> BR2_PACKAGE_GNURADIO=3Dy
> =

> BR2_sh=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE=3Dy
> BR2_PACKAGE_BOOST=3Dy
> BR2_PACKAGE_BOOST_CONTRACT=3Dy
> BR2_PACKAGE_BOOST_EXCEPTION=3Dy
> BR2_PACKAGE_BOOST_GRAPH=3Dy
> BR2_PACKAGE_BOOST_GRAPH_PARALLEL=3Dy
> BR2_PACKAGE_BOOST_IOSTREAMS=3Dy
> BR2_PACKAGE_BOOST_JSON=3Dy
> BR2_PACKAGE_BOOST_LOCALE=3Dy
> BR2_PACKAGE_BOOST_LOG=3Dy
> BR2_PACKAGE_BOOST_MATH=3Dy
> BR2_PACKAGE_BOOST_MPI=3Dy
> BR2_PACKAGE_BOOST_NOWIDE=3Dy
> BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=3Dy
> BR2_PACKAGE_BOOST_RANDOM=3Dy
> BR2_PACKAGE_BOOST_SERIALIZATION=3Dy
> BR2_PACKAGE_BOOST_STACKTRACE=3Dy
> BR2_PACKAGE_BOOST_TEST=3Dy
> BR2_PACKAGE_BOOST_TYPE_ERASURE=3Dy
> BR2_PACKAGE_BOOST_URL=3Dy
> BR2_PACKAGE_BOOST_WAVE=3Dy
> =

> BR2_x86_64=3Dy
> BR2_TOOLCHAIN_EXTERNAL=3Dy
> BR2_PACKAGE_BOOST=3Dy
> BR2_PACKAGE_BOOST_CONTRACT=3Dy
> BR2_PACKAGE_BOOST_COROUTINE=3Dy
> BR2_PACKAGE_BOOST_EXCEPTION=3Dy
> BR2_PACKAGE_BOOST_FIBER=3Dy
> BR2_PACKAGE_BOOST_GRAPH=3Dy
> BR2_PACKAGE_BOOST_GRAPH_PARALLEL=3Dy
> BR2_PACKAGE_BOOST_IOSTREAMS=3Dy
> BR2_PACKAGE_BOOST_JSON=3Dy
> BR2_PACKAGE_BOOST_LOCALE=3Dy
> BR2_PACKAGE_BOOST_LOG=3Dy
> BR2_PACKAGE_BOOST_MATH=3Dy
> BR2_PACKAGE_BOOST_MPI=3Dy
> BR2_PACKAGE_BOOST_NOWIDE=3Dy
> BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=3Dy
> BR2_PACKAGE_BOOST_RANDOM=3Dy
> BR2_PACKAGE_BOOST_SERIALIZATION=3Dy
> BR2_PACKAGE_BOOST_STACKTRACE=3Dy
> BR2_PACKAGE_BOOST_TEST=3Dy
> BR2_PACKAGE_BOOST_TYPE_ERASURE=3Dy
> BR2_PACKAGE_BOOST_URL=3Dy
> BR2_PACKAGE_BOOST_WAVE=3Dy
> ---
> =A0.../0001-Improve-modfunc-performance.patch=A0=A0=A0 | 551 ------------=
------
> =A0package/boost/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 13 +
> =A0package/boost/boost.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0 4 +-
> =A0package/boost/boost.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 5 +-
> =A04 files changed, 18 insertions(+), 555 deletions(-)
> =A0delete mode 100644 package/boost/0001-Improve-modfunc-performance.patch
 =

SNIP]
 =

> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index b99b01f22e..614a71abb0 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -341,6 +341,19 @@ config BR2_PACKAGE_BOOST_TYPE_ERASURE
> =A0comment "boost-type_erasure needs a toolchain not affected by GCC bug =
64735"
> =A0=A0=A0=A0=A0=A0=A0=A0 depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> =A0
> +config BR2_PACKAGE_BOOST_URL
> +=A0=A0=A0=A0=A0=A0 bool "boost-url"
> +=A0=A0=A0=A0=A0=A0 help
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Boost.URL is a portable C++ l=
ibrary which provides containers
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 and algorithms which model a =
"URL," more formally described
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 using the Uniform Resource Id=
entifier (URI) specification.
> +
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 This library understands the =
grammars related to URLs and
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 provides functionality to val=
idate, parse, examine, and
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 modify urls, and apply normal=
ization or resolution algorithms.
> +
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 To use the library "header-on=
ly" this option is not needed.
> +
> =A0config BR2_PACKAGE_BOOST_WAVE
> =A0=A0=A0=A0=A0=A0=A0=A0 bool "boost-wave"
> =A0=A0=A0=A0=A0=A0=A0=A0 # limitation of assembler for coldfire
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index ab54a4b2fc..ebecc7ddc4 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,5 +1,5 @@
> -# From https://eur06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fwww.boost.org%2Fusers%2Fhistory%2Fversion_1_80_0.html&data=3D05%7C01%7Cd=
.lang%40abatec.at%7C64e3321b5ea444a92e6808db0b5b9968%7C8814618e1e364349bccb=
87b9400379c3%7C0%7C0%7C638116260282315654%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&s=
data=3DPK9H%2FdA%2Bj%2BvWN%2BZ3uuweEBL1JzHqihlV1rnN%2FfiQtlI%3D&reserved=3D0
> -sha256=A0 1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500=
c0=A0 boost_1_80_0.tar.bz2
> +# From https://eur06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fwww.boost.org%2Fusers%2Fhistory%2Fversion_1_81_0.html&data=3D05%7C01%7Cd=
.lang%40abatec.at%7C64e3321b5ea444a92e6808db0b5b9968%7C8814618e1e364349bccb=
87b9400379c3%7C0%7C0%7C638116260282315654%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&s=
data=3Dj%2FvZdH%2B6pdOPSFMblgZHiwJ4otDU6EG7EEWkZOiMf6E%3D&reserved=3D0
> +sha256=A0 71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99=
fa=A0 boost_1_81_0.tar.bz2
> =A0
> =A0# Locally computed
> =A0sha256=A0 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284a=
d566=A0 LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index bd1d329982..b6e09f777d 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
> =A0#
> =A0######################################################################=
##########
> =A0
> -BOOST_VERSION =3D 1.80.0
> +BOOST_VERSION =3D 1.81.0
> =A0BOOST_SOURCE =3D boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
> =A0BOOST_SITE =3D https://eur06.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fboostorg.jfrog.io%2Fartifactory%2Fmain%2Frelease%2F%24&data=3D=
05%7C01%7Cd.lang%40abatec.at%7C64e3321b5ea444a92e6808db0b5b9968%7C8814618e1=
e364349bccb87b9400379c3%7C0%7C0%7C638116260282315654%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&sdata=3DQ9MAU7nlmViY0%2FbwW5ZMN2rZBOI%2FB29Q74siHQC9Kl4%3D&reserv=
ed=3D0(BOOST_VERSION)/source
> =A0BOOST_INSTALL_STAGING =3D YES
> @@ -18,7 +18,7 @@ HOST_BOOST_FLAGS =3D --without-icu --with-toolset=3Dgcc=
 \
> =A0=A0=A0=A0=A0=A0=A0=A0 contract container coroutine date_time exception=
 fiber filesystem graph \
> =A0=A0=A0=A0=A0=A0=A0=A0 graph_parallel iostreams json locale log math mp=
i nowide program_options \
> =A0=A0=A0=A0=A0=A0=A0=A0 python random serialization stacktrace test thre=
ad timer \
> -=A0=A0=A0=A0=A0=A0 type_erasure wave)
> +=A0=A0=A0=A0=A0=A0 type_erasure url wave)
> =A0
> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
> @@ -50,6 +50,7 @@ BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_TEST)=
,,test)
> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_=
erasure)
> +BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,url)

I think this line is supposed to be

BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_URL),,url)

> =A0BOOST_WITHOUT_FLAGS +=3D $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
> =A0
> =A0BOOST_TARGET_CXXFLAGS =3D $(TARGET_CXXFLAGS)
> -- =

> 2.34.1

Regards
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
