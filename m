Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C12C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F7C610CE
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8F7C610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1C9683C82;
	Sun,  1 Aug 2021 12:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWmvTTqBdJOv; Sun,  1 Aug 2021 12:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3881183C95;
	Sun,  1 Aug 2021 12:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C156E1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B029040385
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxGh1qBKBZYG for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:09:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A382A4037D
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:09:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 456095FFAA;
 Sun,  1 Aug 2021 14:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819740;
 bh=s2xOeH+7y+RKn+G3xFij5+bUJlMZ8YCxmtAY8mESm8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7LeoMI3IGDe4h3SSrjW4hArlQIYkm51/QQHoPdZDVXpigYPdfT/QCkyZvnYo3lEv
 uw+Ae8/Q/D9ZBiRjZxbIiHJWr6GrYNeR+Q/kCxNeqwzusnas2YfJnHoRvTDTGCvdba
 1FoiyLJwIUfcDh6kS1AbKvDOEyx4CuW3z8QLfoCEj1IEZM21jO61gyMk2QGOm7iVuC
 1T5ZFiE5on/QUN4kcpJGwrstUTYYt/VzBbVGWNnrJNry8NF/tR+HiW7Hqj1P/9pYzW
 htW0BpvzxrLtc6thafpkRk+gbrH0t1Y/zYnwu/rAz2b6+18JBgMMGHp+xm1KHjbv34
 EC/GaTSM9NhEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:08:56 +0200
Date: Sun, 1 Aug 2021 14:08:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801120855.GX3189549@scaer>
References: <20210801114439.2763436-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801114439.2763436-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ulogd: add SELinux module
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 13:44 +0200, Fabrice Fontaine spake thusly:
> Support for ulogd is added by the services/ulogd module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ulogd/ulogd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
> index 1b86c12773..c00a53f3d5 100644
> --- a/package/ulogd/ulogd.mk
> +++ b/package/ulogd/ulogd.mk
> @@ -13,6 +13,7 @@ ULOGD_DEPENDENCIES = host-pkgconf \
>  	libnfnetlink
>  ULOGD_LICENSE = GPL-2.0
>  ULOGD_LICENSE_FILES = COPYING
> +ULOGD_SELINUX_MODULES = ulogd
>  
>  # DB backends need threads
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -- 
> 2.30.2
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
