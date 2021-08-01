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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D462CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A835610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A835610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F29606DF;
	Sun,  1 Aug 2021 13:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_9KBhAwmWKx; Sun,  1 Aug 2021 13:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711096074A;
	Sun,  1 Aug 2021 13:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 383F11BF20B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26562400FC
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BadKx797ERKG for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:59:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C61A6400D2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:59:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 191945FFA8;
 Sun,  1 Aug 2021 15:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627826356;
 bh=cV6fjAG2j/D6xCukvh5biLMtXMznDVZpT3FZIAOWtGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODvu3+TaN0iDu+dtk70z9ZwqSOM4P/7uqIJwEq3yjz9NwJ3her6PZ8K5ozbx7X1Wh
 EgA+WkL5yHXWEMmtDiOLDOcEerabiFLDdAy11J+2kMDdwX6zy5T2US8JyKu3f4yE9e
 HMjBo9tUZdWIHb3mSRoFE3A9Xd2Er9C7ycVj9Rg+St7SPYO7AXaFAe4stXae0f5OmS
 jOs886uyiePh9l9j3nGdrUxfAr5298cZSLclNBi5pl1ZU3jj/Pmkf/7/ATOB6gvatN
 ldub7Q4rNP6aU5sDUm9ydNkaKARoK7y0ENU6XMF660HEsxvvADxIuuGlqwz949FkIY
 Lrv0TQTxfJbpQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 15:59:07 +0200
Date: Sun, 1 Aug 2021 15:59:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801135907.GB3189549@scaer>
References: <20210801122117.3061059-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801122117.3061059-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/vnstat: add SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Rodrigo Rebello <rprebello@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 14:21 +0200, Fabrice Fontaine spake thusly:
> Support for vnstat is added by the services/vnstatd module in the
> SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/vnstat/vnstat.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
> index c5836cf037..7f5ff67b82 100644
> --- a/package/vnstat/vnstat.mk
> +++ b/package/vnstat/vnstat.mk
> @@ -8,6 +8,7 @@ VNSTAT_VERSION = 2.7
>  VNSTAT_SITE = http://humdi.net/vnstat
>  VNSTAT_LICENSE = GPL-2.0
>  VNSTAT_LICENSE_FILES = COPYING
> +VNSTAT_SELINUX_MODULES = vnstatd
>  VNSTAT_DEPENDENCIES = host-pkgconf sqlite
>  VNSTAT_CONF_OPTS = --disable-extra-paths
>  
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
