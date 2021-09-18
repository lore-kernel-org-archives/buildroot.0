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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CC5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBCC6127A
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFBCC6127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8240B4050B;
	Sat, 18 Sep 2021 15:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vy8mNZ4gmFne; Sat, 18 Sep 2021 15:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D203C40513;
	Sat, 18 Sep 2021 15:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F03D41BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF406400C3
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iumlIxEIKlW for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 943154000B
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:39:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C20B2B004E8;
 Sat, 18 Sep 2021 17:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631979571;
 bh=lpbMOSjJH9fFkQbXIbGoERwcyA5GJD76f3cQg312vdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFwIZL+AbslzYnJKwRX6AvJoSSmFy0T8WNWJDRUTKqXXK7qzqjnBhinRyrgufE8bR
 d3iTY6stFQW/+b9KMO06mLVyBvf7N9pROUH4aZQ0CybaOH1zdopNqDtu+6cvTc/a2U
 L2ktwe+P2T9NVdB/iEFhFZfI6jJDvc+SM+4YWTAY8fWSzHQFITFWui2lBMGMV2QNdL
 lU1uJahr7S5eGtUFiRUyFy3xOgzMl9PunYGXnFh9/60vFsErcBG/aNjohcOjOyYiDh
 lLTUGxLwYOqRQBXXnPzjgQiVnxVV9EkXaSiaPoPaCPBL8R7m+wcSjzWSBYUa/RCtfu
 WkWkQGeUheQbg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:39:22 +0200
Date: Sat, 18 Sep 2021 17:39:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: david.corbeil@dynonavionics.com
Message-ID: <20210918153922.GC1053080@scaer>
References: <20210915001028.3540588-1-david.corbeil@dynonavionics.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915001028.3540588-1-david.corbeil@dynonavionics.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/glmark2: bumped to latest
 version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

David, All,

On 2021-09-14 17:10 -0700, david.corbeil@dynonavionics.com spake thusly:
> From: David Corbeil <david.corbeil@dynonavionics.com>
> 
> Fixes a segfault happening on Raspberry Pi4 on the fourth test
> 
> Signed-off-by: David Corbeil <david.corbeil@dynonavionics.com>

Applied to master, thanks.

glmark2 now has a meson-based buildsystem; could you see at switching
our packaging over to using meson?

Regards,
Yann E. MORIN.

> ---
>  package/glmark2/glmark2.hash | 2 +-
>  package/glmark2/glmark2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
> index 33a99de12a..8405819770 100644
> --- a/package/glmark2/glmark2.hash
> +++ b/package/glmark2/glmark2.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  9ad57e4eec0049c47a367b57f5f8d3e31e4c488b1d5d6673a75f1b2282e40888  glmark2-c493520253fbfe3676c8b34b6f91a7c9a838fc8e.tar.gz
> +sha256  12aef3ce80406bc723542979b9818886a28d0a4c93f62379eaadfd830974790d  glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index 9e47b426fe..5c2dd06362 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLMARK2_VERSION = c493520253fbfe3676c8b34b6f91a7c9a838fc8e
> +GLMARK2_VERSION = 06e78b67702b5413335ecdf1ae816da9c20f6ed9
>  GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
>  GLMARK2_LICENSE = GPL-3.0+, SGIv1
>  GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
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
