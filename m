Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6FAC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA66F61130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA66F61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC709605CF;
	Fri, 20 Aug 2021 21:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id biXTE2iwV0iv; Fri, 20 Aug 2021 21:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 587556066F;
	Fri, 20 Aug 2021 21:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C40ED1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B019F4072B
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJzQeCKlC76c for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:04:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEA1B4072A
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:04:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fd65:b012:ebca:84c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 924D95FF67;
 Fri, 20 Aug 2021 23:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629493452;
 bh=T2OvlawjeLd5URjOcq2Qzjhmc/xLEBrzkQnM317f0F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KKNc+1zGWYYm9DeVYPUoJHotuILY0+NPcjjCvBdg5q67FMMv6SfeJbqSWBIWEQWa8
 f9c61VnLahFcdEv0blNzPC4/Xzk7nHOUi0DpUJUYMvKqPckWDfL9soHgryXd6ygBmW
 ybKKgAXri9IV7yu2WyEF+RGag7Nz9LmL8xLpXqan1PrSbb3ZDAkTFoqHipdyucTUGk
 CsA51LaFsdVbzdZQ9natEP22KjUoXB7Sfz+EA6b/4Jx2vcExkvdRLG27zgOQCa4Q5E
 zYAfU0CVL3GfswVap5pTuDrIAIw6qnWA5e1H3WE0TTkzxNV/GQpN1wGcRVYppLQ/Hh
 Q7XRUySwm2gKQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 23:04:05 +0200
Date: Fri, 20 Aug 2021 23:04:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210820210405.GU27036@scaer>
References: <20210820201313.953976-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820201313.953976-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: install polkit.loc to
 HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-20 22:13 +0200, Fabrice Fontaine spake thusly:
> Fix added by commit c20d31baf471daeeec50d62cb8baa79bac06fa51 is
> incomplete as polkit.loc must also be added to
> $(HOST_DIR)/share/gettext/its
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/170e4802b7b4e8e7dafa95ade549e8fd05e43bfd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/polkit/polkit.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index 23adb534d0..0c12a88601 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -41,11 +41,13 @@ else
>  POLKIT_CONF_OPTS += --with-authfw=shadow
>  endif
>  
> -# polkit.its is needed for gvfs and must be installed in $(HOST_DIR)
> +# polkit.{its,loc} are needed for gvfs and must be installed in $(HOST_DIR)
>  # and not $(STAGING_DIR)
>  define POLKIT_INSTALL_ITS
>  	$(INSTALL) -D -m 644 $(@D)/data/polkit.its \
>  		$(HOST_DIR)/share/gettext/its
> +	$(INSTALL) -D -m 644 $(@D)/data/polkit.loc \
> +		$(HOST_DIR)/share/gettext/its

The destination for "$(INSTALL) -D" must be a filename, not just the
directory, so I've fixed that for both the existing .its, and for the
.loc added by this patch.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  endef
>  POLKIT_POST_INSTALL_TARGET_HOOKS += POLKIT_INSTALL_ITS
>  
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
