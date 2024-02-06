Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5483DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D036114B;
	Tue,  6 Feb 2024 16:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D036114B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Gdx9cXHQDry; Tue,  6 Feb 2024 16:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74CD61129;
	Tue,  6 Feb 2024 16:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74CD61129
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10B951BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AE3380F05
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dURIEArp7_l9 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:21:34 +0000 (UTC)
X-Greylist: delayed 956 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Feb 2024 16:21:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9AE580ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AE580ED9
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::729;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0729.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::729])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9AE580ED9
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cBKspD10lM1woFo8AG9cYAhcQ3O4zQtkrCkz9Iysg2HfFKhnurx4yOJA8JkIYhE4acA24hBZ03c+hc4BXPIAiAxq5qKI+4JJTsoUfB1nqZJEYPESGNizkbLcABP+4UJ4u2aov9ai4cUaUgukGARUCWf23eMVwaIA4XRV6FLRJnYwOR6clP2nuHeqh6ef58opzLaTJAuIsz+kq4JysmsL27ltsNsE9voLt2OiGaG45tdNDhxRK4QGeC/+TsDypyWHvvJ++U/Vw+tlrEJY/+J+ztqz9Um6Fqstu7hKEqYoARCw6VlaKltQFWpYLdgBK5z4V49PB77BDaUPU5+TgQ5R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX9XCfgizJf3GT2Oq6amEv/zRFIc+T6XjCHZcljTAnY=;
 b=Cdib0xZM+pTHmStNHLDOAsC87N9tLwv1iKYqMJiLOcEU/e3d0fD6Wb9zQP2KvUfYPbLdeR26fBtfZ1rlx/N28ViINaE5ZJXXeS12+lSPA/n7IRW8T5vBNouY3tes9zCXX9URwTyw2w9v0k3WfV3Qy4hHtYqLAeGpNZ8Tl4MNlRc0bow6M/nVjGw9MWYDldiYpG3dzB4COXOCAK/EDGOpT/Mp/gHIWEPZ04ctZVWaXQGUv0CX87CX5hr93GlcTCyc/kae6xWqWJoiR6e+c0bNULHxBfhuGyJJ0+tMp7K/+yb8PJLh8ovrNUkPMTtAzdybRjHK0vWVflRkD/tJ7Br70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1602.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Tue, 6 Feb
 2024 16:05:31 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa%7]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 16:05:31 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - [Buildroot] [PATCH] package/attr: fix build failure
 on Microblaze architecture
Thread-Index: AQHaWRTK658zcc4TVEGsPuNa5GcN4bD9eJag
Date: Tue, 6 Feb 2024 16:05:31 +0000
Message-ID: <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240206161152.0e178414@windsurf>
 <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1602:EE_
