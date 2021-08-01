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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A98FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AE3610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0AE3610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C300740389;
	Sun,  1 Aug 2021 12:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFPSnj2ZoJpO; Sun,  1 Aug 2021 12:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1684038E;
	Sun,  1 Aug 2021 12:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB8A1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1084D605F2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqsk4cIeooz2 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:08:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 309C2605F0
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:08:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7B12C5FF9D;
 Sun,  1 Aug 2021 14:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819728;
 bh=6ICpw1WypeDRjgR6JEoMXYGQr2mEbsN43xUI9y+muc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7j68S96ZzpG0XnXefo1tYGxpC7xFOwxhqtWA2kcVF7D8aXwn7B7uSqBd9ZHG1rzv
 0nZ+39QZT37d4ds1sK3Zv2Q9bfH/J04XZFwo9rWAzSCeRwGUdSoxC0IOM6R/2BPLO/
 Om2+gA6xl6i/73OZQ+rPtfROcvwj5/8g/+ci60PgP7sqXysYKw1CxM+bDYtGjQ1ML8
 B7s3R2R8gCdTL1dVS+hoYLnlXfCQ4kkw+zmCX6lRRzaoigC0DAAluDKcxORZlAGzem
 y59AtVoBy/zdvPGcsI5TeQxxpIPnotdx8G3f70a27g1ItV+QS8ErjlPtczEnho5sBx
 VaUB9XGg8KXOg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:08:44 +0200
Date: Sun, 1 Aug 2021 14:08:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801120844.GW3189549@scaer>
References: <20210801114352.2763317-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801114352.2763317-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/smstools3: add SELinux module
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
> Support for smstools3 is added by the services/smstools module in the
> SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/smstools3/smstools3.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
> index 87d189baa8..d13900bc03 100644
> --- a/package/smstools3/smstools3.mk
> +++ b/package/smstools3/smstools3.mk
> @@ -8,6 +8,7 @@ SMSTOOLS3_VERSION = 3.1.21
>  SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
>  SMSTOOLS3_LICENSE = GPL-2.0+
>  SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
> +SMSTOOLS3_SELINUX_MODULES = smstools
>  
>  SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
>  SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
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
