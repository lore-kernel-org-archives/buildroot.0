Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0270AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761F0600D0
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 761F0600D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAB060786;
	Sun,  5 Sep 2021 19:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09vsXETnzf4V; Sun,  5 Sep 2021 19:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7324E60746;
	Sun,  5 Sep 2021 19:32:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D565B1BF403
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE0140437
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOVLfS-aWV71 for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 19:32:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757B940436
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 19:32:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e8df:59ab:c58f:7e9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F2612B00571;
 Sun,  5 Sep 2021 21:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630870350;
 bh=X+8PDcTdeOmFEiy6oAbZmDcL0SUH+h6uBUFPHuhIyr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZcN4SKyJCLw/Na9VSIIKAbBDH2y+yC1La+ED5TTNfKkFtBhDD/AH79bk+7RsliAd
 NuA13lmbN+rrW9lB9OEhhVa4j2JvrScjIB8dcl1VXcCHoZUxyGTolu14a6sHgYZyzs
 4h0si8yZkIDoQ9QiLKY5vAGeoCxEAPvnXz2VKz05itcRKyjd12u1PN+meWbOmwKLGE
 xVp5bmJkxIjS0gqxihD04eKiQcDk7ff2+eQiT/6TBAqFrNpCGldKCqcGu+v8w++HfU
 gD4YO5JT93Jpx6Gcrzn68b63jRg8g0hjsTIryd/fGFtqFSlpdPoeL/SNc40UjZwps2
 s8fhpapoiEYUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Sep 2021 21:32:23 +0200
Date: Sun, 5 Sep 2021 21:32:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210905193223.GW1053080@scaer>
References: <20210905090953.616481-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210905090953.616481-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: needs host-binutils
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-05 11:09 +0200, Fabrice Fontaine spake thusly:
> libcap needs a version of objcopy which supports --dump-section since
> bump to version 2.52 in commit 38b0759432070f7a57c0fab84d44a07caead6f06
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ee3b25c0a877fa74d1aec88f325ac45b09963c82
> 
> objcopy --dump-section .interp=loader.txt empty /dev/null
> objcopy: unrecognized option '--dump-section'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/88cc2be14a5f134dc2aa22ca838836dc11e39930
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcap/libcap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 45700e56ec..d8e685d1d7 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -14,7 +14,7 @@ LIBCAP_CPE_ID_VENDOR = libcap_project
>  LIBCAP_DEPENDENCIES = host-libcap host-gperf
>  LIBCAP_INSTALL_STAGING = YES
>  
> -HOST_LIBCAP_DEPENDENCIES = host-gperf
> +HOST_LIBCAP_DEPENDENCIES = host-binutils host-gperf

Nope, that's not a good fix, because then the various binutils (ar, ld
et al.) will overwrite those from the toolchain. This is not an
acceptable situation for various reasons, the first being that we want
to avoid exactly the case where two packages overwrite the same file(s).

But technically, this would also lead to a situation where utilities
from the toolchains are partially changed, which means the resulting
toolchain would now be tainted.

host-binutils can only be used when using the internal toolchain.

Notice however that the failure only ev er occur on my autobuilder,
which is the very old Ubuntu 14.04 Trusty Tahr.

I wonder if the proper solution would be to instead "fix" libcap to use
a better construct that can support oldder binutils...

For example, I could whip up the following:

    LD_TRACE_LOADED_OBJECTS=1 ./empty \
    |sed -r -e '$!d; s/[[:space:]]+([^[:space:]]+)[[:space:]]+.*/\1/' \
    >loader.txt

Of course, that is not as efficient nor as conpact as the surrent
upstream code, but it works everywhere...

Oh wait, it will probably break on non-glibc systems... Meh... So OK,
what about this:

    readelf -p .interp empty \
    |sed -r -e '\:.*(/.+)$:!d; s::\1:' \
    >loader.txt

That will probably be a hard-sell to push upstream, though, because
--dump-section has been implemented in 2013, released in binutils 2.25,
but Ubuntu 14.04 only has binutils 2.24... Sigh... My autobuilder is
seriously getting old...

Regards,
Yann E. MORIN.

>  LIBCAP_MAKE_FLAGS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
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
