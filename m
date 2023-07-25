Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B83C001B0
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 00:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7F3340919;
	Tue, 25 Jul 2023 00:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7F3340919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5K9B08w0KAH6; Tue, 25 Jul 2023 00:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4D640922;
	Tue, 25 Jul 2023 00:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F4D640922
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA891BF2B6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BCEA60A7F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCEA60A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ8PALUG1lfe for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 00:26:58 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A94756080A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 00:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94756080A
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-522205646fdso575695a12.0
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690244816; x=1690849616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMwTjQQqed5UU7NaB5HaOTOmdfvzMfhDy8ddbzhGBZM=;
 b=GqXARaURPaGv8KbNR+fMW4Y789tyLvw99Dd1/iZUawlc34bO6as5BSx5RG1VQ+dccP
 0KeD1M/6nJsrGT1bB5EL3CsDnhfTaNVkIt+v9UIrR9OLsYCnEVZbVb14WVy+sh+kJ97F
 Og3AFIa8Bndn7JPUqzz1k8OuBTdRE0BQoeblCVwnWWR2hSeI3SngZ6uT7vAIlU5vUOU2
 QyFuo87ZIW7b1rqnoEI1jorp6v7fU0ePgHOAI1y2uKCQGm95o9jmybDmJP/DpBr7S/yK
 SlyJckqTiHof8pbM4TtFaUP91iR/XIMSn0r1P5uNNLxFbAybk9Z8pHxrMHBAFH4nOKz3
 EojA==
X-Gm-Message-State: ABy/qLas1wDIjr5rS0wcnQuIfKvbLTi/VrCyJSbJutflVbpPanCcV5FM
 zrtzWhPaEjs3g6ECZIg1mo2CwTnmptI+OeH+HJJauQ==
X-Google-Smtp-Source: APBJJlGVCMi1mnVezWTBO5jRPIetkNq828QcCWu5j1ChQWdu7ywQsIYAFkiZp+esjqeGbwpEuQE6mT/W51SNlyU3Kvc=
X-Received: by 2002:a05:6402:2695:b0:521:66b4:13b4 with SMTP id
 w21-20020a056402269500b0052166b413b4mr9616774edd.0.1690244815803; Mon, 24 Jul
 2023 17:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230706170904.1063565-1-vfazio@gmail.com>
 <20230706170904.1063565-3-vfazio@gmail.com>
 <CAGt4E5vsBmVfqSFudFLRn7SEogXFUFd=LE1jrcdJsntOZp3AZg@mail.gmail.com>
In-Reply-To: <CAGt4E5vsBmVfqSFudFLRn7SEogXFUFd=LE1jrcdJsntOZp3AZg@mail.gmail.com>
Date: Mon, 24 Jul 2023 17:26:44 -0700
Message-ID: <CAGt4E5vfbnf-TYH5Y6HxW3hrG37fgHYdfLZ5yobne+Edpk2uUg@mail.gmail.com>
To: Vincent Fazio <vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1690244816; x=1690849616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uMwTjQQqed5UU7NaB5HaOTOmdfvzMfhDy8ddbzhGBZM=;
 b=FO2tjD1py4qBJBkjN1lPkTSZ4R4HX9WvWfDfc9Nfjqnr3pXPEuHYOu71Cs6ycwSoJN
 DICaLS2GdgOdHHz2E3ahd0ZSN4+GlrdJuCzmUEUtcjv8YvBlcjM66brdWMwEZOAdtJ/A
 G4lzpcyjJBXCqlaUPsDvsA+6Y6TLPWeqOfPQI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=FO2tjD1p
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/toolchain-external: always
 call checks with dependencies
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 at 17:05, Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Thu, 6 Jul 2023 at 10:19, Vincent Fazio <vfazio@gmail.com> wrote:
> >
> > Call these unconditionally to make sure proper support is flagged so
> > proper dependencies are included in the resultant filesystem.
>
> What is the reason behind this change? It has a high potential of
> breaking the build for users.
>
> It certainly does for us.
>
> >>> host-skeleton  Executing pre-build script board/brcmstb/pre-build.sh
> >>> toolchain-external-custom  Configuring
> /bin/bash: line 1:
> /opt/toolchains/stbgcc-8.3-1.0/bin/aarch64-linux-gfortran: No such
> file or directory
> OpenMP support is not selected but is available in external toolchain
> make[1]: *** [package/pkg-generic.mk:283:
> /storage/Extra/buildroot/output/arm64/build/toolchain-external-custom/.stamp_configured]
> Error 1
> make: *** [Makefile:27: _all] Error 2

Okay. It isn't gfortran that aborts the build but OpenMP, and I can
fix that by setting
BR2_TOOLCHAIN_EXTERNAL_OPENMP=y

Still, the gfortran error message ("No such file or directory") should
probably not appear. Let me see if I can whip up a patch for that.

>> host-skeleton  Executing pre-build script board/brcmstb/pre-build.sh
>>> toolchain-external-custom  Extracting
>>> toolchain-external-custom  Patching
>>> toolchain-external-custom  Configuring
/bin/bash: line 1:
/opt/toolchains/stbgcc-8.3-1.0/bin/aarch64-linux-gfortran: No such
file or directory
>>> toolchain-external-custom  Building
/storage/Extra/buildroot/output/arm64/host/bin/ccache /usr/bin/gcc -O2
-I/storage/Extra/buildroot/output/arm64/host/include -DNDEBUG
-DBR_CPU='"cortex-a53"' -DBR_ABI='"lp64"' -DBR_CROSS_PATH_SUFFIX='""'
-DBR_CROSS_PATH_ABS='"/opt/toolchains/stbgcc-8.3-1.0/bin"'
-DBR_SYSROOT='"aarch64-buildroot-linux-gnu/sysroot"'
-DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=4096",
"-Wl,-z,common-page-size=4096", "-fstack-protector-strong",'
-DBR_CCACHE -DBR_CCACHE_BASEDIR='"/storage/Extra/buildroot/output/arm64"'
-DBR2_PIC_PIE -DBR2_RELRO_FULL -s -Wl,--hash-style=both
toolchain/toolchain-wrapper.c -o
/storage/Extra/buildroot/output/arm64/build/toolchain-external-custom/toolchain-wrapper
>>> toolchain-external-custom  Installing to staging directory

Regards,
-Markus

> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > ---
> >  .../toolchain-external/pkg-toolchain-external.mk | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index c37f3500d9..ddf1d70ab4 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -576,18 +576,10 @@ define $(2)_CONFIGURE_CMDS
> >                 $$(call check_arm_abi,\
> >                         "$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
> >         fi ; \
> > -       if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
> > -               $$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
> > -       fi ; \
> > -       if test "$$(BR2_TOOLCHAIN_HAS_DLANG)" = "y" ; then \
> > -               $$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
> > -       fi ; \
> > -       if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
> > -               $$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
> > -       fi ; \
> > -       if test "$$(BR2_TOOLCHAIN_HAS_OPENMP)" = "y" ; then \
> > -               $$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
> > -       fi ; \
> > +       $$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
> > +       $$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
> > +       $$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
> > +       $$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
> >         if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
> >                 $$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
> >         elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
