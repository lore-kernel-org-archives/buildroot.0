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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D20C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677036126A
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 677036126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A07606C6;
	Sat, 18 Sep 2021 15:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5Kak-xsghtO; Sat, 18 Sep 2021 15:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7481F60750;
	Sat, 18 Sep 2021 15:31:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 847F21BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 747826063F
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPGIKFIYKsJz for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A3E60662
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:30:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DC7C5B0053D;
 Sat, 18 Sep 2021 17:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631979029;
 bh=hc0uNCJiCN3h6aecVue7Xmu7hZZYZ6+X+TX1EJgcpTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SuyEv9adru8SmPFq8POZRzRs8hXhxTO23bFc81x53hQVYuDYVvuBF6kaPyCIaFENI
 MGT4qO6rqk5K9no/PDCxWhJ2hJCGXFS8T+jJY/bGKWCE4LAmkKVRTHdNfPJL28IYvz
 TSRgX29vMFSRgVcu1B1uMpIPZzZouLfLNvPe3W24d34X4zvQQVM0+W8pM0BxtDxZSz
 n0HvGXaM35bP3fCigvjlHR9wpUfwmsN7544SE//xiTVF/Wj9+59A5HQLB8ffQa09SX
 TbCHQuZ2EDrpaKcixmnollAHifd+rTu/Vwgek+8k9ik8y9ANdWufpL8V1ymkpcP4Uq
 IBVoAg85cEudQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 17:30:24 +0200
Date: Sat, 18 Sep 2021 17:30:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210918153024.GX1053080@scaer>
References: <20210915191603.15210-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915191603.15210-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/imlib2: bump version to 1.7.3
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

Petr, All,

On 2021-09-15 21:16 +0200, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/imlib2/imlib2.hash | 8 ++++----
>  package/imlib2/imlib2.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
> index 3df3deffec..690d836c2e 100644
> --- a/package/imlib2/imlib2.hash
> +++ b/package/imlib2/imlib2.hash
> @@ -1,8 +1,8 @@
> -# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.1/
> -md5  98569de9b10bcb6fd5d13e4d331ddd81  imlib2-1.7.1.tar.bz2
> -sha1  092c66ae0180798a4036e68c68d7f316de192e36  imlib2-1.7.1.tar.bz2
> +# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.3/
> +md5  1e79055a0b8fe27d208b6f8bb1bde60c  imlib2-1.7.3.tar.bz2
> +sha1  3d55965f946d0b2754a84c8e57c78ddc227252c6  imlib2-1.7.3.tar.bz2
>  
>  # Locally computed
> -sha256  033a6a639dcbc8e03f65ff05e57068e7346d50ee2f2fff304bb9095a1b2bc407  imlib2-1.7.1.tar.bz2
> +sha256  158d0b8c20bc11221af9e77a64a116fca7051b03cdea2c4f31d31f469382f997  imlib2-1.7.3.tar.bz2
>  sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
>  sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
> diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
> index 6d973827dc..89b4769f92 100644
> --- a/package/imlib2/imlib2.mk
> +++ b/package/imlib2/imlib2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMLIB2_VERSION = 1.7.1
> +IMLIB2_VERSION = 1.7.3
>  IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
>  IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
>  IMLIB2_LICENSE = Imlib2
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
