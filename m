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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0B3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1158661057
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1158661057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED6D605AA;
	Sun,  1 Aug 2021 13:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L61w_nEhQPw0; Sun,  1 Aug 2021 13:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E4C605A9;
	Sun,  1 Aug 2021 13:58:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 084BC1BF333
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA85C832A9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQMcBNZyv23x for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:58:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1104B835ED
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:58:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 81DA75FF7A;
 Sun,  1 Aug 2021 15:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627826330;
 bh=O9BJw8OVMXWktksDl03cqQdPdaCSNX9VFp8Se1Ua+HA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ax2gVfvVPkx+EAD7rpzs3+HH30/nSUqUYSxW98KEGeVHxaf9Q7SY2D1NzFKLuBTd0
 A+g+D4ZgIhOvXqQ6hJTM0Td2cs7zTg7ojxycNGfZHOh9RwO/+m8vDB55nVvzKl5Epn
 Rt94ve2BE51LvNwPIk5czpo87feZCes3fkN/TvsSi89gPNfOyR5gLzkIE53hi0wGPT
 8RrbQXBmb2JxQb+HL1mAveVHf0AKzT+fkYkToSK5pFypkRUNN3FnSuIVozUbpDAC9t
 zW5WVXZ7PvHgigzklPpirlAJCxQkeGxw/bW9JZxgnBUZNY+AqizOJIfBgFbrfXvfM6
 lBWa2bP+PumBQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 15:58:46 +0200
Date: Sun, 1 Aug 2021 15:58:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801135846.GA3189549@scaer>
References: <20210801122017.3060928-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801122017.3060928-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/quagga: add SELinux module
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

On 2021-08-01 14:20 +0200, Fabrice Fontaine spake thusly:
> Support for quagga is added by the services/zebra module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/quagga/quagga.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index adf8085054..97297baff8 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -11,6 +11,7 @@ QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
>  QUAGGA_LICENSE = GPL-2.0+
>  QUAGGA_LICENSE_FILES = COPYING
>  QUAGGA_CPE_ID_VENDOR = quagga
> +QUAGGA_SELINUX_MODULES = zebra
>  
>  # We need to override the sysconf and localstate directories so that
>  # quagga can create files as the quagga user without extra
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
