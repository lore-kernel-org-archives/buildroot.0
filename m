Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC58FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A9A608A3;
	Sun,  7 Apr 2024 12:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnrR2oMy4Vlk; Sun,  7 Apr 2024 12:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA58608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA58608A5;
	Sun,  7 Apr 2024 12:19:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5BE1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58D9640361
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysYeKq1pqWTO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:19:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10B5F407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B5F407CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10B5F407CA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:19:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED75513F89A;
 Sun,  7 Apr 2024 14:19:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 14:19:14 +0200
Date: Sun, 7 Apr 2024 14:19:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhKPQg5bfmEpx0Ji@landeda>
References: <20240407100012.595352-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407100012.595352-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712492357;
 bh=MBRosDDZGstsPkT9ok3Ex5fR8s4UAIpVFBXDSwRPvTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ptp5GEzlQ96YM4jk8Cihft1oO15SvzUzgOYZJ1uG6zMGJMZQydOoneeyB4vROdN2O
 rk2ciMUWgaLJ9or8lMhhP+8QFeDW++UWvyz1EYiNhuqrGKt9cEebApt42TRGpOuGAh
 NirLMq3jmBnleAqZHmPuezNxyQeh/EN0r8UZDedfxeO7C75GZJVV5KrxukOc90BUjK
 OmE9UTw+lXgrAS+Uo59bOzQHG6UHy0YTIAzjcYyHEc/4J3o22JndmzOtNfk49/4y45
 kQkncmkoYMnGodot8KoO8c/11nuKbNdYeIk5MdByUPXbQ5n6uYOlCgr9QqhFHxsPuk
 HB2E0V7ey1WdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ptp5GEzl
Subject: Re: [Buildroot] [PATCH 1/1] package/quagga: add libxcrypt optional
 dependency
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

Fabrice, All,

On 2024-04-07 12:00 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ../lib/.libs/libzebra.so: undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/984572031cedd124f48b5a5bc5abe6096d22eaf3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/quagga/Config.in | 1 +
>  package/quagga/quagga.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/quagga/Config.in b/package/quagga/Config.in
> index 9427475d03..9361b6a212 100644
> --- a/package/quagga/Config.in
> +++ b/package/quagga/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_QUAGGA
>  	bool "quagga"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Routing software suite, providing implementations of OSPFv2,
>  	  OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 97297baff8..5d8d52263a 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -33,6 +33,10 @@ else
>  QUAGGA_CONF_OPTS += --disable-capabilities
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +QUAGGA_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
>  QUAGGA_CONF_OPTS += --enable-protobuf
>  QUAGGA_DEPENDENCIES += protobuf-c
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
