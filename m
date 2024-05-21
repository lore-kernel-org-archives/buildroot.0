Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB64C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C71AF40106;
	Tue, 21 May 2024 04:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLtAjT2BtQog; Tue, 21 May 2024 04:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A04CC40350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04CC40350;
	Tue, 21 May 2024 04:56:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B45331C4F68
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF50C4040A
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QKbOwC7S0OB for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:56:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAAB340106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAAB340106
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAAB340106
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:56:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EA8F113F899;
 Tue, 21 May 2024 06:56:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 06:56:51 +0200
Date: Tue, 21 May 2024 06:56:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zkwpk9HrTZu_CfHc@landeda>
References: <20240520080706.32223-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520080706.32223-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716267414;
 bh=oCDZvJejxjQQujmxmtdWO4pIm9L4s6hGnRRYon9uzQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SP0KuVq0FZXFxsp79VAAKL6Affj5TkYXFqKwFBfJbKeS3yEin8KIqeybvnaeQiwpR
 RMqsDmeCYLUyx02E32Psukg+CvS6/YxapJprl4Z5c8AtuIrfovamJyWj9pOvviuXeT
 0mbOSHKlwGuK7lWkHdksXH/5/ge1SC66FAAylQI5J60TKxtsyEfl0bE6eZvnEznME7
 TlA9kZD1dvGPOJWSWT28ftYe+xMG9+Q3DZR8b4HbXT/kqePEScCqxTwfxEIenXFEbs
 EdEemW24O4cGZokb3fAlu4UYYNmsdo0NcLEV1MRhWE83JcAcXFR44YsaniKyMD1EZY
 sfhnNeeBHhC8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SP0KuVq0
Subject: Re: [Buildroot] [PATCH 1/1] package/lmdb: fix static build
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

On 2024-05-20 10:07 +0200, Fabrice Fontaine spake thusly:
> Fix the following static build failure raised since the addition of the
> package in commit eb60c4054c25129d78651a66d1e7554aff04767f:
> 
> __uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> 
> Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
>  - http://autobuild.buildroot.org/results/e2bc8c35a10b6513c5605954e93b5b8a1ec7654b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lmdb/lmdb.mk | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
> index dafe7332cb..13e3235267 100644
> --- a/package/lmdb/lmdb.mk
> +++ b/package/lmdb/lmdb.mk
> @@ -10,21 +10,31 @@ LMDB_LICENSE = OLDAP-2.8
>  LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
>  LMDB_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LMBD_ILBIBS += liblmdb.a
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LMBD_ILBIBS += liblmdb.so
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +LMBD_ILBIBS +=  liblmdb.a liblmdb.so
> +endif

    $ ./utils/docker-run make check-package
    package/lmdb/lmdb.mk:14: possible typo: LMBD_ILBIBS -> *LMDB*
    package/lmdb/lmdb.mk:16: possible typo: LMBD_ILBIBS -> *LMDB*
    package/lmdb/lmdb.mk:18: possible typo: LMBD_ILBIBS -> *LMDB*

> +LMDB_MAKE_OPTS += ILIBS="$(LMBD_ILBIBS)"

Since I had to fix the LMBD typo, I also dropped LMDB_MAKE_OPTS, because
it is not the whole of the make options anyway (missing XCFLAGS), and I
directly passed ILIBS along XCFLAGS, below.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  define LMDB_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
> -		XCFLAGS="$(TARGET_CFLAGS)"
> +		$(LMDB_MAKE_OPTS) XCFLAGS="$(TARGET_CFLAGS)"
>  endef
>  
>  define LMDB_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
> -		DESTDIR="$(STAGING_DIR)" \
> +		$(LMDB_MAKE_OPTS) DESTDIR="$(STAGING_DIR)" \
>  		prefix=/usr \
>  		install
>  endef
>  
>  define LMDB_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
> -		DESTDIR="$(TARGET_DIR)" \
> +		$(LMDB_MAKE_OPTS) DESTDIR="$(TARGET_DIR)" \
>  		prefix=/usr \
>  		install
>  endef
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
