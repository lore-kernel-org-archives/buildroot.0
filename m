Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26520C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B5C610CB
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B5C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD74605A5;
	Sat, 18 Sep 2021 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNHFi0zgVaZj; Sat, 18 Sep 2021 20:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F574605DC;
	Sat, 18 Sep 2021 20:34:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBB41BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F34A04024D
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9mKDKEf-fvP for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:34:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4602403EB
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:34:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3EC15B0051B;
 Sat, 18 Sep 2021 22:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997244;
 bh=JwIQ6ogvklXhgCJF/w1wVKEKEVA1QjP8/xli7FCvqWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YToLQq2OcD4EmXh/5/tsjvXoPvce6XaDNU2S4rpKZJduybmC/FLZ9/RfV5gur/oEW
 AHgls99DddqIpV0OYZ0TZh1z6MwVWCWU65U/Tytw5ESp01RtY+fhlsK4d/f6HSrrY9
 2rpGOvsfWuwUWskT/68NzY5aOYmoYa/wjWG+5Xvf2WE9cxNyEcxnvMzO0qyPCakXkL
 zH1u5t6BBukzyI/Jn6LkapbT6oBPzidzCB5Ij4F8Ibzy5cM/A5p3umMml0g9CE7dak
 UKSHyGuXEycQGpFYj4pPULOzW6ZCFnmtc9Htz0HNT8pvz+YuzZ8jp0zmlr/XHCSUfv
 yf6ifuEl0zuPQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:33:59 +0200
Date: Sat, 18 Sep 2021 22:33:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918203359.GS1053080@scaer>
References: <20210912164819.2164395-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912164819.2164395-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,1/1] package/fio: bump to version 3.28
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-12 18:48 +0200, Fabrice Fontaine spake thusly:
> This will fix the following build failure with kernel >= 5.14 thanks to
> https://github.com/axboe/fio/commit/382975557e632efb506836bc1709789e615c9094:
> 
> In file included from crc/../os/os.h:39,
>                  from crc/crc32c-arm64.c:2:
> crc/../os/os-linux.h:17:10: fatal error: linux/raw.h: No such file or directory
>    17 | #include <linux/raw.h>
>       |          ^~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d85c044263c76ff7ef0fe47921d893a472954da9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Fix tarball hash
> 
>  package/fio/fio.hash | 2 +-
>  package/fio/fio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fio/fio.hash b/package/fio/fio.hash
> index 88319e4cc0..891ca4e40e 100644
> --- a/package/fio/fio.hash
> +++ b/package/fio/fio.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.27.tar.gz
> +sha256  859dca5241e5494d86c4aa1531a984cc556789c78e56b30d6070acfbdd193a8c  fio-3.28.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
> diff --git a/package/fio/fio.mk b/package/fio/fio.mk
> index 12e2b2ab7c..13818b60fd 100644
> --- a/package/fio/fio.mk
> +++ b/package/fio/fio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIO_VERSION = 3.27
> +FIO_VERSION = 3.28
>  FIO_SITE = http://brick.kernel.dk/snaps
>  FIO_LICENSE = GPL-2.0
>  FIO_LICENSE_FILES = COPYING MORAL-LICENSE
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
