Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD6C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 07:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9DE41049;
	Sat, 10 Sep 2022 07:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9DE41049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRizoHU-JIYD; Sat, 10 Sep 2022 07:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40EBE404FC;
	Sat, 10 Sep 2022 07:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40EBE404FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9621BF47A
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 07:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61A0A41CA3
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 07:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A0A41CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYNZo0AfeBQk for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 07:05:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CA341CA0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42CA341CA0
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 07:05:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d2dc:af53:61e0:beab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F253019F5B4;
 Sat, 10 Sep 2022 09:05:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Sep 2022 09:05:48 +0200
Date: Sat, 10 Sep 2022 09:05:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220910070548.GD264214@scaer>
References: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662793551;
 bh=bI3u7jsH3qE0xJ2SsZqVtPY+2ZzQD3UrgnSy+SBDGu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJcbPYy/2Xvv5skLNJ2kfrmajgwYGIxC3cblMQgTq5qCxy+1a0fZTzQcOwCbLAhu2
 vufip4VdnzdXryIelH7zw5A399XCxYBSL9AswWvYowNC41xu9etrLBuTo/YhI0Rkxj
 YEId8NVL8hveA14HTBdgBVhtFlnlDlRnDiBRQ0vGaWtaCpNwftLGG8zPfgD5wLqXIL
 k8d5Oqnu3OcSH8NQThx9DagYczI5yKb1nAj4WhCUZiG/6pmT7CwyOlJgezb1qHv/wa
 fq8Wjxm3Ocwr3fCEQ4nUGA5R1Phq+Pgcqhrw0AKFayjzEUFbh7x+BZrlU8AgN/pYk0
 y5+AabGK7FXdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RJcbPYy/
Subject: Re: [Buildroot] [PATCH] package/sox: work around gcc bug 68485
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-10 00:15 +0200, Giulio Benetti spake thusly:
> With Microblaze Gcc version <= 12.x the build fails due to gcc bug 68485:

Since the latest gcc versin is 12.x, then "gcc <= 12.x" actually means
all versions of gcc, no?

> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
> building sox with optimization but not when building with -O0. To work
> around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using -O0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sox/sox.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 1896437ad4..d0329bf50d 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -26,6 +26,14 @@ SOX_CONF_OPTS = \
>  	--with-distro="Buildroot" \
>  	--disable-stack-protector
>  
> +SOX_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)

Since you said the bug only appears for microblaze, gcc <= 12, and this
specific gcc bug, then shouldn't all three conditions be used?
(excluding gcc version because of my earlier comment):

    ifeq ($(BR2_microblaze)$(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),yy)

I.e. there is no reason to penalise other architectures, since only
micrbolaze is impacted by that bug.

Regards,
Yann E. MORIN.

> +SOX_CFLAGS += -O0
> +endif
> +
> +SOX_CONF_ENV += CFLAGS="$(SOX_CFLAGS)"
> +
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
>  SOX_DEPENDENCIES += alsa-lib
>  SOX_CONF_OPTS += --enable-alsa
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