x-ms-office365-filtering-correlation-id: bede000a-fe8c-43d6-3b56-08dc272d7197
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JeXCMFuc6ioul/nkgc2gGr/robxzHgI6UqfLDEOfeeCCxI52RIvQ00gkHd7q614qtw00gisLHwc5f8RC2AiC+bxtiT2a0xK04dypMEIZcBvrqg8oRgyJceTkAir0M3eFP0GLtKqpbhqyCFejGgxZJlGzSku5RH59vvTJ9v5KnyQvNdxxq4rwhCjY9HAi0+0D189hOT0ZFlk/4YPBKsHVlxlS5mgD3rRk8jtfsVkcKoTbTqJCeKjXvfLjkPlDPBrUc37EQpfZNhuEFzzVNT7BpRvUpit4cM71C1I2LhIo4lmvicG9eOzX5y/9bTShjrJB8ib2Y7+KlotP0PQ/hbSwrHjlLz56+TBPA+nzgWaJj7DT2b4V74N2FgW/r9ORLje06zVsLHT8QQk0LfoU+OITKQHXRp92j/Pga4Sk/dVt5MriFzsQH8e3OhExQBT3CYljB3+liltqDnES2+PsUoFrqNuq50EUNjrPtDUSfjTwyCmUARau7dcY7AfFTyDEh041vZ0jjm2XU9IEeknAHby0AEld0CV+nteoql9+P3oCLaPJ/a71awfknFCU55VmPBQI4nrlzsEF9FXyLn2x5cuh7VVUzXaOYeZ+Ex6uV2zLQR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39830400003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(86362001)(41320700001)(83380400001)(26005)(66556008)(4326008)(5660300002)(2906002)(110136005)(8936002)(76116006)(8676002)(122000001)(38100700002)(66946007)(66446008)(64756008)(66476007)(6506007)(71200400001)(7696005)(508600001)(53546011)(9686003)(966005)(52536014)(38070700009)(41300700001)(66899024)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Akx6pRodA5HdVGHUvmZIc2ttV2A2t8SWpigk+J1TX9CG3x0sKS2W7Nh8i43w?=
 =?us-ascii?Q?QJnNEwqxCahio7GZynNtEKVBoz2eU46LbojzNdDF8XXYtUinY6+Z0Fj57naK?=
 =?us-ascii?Q?8hzOPoiluSITNlpKc+CtgZyZMmesBaBOFJQdE8v258PFOQe0KEzCCxmCbdan?=
 =?us-ascii?Q?DqhYiMmWKDS9RjOqnupm8vhmlv2qPfJ2is7K4/qc4pFQgUzooOrxwv4/0h92?=
 =?us-ascii?Q?YKiD4YnVKs1wa0IClQPJdtb6S8DiZuoEuFgB+N60tjIw8zHUQATefptEDmqu?=
 =?us-ascii?Q?FsKcJZkEcVqY6Drr3BSKzceQZ9jGk86Tg9Ld9ynTQ6hT7V9s71uy9OjQaod6?=
 =?us-ascii?Q?rrOzMjsZJ6h9XtuaHEe+qCluWGq1X6bCxQrBv90DNKUJN6r3BLD+jhfHeNui?=
 =?us-ascii?Q?oq91HlDesmF2yfBnBx1PCui6Ae7lEs3YBxyRRUftTj3W+HvXC/LNDpvFQ+Bh?=
 =?us-ascii?Q?tvPhOKLC+0ykCeJlsVQOCR3JHVXpS8lRWHphxJ6lJCinVTvTCnGZ61VhPKfC?=
 =?us-ascii?Q?ajGidbCaz/fbZc0OP8SIGcm2sN+twISiDGYT5g5RZKaEAi6RSgHaGAkHbI7R?=
 =?us-ascii?Q?ilxNp/zpYse9hF6zexRK9gYmKjCOVAw571o8ozFxzaxrJfFPgxewxjzvtZo9?=
 =?us-ascii?Q?eO6A18g8fyU0MvdOvPhx/8aU6Lnp9T08xNPXtIBF5OW4olbdpiUWm4uYmX1d?=
 =?us-ascii?Q?AjdKp2WlEQluBbdCIuUAfw+/s+aIEeDxZjEx2n2NHM1sAYQ8VsRUAXc6LlF4?=
 =?us-ascii?Q?oW+iVXLliUehxiSD4QKwBKgzcq3dJkiWg2ya2jDolkf4PtfGmMrp1QPtNreq?=
 =?us-ascii?Q?J04iYOMu2KdjeCL8OttHH4jKNFhOu3rfekJQqoxHuswSG/tGamBaxTeX38Nr?=
 =?us-ascii?Q?FghkWTKjVuyPHD72+iXcMzVtrkVn8++iDQ4S397kjKQLdjvAtdwRLSXU7ad+?=
 =?us-ascii?Q?npd8ClIIlPYTlVUxEGQEh7bx1oGuPYcD0hqWkVb43qO8Qdvuschfu/vUe3TP?=
 =?us-ascii?Q?2DqHoGeYJwUghW4Xcd2nh6P1+he+nUw+Zf6YDkgIMdpm2qW16UL3uhXsmoze?=
 =?us-ascii?Q?lqchGoVPv4Tq6/3+j59mSniWQdkXsuJwTVc3m9rkAR8JQyOc626jOXqy+vVH?=
 =?us-ascii?Q?eJHGEkKCsJRt4V+0mexYG69QYlTSWQzO0dl4UXoY+b66SWknT+1spwjGnX63?=
 =?us-ascii?Q?ZaKGm/YMmbiBGCr+5e3kKbyuzetFaEO+T7Vo30yUru2Jwfa9NeR4RgKf0HDZ?=
 =?us-ascii?Q?ru/eqHWEPSo10o3XFMJpmcCdHLb2enJ6kjwUobdSxiNK5Y6jymKpzb+9t0/0?=
 =?us-ascii?Q?PL8EW19dfEe9KND4fVQx/eAbF1uqCldA8pyp3btGdC5+BHDdeIvjmy1blgrZ?=
 =?us-ascii?Q?H55UmMu9XqxTHglGAMjvnhVh0fyn7EPD3GAAtu7jpP9P9+7Wsp7IJnueovTa?=
 =?us-ascii?Q?P/J7/1gpqxDUh+E7K5aJQ0qq9ZtqEzIgHgK8yENbcdrJCNrpAYsAl6PL3oo1?=
 =?us-ascii?Q?Vy2KmdMs3VWY49s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bede000a-fe8c-43d6-3b56-08dc272d7197
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 16:05:31.2140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX9XCfgizJf3GT2Oq6amEv/zRFIc+T6XjCHZcljTAnY=;
 b=Tz8HIBj/Ic+eaTLNzeMxyTmbXZCqC8/Jvjwyto+AmpL9B4yZGiTL39Lb4SEFvWJQ+rhO6HsKnsGkJw281E37EhDSmExetzw4IzK/kXxn6x9xsC+aGN9c/GkZXgtpn0kV1pgNeKjYOrV3DncX6F1hR2GpVHc+xeAwk+u9Yux4f5ow6987rQQH9dLF7s/P0hnx2vde+Q6fC4+qIMPumyXNKjABExvzIaZv/PDHJwP8khrz9/fhnhhVuOEm26heanCb5PwWkA9eMxycmLPgRjys850eJPsuBV2SJdJcASMegOIN4hQzr9+Vd5Ve5vuOFRgu4sknDqlzOoN2fE9jjr7D3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=Tz8HIBj/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/attr: fix build
 failure on Microblaze architecture
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

