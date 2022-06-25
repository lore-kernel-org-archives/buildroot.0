Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503E3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDE6C41043;
	Sat, 25 Jun 2022 06:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE6C41043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkJTnASW-2Ut; Sat, 25 Jun 2022 06:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAD3840A9A;
	Sat, 25 Jun 2022 06:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD3840A9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 584F51BF2C6
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 328C360F0B
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328C360F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSDaNW0KLTV3 for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABF460F07
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ABF460F07
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:45:30 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101bb9275bcso6572291fac.8
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 23:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuW21GXTtc5+p+cBfWPm5sS0Jo0ltsAWZng85GCePcM=;
 b=cg1uO7gYvAIxuoXRUiJGMi8Af49+9kSH2U87sbdF+I5kgFdR2abp4Pa+Hy1LYeyC9p
 C1azg4oEyOG4pJzolRge3udCI9VqAleKhrqqU/08MUFJa9YarVz24o6J0HAMTAh4B2EW
 +Pjq/vGfV0wUAg+U1u3UrxDEwuyIJe52I3Mml383hi5BqIaIBeWVfVuB5m9iWnBnT5Yu
 l/8rG0MDhwyvmP68736tuN2TtFir1jDIJX5OrP9/s7fc7eYsRABybV7iusYvlHgkTa+z
 tg93jkLYrB6IGQRAdjtVpgrkGiqyWFeLD2H4ixQucdFW1TbDM53hj6501jz0QDDSMwB8
 1daw==
X-Gm-Message-State: AJIora+aGIAqDgncbCJGgUWs93fQHX86eZD7k7eaixJQxqSs3k4+y2o0
 TZf8LI7l0egFfqFyzB0GIcfALLLtgc4SEbtC3RKdQsjHyG4=
X-Google-Smtp-Source: AGRyM1vO/k/M0SvOCmFgZ23Qex2afdmbgB919wq/+EZhvlBXmBXtXJrcXlExQSohxVON5Vk3dONHEyVvEqnb30sECT0=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr1750951oaa.99.1656139529006; Fri, 24
 Jun 2022 23:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-8-romain.naour@gmail.com>
In-Reply-To: <20220529131811.481017-8-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Jun 2022 00:45:18 -0600
Message-ID: <CADvTj4oSsDgObzR=zRD_g0rHYn6AHEKQp7g0OY+qRi29wo=WNw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yuW21GXTtc5+p+cBfWPm5sS0Jo0ltsAWZng85GCePcM=;
 b=HWbL8yxKuuqWgVXGMlPnzHnZja1iRI8VSXUPpjfmtwikvKaX+lS2tbWiAed1QDOZO/
 oBPG3pdYuO56JVK014VyIZtL83qdHtTu2pF/dCZrV2dF/R0RmzgHB4AvDvXZpTowJSI7
 rWPEUPG/Fywzuiz3lXlJH2BaC/6LYB1+cPOgdFqmp/wRkWfOVircPA0I/sgNN54a5mt1
 XwuBLDpC9gYFhwMIPgltWpUFGcOmHRD4/zLlcQGhXWauykosr3DGl+0kp1+PYXPUQlru
 ZwRySKIrdSSwxlQmV5XRaYYnEM4fY2ZliMHK4CtKXseBWe+R2yoBDGHMc5krPse550V3
 Kq4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HWbL8yxK
Subject: Re: [Buildroot] [PATCH for-next 08/11] package/gcc: add support for
 gcc 12
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 29, 2022 at 7:20 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> https://gcc.gnu.org/gcc-12/changes.html
> https://gcc.gnu.org/gcc-12/porting_to.html
>
> Tested with toolchain-builder:
> https://gitlab.com/kubu93/toolchains-builder/-/pipelines/550404957
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gcc/Config.in.host | 14 ++++++++++++++
>  package/gcc/gcc.hash       |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 06f83d8f87..bcf0743b23 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -62,6 +62,19 @@ config BR2_GCC_VERSION_11_X
>         depends on !BR2_archs4x_rel31
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>
> +config BR2_GCC_VERSION_12_X
> +       bool "gcc 12.x"
> +       # powerpc spe support has been deprecated since gcc 8.x.
> +       # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> +       depends on !BR2_powerpc_SPE
> +       # uClibc-ng broken on sparc due to recent gcc changes
> +       # that need to be reverted since gcc 8.4, 9.3 and 10.1.
> +       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> +       depends on !BR2_sparc
> +       # ARC HS48 rel 31 only supported by gcc arc fork.
> +       depends on !BR2_archs4x_rel31
> +       select BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +
>  endchoice
>
>  # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
> @@ -88,6 +101,7 @@ config BR2_GCC_VERSION
>         default "9.4.0"     if BR2_GCC_VERSION_9_X
>         default "10.3.0"    if BR2_GCC_VERSION_10_X
>         default "11.3.0"    if BR2_GCC_VERSION_11_X
> +       default "12.1.0"    if BR2_GCC_VERSION_12_X
>         default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
>
>  config BR2_EXTRA_GCC_CONFIG_OPTIONS
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index e364be0a06..dc19c282c2 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -6,6 +6,8 @@ sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b79
>  sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
>  # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
>  sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
> +# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.1.0/sha512.sum
> +sha512  2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900  gcc-12.1.0.tar.xz
>
>  # Locally calculated (fetched from Github)
>  sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
> --
> 2.35.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
