Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDB4C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BA080F54;
	Mon, 19 Aug 2024 20:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 650rXoTHm5fc; Mon, 19 Aug 2024 20:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0EF80F51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0EF80F51;
	Mon, 19 Aug 2024 20:41:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4543D1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F6CB404F7
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsiXoSFsfz7v for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2C60404EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C60404EE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2C60404EE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:41:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AFCB713F846;
 Mon, 19 Aug 2024 22:41:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 22:41:23 +0200
Date: Mon, 19 Aug 2024 22:41:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsOt8zO2Ne5rUvaf@landeda>
References: <20240818122521.955359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818122521.955359-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724100088;
 bh=lLDh7tuLTWxRhoWFNRrru8YtngTq441lxPsTLk0KLeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j+j6FBNSmhOin7az/0rViqAagvetvCEMQEm00sZ+ZcK+QevIJJ9IKbO4exTGcgWck
 Z6hZTcnE0YurUpi25dEfCLek4oql1L0levYqYunluei9UHRksZBmiRZh00sY+cao1a
 zRoBrBMCIlMysBiQiSiWZk+EqxdqpQAoIxS8J2Nw2xDd9morVeMIcPMbcH3gbatNfM
 nd9WkHYdmH3BNTjzEO//0/7z5yIT7OUNAACgchx5iI6FTR9KYdalLPyE6DBNWN8X/c
 UshttVpFKlHgzrSpNjZ/4oV+wTWRqr7n9DjcJ8gYEn3OTVdMToIDMI8KvB8BBp3j+x
 OxOk4Bu3X9zlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=j+j6FBNS
Subject: Re: [Buildroot] [PATCH] package/systemd: account for arch
 dependency of vmspawn support
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,
On 2024-08-18 14:25 +0200, Thomas Petazzoni via buildroot spake thusly:
> Since upstream commit
> 5c57a8650630304d8434a348283b6b643fbc676b ("vmspawn: add support for
> -D/--directory"), src/vmspawn/vmspawn-util.h defines a
> QEMU_MACHINE_TYPE based on the architecture, and not all architectures
> are supported. This commit first appeared in systemd v256.
> 
> Due to this, the unsupported architectures fail with:
> 
> In file included from ../src/vmspawn/vmspawn-util.c:27:
> ../src/vmspawn/vmspawn-util.h:46:4: error: #error "No qemu machine defined for this architecture"
>    46 | #  error "No qemu machine defined for this architecture"
>       |    ^~~~~
> 
> So let's add a BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS and use it to
> ensure vmspawn support is only used on architectures that are
> supported. Even though no-one selects BR2_PACKAGE_SYSTEMD_VMSPAWN (and
> would therefore need to inherit the
> BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS dependency), we nevertheless
> introduce BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS to make the
> depency list prettier than a long "depends on A || B || C || D ||
> ...".

Yes, that's much clearer that way, thanks!

> Fixes:
> 
>   http://autobuild.buildroot.net/results/0e614375f731f7bfe3c6041c6e89a09c31898053/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/Config.in | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 6708adce9b..113a8093c4 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -599,8 +599,22 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
>  	  Default keymap for the system. Leave empty to not set a
>  	  default keymap.
>  
> +# See for which architectures QEMU_MACHINE_TYPE is defined in
> +# src/vmspawn/vmspawn-util.h
> +config BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386
> +	default y if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_riscv
> +	default y if BR2_s390x
> +	default y if BR2_x86_64
> +
>  config BR2_PACKAGE_SYSTEMD_VMSPAWN
>  	bool "enable vmspawn"
> +	depends on BR2_PACKAGE_SYSTEMD_VMSPAWN_ARCH_SUPPORTS
>  	help
>  	  systemd-vmspawn may be used to start a virtual machine
>  	  from an OS image. In many ways it is similar to
> -- 
> 2.46.0
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
