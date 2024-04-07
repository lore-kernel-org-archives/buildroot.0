Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEAECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A43D409C4;
	Sun,  7 Apr 2024 08:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG74keD4EVqa; Sun,  7 Apr 2024 08:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4665B4064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4665B4064F;
	Sun,  7 Apr 2024 08:52:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14A051BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A89A8404A0
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHjmXf_B4WJb for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE69E40B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE69E40B01
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE69E40B01
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8D63613F8B8;
 Sun,  7 Apr 2024 10:52:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:52:29 +0200
Date: Sun, 7 Apr 2024 10:52:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJezTXYvCnWwed1@landeda>
References: <20240404205004.1797452-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404205004.1797452-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479951;
 bh=bXUKd74ceEmDj9i1BWfzglx7UAWI2QWLxUSdZ/ZU3BA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nf2/fwqIsIHf+5Ar8Ps2WBcc+uXr/LYxQaIncYd2MRhw3jBhXFU3pdcwcSzzdd4pS
 1i/hjhw9EMlxWbRikshyoJT2xP2/3APR7OzlaTt4ZSGCegZxWGBp2hBv9KfwqKMv1p
 oEitAC/pp/d8LJaZMuz7a06Te7TjWkIUfKMiDXl1nGyux+4ISFS3dnQTC5zRrMkfER
 ZMWa4KbPYXAMXEZ4Dd7tkzzS6qSwszal1okIAptVbOL7L0hTPWwRAGo9g65I1NQ43C
 nz3q33mh1IrIHbHSpIM82zsV8TAaFGEujlvjUnUoCYqrE7Ki1vYl8IVGCQrpf2bdBU
 TQpmOan4gKdZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nf2/fwqI
Subject: Re: [Buildroot] [PATCH 1/1] package/uhttpd: add libxcrypt optional
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

On 2024-04-04 22:50 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: CMakeFiles/uhttpd.dir/main.c.o: in function `main':
> /home/autobuild/autobuild/instance-4/output-1/build/uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c/main.c:437:(.text.startup+0x628): undefined reference to `crypt'
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/ccd789b301b6ddcca1b29e26d5cc48d54427a001
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uhttpd/Config.in | 1 +
>  package/uhttpd/uhttpd.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
> index 8d5d8bee13..eeb169a96d 100644
> --- a/package/uhttpd/Config.in
> +++ b/package/uhttpd/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_UHTTPD
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBUBOX
>  	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  uHTTPd is a tiny single threaded HTTP server with TLS, CGI
>  	  and Lua support. It is intended as a drop-in replacement for
> diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
> index ba8e13ccb8..f4fcccfa67 100644
> --- a/package/uhttpd/uhttpd.mk
> +++ b/package/uhttpd/uhttpd.mk
> @@ -11,6 +11,10 @@ UHTTPD_LICENSE = ISC
>  UHTTPD_LICENSE_FILES = uhttpd.h
>  UHTTPD_DEPENDENCIES = libubox json-c
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +UHTTPD_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>  UHTTPD_DEPENDENCIES += lua
>  UHTTPD_CONF_OPTS += -DLUA_SUPPORT=ON
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
