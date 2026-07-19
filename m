Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0CC44521
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF9E6062C;
	Sun, 19 Jul 2026 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjpOAb7T2CMv; Sun, 19 Jul 2026 13:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DFA60633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784466997;
	bh=ooQuV2DSaTcRExa1RwYzzV4lMYGHdbc3ons6AvbtzwU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c537kI1i/b0GkzTBONhM1lsPYj+l5XoT6iWwc93YOaVFmmzv4QV0k0D3aMl39dJ/g
	 2eMBl1aFDJydWEY71VfjlcZjTyJTVtwcAIR5W0aRjxximgtfG7MowjPfK7fROPrZsB
	 M3jywujLvtSmSKRwQRRMqty5lDkWt2Jo5qUVt2e9KMXUovLhlcJ+tY7JvyGfMhcx+7
	 8Xc2qxwTZJWKc4/bVtZT0zXogQKCirVB3cB1ydMZQ2zGCY7L3zDHq3OiUgxZhQl9YI
	 fgPeTKE5G38SDTwhXZ+n1VLiU8JVP1wstjizkHjVnGQiWhmYZIORFrbKTcgheiA130
	 HPkB0EOlxpPaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DFA60633;
	Sun, 19 Jul 2026 13:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B9C206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA4E740557
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqJkHkvAZUek for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 13:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A084940556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A084940556
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A084940556
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 13:16:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D856678034D;
 Sun, 19 Jul 2026 15:16:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 15:16:30 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 15:16:30 +0200
To: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260717093249.2183039-1-andrea.ricchi@amarulasolutions.com>
References: <20260717093249.2183039-1-andrea.ricchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <10790734da8d04317e5e8a78fe12030c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784466992;
 bh=VVL1HjFWmr/tBQ1url8b1sMoJIuW+Vr/pN0sQtsBN9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FA6Y9LFrzdP6Iz6YQpdyhvXN6eFRGNelIzte4h14yKrcLBaCgf51rk6vVXr5b2ma1
 ULeV3CCtCqhkbRip52tnhNZ5fa47XzTXC5tDZMtoCvFqtFOgrStYF2pceXPVQvx0QG
 JMAXbRiBkBnhNu6x8RENxYiyKYDwI0DHgXmoW9dIxwVtg/PuAFG3APIt8Hg2/IMa9T
 QvHXUJJuWWAMFUVTy3g6tob347gHK/WafB2j/4Pt1782B9PW1+jcMIJNGK02TSjzON
 wHm64Lfip0IdPPn4uCd9dNKm5mI3o1NUMgojCNRk498nFWb/Nz5mGlUXFWtKAJdS02
 YtynQUW5tt1/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FA6Y9LFr
Subject: Re: [Buildroot] [PATCH v2] package/libcppconnman: add new package
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

Thanks for the patch.

The package  introduces build failures for some toolchains. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2688533526

You can reproduce locally with the command:
utils/test-pkg -a -p libcppconnman

I have another comment, see below.

On 17/07/2026 11:32, Andrea Ricchi wrote:
> libcppconnman is a C++ library that provides an easy-to-use API
> to communicate with ConnMan over D-Bus using GDBus.
> 
> https://github.com/amarula/libcppconnman
> 
> Also add myself to DEVELOPERS for this package.
> 
> Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> ---
> Changes v1 -> v2:
>   - add missing libcppconnman entry in package/Config.in
>   - merge the DEVELOPERS addition into this patch
> 
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
>  package/libcppconnman/libcppconnman.hash |  3 +++
>  package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
>  5 files changed, 55 insertions(+)
>  create mode 100644 package/libcppconnman/Config.in
>  create mode 100644 package/libcppconnman/libcppconnman.hash
>  create mode 100644 package/libcppconnman/libcppconnman.mk
> 
[...]
> diff --git a/package/libcppconnman/Config.in 
> b/package/libcppconnman/Config.in
> new file mode 100644
> index 0000000000..19dc0bbd2d
> --- /dev/null
> +++ b/package/libcppconnman/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_LIBCPPCONNMAN
> +	bool "libcppconnman"
> +	depends on BR2_INSTALL_LIBSTDCPP
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
> +comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_LIBCPPCONNMAN
> +
> +config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
> +	bool "libcppconnman example"

When configuring with examples, package build configuration fails with
a missing readline library. You can reproduce with:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LIBCPPCONNMAN=y
BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE=y
EOF
make olddefconfig
make libcppconnman

Could you add this missing dependency (both in Config.in and in the .mk 
file)
please?

> +	help
> +	  Compile CLI example.
> +
> +endif

Could you send an updated patch fixing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
