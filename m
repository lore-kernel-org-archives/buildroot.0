Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A242C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:09:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2A3611EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA2A3611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6F6404E1;
	Fri, 10 Sep 2021 20:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBMuPAVroxpA; Fri, 10 Sep 2021 20:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D1F94061D;
	Fri, 10 Sep 2021 20:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED2A1BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2DE40360
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e32x-xi0ID5K for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:09:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F096A40346
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:09:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4FFE5200381;
 Fri, 10 Sep 2021 22:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631304545;
 bh=oydklHoesmjkPBoDmx9ivSw8Zf1AygWSFe5ZZh999Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mo+212MUti9+NZ1HnRDZlqK+ou7LDv57j+Dz0766MWQitYRotk/L62o9uTcTpHqGh
 AmStKAUC4zYiouGW4c8tcOcZjm1u8LbNpEZK3j8Pnzni/4q9KZZ5FTWOYSeVu7qheo
 ZQs9KVh2/wpUEojoB6XlA5+UaSBCSFSzobfJkpcL1uFCMvPzIfMR2AmhwWqyFDVwqh
 fp165c4j4Ekx8+5EixoM6zgvJaP8OhjInfODaUAL32EmawLwG8kXJymy09RxS5U8G5
 SA3vpqNkDnokhQQbaQvxfxcMiRZaMEYEEzRJ5icjrwoegXHPgClc7FbOhbC4hfYMD5
 /cQzowb/LguCw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 22:08:59 +0200
Date: Fri, 10 Sep 2021 22:08:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210910200859.GB1053080@scaer>
References: <20210910065305.100451-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910065305.100451-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: drop gr-flex option
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-10 08:53 +0200, Fabrice Fontaine spake thusly:
> gr-pager is not available since bump to version 3.8.0.0 in commit
> 0d6a7b2981d4ba83a95ff1c10a15970e41fabec2 and
> https://github.com/gnuradio/gnuradio/commit/2d2caa205f3c3059deab7c82660908656167fd90

I was confused about the discrepancy between gr-flex and gr-pager, so I
tweaked the comit log to explain it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy             | 8 ++++++++
>  package/gnuradio/Config.in   | 6 ------
>  package/gnuradio/gnuradio.mk | 6 ------
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 6f71575f8a..c550abf419 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,14 @@ endif
>  
>  ###############################################################################
>  
> +comment "Legacy options removed in 2021.11"
> +
> +config BR2_PACKAGE_GNURADIO_PAGER
> +	bool "gnuradio gr-flex support removed"
> +	select BR2_LEGACY
> +	help
> +	  gr-flex has been removed from gnuradio since version 3.8.0.0.
> +
>  comment "Legacy options removed in 2021.08"
>  
>  config BR2_PACKAGE_LIBMCRYPT
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 183b49fe9b..77163c611d 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -130,12 +130,6 @@ config BR2_PACKAGE_GNURADIO_FILTER
>  	help
>  	  Filter signal processing blocks
>  
> -config BR2_PACKAGE_GNURADIO_PAGER
> -	bool "gr-flex support"
> -	select BR2_PACKAGE_GNURADIO_ANALOG
> -	help
> -	  FLEX pager decoder implementation blocks
> -
>  config BR2_PACKAGE_GNURADIO_QTGUI
>  	bool "gr-qtgui"
>  	depends on BR2_PACKAGE_GNURADIO_PYTHON
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index d8292dac08..36d7ee65cf 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -130,12 +130,6 @@ else
>  GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
>  endif
>  
> -ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
> -GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=ON
> -else
> -GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
>  GNURADIO_DEPENDENCIES += qt5base python-pyqt5 qwt
>  GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
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
