Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2EDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BE761242
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3BE761242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D53606DE;
	Sun, 19 Sep 2021 07:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGKXuiEaxUIU; Sun, 19 Sep 2021 07:03:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9BC606D3;
	Sun, 19 Sep 2021 07:03:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE7791BF341
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4164401D1
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9RkpVlLEm6j for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:03:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92D5A401B1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:03:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 46BACB0053F;
 Sun, 19 Sep 2021 09:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632035033;
 bh=HK4gmlAZ1JhAcLBhWEvSTFg2tdRpJRartB4IwLYMYbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7bRxEPVoGLoDTI0za34rF/CM+1/qLr57iLQusHj4BOMyoWkEVcadydC7n0eqshEQ
 VLLS5OczUvuNFxaHpezUdxTDFTntNY/OlAauKHbp/82rmVyHsxAHOvVsT70yCtPgqB
 cZAzdTEJ03H42fZf1dHTtMJ1DxxxIGhR/NtkwH77EYtmJfCiSrZ+Nl8BuMS/ARCmnu
 z8mWCWPhuV+0mDheOlT9fejWdZIsGCsmMxB1RpkV3WHzl0xrn4oC+kkoHl5suXFB1G
 0k52T1AusJ709xHpyUFFM0D1N0T9bDmWDv1cOjxbtT6Si6UqLxHp5LLfVKj30Z6GX5
 zcs7XyOd9kaxw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 09:03:45 +0200
Date: Sun, 19 Sep 2021 09:03:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919070345.GD1053080@scaer>
References: <20210918213736.1233777-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918213736.1233777-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cdrkit: drop host variant
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-18 23:37 +0200, Fabrice Fontaine spake thusly:
> host variant is not used by any packages since commit
> 7f303516f69a143c2ecc317948ec1934a195235c

Really?

    $ git grep host-cdrkit
    fs/cloop/cloop.mk:ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit

(granted, there was no reason to believe cloop would use it.)

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cdrkit/cdrkit.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
> index 67814f1418..21c11db227 100644
> --- a/package/cdrkit/cdrkit.mk
> +++ b/package/cdrkit/cdrkit.mk
> @@ -8,7 +8,6 @@ CDRKIT_VERSION = 1.1.11
>  CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
>  CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
>  CDRKIT_DEPENDENCIES = libcap bzip2 zlib
> -HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
>  CDRKIT_LICENSE = GPL-2.0
>  CDRKIT_LICENSE_FILES = COPYING
>  
> @@ -28,4 +27,3 @@ CDRKIT_CONF_OPTS += -DUSE_MAGIC=OFF
>  endif
>  
>  $(eval $(cmake-package))
> -$(eval $(host-cmake-package))
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
