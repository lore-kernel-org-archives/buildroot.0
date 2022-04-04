Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B29C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC094827CE;
	Mon,  4 Apr 2022 17:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2dDiughYqYo; Mon,  4 Apr 2022 17:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066218278F;
	Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 384E21BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C6760FE6
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYE0ztZh6ln3 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E0D460FE1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id d10so7181191edj.0
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gnLqL4lBV5phSTcWdnmZ2cC/BRHCkyhsAg5cydgitPQ=;
 b=TcJxPBJk2gcu0FFcxENyngoKfPT3LLg2/Ufv3a5HKZiV/iUtV4N11kEZyr6Mk9u86w
 Omu9TvucRffxD1T1O5DeO4YtNNlxR3yTkuVb5NAX9iGmBbRJ8BBEUOlZ730ejXTxD0pE
 h6DzY/JfHrrGWelph1i9mkzNLnfizCtz2wvWFAsSjNf/JW2au21va+Pb52iqxBo79rjL
 5kEcBlQaKGg/NofkaFx2opqR2WC5hErqQSv392kSwWwFaU8A9VWvyVgTdowQe0nNYGva
 EnRGVdjW3dRIyNhDK3bWnVKgK9udVvga/TQXiqVSZSXjtbL5RKOdhUUDxehEIjijWakI
 W01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gnLqL4lBV5phSTcWdnmZ2cC/BRHCkyhsAg5cydgitPQ=;
 b=IpZf0FsfyoFHCYP3PrRmi58J3UFBQmmduyLhSL54KZMFPwI2/i2CGBLdTi5lOGVEs8
 HbuEeFf0dKsXfBGF2EdJP/F90vzJ0DJ2KCO0qW4gvporkcEdYaUKgtmBCu2dFXxpO8eg
 obdALEB+j/cbdmqJbPq9dhnpIOvqFLYVzaJrwLIo7GNKh42bwPRKltjqVo0cXtgX5ep6
 cHykv5U7E2e7RsukOqyTM1bLCAJnlyYbr8u+gOe4IGf1BsGiQpWO6KEgc2sNfCPBgD2M
 4XeZMHss6Ynf3CN08XOyTlzh2lxQG17verYIAAAnqaRvhHkeofysU3ikAn7sdSOdBaZ8
 lTuQ==
X-Gm-Message-State: AOAM533/zyJYlpWeKJ/+yLNmVDPVrIqNBkWzvLCw8vHAsWZHfm9oxzyP
 v2ufFRA2Nm2IugD5wlMAn2AvzQ==
X-Google-Smtp-Source: ABdhPJzUivV8/+Ywq85C1cYPdmsOK9jHaacp18H8qZ4W2JhfkhNV66EfGWGAv+Bk9tfTh4TiZtKL/A==
X-Received: by 2002:a05:6402:5107:b0:419:935d:bb6e with SMTP id
 m7-20020a056402510700b00419935dbb6emr1304119edd.242.1649093213142; 
 Mon, 04 Apr 2022 10:26:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1709061d0300b006da94efcc7esm4616821ejh.204.2022.04.04.10.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:26:52 -0700 (PDT)
Message-ID: <6ca6b182-c66d-3509-bb58-862188da3e93@mind.be>
Date: Mon, 4 Apr 2022 19:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220330165702.1018014-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330165702.1018014-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,1/1] package/pango: fix empty-body
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2022 18:57, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.50.5 in
> commit 68b0efbae49a42d0e14d6040e5e7e573d382ff75:
> 
> ../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
> ../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>       ;
>       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Fix error instead of dropping -Werror
> 
>   ...-utils-viewer-cairo-c-fix-empty-body.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
> 
> diff --git a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
> new file mode 100644
> index 0000000000..4b7b5f9b19
> --- /dev/null
> +++ b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
> @@ -0,0 +1,40 @@
> +From 5372a0cfd641776ece77db5590bf0d265e810086 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 29 Mar 2022 21:39:03 +0000
> +Subject: [PATCH] utils/viewer-cairo.c: fix empty-body
> +
> +Fix the following build failure raised
> +since version 1.50.5 and
> +https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
> +
> +../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
> +../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
> +     ;
> +     ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.gnome.org/GNOME/pango/-/commit/5372a0cfd641776ece77db5590bf0d265e810086]
> +---
> + utils/viewer-cairo.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/viewer-cairo.c b/utils/viewer-cairo.c
> +index ca98c1cd..f15b3fb9 100644
> +--- a/utils/viewer-cairo.c
> ++++ b/utils/viewer-cairo.c
> +@@ -225,7 +225,7 @@ cairo_vector_view_create (const PangoViewer *klass G_GNUC_UNUSED)
> +     return NULL;
> +
> +   if (0)
> +-    ;
> ++    {}
> +   #ifdef CAIRO_HAS_SVG_SURFACE
> +     else if (0 == g_ascii_strcasecmp (extension, "svg"))
> +       constructor = cairo_svg_surface_create;
> +--
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
