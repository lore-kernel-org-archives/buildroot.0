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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A0CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:14:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230D0610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 230D0610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61404052D;
	Sat, 18 Sep 2021 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhWVWIahLTgA; Sat, 18 Sep 2021 15:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20204403CC;
	Sat, 18 Sep 2021 15:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDED1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E71D83422
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFp3cF0_VTIx for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC4E582FC9
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:14:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E1745B00548;
 Sat, 18 Sep 2021 17:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631978045;
 bh=vm+t6Zn9C6jkmHEJudNcOY4No4p+y8FrQOm0knM32Wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1bq1pZllEeeBDYw3+xe9uO6RGWA+5D8Km9se89u/Nw7qPzplGHZkZEi3PJ9zRIjW
 dOevCzsce46iiSOyZ9gnEQdsN2lHh6ZZ2fr998B9z002USsNGDsRB7uR5FrFy0Kdif
 PhNO2jITTSDTU3V8kq36yriY0guRVbEB15yHcAxqTw9AIQ8RMyQDidT4LMSsbSGPKA
 Ics1JAhceqVrvr6u8vxCL+4BujJ3Te1ToYPD7gAShlRYLdW3bTHmXLhkpI48MXItHd
 f8OPgjABr/VeBaRvPe+Yw/Eu3nbQygmRfQ8cr0/jMm6uNciy7dtOssGMe/IeREY44k
 f65b9Qx/FA7UQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:13:58 +0200
Date: Sat, 18 Sep 2021 17:13:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918151358.GV1053080@scaer>
References: <20210916164821.1940365-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210916164821.1940365-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.10
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-16 18:48 +0200, Fabrice Fontaine spake thusly:
> https://discuss.linuxcontainers.org/t/lxc-4-0-10-has-been-released/11618
> https://discuss.linuxcontainers.org/t/lxc-4-0-9-lts-has-been-released/10999
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lxc/lxc.hash | 2 +-
>  package/lxc/lxc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
> index 85cdecceb2..efd7a8e42c 100644
> --- a/package/lxc/lxc.hash
> +++ b/package/lxc/lxc.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347e9f06048eba1e463  lxc-4.0.6.tar.gz
> +sha256  a10c518056d2e497bd600e4ffac2853bdeab1e835bf455a6d87cc8df128bfae9  lxc-4.0.10.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 24a1f3c588..93f6d2535f 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LXC_VERSION = 4.0.6
> +LXC_VERSION = 4.0.10
>  LXC_SITE = https://linuxcontainers.org/downloads/lxc
>  LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
>  LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
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
