Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C34C27C52
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 07:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD266101F;
	Tue,  4 Jun 2024 07:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlJDDP9ZhwPL; Tue,  4 Jun 2024 07:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5967A607B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5967A607B6;
	Tue,  4 Jun 2024 07:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB981BF2CB
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 07:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17205409B9
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 07:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbDDuHjRgV2i for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 07:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98147405FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98147405FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98147405FF
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 07:57:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3952313F88E;
 Tue,  4 Jun 2024 09:56:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 09:56:55 +0200
Date: Tue, 4 Jun 2024 09:56:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <Zl7IxwmaM93LDUi_@landeda>
References: <AS1P250MB060843CF993EF8CB658A1142A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS1P250MB060843CF993EF8CB658A1142A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717487818;
 bh=IGFkEq6eAvT5SRyyvxTzOrmGkcv8gradbfRPqQt7zh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SStrZ92ZOvdATw1lSJ+q7DKbMtU8JvTzbVwq5hmEt36t9QWDAOwpIcfILRZuoH0GT
 8wOCvpE0gAAjMAsaRR3NkxKdsIe/pus7VySQy83VMvzbqChDbxIQUsAfCj8iL5JqVm
 t/OQ3SJy9pXmY+dMFFvOZctvZgikjDanikE4wejw7N76KysjSPotxU9CiFCl8z1axn
 fe17ZdpTjjulElynRYK9MOvw6GOvkkY4tHVCPQ6dG5Mzq6MvLBx0zuwspX9heEg2k8
 9VEKm6GzOPAnaAY4nrjlIkEX8TNupuyT4rqdwBBThfoJ0ESSGRBzlNlkLdMQTD0sWx
 I6FR5LvO+9XKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SStrZ92Z
Subject: Re: [Buildroot] [PATCH] package/libzenoh-c: add GLIBC and aarch64,
 x86_64 and arm dependencies
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

Michel, All,

On 2024-06-04 07:43 +0000, Michel Alex spake thusly:
> zenoh-c only have support for following targets:
> aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi
[--SNIP--]
> diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
> index d22807c047..06e56c0879 100644
> --- a/package/libzenoh-c/Config.in
> +++ b/package/libzenoh-c/Config.in
> @@ -1,6 +1,17 @@
> +config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm
> +	default y if BR2_x86_64
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

The dependency on the C library should not be in the _ARCH_SUPPORTS
symbol. Indeed, the architecture is something the user can't changem
it's what it is, but the C library is software, so the user has the
option to choose.

So, when the architecture is not supported, there is no reason to show
the main symbol, and there is no reason to show the comment either. But
when the architecture is supported, we want to tell the user the have
the option of changing the C library to use that package. That's why in
my quickly shipped code snippet in my previous mail, the dependency on
the C library was not added to _ARCH_SUPPORTS, but to the main symbol
and, as an inverted test, to the comment.

Can you fix and respin, please?

Regards,
Yann E. MORIN.

> +comment "libzenoh-c needs a glibc toolchain and supports only aarch64, x86_64 and arm architectures"
> +	depends on !BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
> +
>  config BR2_PACKAGE_LIBZENOH_C
>  	bool "libzenoh-c"
> -	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
>  	select BR2_PACKAGE_HOST_RUSTC
>  	help
>  	  This package provides a C binding based on the main
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
