Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C9AEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F38983437;
	Thu, 27 Jul 2023 21:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F38983437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzRRivudp5O8; Thu, 27 Jul 2023 21:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2160F838B2;
	Thu, 27 Jul 2023 21:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2160F838B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E32981BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B797E60DE5
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797E60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuMA_6Qbuf6J for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:52:16 +0000 (UTC)
X-Greylist: delayed 924 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 27 Jul 2023 21:52:16 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9470B60D94
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0709.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::709])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9470B60D94
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=GNx8f53YTLDYHJ8T8O3KhU3mI8lTJSAvZhNanoCUIwnOWS5FLMClM8AH8pyaHBJSPgCV2sBeg35pRbVlVWw4ttJn3sUEvYBnHQqlKlGRA4+9fjPaq0uB51iGXw543roKhL8myXGP9cRf0BBbgqcCtIEi8+1NpFHMwtQyoNUQvymMtGrMSom8tF9wbnnlsRQLKmQC1AATC6J3Vhn16GJgcEWTjyjWLHArEwXnpSbvFKztQxZOOMe/InVUESJg0JmKSDhYqUYw7NRzclMjYKg0DythSilx3GPkEmmQ4vtcIh+v82/q2C+8Fkvdc2a0ZBJF1RaBFwk7SgUfYi8+DZ9hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn9CPLCGRJZNQ5smbYkYu1yICiF9yLtfeQGOqcsVkt0=;
 b=d0YjPqCYLSf7Q3nx6f3kxaQ6HnyMq9IsRusexo+mN5Tune0NR1vAc2eZcvNl3kTmzDdDv7d+9Di6sqaBsFQU1w9UKL+jA4/fNlPP6RV1321rz7/uv6iQHakqlhN52ejA2HX3fAFquCcaRcOqsmcqOr1B3+kP37qGivZTZ4JrSeAt02EGKmVCom//p7YPsGYQom4NobiBa3LNRF/WFnIT0OsSn7w6NeVKT8b4RsjGMMqwDixVQfTe23N4D33xZzNWtipuhCSv2gmzyA2V1IQD8NwUrexz67VmEE/q6HdGulQ9VHgF+XkpIoSzokSclE4x7SKx3NJmIVnwc4F0Oa/Czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1760.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.43; Thu, 27 Jul
 2023 21:36:48 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d2cc:98b7:dd97:e8fe]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d2cc:98b7:dd97:e8fe%7]) with mapi id 15.20.6588.043; Thu, 27 Jul 2023
 21:36:48 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@gmail.com>
Thread-Topic: [External] - [Buildroot] [PATCH 3/6] package/gcc: add support
 for gcc 13
Thread-Index: AQHZh/3WG3/4Vixkek2MJLTwwspuuK/OiZEA
Date: Thu, 27 Jul 2023 21:36:48 +0000
Message-ID: <PH1P110MB1603F06F10A1FCD2479D777E9F01A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230516135107.238343-1-romain.naour@gmail.com>
 <20230516135107.238343-3-romain.naour@gmail.com>
