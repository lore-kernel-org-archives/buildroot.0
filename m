Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE33DC44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF6180D74;
	Mon, 20 Jul 2026 19:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIS6tjI6K-vC; Mon, 20 Jul 2026 19:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A438C80D63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784575378;
	bh=+yLSEQ9PIUIZf9WuFNcIdj65u+yv6QZkIQh7L0OX0Uw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QJ6EQkgKYnlBbD8OrGB/aoDQCBEvULFgAGR/eMhuyi5VFS+bRT9VjUuTn0SpqgjSn
	 uSkJ1EF64CpaVqRy5yTnjY1g9NKA1hOWdLIyKKiFBGyDix3WqfFtL6eyn894zZK/CK
	 9K9XXXC//UimsKQ9SSYJrdSqR0knHhrfiZfMATWKxRs3/yK3aOS8zUonz452bmW3Qc
	 vTUBT6yc/+fw7RhkVO/bUUIB1ef73jOpX1AlZ+325jQm/AMcrB6u7+/YTvStxFuMRI
	 1GNstWjXrLSFBPUjcab7rdkxr3tMqpPnQY57v5N+XjeuGVU8/BsnqR0Ym1kyNbkq1/
	 CDK5TCx1IXCPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A438C80D63;
	Mon, 20 Jul 2026 19:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4364313
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA1B740180
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXqci4FGy_mI for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE68940167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE68940167
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE68940167
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:22:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B982019F5A7;
 Mon, 20 Jul 2026 21:22:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:22:52 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:22:52 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
References: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <677b873ff2144474ec7024f39b6496ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784575373;
 bh=fq1LryUUJ3R+iO5kZx6iy6PmvIKpd/s/+nsRyDho5H8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bBgI/jT8cLFTCuN+ZjbDuj6Ihm7X7tu7G/HnlFhW9s7bdCA6zR5kdx97tfsenJnS/
 JvoF7IIFxAirUVc+4ESu9nyaVohaAC82+ou4JIRSOZrHNHK+r3v9IoJnna+epYGnqH
 A8iiQPMByp3NZ+0pRga8mBohjoq1X8G0oGoO6H7i7ah7jLtYuMHvWUxBYKM7YxR1t0
 BDA2fV8Kt5g/vlxs8BjtOemFojY5wcGymcmxEBbfM1BDbkvLtms0rGJzzfDE9VfzLC
 7wMrNqwpXqpckn1P/0gV1rugUcvCL47W/bDEU3o0McaeNBWrY2xCAhT4BawapQgGae
 pbOSQD0kwZ1zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bBgI/jT8
Subject: Re: [Buildroot] [PATCH v3] package/libcppconnman: add new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrea,

Thanks for the updated patch!

On 20/07/2026 14:22, Andrea Ricchi wrote:
> libcppconnman is a C++ library that provides an easy-to-use API
> to communicate with ConnMan over D-Bus using GDBus.
> 
> https://github.com/amarula/libcppconnman
> 
> Also add myself to DEVELOPERS for this package.
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
> Changes v2 -> v3:
>   - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++20 / 
> <ranges>),
>     fixing build failures on GCC < 10 toolchains reported by the 
> autobuilders
>   - Config.in, libcppconnman.mk: select and depend on readline for the 
> example,
>     fixing the missing readline library configure error when examples 
> are enabled
> 
> Changes v1 -> v2:
>   - add missing libcppconnman entry in package/Config.in
>   - merge the DEVELOPERS addition into this patch
> 
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/libcppconnman/Config.in          | 28 ++++++++++++++++++++++++
>  package/libcppconnman/libcppconnman.hash |  3 +++
>  package/libcppconnman/libcppconnman.mk   | 25 +++++++++++++++++++++
>  5 files changed, 58 insertions(+)
>  create mode 100644 package/libcppconnman/Config.in
>  create mode 100644 package/libcppconnman/libcppconnman.hash
>  create mode 100644 package/libcppconnman/libcppconnman.mk
> 
[...]
> diff --git a/package/libcppconnman/Config.in 
> b/package/libcppconnman/Config.in
> new file mode 100644
> index 0000000000..d99d711e25
> --- /dev/null
> +++ b/package/libcppconnman/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_LIBCPPCONNMAN
> +	bool "libcppconnman"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  libcppconnman provide easy to use C++ API to communicate
> +	  with ConnMan via the DBus using GDBus.
> +
> +	  https://amarula.github.io/libcppconnman/
> +
> +comment "libcppconnman needs a toolchain w/ C++20, wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +
> +if BR2_PACKAGE_LIBCPPCONNMAN
> +
> +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
> +	bool "libcppconnman example"

It seems there is still 2 build failures with the examples. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2691451879

It is likely due to a missing dependency on BR2_TOOLCHAIN_HAS_SYNC_1.

Could you have a look please?

> +	select BR2_PACKAGE_READLINE
> +	help
> +	  Compile CLI example.
> +
> +endif

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
