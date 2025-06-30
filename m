Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEEFC83038
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A1060E4F;
	Mon, 30 Jun 2025 19:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Mc6kNy11_dB; Mon, 30 Jun 2025 19:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED96D60F0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED96D60F0B;
	Mon, 30 Jun 2025 19:30:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CCF6223
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DA7740401
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YAdcSbEbcE7 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A1F840965
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1F840965
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A1F840965
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:29:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5BC70B00571;
 Mon, 30 Jun 2025 21:29:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Jun 2025 21:29:55 +0200
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 21:29:55 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <c509e65797c5662315ce9316ee1c4b50e5275111.1751288710.git.yann.morin@orange.com>
References: <c509e65797c5662315ce9316ee1c4b50e5275111.1751288710.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <64c23b7abfbfd647599418acd278f3a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751311796;
 bh=AMhnMhWet00YXkiC5ImgPtVGOqTXd7/Gx33MvVKhP7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p7dcE9fGqrWBJgXHuLu9UmJ1sCWYiKLjAwlgvjy4Rrjbpi5WJKVv4PV0RzOrxqTb0
 Sf7Scxzd648KG2g8ha0WEuLiWLhG9u7aPEiA5iuQ3YuxGTixfF9912jxKty9Ipbjv1
 C0DYMZhRbctnhoRatkSgryMY9dsnLab63wSkad3N8slh7NzB76xcMX8G3Z5Wc0mYk3
 ez2U7wKpXkGTexUCAjGiKWo8zGayK4pBkZ/5xxXmSBLSV8fmO1MDXul1q/qkRDJwBc
 MooirVDH2kaqGjU3MMczDYvIzftoqrG5Dm0BmkqyoBufgEu9htYRePc87AfCGkU0is
 o2d663PC8NiMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p7dcE9fG
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.0
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

Hi Yann,

Thanks for the patch. I have a question/comment, see below.

On 30/06/2025 15:05, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Upstream passt only documents runtime dependencies; and they advertise
> being able to run on kernel 3.8 or later. However, they do not document
> the build dependencies.
> 
> As reported by Julien, since 2024_12_11.09478d5, upstream requires
> kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
> introduced in 5.0.
> 
> Add a dependency to kernel headers, and propagate it to podman, 
> updating
> the previous 4.14 requirement.
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/passt/Config.in  | 4 ++++
>  package/podman/Config.in | 6 +++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/passt/Config.in b/package/passt/Config.in
> index a2d2f4f1fe..a93a088670 100644
> --- a/package/passt/Config.in
> +++ b/package/passt/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PASST
>  	bool "passt"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
>  	help
>  	  passt: Plug A Simple Socket Transport
>  	  pasta: Pack A Subtle Tap Abstraction
> @@ -17,3 +18,6 @@ config BR2_PACKAGE_PASST
>  	  hence not requiring any capabilities or privileges.
> 
>  	  https://passt.top/passt/about/
> +
> +comment "passt needs a toolchain w/ headers >= 5.0"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index 6bfd477f38..cb7984f709 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt

Since podman has two network backends (passt and slirp4netns),
exposed in a Kconfig choice, do we really need to propagate this
dependency here? Or could it moved only to
BR2_PACKAGE_PODMAN_NET_PASST?

This way, we could still build podman+slirp4netns for kernel
headers >= 4.14 and < 5.0.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
>  	depends on BR2_USE_WCHAR  # conmon
>  	select BR2_PACKAGE_HOST_GO
> @@ -82,12 +82,12 @@ endchoice
> 
>  endif
> 
> -comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
> +comment "podman needs a toolchain w/ headers >= 5.0, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_USE_WCHAR
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
