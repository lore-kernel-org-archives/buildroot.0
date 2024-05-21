Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DFEC25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F6384064F;
	Tue, 21 May 2024 04:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkIdd1CjGj6w; Tue, 21 May 2024 04:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E732A40B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E732A40B8C;
	Tue, 21 May 2024 04:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE6EC1C4F7E
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A42F6817AF
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ4eHYKuBat6 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71BF581361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71BF581361
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71BF581361
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:59:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0228F13F86E;
 Tue, 21 May 2024 06:59:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 06:59:35 +0200
Date: Tue, 21 May 2024 06:59:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZkwqN40mf5fRPtUP@landeda>
References: <20240519072502.1142825-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240519072502.1142825-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716267582;
 bh=Im8KNK7j27g08RtQHoklXiLhI5X+sDVeUHPPxaRZPRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbKcxPrF9S+pcu/Pk0tdBvymeUG5g50ooY2wkz4zJCwxfjlJUT2YegM1ZNXwVX2Yu
 KsJeVKb6wQvAL+XaCQMjbDQB5yWF//bjb5a36wZvoNNqzbp0tUdxdIQG2PYo80l6Zu
 +c2F3Eiprj3rIabrvYEY6ZLEoufVQnZSXre9FM/vq565G0J+DAD1X4ezSGLz5eMZoN
 Do7CzOYWTDb1deJhMj6V1auB9XoFaBnM6M7smee5jBjOy3y4mjay1uFgkUtLFl9Fbb
 68/sAgUdsiItrAfydIVRyvLxZLKckfurp+JkQ+iwp6hvb4ov/TCSGzPj72cdGJ+N1C
 Y6CUoi3iduBaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kbKcxPrF
Subject: Re: [Buildroot] [PATCH v3] package/zxing-cpp: add options for
 enabling readers and/or writers
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
Cc: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-05-19 09:25 +0200, Dario Binacchi spake thusly:
> The patch allows you to choose whether to build encoding (BUILD_WRITERS),
> decoding (BUILD_READERS) or both. At least one of the two options must
> be enabled. This way, it's possible to keep the library size at minimum.
> By default, to ensure backward compatibility, both are compiled.
> 
> Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
> - Add 'select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS'
>   and drop comment.
> - Add Co-Developed-by tags
> 
> Changes v1 -> v2:
> - Drop BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS selection
> 
>  package/zxing-cpp/Config.in    | 17 +++++++++++++++++
>  package/zxing-cpp/zxing-cpp.mk | 14 ++++++++++++--
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
> index b72a00ec35f9..e5b8cfcdd8aa 100644
> --- a/package/zxing-cpp/Config.in
> +++ b/package/zxing-cpp/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_ZXING_CPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_STB
>  	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS
>  	help
>  	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
>  	  multi-format 1D/2D barcode image processing library
> @@ -17,3 +18,19 @@ config BR2_PACKAGE_ZXING_CPP
>  	  compiles the C++ port.
>  
>  	  https://github.com/zxing-cpp/zxing-cpp
> +
> +if BR2_PACKAGE_ZXING_CPP
> +
> +config BR2_PACKAGE_ZXING_CPP_READERS
> +	bool "readers support"
> +	default y
> +	help
> +	  Build with readers (decoders) support
> +
> +config BR2_PACKAGE_ZXING_CPP_WRITERS
> +	bool "writers support"
> +	default y
> +	help
> +	  Build with writers (encoders) support
> +
> +endif # BR2_PACKAGE_ZXING_CPP
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index 86a1ef96806d..077d7e75d3dd 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -12,8 +12,6 @@ ZXING_CPP_INSTALL_STAGING = YES
>  ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
>  ZXING_CPP_DEPENDENCIES = host-pkgconf stb
>  ZXING_CPP_CONF_OPTS = \
> -	-DBUILD_READERS=ON \
> -	-DBUILD_WRITERS=ON \
>  	-DBUILD_BLACKBOX_TESTS=OFF \
>  	-DBUILD_UNIT_TESTS=OFF \
>  	-DBUILD_DEPENDENCIES=LOCAL
> @@ -28,4 +26,16 @@ else
>  ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
> +ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
> +else
> +ZXING_CPP_CONF_OPTS += -DBUILD_READERS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZXING_CPP_WRITERS),y)
> +ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=ON
> +else
> +ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=OFF
> +endif
> +
>  $(eval $(cmake-package))
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
