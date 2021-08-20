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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D0EC432BE
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B585C60F92
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B585C60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 261F0605F4;
	Fri, 20 Aug 2021 08:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dbst1OxPDfY; Fri, 20 Aug 2021 08:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA945613AB;
	Fri, 20 Aug 2021 08:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAC811BF3A6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E669940638
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOeUS4xe1XLb for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 08:03:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A84140634
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 08:03:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7BBE62003CA;
 Fri, 20 Aug 2021 10:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629446606;
 bh=U65sDJQYJNo2KZIeS055+fTo/TRSawayO+0fjoiVdFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSERUItTP49LJkSUk5Rf2QABvq+5E5P31InLesBJNEXlKcpJCOBwb3Y32NeXZSUr0
 07JIGZnib2Fur1y/YF232o4Iyp1ZvT8N66ZceNY2FAzDiClvbiyFYepmaHa36oWtaA
 RtsWb/JJrAgkiog4puZfkhPIORIiRXu5c0x0h9LYIqY0+qgdyJGbwDsPqWvTE9M0la
 7/GMCUYMz/lcohaTji5nVBfsxRTHiVUMoa7ILjPEIZTNi4bDROqG5VKnHV9fJds/Kf
 qjZkJGHBGSSss5xvXNQ9OIYYzsMfhwHnpJJrb3+RYQ4j3xHR06W81k/4lzR1s8GkPR
 JJusU8mcuqFug==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 20 Aug 2021 10:03:20 +0200
Date: Fri, 20 Aug 2021 10:03:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210820080320.GO27036@scaer>
References: <20210819221254.23336-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819221254.23336-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/mpv: vaapi-drm needs egl-drm
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

On 2021-08-20 00:12 +0200, Fabrice Fontaine spake thusly:
> Build of vaapi-drm without egl-drm is broken since commit
> 6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174.
> 
> egl-drm has been added with commit
> 031df474c24f92757ac95ade572b90995ebdc6a2 and it is only available with
> mesa3d because of the gbm dependency:
> https://github.com/mpv-player/mpv/blob/0b56e1c00a57fdb767674462c299a5c973a9e373/wscript#L571
> 
> Indeed, at the moment, mesa3d is the only gbm provider in buildroot.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/83d6dcbb77ab8754aefcdcf90baeaff9db2a1c81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update commit message
> 
>  package/mpv/mpv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
> index d4d4d4811d..91e31dd150 100644
> --- a/package/mpv/mpv.mk
> +++ b/package/mpv/mpv.mk
> @@ -181,7 +181,7 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
>  MPV_CONF_OPTS += --enable-vaapi
>  MPV_DEPENDENCIES += libva
> -ifeq ($(BR2_PACKAGE_LIBDRM),y)
> +ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
>  MPV_CONF_OPTS += --enable-vaapi-drm
>  else
>  MPV_CONF_OPTS += --disable-vaapi-drm
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
