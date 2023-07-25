Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBCCC0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 00:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1113981BD6;
	Tue, 25 Jul 2023 00:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1113981BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOfM8gY0rJpJ; Tue, 25 Jul 2023 00:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3717681BB2;
	Tue, 25 Jul 2023 00:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3717681BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 881621BF2B6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A1840190
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A1840190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqBCCERTsQin for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 00:06:12 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B50AD4010C
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 00:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B50AD4010C
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-991f9148334so138051666b.1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690243570; x=1690848370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1fGfoafzVIlI9gtU2jd4eSbuHJsMDAyAbFFvBtN7EU=;
 b=OIwQmmrzZr/gnClqD6COZclTkKijfmmrE3e7m6UTlZEpZdAvvxbPYCfXfQPcTAJZta
 vwSGyDqLTe3Sla1AXwsCJU/buCqidkTqz83trpFTHULODj2QRflVKLBRxVK0/Ov629V1
 ipjUU0Odj+r3bkQAMd8gXlpT/Q9C/zuURb+emaToOiOvVoV+t5jMyfn20VhSFwnP+iP/
 zCE0HhEecfVuVoWGr3KDwa2RvPgPChvmmOXHr1gkBTlt4/1l6hE5YFQe1nSocIzWGMF5
 biqXIMaJTeQZ4IkZWVweCP1/l61cChBFHyZIeHzJc2IBB9IWueY245yYla4yMwFxQex3
 7cGw==
X-Gm-Message-State: ABy/qLZc2FJFjrhCz15e0lkmaO5z7R4loyv7o0mPlLI2DKtgy8hveJUU
 CjWP0+J5BlW1MttBmDGBT+7l/DQ3uOAVy5PsRTjHKPLFP2eNoN0UUfnRUA==
X-Google-Smtp-Source: APBJJlHoTCTPDezYFFcSc0SD2nsI7iBZiG+30iaYdMNr6ep7bwWNEGlK3TcBAM8hyWDcXlqU8CcSRvJLWow+xSC0aWU=
X-Received: by 2002:a05:6402:5114:b0:514:971b:7f36 with SMTP id
 m20-20020a056402511400b00514971b7f36mr3686088edd.3.1690243569740; Mon, 24 Jul
 2023 17:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230706170904.1063565-1-vfazio@gmail.com>
 <20230706170904.1063565-3-vfazio@gmail.com>
In-Reply-To: <20230706170904.1063565-3-vfazio@gmail.com>
Date: Mon, 24 Jul 2023 17:05:58 -0700
Message-ID: <CAGt4E5vsBmVfqSFudFLRn7SEogXFUFd=LE1jrcdJsntOZp3AZg@mail.gmail.com>
To: Vincent Fazio <vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1690243570; x=1690848370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s1fGfoafzVIlI9gtU2jd4eSbuHJsMDAyAbFFvBtN7EU=;
 b=dtAzIKrz+zDRd+qnwofEwjDEd1JIXKQOazrotIxiHR9w8q48GrUnB5t822uM0v++HM
 mx0zaPqF7mdJNBK+T6Hmx8V+nEMsI7UFzqu89GM26UNO8zadWxJDHV1dQij+wTyu4xL7
 NOdSHM8FrbAeBMlghZSnjA+C4dpL08txYu4jk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=dtAzIKrz
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

On Thu, 6 Jul 2023 at 10:19, Vincent Fazio <vfazio@gmail.com> wrote:
>
> Call these unconditionally to make sure proper support is flagged so
> proper dependencies are included in the resultant filesystem.

What is the reason behind this change? It has a high potential of
breaking the build for users.

It certainly does for us.

>>> host-skeleton  Executing pre-build script board/brcmstb/pre-build.sh
>>> toolchain-external-custom  Configuring
/bin/bash: line 1:
/opt/toolchains/stbgcc-8.3-1.0/bin/aarch64-linux-gfortran: No such
file or directory
OpenMP support is not selected but is available in external toolchain
make[1]: *** [package/pkg-generic.mk:283:
/storage/Extra/buildroot/output/arm64/build/toolchain-external-custom/.stamp_configured]
Error 1
make: *** [Makefile:27: _all] Error 2

I don't think that having a gfortran compiler is a mandatory
prerequisite to be using a toolchain for Buildroot. At least it
shouldn't be.

Can't this be implemented in such a way that the build won't just fail
for no good reason whatsoever?

Thanks,
-Markus

> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  .../toolchain-external/pkg-toolchain-external.mk | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c37f3500d9..ddf1d70ab4 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -576,18 +576,10 @@ define $(2)_CONFIGURE_CMDS
>                 $$(call check_arm_abi,\
>                         "$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
>         fi ; \
> -       if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
> -               $$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
> -       fi ; \
> -       if test "$$(BR2_TOOLCHAIN_HAS_DLANG)" = "y" ; then \
> -               $$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
> -       fi ; \
> -       if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
> -               $$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
> -       fi ; \
> -       if test "$$(BR2_TOOLCHAIN_HAS_OPENMP)" = "y" ; then \
> -               $$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
> -       fi ; \
> +       $$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
> +       $$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
> +       $$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
> +       $$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
>         if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
>                 $$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
>         elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
