Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23616D68BE8
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 11:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85D841E85;
	Sat, 16 Nov 2024 11:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcpcrsBUJjK4; Sat, 16 Nov 2024 11:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4CF41A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4CF41A6B;
	Sat, 16 Nov 2024 11:19:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F96BB14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00CFF84957
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l382ySfL_ScQ for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 11:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5DB784953
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DB784953
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5DB784953
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 11:19:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A12D213F88D;
 Sat, 16 Nov 2024 12:19:20 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38540])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 12:19:20 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 12:19:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, zer0@droids-corp.org, robin@jarry.cc
In-Reply-To: <20241115173510.31009-1-vjardin@free.fr>
References: <20241115173510.31009-1-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <31efd2663d1b8e193e49c0cc76113384@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731755964;
 bh=tljqmSDCYJTCXHa4ZeLYequB+2evzBj/rDs+RAcVWM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NNoJs3L7gI6fHpDR50NGT4BrhneHGJWSiTkjQpi+sVap+Txxn5F8dbSDQsP6ctZ6Y
 /vkhOx0oHLMH3+2f/YcrChrkYHz4i8krQTQ2E9xwy+eMaMsgYK06elJ79N9O4rBLsE
 oQM6U9897UHfImupVX6l6geI65at7JAEJ+cw2dGWCl83D3Vyg7JD+BP3qvJHaDVJJh
 Vzs1dW0ZjslniJ8tD0udwerCXQIW2hWIGUsY6tm76xjh/E9lNXmg0K6aSTjAe2V69G
 qAlIZRGddrmNCICucbc3+/VaZXbyW/P/+rTKFp4aJMfd3F34ys0OuPUVe9iO6BfFZN
 wMD4dlMOiASKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NNoJs3L7
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: new package
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

Hi Vincent,

Thanks for the patch!

The .hash file is missing in this new package proposal. See:
https://buildroot.org/downloads/manual/manual.html#adding-packages-hash
Could you add it, please?

Also, out of curiosity: I believe you propose this library to be used
as a dependency by another package you'll propose? Which one it is?
(is it "grout", since you introduced dpdk?)

On 15/11/2024 18:35, Vincent Jardin wrote:
> Add a new smart library for CLI / command line.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/libecoli/Config.in   |  7 +++++++
>  package/libecoli/libecoli.mk | 17 +++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/libecoli/Config.in
>  create mode 100644 package/libecoli/libecoli.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3945803d53..a44c79e66a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
>  F:	package/bfscripts/
>  F:	package/dpdk/
> +F:	package/libecoli/
> 
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
> diff --git a/package/Config.in b/package/Config.in
> index 1eb5e1e020..278c82bb05 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2337,6 +2337,7 @@ menu "Text and terminal handling"
>  	source "package/icu/Config.in"
>  	source "package/inih/Config.in"
>  	source "package/libcli/Config.in"
> +	source "package/libecoli/Config.in"
>  	source "package/libedit/Config.in"
>  	source "package/libenca/Config.in"
>  	source "package/libestr/Config.in"
> diff --git a/package/libecoli/Config.in b/package/libecoli/Config.in
> new file mode 100644
> index 0000000000..765a8b9e5c
> --- /dev/null
> +++ b/package/libecoli/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBECOLI
> +	bool "libecoli"
> +	depends on BR2_PACKAGE_LIBEDIT
> +	help
> +	  libecoli is the best library to develop a CLI
> +
> +	  https://github.com/rjarry/libecoli/
> diff --git a/package/libecoli/libecoli.mk 
> b/package/libecoli/libecoli.mk
> new file mode 100644
> index 0000000000..7ade6666ff
> --- /dev/null
> +++ b/package/libecoli/libecoli.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# libecoli
> +#
> +################################################################################
> +
> +LIBECOLI_VERSION = 0.2.0
> +LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
> +LIBECOLI_INSTALL_STAGING = YES
> +LIBECOLI_LICENSE = BSD-3-Clause
> +LIBECOLI_LICENSE_FILES = license/bsd-3-clause.txt
> +
> +LIBECOLI_DEPENDENCIES = \
> +	host-pkgconf \
> +	libedit
> +
> +$(eval $(meson-package))
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
