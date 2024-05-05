Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C1C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 17:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C6560789;
	Sun,  5 May 2024 17:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtLo4cGfntFH; Sun,  5 May 2024 17:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFAED6078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFAED6078B;
	Sun,  5 May 2024 17:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5121BF3F2
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1554D402CE
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3anjpYm4qYD for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 17:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18EE1400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18EE1400C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18EE1400C6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 17:45:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1703213F8BA;
 Sun,  5 May 2024 19:45:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 19:45:20 +0200
Date: Sun, 5 May 2024 19:45:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjfFsFQfBr1FGfIL@landeda>
References: <20240504091515.365847-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504091515.365847-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714931124;
 bh=SuyClrQGAVzQuUXTyH7VH1vzeX4/3O5CncsGo0T2YMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CXWqQst9XwxxeF/Pe6ijBv+oCv1Rp4t3ICrZHn96SP0dt6fO2oPvLD+Ke8xk4plPU
 Gkqm+PjYT6BkBhIZ/7+oVIm7VVvgXFNC804ouKOJb5zz1zWO+AkQtEwP8YZjX7wows
 efYwG3pkNBzqnIftqAGNpx/MmpUeh3sGx/c0+Xk6dzFblJG3bDnEaCEXEA/J8MP7ex
 zVO1oQHYZ3McmJD/jBev34R5bIP5oLYSbbBqo6Dm+NnWSM3DOo/X2DTboTQVhXGRx+
 vA4PlnNX6KtOJyCv/sFPwx6+yyr832yTfeY4KI6y2amAgKy8xmpvSuRRKthxx3lJp1
 YnH8SmZlEr9YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CXWqQst9
Subject: Re: [Buildroot] [PATCH 1/1] package/libutempter: do not hardcode PIE
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-04 11:15 +0200, Fabrice Fontaine spake thusly:
> PIE will be set by buildroot if the user wants it so set LINK_PIE to an
> empty value to fix the following build failure raised since the addition
> of the package in commit 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b:
> 
> /home/buildroot/autobuild/run/instance-3/output-1/host/bin/m68k-linux-gcc -W -Wall -Waggregate-return -Wcast-align -Wconversion -Wdisabled-optimization -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0   -std=gnu99  -DLIBEXECDIR=\"/usr/lib\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wl,-z,relro -Wl,-stats   -fPIE -pie -Wl,-z,now  utempter.c -o utempter
> 
> [...]
> 
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/12.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> (.text+0x4): undefined reference to `__shared_flat_add_library'
> 
> Fixes: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
>  - http://autobuild.buildroot.org/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libutempter/libutempter.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
> index d51f70049c..b6e77449c6 100644
> --- a/package/libutempter/libutempter.mk
> +++ b/package/libutempter/libutempter.mk
> @@ -11,7 +11,7 @@ LIBUTEMPTER_LICENSE = LGPL-2.1+
>  LIBUTEMPTER_LICENSE_FILES = COPYING
>  
>  define LIBUTEMPTER_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LINK_PIE=

Why don't we also need to pass COMPILE_PIE= (empty) to also disable
-fPIE at compile time?

Regards,
Yann E. MORIN.

>  endef
>  
>  define LIBUTEMPTER_INSTALL_STAGING_CMDS
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
