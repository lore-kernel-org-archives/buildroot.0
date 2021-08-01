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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD38C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382F3610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 382F3610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 161F74033E;
	Sun,  1 Aug 2021 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYvCWKp7h-lo; Sun,  1 Aug 2021 12:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC344032D;
	Sun,  1 Aug 2021 12:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E84F61BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6820605F0
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXcg6lHIJlYj for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:08:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B2CE605BA
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:08:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 613E95FFA8;
 Sun,  1 Aug 2021 14:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819713;
 bh=mrRiJy8M9HwQ45prz5vwEBDW7N+RQDGAqAvZ6X7Pvkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TxvZOXK1RrjHk12F7EyxWhoyIXFEy2Qgk3i0qadLrSiB1ROoA8wzyQp3RF55sHdyb
 /RaUC5w7/EhDF6GZ4cR1ORxbxQLXsNli7WsEhlE4p1I1JcPQHR5XszY8XhuoAcRH3x
 IrcUF2B792sHB4krG2MD0rHKa0PsTnNOggZ14qAsxnXSykoFeixuuxBLsINQMG94ZD
 0MD/66dIbdOh0UFNFljhDYeAXNYbulDKYpID80am7JJxzXBMN/JPB3j8vOKYlaHHbd
 cXzi71S6ndhgnCbtWwoReFFNY0aC0XekPpuXi9JDZFc8D7MQwwRErrETZtrTUuwTgr
 xyqMsk5pfaW7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:08:29 +0200
Date: Sun, 1 Aug 2021 14:08:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801120829.GV3189549@scaer>
References: <20210801114317.2763207-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801114317.2763207-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/smartmontools: add SELinux
 module
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

On 2021-08-01 13:43 +0200, Fabrice Fontaine spake thusly:
> Support for smartmontools is added by the services/smartmon module in
> the SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/smartmontools/smartmontools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
> index 215db1ae69..2e2bbcd4e2 100644
> --- a/package/smartmontools/smartmontools.mk
> +++ b/package/smartmontools/smartmontools.mk
> @@ -9,6 +9,7 @@ SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smar
>  SMARTMONTOOLS_LICENSE = GPL-2.0+
>  SMARTMONTOOLS_LICENSE_FILES = COPYING
>  SMARTMONTOOLS_CPE_ID_VENDOR = smartmontools
> +SMARTMONTOOLS_SELINUX_MODULES = smartmon
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
>  SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
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
