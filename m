Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B69C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067D1408AA;
	Sat, 15 Jun 2024 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlO73zYOO3Aa; Sat, 15 Jun 2024 19:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1DDB408A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DDB408A8;
	Sat, 15 Jun 2024 19:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 617D61BF306
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53BFD4060E
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeqhBq-KhqdH for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3AAF4044D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3AAF4044D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3AAF4044D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:55:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4FE9113F89A;
 Sat, 15 Jun 2024 21:55:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 21:55:28 +0200
Date: Sat, 15 Jun 2024 21:55:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zm3xsIaMg8XMn0Ob@landeda>
References: <20240615075619.2410679-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615075619.2410679-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718481331;
 bh=urG3aKwLsYMCm7mS7wvN8v0HjoHXxN9Z7u+k8aPSnxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8Qi81BDXe3cqLGIH1DyO6Tt+MOzM49o+8E1Nfheode9N2Upc1CozaIrkWovLsRti
 yN2c+Iz8Pew1p1wCMnKjfp4WD8UTylQiRDX9DUlI36q9KNDn/GYpBRb4ta8C1rUW30
 RUcwbMDORytZQj9LtpOsKWs1dgaSQ0WpXRmM1NtvYYyhssSinExNKIjtbIe8PSvlb/
 TLSYZ/uqIJ0qlF/wEAfLRIeQngRNcc3BXI6ZQ0xclRNe1haeSWNuhuRznU6+H6Wxqf
 5fWD7nQawP0zmdZCKi6RfCpLmz6MNnFw2xeCTj3XPwy88xVaboEEUpjVqJPROncIK3
 Rhm/qgUTH6cbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c8Qi81BD
Subject: Re: [Buildroot] [PATCH 1/1] package/execline: fix uclibc build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-06-15 09:56 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failure raised since bump to version
> 2.9.5.1 in commit 42fad03182ed53de8003b66d50e893f42b72145e and
> https://github.com/skarnet/execline/commit/6dfe54be869c117676dcc004400ac68096945531:
> 
> src/execline/eltest.c: In function 'eltest_run':
> src/execline/eltest.c:366:31: error: 'struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
>   366 |       return timespec_cmp(&st.st_mtim, &st.st_atim) > 0 ;
>       |                               ^~~~~~~
>       |                               st_mtime
> 
> Fixes: 42fad03182ed53de8003b66d50e893f42b72145e
>  - http://autobuild.buildroot.org/results/64bf2928f36e07332052854cbaaa7a6f8f347e29
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/execline/execline.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/execline/execline.mk b/package/execline/execline.mk
> index 842ded6b88..b3d2d98216 100644
> --- a/package/execline/execline.mk
> +++ b/package/execline/execline.mk
> @@ -12,6 +12,7 @@ EXECLINE_INSTALL_STAGING = YES
>  EXECLINE_DEPENDENCIES = skalibs
>  
>  EXECLINE_CONF_OPTS = \
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \

    $ man 3type stat
    [...] glibc exposes the nanosecond component names if
    _POSIX_C_SOURCE is defined with the value 200809L or
    greater, or _XOPEN_SOURCE is defined with the value 700
    or greater.

In uClibc-ng, they are guarded by __USE_MISC, which is defined by
_BSD_SOURCE || _SVID_SOURCE, which are each stated to be equivalent
to defining _POSIX_C_SOURCE to 200809L or greater.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	--prefix=/ \
>  	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
>  	--with-include=$(STAGING_DIR)/include \
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
