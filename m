Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3674EEE4980
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 17:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE871840A4;
	Fri, 18 Aug 2023 17:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE871840A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izRIqSRoGdaW; Fri, 18 Aug 2023 17:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3B4840A9;
	Fri, 18 Aug 2023 17:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3B4840A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECB361BF290
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 17:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C81C540562
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 17:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C81C540562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doTKl_QcY2CH for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 17:31:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76E4B4044B
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 17:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76E4B4044B
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4ff88239785so1695484e87.0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692379866; x=1692984666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJzg9eaNSpA8bu+93j0nwReY6gd2tNgL1nLnozUeeuc=;
 b=YPueKHEwmoj9xeCq8vl+KCHwJY8UvuUFdBKz1Lo69doVxXbNkU3+xagP43IWtpcBS5
 PgB21pmDxnsXPCMRIZyOA4gs3KD66EXtn0AETD6Fmxmz+L94FYznwognZ3i/j3ZmO+WG
 MlfxUzjMi4wQZY2kQ8tZ3QCQWlc4geugUOP1+aJiGsYRA971OPjtkAsIusuiDccvoiGw
 yH5+eRSyS73ppIdE+I4MRBKU9s58IFWwpfU61KUYKq1aNKsV5SWKQaOXcc7p2jLB8CpD
 V8En9HF9oWrRw37C4YuD5GIsBctc9dQqZWj4na53vtbzkM+RMc3xGt5ugCtaWiQrF1CD
 668w==
X-Gm-Message-State: AOJu0YxSFcLQGpmwwOFeFEyH4bpFKGA1hv9t8ZtLh9DZeSGk2xw5sfSn
 NQTt0fzOjIu0GCK/vwhMfX7p9ynep2OG9A==
X-Google-Smtp-Source: AGHT+IH+r5uvbimJajh9kXg0UOmTtT9BX5DgLzGTCxO6xzhnYLgkXMOZUAX8zbtpqxYmQxX9JO9QrA==
X-Received: by 2002:a05:6512:3d0f:b0:4ff:793f:fbf8 with SMTP id
 d15-20020a0565123d0f00b004ff793ffbf8mr2669283lfv.51.1692379865555; 
 Fri, 18 Aug 2023 10:31:05 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 s12-20020ac25fac000000b004f9c44b3e6dsm419796lfe.127.2023.08.18.10.31.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 10:31:04 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b9cdba1228so18488781fa.2
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:31:04 -0700 (PDT)
X-Received: by 2002:a2e:87c8:0:b0:2b9:eaa7:c23f with SMTP id
 v8-20020a2e87c8000000b002b9eaa7c23fmr2231843ljj.49.1692379864611; Fri, 18 Aug
 2023 10:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-10-dannenberg@ti.com>
 <20230625085950.GJ24952@scaer>
In-Reply-To: <20230625085950.GJ24952@scaer>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Fri, 18 Aug 2023 11:30:52 -0600
X-Gmail-Original-Message-ID: <CADXxVSKrBZay47f1s4_Tjmm6F1ULcsjZXU6Ge3Du7sgXfkBzjg@mail.gmail.com>
Message-ID: <CADXxVSKrBZay47f1s4_Tjmm6F1ULcsjZXU6Ge3Du7sgXfkBzjg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v9 09/11] package/ti-rogue-km: new package
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
Cc: buildroot@buildroot.org, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

> On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> > This package adds the kernel module for the Rogue graphics
> > accelerator of the following Texas Instuments SoCs: AM62,
> > J721E, J721S2, and J784S4.
> >


