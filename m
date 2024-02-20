Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4DCC48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 20:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF74760BE4;
	Tue, 20 Feb 2024 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VgR8vrwlHDHD; Tue, 20 Feb 2024 20:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D139460BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D139460BF4;
	Tue, 20 Feb 2024 20:44:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA24B1BF33E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E474B820B6
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n26F4fHjQ5oD for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 20:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B161B820AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B161B820AD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B161B820AD
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 20:44:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E238A13F81D;
 Tue, 20 Feb 2024 21:44:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 21:44:15 +0100
Date: Tue, 20 Feb 2024 21:44:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZdUPH27hCR4--tg7@landeda>
References: <20240220195007.380433-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220195007.380433-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708461859;
 bh=b4UukM2/yZ47MUZptANWodczewQCXbDA1EE9KbHP/Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sosF1DEXUe5DBvOClBynm2hgI1RrLqmhkBeah+ldnsLjKqMq6DaxE7QcFzrEq4guW
 kfJp/UHv46ZUj9agZqrkSgsUGRCfBu2pxiYt5IR3ofJJLT0P+U5hC+PFLiqy41F0I2
 kqwXayUfDzsplwQXxxjoDk9L1RVI42TuiTLWGPxOup27aTzudF81QtF8WzcGHLWaMU
 zpCcUoDS78CEfWFnb3HfD3We1rApdAm0nZ4CvReEczQ8rge+tHNlyuZ1JJZnK56i+7
 TKicvbIgkvBIwE9hAOW0P1B94krO+aPnd7W/8IeNN+a3YE7CBvvAhk5SOAkO16Nohl
 1tonvReDQZA6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sosF1DEX
Subject: Re: [Buildroot] [PATCH 1/1] package/uacme: fix build
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
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-20 20:50 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 1.7.5 in
> commit b7ee5f3b0e3ef703bafd007cc99da10312d99b9e and
> https://github.com/ndilieto/uacme/commit/fe826f4b1931ae508047d8b2693b5b6ac2cb21fd:
> 
> checking if mmap(MAP_ANON|MAP_SHARED) works... configure: error: in `/home/autobuild/autobuild/instance-9/output-1/build/uacme-1.7.5':
> configure: error: cannot run test program while cross compiling
> 
> Fixes: b7ee5f3b0e3ef703bafd007cc99da10312d99b9e
>  - http://autobuild.buildroot.org/results/9715ade98f4894c07b640d151daa41813d2bec3a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
> index f02e522761..cd670ee951 100644
> --- a/package/uacme/uacme.mk
> +++ b/package/uacme/uacme.mk
> @@ -12,6 +12,8 @@ UACME_SITE = $(call github,ndilieto,uacme,upstream/$(UACME_VERSION))
>  UACME_LICENSE = GPL-3.0+
>  UACME_LICENSE_FILES = COPYING
>  UACME_DEPENDENCIES = libcurl
> +# We're patching configure.ac

I've slightly reworded this comment to reference the patch filename, so
that's it is easier to notice when the patch is dropped that we should
also drop autoreconf.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +UACME_AUTORECONF = YES
>  
>  UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
>  
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
