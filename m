Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB65D6C2B4
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A3B180A7C;
	Tue, 19 Nov 2024 21:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yl-lXbfhEpz; Tue, 19 Nov 2024 21:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE4280A67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE4280A67;
	Tue, 19 Nov 2024 21:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C60EDB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AD8D80A63
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00KyeFj9YkfK for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4254280A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4254280A4C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4254280A4C
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:59:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 61DB92003CE;
 Tue, 19 Nov 2024 22:59:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59668])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Nov 2024 22:59:31 +0100
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 22:59:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, zer0@droids-corp.org, robin@jarry.cc
In-Reply-To: <20241119203329.57567-1-vjardin@free.fr>
References: <20241119203329.57567-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <b9ce24a0f89d07fcbc3ea9711d8b16d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732053574;
 bh=2s7Qkku8jwiw5gC7sCxiuCtoqMcqaA2jl9VRJv1wvwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kX5eACl9/T0XHqFR1hP6FyTGb8rZh/WPFRqmenp3ZylmJhxZYVO7wwfEz3taqn6if
 XB3YDywJDcbtzN4OoVKbUOh48q3Bn+7MXYUO+J1uyd4mcqzEmbbod9z2m1RGgNJrff
 6p9elaHMhEJ5CaFz0aQpxluy05PaRpXFC07zKI+xmsgcjCndGcu/oWU9dMCQrdqhsz
 fnQe5pcR6qKpgXLWyUYS8Cg3g1c0ldVedvVAzrGN7/hXOfpv/ds++tAoJ5A0iGGIHg
 qxgKkefrPuJl6KnJr6Pr91OsPuZymZfCvGnx5FO7ieyJce026kc8qMpSpYDDUUGN9r
 xELF/b7B5F4nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kX5eACl9
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: bump version to 0.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/11/2024 21:33, Vincent Jardin wrote:
> This new version includes the missing headers that will be needed for
> grout. Its meson option has been revamped.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Suggested-by: Robin Jarry <robin@jarry.cc>

Applied to next, thanks.

I made a small change, detected by "utils/docker-run make 
check-package".

> ---
>  package/libecoli/libecoli.hash |  2 +-
>  package/libecoli/libecoli.mk   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libecoli/libecoli.hash 
> b/package/libecoli/libecoli.hash
> index 0540ef7270..433550f91b 100644
> --- a/package/libecoli/libecoli.hash
> +++ b/package/libecoli/libecoli.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  
> 0da8f953e054dd2ba75a0d1dcbbc8830b76747282035e1d1de6082ec3bb6f995  
> libecoli-0.2.0.tar.gz
> +sha256  
> e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  
> libecoli-0.3.0.tar.gz
>  sha256  
> e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  
> LICENSE
> diff --git a/package/libecoli/libecoli.mk 
> b/package/libecoli/libecoli.mk
> index c46f62b523..f518208e92 100644
> --- a/package/libecoli/libecoli.mk
> +++ b/package/libecoli/libecoli.mk
> @@ -4,14 +4,23 @@
>  #
>  
> ################################################################################
> 
> -LIBECOLI_VERSION = 0.2.0
> +LIBECOLI_VERSION = 0.3.0
>  LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
>  LIBECOLI_INSTALL_STAGING = YES
>  LIBECOLI_LICENSE = BSD-3-Clause
>  LIBECOLI_LICENSE_FILES = LICENSE
> 
> +LIBECOLI_INSTALL_STAGING = YES

This _INSTALL_STAGING is duplicate. It was already present in the 
initial 0.2.0
submission.

> +
>  LIBECOLI_DEPENDENCIES = \
>  	host-pkgconf \
>  	libedit
> 
> +LIBECOLI_CONF_OPTS = \
> +	-Ddoc=disabled \
> +	-Deditline=enabled \
> +	-Dexamples=disabled \
> +	-Dyaml=disabled \
> +	-Dtests=disabled
> +
>  $(eval $(meson-package))
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
