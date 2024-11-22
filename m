Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5C2E6ADCB
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 23:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A67406D0;
	Fri, 22 Nov 2024 23:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHbGg6vHVxXW; Fri, 22 Nov 2024 23:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0178C406DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0178C406DB;
	Fri, 22 Nov 2024 23:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 310B91D8B
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EB02608B9
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5XsYCPTzqxF for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 23:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F273607B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F273607B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F273607B7
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 23:20:02 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:c192:5f44:1fb7:e350])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5DE15B0051E;
 Sat, 23 Nov 2024 00:19:58 +0100 (CET)
Date: Sat, 23 Nov 2024 00:19:58 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <hv7nx7bxocwoe5f7yls7p37dgv2iqpfwiqpluizc7fcundgyfl@wwmamiudj2ux>
References: <20241122213809.176709-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122213809.176709-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732317600;
 bh=atv1Huwxq2WtMuc/Sj6mPmnknBYRNY0pKAWz6/bCnjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7klphKUJ38Nx1FVznl56sBWvVw9KCU/PpgWOaQPuVb9c1i/26qr+KPc6TpqCoxxS
 uojWBYASNfUBdFANgc4DmiAbQ96hl6pz6mC8F+jT0Jgiy7k0RMCcbUx6lUQDgVj1QU
 5yaY540U6aI4lt6vkWiqgyaiQ2etU9nfw8UEY1g1Dcf78mikVAQQzgv8LDZdu6x9tg
 zbEtSovqUdKFGwkCXhMDzqPyetp3+8VUVDfgCzl0shTq0/EKAVp3xcGYd1VsqKDXwh
 dxSfgxAal5d+9Ps1ZaLnOujXKukehETeeQ4p4EreOxpBgpAr3gEw+5Z8LSPlj0OdGJ
 6LnmmGD7fKLoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m7klphKU
Subject: Re: [Buildroot] [PATCH next 1/1] package/spice: re-enable on all
 cpu architectures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Fri, Nov 22, 2024 at 10:38:09PM UTC, Julien Olivain wrote:
> Buildroot commit [1] restricted spice compilation to x86 only.
> As the log of this commit mention, this was because at that time,
> spice 0.12.0 was generating an error on untested cpu architectures.
> See [2] (we can also see that armv6+ platforms was apparently
> supported).
> 
> Spice commit [3] (first included in spice v0.12.6) relaxed this error
> to a warning. The reason was that big endian support was improved,
> and also there was an intent to make testing easier.
> 
> This commit removes this i386/x86_64 cpu architecture restriction.
> It reverts the commit [1] and also adds the dependency on
> BR2_USE_MMU, as it is needed by libglib2. This dependency was
> missing, but was implied by the cpu restriction (as all i386/x86_64
> cpus has a MMU). Spice also needs a gcc version with C++11 support,
> including with std::list allocator which correspond to gcc >= 6.
> See gcc commit [4].

Thanks for enabling spice for many platforms. LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent

> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/4f452a86b8523d90ffa7a94cb1d540e574ceb165
> [2] https://gitlab.freedesktop.org/spice/spice/-/blob/v0.12.0/configure.ac#L60
> [3] https://gitlab.freedesktop.org/spice/spice/-/commit/f80eef8f9ca04f923752efbda043ab856801be8a
> [4] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1556927270
> ---
>  package/spice/Config.in | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/spice/Config.in b/package/spice/Config.in
> index ca5c562ca1..4ef4376a5a 100644
> --- a/package/spice/Config.in
> +++ b/package/spice/Config.in
> @@ -1,14 +1,16 @@
> -comment "spice server needs a toolchain w/ wchar, threads, C++"
> -	depends on BR2_i386 || BR2_x86_64
> +comment "spice server needs a toolchain w/ wchar, threads, C++, gcc >= 6"
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_INSTALL_LIBSTDCPP
> +		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  
>  config BR2_PACKAGE_SPICE
>  	bool "spice server"
> -	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_USE_MMU # libglib2
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	# Needs gcc >= 6 with c++11 std::list allocator
> +	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=cc7f3d0eeef05fb8fc11384a9a29afae10a54cc7
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_OPENSSL
> -- 
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
