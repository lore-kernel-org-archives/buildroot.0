Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EF2C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1084610CF
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1084610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 844CD401B2;
	Fri, 20 Aug 2021 08:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGliFBXvUL1x; Fri, 20 Aug 2021 08:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B67BC401FD;
	Fri, 20 Aug 2021 08:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15BDB1BF3A6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3EE0613AB
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlcpjbaAdvwX for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 08:03:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D2D3605F4
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 08:03:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A945A200390;
 Fri, 20 Aug 2021 10:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629446578;
 bh=xSvOXxPavZXz07qXlwhJum9UMiY9E7XLakwLg4HC2u0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XrH5WL7iVIVvf9krh8ahhY28JY8gXWb6owxgbgplCw17Wzk+Y6gO8Py5RsU53TVPP
 CiofOCm4UB7XowD5oG8/r/891lHaT2Xm/TEdZYJeoDMtRk7wRcenNPbQl/FGrqh/BL
 /7i5XUm3qfKKliPj+7Z9vukH+p6ydyCJdM0s690ypfjAnVoV8/GyiyaSElKvQzHjom
 wlsjsxFSIfdgNd3ffgaQLXT/ezE5gsENg3JDzYAVH/NsvkDNCoqt6/YYuNj5gcGH6t
 ydFzL73F/TUqOe4IGNK5LXH+xqroWkjc4LRIhYpn/4B8qqVtHqaN4Jy3P3Xmj4lSwB
 E0PjAJb6Vs6Ww==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 10:02:52 +0200
Date: Fri, 20 Aug 2021 10:02:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210820080252.GN27036@scaer>
References: <20210819221929.99687-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819221929.99687-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/mpv: fix build of vaapi with egl-drm
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

On 2021-08-20 00:19 +0200, Fabrice Fontaine spake thusly:
> Build of vaapi with egl-drm is broken since commit
> 6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174 because egl-drm is a part of gl
> group which is only enabled if BR2_PACKAGE_HAS_LIBGL or
> BR2_PACKAGE_HAS_LIBGLES are set:
> https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L572
> 
> As a result, despite what is being displayed in the autobuilder log
> message, the build failure is not related to X11 but to the fact that
> we try to enable vaapi through egl-drm but at the same time, we disable
> gl.
> 
> To fix it, enable gl if libegl is available as gl can be enabled for
> example through wayland and egl (gl-wayland):
> 
> 'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
> + 'gl-win32 || gl-wayland || rpi || '
> + 'plain-gl',
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e5c15228f42a73f8c34b26630b2074c30e5f5966
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Update commit message
> 
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
