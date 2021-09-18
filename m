Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B758FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C76460F51
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C76460F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 490C6401D1;
	Sat, 18 Sep 2021 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-PAHUGyWOqc; Sat, 18 Sep 2021 20:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50B5240108;
	Sat, 18 Sep 2021 20:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACC021BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D47081A92
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nsutluV6ABc for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEBA780F80
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:35:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DC6DBB0051B;
 Sat, 18 Sep 2021 22:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997307;
 bh=5rCtHvsk7oQEjsP9aiZwrkJYVZzLUUv5h02DjfXOGY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JIftV/fqpDiIjBrmnCQHOoXihIu62KuKArWFzDV+H8MxuJDUWFZkK/ChIPYPtysEU
 z9qbp7mNzsvtPxx6Dch8yBzLpF691AXKPFLYDkStXRbdYt0VEmhpDD9GLAVZMHNJMw
 JT7f6UHFBH4XysJhj95brVgO60pe843MQMONuIhHBkbSzbqE6FFEzm4Pol34ABCTX5
 LvN3fxp34HcO4uEEUbR5hdH2RjvZ8RtpFo552Of7s3QSQwCiqpADPew9VK5AiOynKO
 cEenRs/jKyMUXAKksMhqbZ74ciIul7/nw9BEx0OTuTgkGDEO4pAuytXmx0FjqPt9YK
 RqL1tFRwqJZ2w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:34:58 +0200
Date: Sat, 18 Sep 2021 22:34:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918203458.GU1053080@scaer>
References: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 22:07 +0200, Fabrice Fontaine spake thusly:
> autoreconf (and so AM_ICONV) is not needed since commit
> 2df32e0d4437b422175089edf1917219656fccef
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/minicom/minicom.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
> index b81ee52120..5cd1d6b8b8 100644
> --- a/package/minicom/minicom.mk
> +++ b/package/minicom/minicom.mk
> @@ -11,12 +11,9 @@ MINICOM_SITE = \
>  MINICOM_LICENSE = GPL-2.0+
>  MINICOM_LICENSE_FILES = COPYING
>  MINICOM_CPE_ID_VENDOR = minicom_project
> -MINICOM_AUTORECONF = YES
>  
>  MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
>  	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
> -# add host-gettext for AM_ICONV macro
> -MINICOM_DEPENDENCIES += host-gettext
>  
>  MINICOM_CONF_OPTS = \
>  	--enable-dfl-port=/dev/ttyS1 \
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
