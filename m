Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1D5CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27BBE4064E;
	Mon,  2 Sep 2024 15:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNfzMw6tFC-U; Mon,  2 Sep 2024 15:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBF8405A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CBF8405A9;
	Mon,  2 Sep 2024 15:41:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20CFB1BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD6E60676
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7G2pP6048RoZ for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCF046066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF046066D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCF046066D
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:41:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 10EA413F86E;
 Mon,  2 Sep 2024 17:41:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:41:19 +0200
Date: Mon, 2 Sep 2024 17:41:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZtXcn-Jkl40CoZ5k@landeda>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901121122.3113482-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725291683;
 bh=r0oBChky9obZ98DL7T6dr/Sqh0QKMk8RrgHA+559gw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDFipsCzFz0MhRpQwPG/CsymK4JP5agIbbEcusPu5FWWDqH/r1pE54pR7120NC4bw
 WPt7VdQvRxdv3j4VIIWuItZ23mcfd+GMq3fDcpFoMFwuo4pNkTN3JrzxLf6/2w/fbc
 Qu1/Zpd5Wx8VMrPcxQyWIULz25CAfRvYhTWso8ID3NSzD63ykvbTrA6yMyKLi7ye+B
 yabAWfEVdvk+jMEMYGgzt9+Fb5WSsECYshJEVnKOEbQvtxjyu3/IVmi0fATmqT7KCX
 T50Mbd8sL0Sj4TvI4JOmRqvlyGymhEdUzs3StCEOhSm8D70gnuF90P7EIWpkYOvNrp
 E75ylVl9OM9iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lDFipsCz
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup
 support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-09-01 14:11 +0200, Thomas Devoogdt spake thusly:
> The midori browser still uses libsoup and was broken since commit
> 38a098df133aaa2ebf09742054b02db5a44f58e5. This commit allows the
> use of libsoup, libsoup3 stays the default.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> This is a bit a replacement for https://patchwork.ozlabs.org/project/buildroot/patch/20240829131232.2132854-2-thomas@devoogdt.com/.
> I don't use midori or libsoup2, and it's still not maintained, so it's also fine to accept the other commit and drop midori altogether.

In the end, I applied the patch removing midori.

And apart for midori, does it make sense to restore using libsoup at
all, or should we drop this patch and keep only libsoup3?

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/webkitgtk/Config.in    | 11 ++++++-----
>  package/webkitgtk/webkitgtk.mk | 12 ++++++++++--
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index a556fec194..5f9c24d610 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -33,9 +33,9 @@ config BR2_PACKAGE_WEBKITGTK
>  	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup/libsoup3
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
> -	depends on BR2_USE_WCHAR # icu, libsoup3
> +	depends on BR2_USE_WCHAR # icu, libsoup/libsoup3
>  	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO
> @@ -47,7 +47,7 @@ config BR2_PACKAGE_WEBKITGTK
>  	select BR2_PACKAGE_LIBEPOXY
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBSECRET
> -	select BR2_PACKAGE_LIBSOUP3
> +	select BR2_PACKAGE_LIBSOUP3 if !BR2_PACKAGE_LIBSOUP
>  	select BR2_PACKAGE_LIBTASN1
>  	select BR2_PACKAGE_LIBXML2
>  	select BR2_PACKAGE_LIBXSLT
> @@ -100,9 +100,10 @@ comment "sandboxing support needs a toolchain w/ headers >= 3.12"
>  
>  config BR2_PACKAGE_WEBKITGTK_HTTPS
>  	bool "HTTPS support"
> -	depends on !BR2_STATIC_LIBS # libsoup3 -> glib-networking, gnutls
> +	depends on !BR2_STATIC_LIBS # libsoup/libsoup3 -> glib-networking, gnutls
>  	select BR2_PACKAGE_CA_CERTIFICATES # runtime
> -	select BR2_PACKAGE_LIBSOUP3_SSL
> +	select BR2_PACKAGE_LIBSOUP_SSL if BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_LIBSOUP3_SSL if BR2_PACKAGE_LIBSOUP3
>  	help
>  	  Enable HTTPS protocol support.
>  
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index ff39ee01e1..af49aad96e 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -14,8 +14,8 @@ WEBKITGTK_LICENSE_FILES = \
>  	Source/WebCore/LICENSE-LGPL-2.1
>  WEBKITGTK_CPE_ID_VENDOR = webkitgtk
>  WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
> -	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
> -	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
> +	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret libtasn1 \
> +	libxml2 libxslt sqlite webp woff2
>  
>  WEBKITGTK_CMAKE_BACKEND = ninja
>  
> @@ -31,6 +31,14 @@ WEBKITGTK_CONF_OPTS = \
>  	-DUSE_LIBHYPHEN=OFF \
>  	-DUSE_WOFF2=ON
>  
> +ifeq ($(BR2_PACKAGE_LIBSOUP),y)
> +WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=ON
> +WEBKITGTK_DEPENDENCIES += libsoup
> +else
> +WEBKITGTK_CONF_OPTS += -DUSE_SOUP2=OFF
> +WEBKITGTK_DEPENDENCIES += libsoup3
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK4),y)
>  WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
>  WEBKITGTK_DEPENDENCIES += libgtk4
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
