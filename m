Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79918C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A3661075
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36A3661075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0342A817FF;
	Thu, 19 Aug 2021 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLZ7Ff42MCpR; Thu, 19 Aug 2021 20:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 367DC81A30;
	Thu, 19 Aug 2021 20:43:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 945611BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81E59605D1
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pO3NYRUYiZeM for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE0AC613D2
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:43:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9C8152003B4;
 Thu, 19 Aug 2021 22:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629405812;
 bh=VEzzWpT6Tf92nLL8nTRfcUK1gyUMVL877rBbsXcjJao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwqzQMqxNPJxLffPaVr2+aV9VzdrFwImJuxXBxXw3V3TF172d+zJJwFdAPMeZ8OMI
 J5he4BkRS7BRXTRYMJlqWIkJYUog8yBzfzna8yPZLvX77C/ctEILMEZKvOlhhKu4lo
 nTYH0uj2fxwZCPZUfFrHsG1QM/Yc4csZQKJaA82vG2PzWR5oPnGYkTTgqTwlKlWOkA
 sGGEhj41o7wdhFI+vVNs+rkd25qCzkKHon554YQvWVBnHCJ52dK1722+I/DkewEwpc
 V34/+0SFNJEiBbiLeVtsGLpmJYHQwGLWvqvoFfdCgWPC1otaKzriVeOFkt0Qx9YsPQ
 SShNn8xJeICxQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 22:43:26 +0200
Date: Thu, 19 Aug 2021 22:43:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210819204326.GD27036@scaer>
References: <20210819160351.1045591-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819160351.1045591-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: fix build of vaapi with
 egl-drm
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-19 18:03 +0200, Fabrice Fontaine spake thusly:
> Build of vaapi with egl-drm is broken since commit
> 6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174 because egl-drm is a part of gl
> group which is only enabled if BR2_PACKAGE_HAS_LIBGL or
> BR2_PACKAGE_HAS_LIBGLES are set:
> https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L572
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e5c15228f42a73f8c34b26630b2074c30e5f5966

This issue is about missing X11, so I am not sure I see the relation
with this change...

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mpv/mpv.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index 91e31dd150..f8ecaeb78a 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -148,6 +148,9 @@ MPV_DEPENDENCIES += libgl
>  else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
>  MPV_CONF_OPTS += --enable-gl
>  MPV_DEPENDENCIES += libgles
> +else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +MPV_CONF_OPTS += --enable-gl
> +MPV_DEPENDENCIES += libegl

Here, you are checking with BR2_PACKAGE_HAS_LIBEGL, but in the previous
patch, as noted by Thomas, you used BR2_PACKAGE_MESA3D_OPENGL_EGL.

Any reason for the discrepancy?

And looking from further away, it looks like the two problems are really
related one to the other, and so maybe need to be fixed in the same
patch...

Regards,
Yann E. MORIN.

>  else
>  MPV_CONF_OPTS += --disable-gl
>  endif
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