I was attempting to build this with uclibc and I got this error:

ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2-br1.tar.gz: OK
(sha256: ef50124b3e79fb1d28d3a2b4135032505abbb5c6b337b24a9bed7223d521dcc1)
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Extracting
gzip -d -c /home/johnsonb/dl/ti-rogue-km/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2-br1.tar.gz
| tar --strip-components=1 -C
/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
  -xf -
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Patching
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Configuring
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Building
PATH="/home/johnsonb/buildroot1/output/host/bin:/home/johnsonb/buildroot1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wsl/lib:/snap/bin:/home/johnsonb/bin"
/usr/bin/make -j21 -C
/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
HOSTCC="/usr/bin/gcc -O2 -isystem
/home/johnsonb/buildroot1/output/host/include
-L/home/johnsonb/buildroot1/output/host/lib
-Wl,-rpath,/home/johnsonb/buildroot1/output/host/lib" ARCH=arm64
INSTALL_MOD_PATH=/home/johnsonb/buildroot1/output/target
CROSS_COMPILE="/home/johnsonb/buildroot1/output/host/bin/aarch64-buildroot-linux-uclibc-"
WERROR=0 REGENERATE_PARSERS=1
DEPMOD=/home/johnsonb/buildroot1/output/host/sbin/depmod
INSTALL_MOD_STRIP=1
KERNELDIR=/home/johnsonb/buildroot1/output/build/linux-custom
BUILD="release" PVR_BUILD_DIR="am62_linux" WINDOW_SYSTEM="wayland"
make[1]: Entering directory
'/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2'
../config/preconfig.mk:316: Could not determine TARGET_OS so assuming Linux
../config/compiler.mk:217:
******************************************************
../config/compiler.mk:217: Compiler target
'aarch64-buildroot-linux-uclibc' not recognised
../config/compiler.mk:217: (missing
../config/compilers/aarch64-buildroot-linux-uclibc.mk file)
../config/compiler.mk:217:
******************************************************
../config/compiler.mk:217: *** Compiler
'aarch64-buildroot-linux-uclibc' not recognised.  Stop.
make[1]: *** [Makefile:54: build] Error 2
make[1]: Leaving directory
'/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2'
make: *** [package/pkg-generic.mk:293:
/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2/.stamp_built]
Error 2

Also got a similiar error with musl
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Patching
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Configuring
>>> ti-rogue-km 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2 Building
PATH="/home/johnsonb/buildroot1/output/host/bin:/home/johnsonb/buildroot1/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/wsl/lib:/snap/bin:/home/johnsonb/bin"
/usr/bin/make -j21 -C
/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
HOSTCC="/usr/bin/gcc -O2 -isystem
/home/johnsonb/buildroot1/output/host/include
-L/home/johnsonb/buildroot1/output/host/lib
-Wl,-rpath,/home/johnsonb/buildroot1/output/host/lib" ARCH=arm64
INSTALL_MOD_PATH=/home/johnsonb/buildroot1/output/target
CROSS_COMPILE="/home/johnsonb/buildroot1/output/host/bin/aarch64-buildroot-linux-musl-"
WERROR=0 REGENERATE_PARSERS=1
DEPMOD=/home/johnsonb/buildroot1/output/host/sbin/depmod
INSTALL_MOD_STRIP=1
KERNELDIR=/home/johnsonb/buildroot1/output/build/linux-custom
BUILD="release" PVR_BUILD_DIR="am62_linux" WINDOW_SYSTEM="wayland"
make[1]: Entering directory
'/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2'
../config/preconfig.mk:316: Could not determine TARGET_OS so assuming Linux
../config/compiler.mk:217:
******************************************************
../config/compiler.mk:217: Compiler target
'aarch64-buildroot-linux-musl' not recognised
../config/compiler.mk:217: (missing
../config/compilers/aarch64-buildroot-linux-musl.mk file)
../config/compiler.mk:217:
******************************************************
../config/compiler.mk:217: *** Compiler 'aarch64-buildroot-linux-musl'
not recognised.  Stop.
make[1]: *** [Makefile:54: build] Error 2
make[1]: Leaving directory
'/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2'
make: *** [package/pkg-generic.mk:293:
/home/johnsonb/buildroot1/output/build/ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2/.stamp_built]
Error 2

If glibc is required I think there is a BR2_TOOLCHAIN_USES_GLIBC  you
can add to the config.in for that package.



Bryce
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
