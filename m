Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63871C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35265408FA;
	Thu, 12 Jun 2025 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCJaJIFSVjAZ; Thu, 12 Jun 2025 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303FE406B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303FE406B1;
	Thu, 12 Jun 2025 19:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65BDD1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C3108354D
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYxHUStSXKqo for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D5B3831AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5B3831AC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D5B3831AC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:58:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50E521C0F53; Thu, 12 Jun 2025 21:58:48 +0200 (CEST)
Message-ID: <7602cfe3-bb43-4416-9cc0-56096c54ea01@rnout.be>
Date: Thu, 12 Jun 2025 21:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, James Knight <james.knight@collins.com>
References: <20250528134401.72041-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250528134401.72041-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pCyEfM/jrOBY9kIlRp1VP/Fl6Z3lP0JgPucfYHBUN9c=;
 b=ofbvzLETKevceXsoQC1eqExbM3MKze+VZRA3hAIC4OI+na0C4797c/hyQg0KyZ/nfDnthC
 wdku+/sDqdogepnvwzi0VST9jbaMZOX8nVqVvMlbWJlQkG5SMU7/O6MIdmGlyjPEhNsu6H
 dJRdYHZdF4JGgRq6mwMDeC3NyVUSYxpd+/pcrPh77i6uobQb80BZX04w3b2KHia9hOJb8o
 tQJNrESNigtyWWo+xtvgENi0FB1a66v/rugVZWqC7Ud6NMrliIHyMagz8QabXQEpP6B3lL
 PbGFIp2gDq6eE/C6z2eywm4cEsL5ZJEVNhnKmb7iOJf7JCi/PNnwEhcW+RZZtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ofbvzLET
Subject: Re: [Buildroot] [PATCH] package/{atkmm, atmm2_28, gtkmm3,
 libglade}: propagate at-spi2-core dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/05/2025 15:44, Thomas Petazzoni via buildroot wrote:
> Since commit d1757fdfb0010d29f20cd68cb6e16f019e236424, at-spi2-core
> depends on !BR2_STATIC_LIBS, but this wasn't properly propagated to
> reverse dependencies, so let's do this propagation now.
> 
> Fixes the following warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
>    Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
>    Selected by [y]:
>    - BR2_PACKAGE_ATKMM [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/atkmm/Config.in     | 6 ++++--
>   package/atkmm2_28/Config.in | 6 ++++--
>   package/gtkmm3/Config.in    | 6 ++++--
>   package/libglade/Config.in  | 5 +++--
>   4 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
> index 571d7e69ad..cdae340266 100644
> --- a/package/atkmm/Config.in
> +++ b/package/atkmm/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
>   	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
>   	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
> +	depends on !BR2_STATIC_LIBS # at-spi2-core
>   	select BR2_PACKAGE_AT_SPI2_CORE
>   	select BR2_PACKAGE_GLIBMM
>   	select BR2_PACKAGE_LIBSIGC
> @@ -14,7 +15,8 @@ config BR2_PACKAGE_ATKMM
>   
>   	  http://www.gtkmm.org/
>   
> -comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
> +comment "atkmm needs a toolchain w/ C++, wchar, threads, gcc >= 7, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
> -		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
> index e88073b87a..8dc70210fa 100644
> --- a/package/atkmm2_28/Config.in
> +++ b/package/atkmm2_28/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_ATKMM2_28
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
>   	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
>   	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
> +	depends on !BR2_STATIC_LIBS # at-spi2-core
>   	select BR2_PACKAGE_AT_SPI2_CORE
>   	select BR2_PACKAGE_GLIBMM2_66
>   	select BR2_PACKAGE_LIBSIGC2
> @@ -17,7 +18,8 @@ config BR2_PACKAGE_ATKMM2_28
>   
>   	  http://www.gtkmm.org/
>   
> -comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
> -		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
> index 76af6b24f9..ac38ba06fc 100644
> --- a/package/gtkmm3/Config.in
> +++ b/package/gtkmm3/Config.in
> @@ -1,9 +1,10 @@
> -comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> +comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
>   		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS
> +		|| !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_GTKMM3
>   	bool "gtkmm3"
> @@ -14,6 +15,7 @@ config BR2_PACKAGE_GTKMM3
>   	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
>   	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
>   	depends on BR2_PACKAGE_LIBGTK3
> +	depends on !BR2_STATIC_LIBS # atkmm
>   	select BR2_PACKAGE_ATKMM2_28
>   	select BR2_PACKAGE_CAIROMM1_14
>   	select BR2_PACKAGE_GLIBMM2_66
> diff --git a/package/libglade/Config.in b/package/libglade/Config.in
> index 8d0d26f159..0f889542fa 100644
> --- a/package/libglade/Config.in
> +++ b/package/libglade/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLADE
>   	depends on BR2_USE_WCHAR # glib2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>   	depends on BR2_USE_MMU # glib2
> +	depends on !BR2_STATIC_LIBS # at-spi2-core
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_AT_SPI2_CORE
>   	select BR2_PACKAGE_LIBXML2
> @@ -14,7 +15,7 @@ config BR2_PACKAGE_LIBGLADE
>   
>   	  https://download.gnome.org/sources/libglade/
>   
> -comment "libglade needs a toolchain w/ wchar, threads"
> +comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
>   	depends on BR2_USE_MMU
>   	depends on BR2_PACKAGE_LIBGTK2
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
