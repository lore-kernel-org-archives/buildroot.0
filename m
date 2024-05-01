Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D188EC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E08E416DB;
	Wed,  1 May 2024 16:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id palsq6lQJMxa; Wed,  1 May 2024 16:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85983416EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85983416EA;
	Wed,  1 May 2024 16:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1D0E1BF28C
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE644416DF
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01BQ5TBkfrXh for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 16:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC98B400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC98B400FB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC98B400FB
 for <buildroot@buildroot.org>; Wed,  1 May 2024 16:27:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2523D13F81D;
 Wed,  1 May 2024 18:27:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 18:27:55 +0200
Date: Wed, 1 May 2024 18:27:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZjJti-jB5kNg511a@landeda>
References: <ZjI4anypCjkVxtjO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjI4anypCjkVxtjO@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714580878;
 bh=4+YJZwqvKlSvJx7/GSFZmafWztaEWkvig8j4M6jamrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CMQT1NCVoH1a1xSt5+QiGL9DdUcTtDF33cfaMmAvlAbNPF18/0IUhZ7IMXwBzt888
 DUG7c3sJ9u2G4hNuF0aTcIEvXYO2SnbBz7hZVNIQdaBoJti+l1BFhhqomRWUbVZcRZ
 Be84vVMauAXOSBT5bjq6zoBlvwCEJhDRspdyhFpxXnHiZQ4GNRi51XISO7hwgpwtsm
 1/wbK0tm+P2xoaQAo9r5qemkbx/2h5TdV35qL57lGxVspfvthlTxc0WNuWkWpPpDCU
 jaMN8qMo6Ufdm5JBnznvk7U8ea4VOaeJVQtgqwj+3c0hBBGWEZ6DFf0de5hRAz3YEA
 duiv6a+XMpuyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CMQT1NCV
Subject: Re: [Buildroot] [PATCH v2] package/asterisk: fix compile issue
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

Waldemar, All,

On 2024-05-01 14:41 +0200, Waldemar Brodkorb spake thusly:
> Fix a compile issue when libyuv and libjpeg is enabled.
> Detection of following function fails:
> checking for pjsip_dlg_create_uas_and_inc_lock in -lpjsip... no
> 
> In config.log you see that libjpeg is missing.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/7bed9fc68fc9331ad12942c3eab9742ee8a7a4c4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  v1->v2: package libjpeg must be enabled, too
> ---
>  package/asterisk/asterisk.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 33d2e78bcf..c37aa5ec9d 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -113,9 +113,15 @@ ASTERISK_CONF_ENV = \
>  
>  # Uses __atomic_fetch_add_4
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -ASTERISK_CONF_ENV += LIBS="-latomic"
> +ASTERISK_LIBS += -latomic
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBYUV)$(BR2_PACKAGE_JPEG),yy)
> +ASTERISK_LIBS += -ljpeg
> +endif
> +
> +ASTERISK_CONF_ENV += LIBS="$(ASTERISK_LIBS)"
> +
>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  ASTERISK_CONF_OPTS += --with-execinfo
>  else
> -- 
> 2.39.2
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