In-Reply-To: <20230516135107.238343-3-romain.naour@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1760:EE_
x-ms-office365-filtering-correlation-id: b5a157e7-b577-4e36-d50d-08db8ee9956e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5wlg9Yowh+7Qe1vLB9PcNKa2jzHxz7wrGip6abPKN9EW5H450AkzTKsIYeW8vOC6kKOW9fFKJscZrn5WDJG6uGSu36aEEBejvLL3mdXXaB5nF8U3qo+eB3HMghK0y9gPs1c7gwRTIf5xxSfxZWzYRRVq6LmFAdmu60tSKp2doXb3Iy3CwWwEpBpHFzpLH+xR6CfUXtcpkg/pGuFiA9mmtqZFaghXGW+HpXgVfF7Yr7OnxprF9LdMnAzz/HOlYr0vtnuUoZoEFKpDS9poUR7/L9i+gJTpdIlt2zuC9HrRjSlO9UNbS/YPHOYPIF2B4xEWsP4stbBnkjpee8hkA+2GlztHr5NN8IwsAEXk+bHBpdZ9LfkzsPwT1ZDwlwTm/FKj77pMUx4EijBazvap9NoOKSaMyk6MxqTL3K/W9hQnS3brSUMtF4bM92euUln0TnOv+vVkVu9ijPOZIgQeSRliQJ+gRLPFqJ63oGlkPLgcXmJNGmnSmm4pazGn7+78zWmpk5wiXOMm9Ktevm3N3C3tg3MUDvtDJENrFRWnCAZrvIHrByV4z8r3GptS7MpBCaCi29wVWLZ7MMmsQdpkaQOZUUyQBUt4xb4gvP49OkZq8LA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39830400003)(136003)(396003)(366004)(451199021)(33656002)(55016003)(41320700001)(122000001)(38100700002)(7696005)(966005)(9686003)(508600001)(71200400001)(41300700001)(66446008)(66946007)(4326008)(64756008)(6916009)(66476007)(66556008)(76116006)(186003)(26005)(6506007)(53546011)(83380400001)(86362001)(8936002)(8676002)(38070700005)(5660300002)(2906002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: wy2Xd1d1DThjjWl4lMLwi/toaKv2LGMIXWP3k4If/BfoKf2YBbVtH4faOBVUIgTirn+1yQt964A4PF9wo579aWeysgg217AOUdUdKjSZVI7DR+pkBdzYI1TmUsRgw5kb4oQQ0c15jbBI0gkjGlevl1o8EsFow14qanP9hO4kNHJPCsUCTWdpjrCsHQuGo6oV3/OmnYorT9+pRbXoYy+/c/DYri/TX6ATW8+/Nce364IrklX4K7OQv2DpKBz33YUWlZfajjEerCFECOqXinunX3f7h2D47/Ms3c29ixXiy/j6y9jSmW3yDl5eioNf2c6oQ/jbuJBvv/4tExwrbrrh2BXcoNHEp2Xl6hdKQXVuuruysfqHZ4qVgreUlM8NsxC6CE/0b6+M/z/yd1dd4nccEcvgFWHkm5i4YgxOwGPtCYI=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a157e7-b577-4e36-d50d-08db8ee9956e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 21:36:48.8241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1760
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn9CPLCGRJZNQ5smbYkYu1yICiF9yLtfeQGOqcsVkt0=;
 b=oE+uv76WFqf0fWUPGWYtw/0TJPGl3etUTOsZZA1vLbfrLy4HKh7yJNltkwOY1JYrYI35yl5Del/OhHWAp8DXxbl9EnIiHCKekW0YA2R4gQQtjCGAf97ALK7lY7XOeu5yyqwmMvqxTCVqYAL8jugaqh8lLei4MnIJsg3MiRaXDMSzkcxb3HwXsNdjYclan7Jtm2vXWQaDeJ7qL0vb5/bdSSH6vJupDxEUu7E8WO3lyYppMHotpQzQiLt7Xo82AK9uBS1JABPi/osu3mmxhXSNA6xhViie8oZv9Mz+P+hq1Br8JvA7o+yLc5h0XuZsCCFL5AX9tmTVvYHushStRHk6Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=oE+uv76W
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH 3/6] package/gcc: add support
 for gcc 13
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Romain
> Naour
> Sent: Tuesday, May 16, 2023 8:51 AM
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@gmail.com>
> Subject: [External] - [Buildroot] [PATCH 3/6] package/gcc: add support for gcc
> 13
> 
> https://gcc.gnu.org/gcc-13/changes.html
> https://gcc.gnu.org/gcc-13/porting_to.html
> 
> Backport upstream patch to gcc 13.1 for RISC-V build issue with gcc 4.9.x:
> 
> GCC should still build with GCC 4.8.3 or newer [1] using C++03 by default. But
> a recent change in RISC-V port introduced a C++11 feature "std::log2" [2].
> 
> Use log2 from the C header, without the namespace [3].
> 
> [1] https://gcc.gnu.org/install/prerequisites.html
> [2]
> https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e
> 3f19d4f4304dc
> [3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-
> member-of-std
> 
> Rebase patch 0001-disable-split-stack-for-non-thread-builds.patch
> required for uClibc-ng without threads support.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> efl2flt for riscv64 is broken with gcc 13.1
> https://gitlab.com/DocSepp/buildroot/-/jobs/4197460843
> ---
>  ...le-split-stack-for-non-thread-builds.patch | 26 ++++++++++  ...ISC-V-fix-
> build-issue-with-gcc-4.9.x.patch | 48 +++++++++++++++++++
>  package/gcc/Config.in.host                    | 14 ++++++
>  package/gcc/gcc.hash                          |  2 +
>  4 files changed, 90 insertions(+)
>  create mode 100644 package/gcc/13.1.0/0001-disable-split-stack-for-non-
> thread-builds.patch
>  create mode 100644 package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-
> gcc-4.9.x.patch
> 
> diff --git a/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-
> builds.patch b/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-
> builds.patch
> new file mode 100644
> index 0000000000..e801085dad
> --- /dev/null
> +++ b/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-builds.
> +++ patch
> @@ -0,0 +1,26 @@
> +From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00
> 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Mon, 25 Jul 2022 00:29:55 +0200
> +Subject: [PATCH] disable split-stack for non-thread builds
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +[Romain: convert to git format]
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + libgcc/config/t-stack | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack index
> +cc0366b4cd8..f3f97e86d60 100644
> +--- a/libgcc/config/t-stack
> ++++ b/libgcc/config/t-stack
> +@@ -1,4 +1,6 @@
> + # Makefile fragment to provide generic support for -fsplit-stack.
> + # This should be used in config.host for any host which supports  #
> +-fsplit-stack.
> ++ifeq ($(enable_threads),yes)
> + LIB2ADD_ST += $(srcdir)/generic-morestack.c
> + $(srcdir)/generic-morestack-thread.c
> ++endif
> +--
> +2.34.3
> +
> diff --git a/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-
> 4.9.x.patch b/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-
> 4.9.x.patch
> new file mode 100644
> index 0000000000..55fb40e358
> --- /dev/null
> +++ b/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patc
> +++ h
> @@ -0,0 +1,48 @@
> +From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00
> 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Tue, 2 May 2023 14:21:55 +0200
> +Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
> +
> +GCC should still build with GCC 4.8.3 or newer [1] using C++03 by
> +default. But a recent change in RISC-V port introduced a C++11 feature
> +"std::log2" [2].
> +
> +Use log2 from the C header, without the namespace [3].
> +
> +[1] https://gcc.gnu.org/install/prerequisites.html
> +[2]
> +https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54
> +e3f19d4f4304dc [3]
> +https://stackoverflow.com/questions/26733413/error-log2-is-not-a-
> member
> +-of-std
> +
> +Fixes:
> +https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
> +
> +gcc/ChangeLog:
> +       * config/riscv/genrvv-type-indexer.cc: Use log2 from the C header,
> without
> +       the namespace.
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com> (cherry picked
> +from commit 87c347c2897537a6aa391efbfc5ed00c625434fe)
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/config/riscv/genrvv-type-indexer.cc
> +b/gcc/config/riscv/genrvv-type-indexer.cc
> +index e677b55290c..eebe382d1c3 100644
> +--- a/gcc/config/riscv/genrvv-type-indexer.cc
> ++++ b/gcc/config/riscv/genrvv-type-indexer.cc
> +@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2,
> unsigned eew, bool unsigned_p,
> +   if (sew == eew)
> +     elmul_log2 = lmul_log2;
> +   else if (sew > eew)
> +-    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
> ++    elmul_log2 = lmul_log2 - log2 (sew / eew);
> +   else /* sew < eew */
> +-    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
> ++    elmul_log2 = lmul_log2 + log2 (eew / sew);
> +
> +   if (float_p)
> +     return floattype (eew, elmul_log2);
> +--
> +2.34.3
> +
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host index
> cd1b9fa46d..3beaaef309 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -59,6 +59,19 @@ config BR2_GCC_VERSION_12_X
>         depends on !BR2_archs4x_rel31
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> 
> +config BR2_GCC_VERSION_13_X
> +       bool "gcc 13.x"
> +       # powerpc spe support has been deprecated since gcc 8.x.
> +       # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> +       depends on !BR2_powerpc_SPE
> +       # uClibc-ng broken on sparc due to recent gcc changes
> +       # that need to be reverted since gcc 8.4, 9.3 and 10.1.
> +       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> +       depends on !BR2_sparc
> +       # ARC HS48 rel 31 only supported by gcc arc fork.
> +       depends on !BR2_archs4x_rel31
> +       select BR2_TOOLCHAIN_GCC_AT_LEAST_13
> +
>  endchoice
> 
>  # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x @@ -89,6 +102,7
> @@ config BR2_GCC_VERSION
>         default "10.4.0"    if BR2_GCC_VERSION_10_X
>         default "11.3.0"    if BR2_GCC_VERSION_11_X
>         default "12.2.0"    if BR2_GCC_VERSION_12_X
> +       default "13.1.0"    if BR2_GCC_VERSION_13_X

13.2 has been released, should we bump this patch?

https://gcc.gnu.org/pipermail/gcc/2023-July/242148.html

>         default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
> 
>  config BR2_EXTRA_GCC_CONFIG_OPTIONS
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash index
> 666124fa6d..d324852bdd 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -6,6 +6,8 @@ sha512
> 440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd
> 7acb3c
>  sha512
> f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e
> 92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-
> 11.3.0.tar.xz  # From https://gcc.gnu.org/pub/gcc/releases/gcc-
> 12.2.0/sha512.sum
>  sha512
> e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445
> 684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-
> 12.2.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.1.0/sha512.sum
> +sha512
> +6cf06dfc48f57f5e67f7efe3248019329a14d690c728d9f2f7ef5fa0d58f1816f309
> 586
> +ba7ea2eac20d0b60a2d1b701f68392e9067dd46f827ba0efd7192db33
> +gcc-13.1.0.tar.xz
> 
>  # Locally calculated (fetched from Github)
>  sha512
> b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f944
> 34767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-
> arc-2020.09-release.tar.gz
> --
> 2.34.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
