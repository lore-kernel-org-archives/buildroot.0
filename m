Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8DE60B61;
	Mon, 25 Apr 2022 19:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkkf1ExMbdXR; Mon, 25 Apr 2022 19:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E96F460B3D;
	Mon, 25 Apr 2022 19:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B80B21BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B50F881756
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rz0xW9vx0Qsg for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:33:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B945980D8C
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:33:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z99so19686315ede.5
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jRaVl8ynJEUNqyg0BtCPrcSomNpOHFnxeJGQ5WXQLpA=;
 b=GR048Mni6/zWIrqxPnbG+4cBDpYM9Kaq4VywHnXxFwbvwnv80k5ivPudUR1WH1VIyM
 xA1Tf1tSX2DNCvG9i/kONsgAheJTwF7xxyOfZ1yWbt0f7eZMNnq5Z9b9PJ+Caym5Zdb/
 khrCqa4w/NChc0iSYnqIT43ekIASojufacDtOdcgrwx2rHQrhg38QKqLaJPQD6Tq+yd3
 SehMTK8RtJbezsypykkIysyFFeNiHkxBP+Fbe/iZed4Uajpvxk0PY72DbTOjxMVMl1AA
 AAjefLjHv52oHFQ9NfRnKWz4vO1dDYv31dbnVKgE+NI08Eq5FmHsHN/yBksiMfpDxnYx
 BLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jRaVl8ynJEUNqyg0BtCPrcSomNpOHFnxeJGQ5WXQLpA=;
 b=1qZODisye+O6eggHXvV+BwyNcmH5ZDeDV14w9BeFCBjSzUg8a9O5qWGh1S4cRJHDBb
 SsFIJL4N+tLpoMwuxIvr890r6tGg+0cXejE36k7R/OiBMRUHHX1LpE4kvc5D/7raB5K7
 +nCZbSAHm7TJ4nZR7E/F49suox4/XnDQstpUZBSWkqrBKWBmE6U0Rq97ezSqEIbvn3kv
 BXRVWNJ/+PnZzWfpSykALdMIeNxNQVYM2ldHhKxWaMUBTBKMHytAFKqeu9mWP9bUxsVJ
 FiGvprmQ0gk/Oqyzy1D9WHbuPjBLNGS92SU/bVFTxE4H+chhPicQP1JTVmfYps0wkrV+
 xoSw==
X-Gm-Message-State: AOAM531ZYZKsvLCxl5thX+2WnmY7zxvpkDUxigrn8x0DtDij48jHV9Qg
 4TOjuMEOMK0Dcs/gMl+XkO2GJg==
X-Google-Smtp-Source: ABdhPJzCqaqhkCjPT94GuXEJ/DRK5XfyUmE1z5SB+tHx05NmGAz9glz8c+0YYIjhDZsnWlwicSRrrA==
X-Received: by 2002:aa7:c9ce:0:b0:425:c396:dde with SMTP id
 i14-20020aa7c9ce000000b00425c3960ddemr17465363edt.397.1650915221927; 
 Mon, 25 Apr 2022 12:33:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm5051229edv.5.2022.04.25.12.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:33:41 -0700 (PDT)
Message-ID: <5d9780b7-3579-c9b8-f2ce-ec5efc9f187f@mind.be>
Date: Mon, 25 Apr 2022 21:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/netsurf: fix build with BR2_OPTIMIZE_FAST
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



On 22/04/2022 23:21, Fabrice Fontaine wrote:
> Disable duktape with BR2_OPTIMIZE_FAST to fix the following build
> failure:
> 
> In file included from content/handlers/javascript/duktape/duktape.h:195,
>                   from build/Linux-framebuffer/duktape/application_cache.c:21:
> content/handlers/javascript/duktape/duk_config.h:2861:2: error: #error __FAST_MATH__ defined, refusing to compile
>   2861 | #error __FAST_MATH__ defined, refusing to compile
>        |  ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2f1b42e2be3aa76cbacd84f3d0ad8b13edce6982
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/netsurf/netsurf.mk | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 1064698c12..574c1423df 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -14,6 +14,17 @@ NETSURF_CPE_ID_VENDOR = netsurf-browser
>   NETSURF_DEPENDENCIES = expat jpeg libpng \
>   	host-bison host-flex host-gperf host-pkgconf host-vim
>   
> +# internal duktape doesn't build with BR2_OPTIMIZE_FAST
> +ifeq ($(BR2_OPTIMIZE_FAST),y)
> +define NETSURF_DUKTAPE_CONFIGURE_CMDS
> +	echo "override NETSURF_USE_DUKTAPE := NO"       >> $(@D)/netsurf/Makefile.config
> +endef
> +else
> +define NETSURF_DUKTAPE_CONFIGURE_CMDS
> +	echo "override NETSURF_USE_DUKTAPE := YES"      >> $(@D)/netsurf/Makefile.config
> +endef
> +endif

  Ideally we'd unbundle duktape of course. I took a look, doesn't look doable.

  Thing is, with this, based on optimisation option, you have netsurf with or 
without javascript support. Not exactly ideal. I think this should be a 
user-visible option then.

  Anyway, for now, applied to master, thanks.

  Regards,
  Arnout

> +
>   ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
>   NETSURF_DEPENDENCIES += libgtk2
>   NETSURF_FRONTEND = gtk2
> @@ -77,6 +88,7 @@ endef
>   endif
>   
>   define NETSURF_CONFIGURE_CMDS
> +	$(NETSURF_DUKTAPE_CONFIGURE_CMDS)
>   	$(NETSURF_ICONV_CONFIGURE_CMDS)
>   	$(NETSURF_SVG_CONFIGURE_CMDS)
>   	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
