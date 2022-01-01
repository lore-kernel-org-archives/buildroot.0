Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FBEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE3940184;
	Sat,  1 Jan 2022 21:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN3SwCu1GOnb; Sat,  1 Jan 2022 21:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D4BB40186;
	Sat,  1 Jan 2022 21:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6659E1BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544D9813FA
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbnU6Pk5C-7j for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:35:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D30F813E6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:35:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4fc:e29e:bbe2:a373])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DD2212003B4;
 Sat,  1 Jan 2022 22:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641072908;
 bh=J351DHUFX+kq6KuGWTWKNveAcpLoaoNkVkSsgaPQAcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGSPFHyFC7EFXL4eIfPyFy8ZUPVgqLHEXaC+SF4bDEOudyPuFmDVtwOXp/J7LmVPD
 rKFn1vEwyNdNACs/XCtJcHF3XZltGoHhdUZw3gRM59L7PAzmdh2LZl+f2ZjAUavQHw
 bbFHxDZYNHDj3Mwv8q/oJxcnkmxdP4F1MQtssy4RRyWW9UhFPwXnJeKoLSvnn/lSaR
 O90CjgG27oubCKMK0T+LOSgIJiIVccAimjw2WIstwn9GsPKm7AHXP1q6OLmUDtiqUn
 h53Le1aXzhIhnf23DB9csJVyzmCWzvyiBM0H0BiR2eNNSddqziK/w6IHCJSPHfrgMZ
 yZfq1mb+t4zPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 22:34:59 +0100
Date: Sat, 1 Jan 2022 22:34:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220101213459.GB69135@scaer>
References: <20220101210952.2148256-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220101210952.2148256-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure with make
 version 4.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-01-01 22:09 +0100, Giulio Benetti spake thusly:
> Make 4.3 is buggy and when parallel building host-libnss/libnss we end up
> with a failure thrown by make itself. So let's work-around this by don't
> parallel build the package if Make version is 4.3.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.mk | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index e2f7521b47..b6279fa921 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -15,6 +15,13 @@ LIBNSS_LICENSE_FILES = nss/COPYING
>  LIBNSS_CPE_ID_VENDOR = mozilla
>  LIBNSS_CPE_ID_PRODUCT = nss
>  
> +# Don't parallel build if make version = 4.3
> +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
> +LIBNSS_MAKE = $(MAKE1)
> +else
> +LIBNSS_MAKE = $(MAKE)
> +endif
> +
>  LIBNSS_CFLAGS = $(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),y)
> @@ -71,12 +78,12 @@ endif
>  endif
>  
>  define LIBNSS_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
> +	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
>  		$(LIBNSS_BUILD_VARS)
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
> +	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
> @@ -131,12 +138,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
>  endif
>  
>  define HOST_LIBNSS_BUILD_CMDS
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
> +	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
>  		$(HOST_LIBNSS_BUILD_VARS)
> -	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
> +	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
> -- 
> 2.25.1
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
