Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B91840420;
	Sun, 27 Mar 2022 16:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbwyJ-fcizHC; Sun, 27 Mar 2022 16:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3DA840136;
	Sun, 27 Mar 2022 16:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D04C1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AF32402BB
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-JX1EyZ9wNd for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A44E402A6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:34 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a17so14388982edm.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yppNt0XVKeYYnQ5Q3b7AgaiXx4tw0I396JdzkcQnfeI=;
 b=duLVvjn31ff4efRnjWtwnhYd9/9oQp36fGKZQzDSSfKwfQ3bv75Hd1QYoeLkN4F+cz
 MTFHEYJ5Z+jS9dcWZi1iM2Hz87s2FR8Afpmz3JJaRa9BHUVJExmOtoelrFdcAJcaxhMU
 lSX3LzYUV1lViPC8kYcP4AyEp9hHbuaL3V/mtOXXV2qOrXa5sbKaEcTWrWkUxxy69EPv
 zeOb4+F4TmR593LAcURD10x1TMzxpJ50MoBnufZzQ7iqUEa25c63IdEjRPVIaU1Y/IT/
 hZnowSEd1YFbjbcdX5gdTgHWViwpuPN1YGWGWW7zAZq9VIVf7LHmgLXRC1YybvAR+pyE
 B/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yppNt0XVKeYYnQ5Q3b7AgaiXx4tw0I396JdzkcQnfeI=;
 b=5qmgknzGXXlnuVUqsygW9n901v2ufMPlhUi0iC/elhGaYtDEHS+6KOQjeWq3yV4/9Q
 gKUb2mXQED8wFfXwzx3Vxxv7AwY063y0P9OhAJgimrLCzqHErJcHsbjHrmE4icIPvnkF
 DClaFm7OmjmEZsAx21NvTowMrArxa6uQb7G6kj4oLWbNsoUYwcQSpbPxrxQ1zMN6IAqe
 z8Iw3gwPrjZfZrgC2EQYY1WmArTms5WOeFHxeMML9uILJwe/o7TnDKQCvgwnXpr/iZxw
 RAv4wPaMal+qcuXYnzr46CBzbTbPhN1Z1R3FeUohnubhBZ+KMBwB5hLYUKgtv8wN/wbq
 /9KQ==
X-Gm-Message-State: AOAM5305iD2EIh6/LbIxpZtIo1vhNnVsfQfD/KNTY1ud2y6Rm1Z0Fqb5
 smdfKJwbP/F8C/7dhBnKSyee9w==
X-Google-Smtp-Source: ABdhPJyWPOhgaz09pEIhX4aVGhhLWTbvi70ysuKJ3FUplbZo2hyEIaNr2jrUicKm5UFulJpdLgnexw==
X-Received: by 2002:a05:6402:1e92:b0:419:76:21a6 with SMTP id
 f18-20020a0564021e9200b00419007621a6mr10927790edf.128.1648397372865; 
 Sun, 27 Mar 2022 09:09:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm5854986edu.93.2022.03.27.09.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:09:32 -0700 (PDT)
Message-ID: <53e0f0fd-8db9-c324-ba12-fdfd75d7b258@mind.be>
Date: Sun, 27 Mar 2022 18:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220322190032.2566880-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322190032.2566880-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: fix target
 loaders.cache
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



On 22/03/2022 20:00, Fabrice Fontaine wrote:
> As reported by Rutger Sassen in
> https://lists.buildroot.org/pipermail/buildroot/2022-March/638895.html,
> target loaders.cache is broken since commit
> 75361a9aba042799040591fb84192802b137fc3a so fix it by prepending /usr/
> to relative host paths
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdk-pixbuf/gdk-pixbuf.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index 6eaf023789..69bb34b0cb 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -70,14 +70,14 @@ endif
>   # gdk-pixbuf requires the loaders.cache file populated to work properly
>   # Rather than doing so at runtime, since the fs can be read-only, do so
>   # here after building and installing to target.
> -# And since the cache file will contain absolute host directory names we
> -# need to sanitize (strip) them.
> +# And since the cache file will contain relative host directory names we
> +# need to prepend them with /usr/.
>   ifeq ($(BR2_STATIC_LIBS),)
>   define GDK_PIXBUF_UPDATE_CACHE
>   	GDK_PIXBUF_MODULEDIR=$(HOST_DIR)/lib/gdk-pixbuf-2.0/2.10.0/loaders \
>   		$(HOST_DIR)/bin/gdk-pixbuf-query-loaders \
>   		> $(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
> -	$(SED) "s,$(HOST_DIR)/lib,/usr/lib,g" \
> +	$(SED) 's,^"lib,"/usr/lib,g' \
>   		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
>   endef
>   GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