Would it make sense to patch GCC for Microblaze to address these at the compiler level instead of constantly patching the packages?

I tested https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6 back when we were solving this problem for xz and had no issues https://gcc.gnu.org/pipermail/gcc/2023-March/240834.html


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Giulio
> Benetti
> Sent: Tuesday, February 6, 2024 9:54 AM
> To: buildroot@buildroot.org; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>; Fabrice
> Fontaine <fontaine.fabrice@gmail.com>
> Subject: [External] - [Buildroot] [PATCH] package/attr: fix build failure on
> Microblaze architecture
> 
> On Microblaze architecture __has_attribute(__symver__) support is broken
> and always return true even if symver is not supported so let's add a local
> patch pending upstream to detect if symver is supported during autoreconf.
> 
> Fixes:
> http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078
> bf77d2a
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...dd-detection-of-symver-gcc-attribute.patch | 56 +++++++++++++++++++
>  package/attr/attr.mk                          |  3 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/attr/0002-configure.ac-add-detection-of-
> symver-gcc-attribute.patch
> 
> diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-
> attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-
> gcc-attribute.patch
> new file mode 100644
> index 0000000000..15bd266d7b
> --- /dev/null
> +++ b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribu
> +++ te.patch
> @@ -0,0 +1,56 @@
> +From 1be7c2251040f1152de9ceb5263e6e96fa5c3d75 Mon Sep 17 00:00:00
> 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 6 Feb 2024 15:33:15 +0100
> +Subject: [PATCH] configure.ac: add detection of symver gcc attribute
> +
> +Upstream:
> +https://lists.gnu.org/archive/html/savannah-hackers-public/2024-02/msg0
> +0009.html
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + configure.ac       | 15 +++++++++++++++
> + libattr/syscalls.c |  2 +-
> + 2 files changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac index 7e362e9..98477b5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -57,6 +57,21 @@ AS_CASE([$host_os],
> +       [linux*], [os_linux=yes])
> + AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
> +
> ++AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
> ++      gcc_cv_symver_attribute,
> ++      [cat > conftest.c <<EOF
> ++void foo (void) {}
> ++__typeof(foo) foo __attribute__ ((__symver__("foo@foo"))); EOF
> ++      gcc_cv_symver_attribute=no
> ++      if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
> ++          gcc_cv_symver_attribute=yes
> ++      fi
> ++      rm -f conftest.[cs]
> ++])
> ++AS_IF([test $gcc_cv_symver_attribute = yes],
> ++      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver
> ++attribute])])
> ++
> + AC_CONFIG_COMMANDS([include/attr],
> +       [dnl
> +       rm -rf include/attr
> +diff --git a/libattr/syscalls.c b/libattr/syscalls.c index
> +907560a..caa70bc 100644
> +--- a/libattr/syscalls.c
> ++++ b/libattr/syscalls.c
> +@@ -32,7 +32,7 @@
> +  * fall back to traditional .symver asm directive otherwise.
> +  */
> + #ifdef __has_attribute
> +-# if __has_attribute(__symver__)
> ++# if defined(HAVE_SYMVER_ATTRIBUTE)
> + #  define SYMVER(cn, vn) __typeof(cn) cn
> +__attribute__((__symver__(vn)))  # elif __has_attribute(__no_reorder__)
> +    /*
> +--
> +2.43.0
> +
> diff --git a/package/attr/attr.mk b/package/attr/attr.mk index
> 6ecf5c53f4..f4f911333a 100644
> --- a/package/attr/attr.mk
> +++ b/package/attr/attr.mk
> @@ -11,6 +11,9 @@ ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+
> (libraries)  ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
> ATTR_CPE_ID_VENDOR = attr_project
> 
> +# Flag added for patch dealing with symver in configure.ac
> +ATTR_AUTORECONF = YES
> +
>  ATTR_INSTALL_STAGING = YES
> 
>  ATTR_CONF_OPTS = --disable-nls
> --
> 2.34.1
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
