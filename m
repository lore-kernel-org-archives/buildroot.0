Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99033C77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 07:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3971240948;
	Tue,  9 May 2023 07:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3971240948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mt9vUwSVeJ29; Tue,  9 May 2023 07:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FB441E92;
	Tue,  9 May 2023 07:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FB441E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE5F1BF2C9
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66D8A614A8
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 07:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D8A614A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xX7vXQ3ymCAl for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 07:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 178F460E8B
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 178F460E8B
 for <buildroot@buildroot.org>; Tue,  9 May 2023 07:18:06 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-965e93f915aso817422966b.2
 for <buildroot@buildroot.org>; Tue, 09 May 2023 00:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683616684; x=1686208684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xw77nhIg/iZoslbAneosmuyEjFs3oSHqbZ3ixata2UQ=;
 b=JGq0mZCb3HAIcXkOVgyWXlIzv9MV9YrnzjEotR9w6UzbfQw6gTP6LDLylyz8UIJjxZ
 DkR86ZeQ6Z8v/FzYpaGN9bfV+FHU1J8TVYHf1hRcBW6V1p8FBvsuBp4ajHNm38NmCsxs
 WVVMulR0fbOVMSlTbY/Cwfn83IwpQct1nWHWFHxfaC2pcpfV8fcR88s4FB2wI5XPEi2e
 u1YFgOl4pbMXnHiX5amFcTP/8dQmAxwrzaS4R0OnhtRL7Sx9eBIfEnaZcgAZyCM14ECU
 9jkNHhB86dUEUzzKg8fj+HIipJ76WEBQE9HPwitt22qLffJ0AQtgsP3N/Rs9LlgPTPi8
 D9rQ==
X-Gm-Message-State: AC+VfDzvM3sIKlEbyOAX0fbfOKvuRAw188kqsa65yqXJSsnnGrM4XBPn
 HFD0kD1Z4QEqOXHSJpayngpniUIdha4VEGzE4OVUJQ==
X-Google-Smtp-Source: ACHHUZ7Limv8wzH0vwacROu+MrsJjHEcrvycrslFIIVqT7JEsvrbpLVdEIy0CmF5Df4OgJcZc6mvjUfuN9PrQ/XDUdE=
X-Received: by 2002:a17:906:dc93:b0:965:4b44:6f5a with SMTP id
 cs19-20020a170906dc9300b009654b446f5amr11591610ejc.10.1683616683997; Tue, 09
 May 2023 00:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
 <20230502154713.1490788-6-etienne.carriere@linaro.org>
 <20230507213849.GT252090@scaer>
In-Reply-To: <20230507213849.GT252090@scaer>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 9 May 2023 09:17:52 +0200
Message-ID: <CAN5uoS_PLOt-oPrNKiop4E-fQrVaRa+6GL9Fkqg=vC=waZoCAQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683616684; x=1686208684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xw77nhIg/iZoslbAneosmuyEjFs3oSHqbZ3ixata2UQ=;
 b=MglVKvSqtkHIjjb1r9ky8VeYfXVdICcO8OV4qHoJRxzVvCviq3Ddm5Ho9tNeJmoavL
 gN3dTme9z34LiqBiaOVtUhoRwZVPBgfW6tb34iueXn+l0KFLQd04hXClvKhaMKGnji+t
 s6yUKBIfHrH1QAFf4Tl9JSeDy/4xpkgfutOBFlJgzeFsYl0WkvuOETPSGI1DspKIwE36
 yEo1QVLlHwOj+UvC8sKhQX/wuuR472r5H0TpEj/RX2/zJpllx79mpPrdqLOGk2w8y5gT
 6lO8yw2xU+tdmVlTFVEyN/FgcprwYgO8R0c6hCgfNbqS0oyqM7YErQOcM7jUktyZQoyt
 utVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=MglVKvSq
Subject: Re: [Buildroot] [PATCH 6/6] package/optee-benchmark: remove
 deprecated package
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Sun, 7 May 2023 at 23:38, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Etienne, All,
>
> On 2023-05-02 17:47 +0200, Etienne Carriere spake thusly:
> > Removes package optee-benchmark that is no more maintained as
> > pointed by discussion thread [1].
>
> This needs to be moved to Config.in.legacy, to inform users that used to
> use optee-benchmark that they can't use it anymore.
>
> Applied to master with the ab ove entry added, thanks.
>
> And now when I write this, I notice I forgot to amend the commit before
> I pushed, so I did a separate commit. Dang...

Thanks fixing the changes from my series..
I didn't even noticed patch files were listed .checkpacakgeignore.
I'll (try to) take care of that in the future.

br,
etienne

>
> Regards,
> Yann E. MORIN.
>
> > Link: [1] https://github.com/OP-TEE/optee_os/issues/5909
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  package/Config.in                            |  1 -
> >  package/optee-benchmark/Config.in            | 20 --------------------
> >  package/optee-benchmark/optee-benchmark.hash |  4 ----
> >  package/optee-benchmark/optee-benchmark.mk   | 14 --------------
> >  4 files changed, 39 deletions(-)
> >  delete mode 100644 package/optee-benchmark/Config.in
> >  delete mode 100644 package/optee-benchmark/optee-benchmark.hash
> >  delete mode 100644 package/optee-benchmark/optee-benchmark.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index eaac32a01a..53c2d3b077 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2565,7 +2565,6 @@ menu "Security"
> >       source "package/apparmor/Config.in"
> >       source "package/checkpolicy/Config.in"
> >       source "package/ima-evm-utils/Config.in"
> > -     source "package/optee-benchmark/Config.in"
> >       source "package/optee-client/Config.in"
> >       source "package/optee-examples/Config.in"
> >       source "package/optee-test/Config.in"
> > diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
> > deleted file mode 100644
> > index 2070582fbb..0000000000
> > --- a/package/optee-benchmark/Config.in
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -config BR2_PACKAGE_OPTEE_BENCHMARK
> > -     bool "optee-benchmark"
> > -     depends on BR2_USE_MMU # fork()
> > -     depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
> > -     depends on !BR2_STATIC_LIBS # optee-client
> > -     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
> > -     select BR2_PACKAGE_OPTEE_CLIENT
> > -     select BR2_PACKAGE_LIBYAML
> > -     help
> > -       Enable the OP-TEE benchmark package that brings facilities
> > -       for profiling traversal and execution timings when
> > -       invoking OP-TEE. OP-TEE benchmark is a component delivered
> > -       by the OP-TEE project.
> > -
> > -       http://github.com/linaro-swg/optee_benchmark
> > -
> > -comment "optee-benchmark needs a toolchain w/ threads, dynamic library, headers >= 4.3"
> > -     depends on BR2_USE_MMU
> > -     depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> > -             !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> > diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
> > deleted file mode 100644
> > index d74a24c8ab..0000000000
> > --- a/package/optee-benchmark/optee-benchmark.hash
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
> > -sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
> > -# Locally computed
> > -sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
> > diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
> > deleted file mode 100644
> > index 338a51ada4..0000000000
> > --- a/package/optee-benchmark/optee-benchmark.mk
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -################################################################################
> > -#
> > -# optee-benchmark
> > -#
> > -################################################################################
> > -
> > -OPTEE_BENCHMARK_VERSION = 3.19.0
> > -OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
> > -OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
> > -OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
> > -
> > -OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
> > -
> > -$(eval $(cmake-package))
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
