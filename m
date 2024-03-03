Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E47CC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FEE410AF;
	Sun,  3 Mar 2024 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iT-Cul7fx2E3; Sun,  3 Mar 2024 09:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCB2410E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCB2410E7;
	Sun,  3 Mar 2024 09:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A42A71BF57B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E3C440136
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fUMQzBJlflIs for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02F6A4011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F6A4011C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02F6A4011C
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:55:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F296A13FA38;
 Sun,  3 Mar 2024 10:55:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 10:55:34 +0100
Date: Sun, 3 Mar 2024 10:55:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeRJFqxy-YtrzYBI@landeda>
References: <20240303084122.157151-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303084122.157151-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709459737;
 bh=CRxYP9YzVQkvJ+CGtkQZ9PMu+g4INIjDU+wiuoUglgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdA5g8SNNKy7n0HupNdKTcUrvEhJFaw0YQXIJb1kA02FuOnwywywTO15qH7Q7K0go
 CDtB1c3aJzof2Kw577A8vKxLBJJS3mhhUTy3mlV0Vp58uArT6S52Gdk4wFMkYjHYXZ
 vaT8lr/WhuPj3Ndy/GM0E6/53169wnTfvZ5DSg4zHSyeA8Wts+5Ic2ofeK0HrDoRLF
 9pGCXp+OnGPouJV3J6Gyv+X46pwe3kj52C/7tucsy44tdqddr/QU9VAkd78Ck3WVaG
 UXfoEc1Bjh1IyjPXVcZJvzr0Jh4Pw/mCXDFcziqkPfMs6kDdifk1jh65b/LLxrIZZv
 5m3vinGywzZ/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GdA5g8SN
Subject: Re: [Buildroot] [PATCH next] package/musl: bump to version 1.2.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-03-03 09:41 +0100, Thomas Petazzoni via buildroot spake thusly:
> This release adds two new ports: loongarch64 and riscv32. The former
> is not supported in Buildroot, but the latter is, so it gets enabled
> in this commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I did a simple arm build, it worked. Let's see what autobuilders will
have to say about this, now.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/musl/Config.in | 2 +-
>  package/musl/musl.hash | 4 ++--
>  package/musl/musl.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/musl/Config.in b/package/musl/Config.in
> index 89f41d2ff1..7fba85bcd9 100644
> --- a/package/musl/Config.in
> +++ b/package/musl/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
>  	default y if BR2_powerpc
>  	default y if BR2_powerpc64
>  	default y if BR2_powerpc64le
> -	default y if BR2_RISCV_64
> +	default y if BR2_riscv
>  	default y if BR2_sh
>  	default y if BR2_x86_64
>  	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
> diff --git a/package/musl/musl.hash b/package/musl/musl.hash
> index 3b5fccc9e2..b105320bac 100644
> --- a/package/musl/musl.hash
> +++ b/package/musl/musl.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature from
> -# http://musl.libc.org/releases/musl-1.2.4.tar.gz.asc
> -sha256  7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039  musl-1.2.4.tar.gz
> +# http://musl.libc.org/releases/musl-1.2.5.tar.gz.asc
> +sha256  a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4  musl-1.2.5.tar.gz
>  sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 08706c139f..783a103fcd 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUSL_VERSION = 1.2.4
> +MUSL_VERSION = 1.2.5
>  MUSL_SITE = http://musl.libc.org/releases
>  MUSL_LICENSE = MIT
>  MUSL_LICENSE_FILES = COPYRIGHT
> -- 
> 2.43.0
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
