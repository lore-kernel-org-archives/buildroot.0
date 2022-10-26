Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E6C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3858140913;
	Wed, 26 Oct 2022 21:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3858140913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RXqit0Y9i59; Wed, 26 Oct 2022 21:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD7340910;
	Wed, 26 Oct 2022 21:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD7340910
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3CF61BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F57660DF0
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F57660DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inMMdP5MA3FG for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0678F60DF4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0678F60DF4
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:04:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v1so28526458wrt.11
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0cq188/9QHSdUs0upKbJbsmye4AkPNgLtrmDvJ1vLc=;
 b=pYa9xzt2jgP3ODc/ihhsBeVTh8QhfLFKI2GcpDDjCGk7iT7kyUSt4F/AirftiKzKig
 JicSNe8gReiU9eJPamf/4mroIQiLHu0ExCdnojdTv4jGj+aZr02H4rNqUAhz9OyJ1iSo
 g26u9ofdsX8wa1+ivI6gvkVT4MRJzn2LkpvJMNRc+xMdqUruj95t4xkwL6lZbVfozo1W
 DxODBl/Pj3o8Y5FD4vSr6zkltXgeOb42cwswKFg9MgzqfZJn6ygmtTvKTtHjc6h/jV/X
 SidpoSLbWjf9uMG+K2akoEsF3DCLwC2ckCx3g3jCmrxHXAs3vX3HE3zLUQkHGARjh62i
 5Szw==
X-Gm-Message-State: ACrzQf0DbGG1PW9YL4vGwNzrpM404DW95V6AG3N4YS8rRjXortfY296x
 lP00XUj5eVuUYQ+vGCz3OF8+v+lpRTmqMSeVQL8=
X-Google-Smtp-Source: AMsMyM4GMOShPjcZPw3brePagYrh+EFPX8X7EUwzwz+X7rzyEdGi2j2F8u69FdMrvy21zA6PKSpzBWmi0PjAcPWBqCs=
X-Received: by 2002:a05:6000:1ac7:b0:232:8c6c:6c4a with SMTP id
 i7-20020a0560001ac700b002328c6c6c4amr30200465wry.455.1666818245149; Wed, 26
 Oct 2022 14:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
 <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20221026183427.3933387-2-thomas.petazzoni@bootlin.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Oct 2022 07:03:36 +1000
Message-ID: <CAKmqyKP-BghA6gVBe3Vi1acxjFZMZZsu2nPZ7MPsqk29MYTavg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L0cq188/9QHSdUs0upKbJbsmye4AkPNgLtrmDvJ1vLc=;
 b=QMpymW3fk4f6dhdxkqUCRuUwXcRnB7BnHoq9qbP9Qd95mwsEc1p7OgxKuxMdcKYUVf
 N7i0RH5Lsudi2Q2e5sqhegg+hooWmx7ffPWCCPI2cBh7/fqJASrlIMj4vKBmuZm/kaX1
 WvxUFMEek1sGUhsfAFMeGpIQB/C+2Qrts/GykOrwjLsj59yJHOxt3kv0865wbE0+nPna
 rDC0C1XI4hQ63hIZueuMUfxrutTp+FVmxJpWfvQvTbsyNLbx9dD1M49g8d/oe30GWxiz
 dG/l7s+LcNsW7YxhfispJWycw1xWVltXJoGKk9JoHbLiq+fSwXkWY4zEA+Sw6aXVvH2x
 II2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QMpymW3f
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: headers >= 5.4 needed on
 RISC-V 32-bit
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 27, 2022 at 4:35 AM Thomas Petazzoni via buildroot
<buildroot@buildroot.org> wrote:
>
> Since glibc 2.33 (upstream commit
> 7a55dd3fb6d2c307a002a16776be84310b9c8989), headers >= 5.4.0 are needed
> to build glibc for RISC-V 32-bit. Indeed
> sysdeps/unix/sysv/linux/riscv/configure.ac contains:
>
> if test $libc_cv_riscv_int_abi = ilp32; then
>   arch_minimum_kernel=5.4.0
> fi
>
> In order to take into account this dependency, we add the appropriate
> logic in package/glibc/Config.in and
> toolchain/toolchain-buildroot/Config.in.
>
> This change means that if headers < 5.4.0 are selected, then no C
> library at all will be available for RISC-V 32-bit, as glibc is the
> only C library supporting RISC-V 32-bit currently. However, thanks to
> the recent addition of BR2_TOOLCHAIN_BUILDROOT_NONE, the
> choice...endchoice for the C library selection will not be empty,
> allowing the user to see the Config.in comment explaining why glibc
> can't be selected.
>
> Therefore, technically this commit does prevent from creating a
> configuration with RISC-V 32-bit and headers < 5.4.0, but it will have
> BR2_TOOLCHAIN_BUILDROOT_NONE=y, which is catched by
> package/Makefile.in, which aborts the build early on pointing out that
> the configuration is invalid.
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/5ca49b2732f68eccb5276e7112f7f496dcc514ee/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/glibc/Config.in                 | 1 +
>  toolchain/toolchain-buildroot/Config.in | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index b63f99b0b4..71c50504ac 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -34,6 +34,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 26d731d976..64f7892f98 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -62,6 +62,10 @@ comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
>         depends on BR2_RISCV_64
>         depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
>
> +comment "glibc on RISC-V 32-bit needs a toolchain w/ headers >= 5.4"
> +       depends on BR2_RISCV_32
> +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +
>  comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
>         depends on BR2_arc
>         depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> --
> 2.37.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
