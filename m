Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F6EC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 08:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BA781464;
	Mon, 20 Feb 2023 08:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BA781464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fV6PnEQ2ah3; Mon, 20 Feb 2023 08:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0D9813D0;
	Mon, 20 Feb 2023 08:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0D9813D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F18B1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 08:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55AED60BA2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 08:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55AED60BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AB-wN48Ks1CZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 08:28:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB5C6080B
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEB5C6080B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 08:28:55 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id t14so797247plo.2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 00:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XELqW7FsthDN26Wusdmn4QkBTHgXwirBuiKmfnxp3tg=;
 b=RMcDGU53ltKqNfwxTbNpNx9qsMxQoJb04wv1Dlg7BhOEe460HMUmugmNbSsltBYdYf
 2nPXFoQiqpovCtqbbAlGu/KPQutpC9vrTQvOVIVMwtIitYhMweKYQipH86sPlrx4QL2c
 pOkB6vNzrxKu4b7LQK9ZfgG5+huNrTlp2ibM8+5utHZGcJ/F8zWG71oxrsPxhznN7idu
 ASykMrOZ5CEjouluXPNsfCmd8JWbhLEUbXPpl1uwCuFKGs/57TKBZeDrOmqtQ4rY099m
 wATZ40nT/pt8vt2OadcNpWa3RKYH4LVTkFCYaA6w+NgRYxNpLCCk8R4aDxcytp83s8AI
 8uhw==
X-Gm-Message-State: AO0yUKU0msQY7WvxW1QLvmQ6ud5Y7AYgeghRGSvDIWfiKrE2UEUvMmXO
 P8XbqH/mn0lvrqoyO9n3m07heOEiW30Tr0yh1yw=
X-Google-Smtp-Source: AK7set9tFJvXBfjPd388Tyya/ljIJXBPQRXTMINdZrWB5vvA0UcBc4x3kApasp2w3T08gzBHglZh3w==
X-Received: by 2002:a17:90b:38ce:b0:232:d6d2:f847 with SMTP id
 nn14-20020a17090b38ce00b00232d6d2f847mr195395pjb.17.1676881734867; 
 Mon, 20 Feb 2023 00:28:54 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 u7-20020a17090a2b8700b00233b196fe30sm1034512pjd.20.2023.02.20.00.28.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 00:28:54 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id h14so635408plf.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 00:28:53 -0800 (PST)
X-Received: by 2002:a17:902:76c1:b0:19a:98cd:1e6 with SMTP id
 j1-20020a17090276c100b0019a98cd01e6mr38309plt.19.1676881733545; Mon, 20 Feb
 2023 00:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20230219224546.1232023-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230219224546.1232023-1-fontaine.fabrice@gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 20 Feb 2023 09:28:42 +0100
X-Gmail-Original-Message-ID: <CAA3JqEcDxvRKNHt7NqeGkzs7XVzr9obQcXJ5UiFaFOCtaMUS+w@mail.gmail.com>
Message-ID: <CAA3JqEcDxvRKNHt7NqeGkzs7XVzr9obQcXJ5UiFaFOCtaMUS+w@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XELqW7FsthDN26Wusdmn4QkBTHgXwirBuiKmfnxp3tg=;
 b=xcNwXcQ6zayhnYW4WIDZ3UjAWTLDngT86W0rxmkzstmE90PxMRwH4aTB0r8tBZh3wk
 +auTUOS/5nci6vQtGFkW16dZVsWLiOXoFu4jgG+Sl9KnI329Q9nV+ZNR6r437Q/mFqGb
 tFudIpUjCctF0hrQ3n1hdJkjscl66c5jCS3rEZepl08PEdzpNR1y2nR70FX5UK3s3KGR
 mSa4l8easqujOC/uo0C93IcRmSP5IkIyf7R3+AfhL7/2pBYLweVdBsxqMpG7CF4ds7kz
 y+C5v6Vtjpo718x853QKcJiEClqmMgSu4OmPZJcVth2gRQ5mccnLu9X3ySdm9EdSBFMc
 nW3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aleksander-es.20210112.gappssmtp.com
 header.i=@aleksander-es.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xcNwXcQ6
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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

Hey,

On Sun, Feb 19, 2023 at 11:45 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
> plugins/meson.build still unconditionally calls shared_module. So
> disable plugins to fix the following static build failure raised since
> bump to version 1.20.2 in commit
> b95334b71fbdde0f7621b58ed35fa98df9e0966d:
>
> [238/417] Linking target plugins/libmm-shared-telit.so
> FAILED: plugins/libmm-shared-telit.so
>
> Plugins could be enabled back through builtin_plugins as soon as
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011
> lands in a stable release
>
> Fixes:
>  - http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/modem-manager/modem-manager.mk | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 979a80a8e9..824b9eda5a 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -80,6 +80,50 @@ else
>  MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
>  endif
>
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MODEM_MANAGER_CONF_OPTS += \
> +       -Dplugin_generic=disabled \
> +       -Dplugin_altair_lte=disabled \
> +       -Dplugin_anydata=disabled \
> +       -Dplugin_broadmobi=disabled \
> +       -Dplugin_cinterion=disabled \
> +       -Dplugin_dell=disabled \
> +       -Dplugin_dlink=disabled \
> +       -Dplugin_fibocom=disabled \
> +       -Dplugin_foxconn=disabled \
> +       -Dplugin_gosuncn=disabled \
> +       -Dplugin_haier=disabled \
> +       -Dplugin_huawei=disabled \
> +       -Dplugin_intel=disabled \
> +       -Dplugin_iridium=disabled \
> +       -Dplugin_linktop=disabled \
> +       -Dplugin_longcheer=disabled \
> +       -Dplugin_mbm=disabled \
> +       -Dplugin_motorola=disabled \
> +       -Dplugin_mtk=disabled \
> +       -Dplugin_nokia=disabled \
> +       -Dplugin_nokia_icera=disabled \
> +       -Dplugin_novatel=disabled \
> +       -Dplugin_novatel_lte=disabled \
> +       -Dplugin_option=disabled \
> +       -Dplugin_option_hso=disabled \
> +       -Dplugin_pantech=disabled \
> +       -Dplugin_qcom_soc=disabled \
> +       -Dplugin_quectel=disabled \
> +       -Dplugin_samsung=disabled \
> +       -Dplugin_sierra_legacy=disabled \
> +       -Dplugin_sierra=disabled \
> +       -Dplugin_simtech=disabled \
> +       -Dplugin_telit=disabled \
> +       -Dplugin_thuraya=disabled \
> +       -Dplugin_tplink=disabled \
> +       -Dplugin_ublox=disabled \
> +       -Dplugin_via=disabled \
> +       -Dplugin_wavecom=disabled \
> +       -Dplugin_x22x=disabled \
> +       -Dplugin_zte=disabled
> +endif
> +

You can disable all plugins altogether with
"-Dauto_features=disabled"; it is the recommended way to do so in MM
1.20.
But I wonder, is it only to have the build with static libs pass? MM
1.20 without plugins will not be usable at all, at least one plugin is
required, so not sure how useful that is.

In MM 1.22 (or git main) there is the new "-Dbuiltin_plugins=true"
option that will embed all selected plugins within the ModemManager
daemon binary itself.

Cheers!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
