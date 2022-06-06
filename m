Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A82C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433FC41703;
	Mon,  6 Jun 2022 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvRBYK-9Hgba; Mon,  6 Jun 2022 13:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5796418F8;
	Mon,  6 Jun 2022 13:01:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 436251BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40DA083F78
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw9wY_xoD4Pb for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:01:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62FB583F76
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:01:41 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id s12so21602584ejx.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IUT4ev2lVxyAT2xAau/pSO8wUmnVD04BYWE4Hq2hpuc=;
 b=PRdMsCZ3gHKN8amSB+3pgQ2pIQDs2ZBQfhG27DalN1Fcs8p9ENPgsBs4SZmhtKCNTN
 7Yr+hmksdoGB6ygL4lIpVQERI/KSxugpVc/qU08nVGT6kdcqQQV1IdUz1wlLFbGD+I2Y
 mtGxwtzB/QqlKuwLEy19puHVk+J4eWQsfxcJ8B4rYnboGO5QL5fo2AMh9fPOgXMnj5fg
 bodhnckBp/DrD1oogjUETNAZnRT1ytxj6WwNR1zkG2UlJqMz0/Oho32mIK3cHrrNOxqt
 MBDoQK3UWVTNaW7JcL1g/0VPLD5pWTcScLY3U28wqxC3NgeQoLBvOhgHCB5tgUpcC7Z9
 qw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IUT4ev2lVxyAT2xAau/pSO8wUmnVD04BYWE4Hq2hpuc=;
 b=TlPt+c1Up0DPd5G39SaD0unmzZXLAJ+mxmMzfdFbd8dNUyOasDu/Bykmqf71KACPTf
 ES1mSmXgx5ARMZpiSCvaC7s29Av8L8Z9z66P2RfqyEjf76brTvSpV5bHW64VBoe4BIA+
 1AxrS8ri9r+dgr5/2pZK0zWQ8zzx3kTyLg3x+pQEB4YWNWDfM+xFz94PvT/n7wF8Ld28
 DSt7xkWcWfikAEKJHVTBvO0AarDs84qEsbyqud5GQamJmJlAQingUc2zqTyuCYCQoF2w
 Gns+sc8xcipSpuVTiZn46jBxt+pggjFAXvWn7FkQunkQ4VyvlBhFvDHZFyowsNtCuUZj
 vLFg==
X-Gm-Message-State: AOAM530oIYMBYT5CpAfvUnGjjksELYUhwwR8T+nRHJaQOrMRm9WXylHS
 YjLQ7ROo6q5NRFKtcNkYDNMFKb4AOJrMHQ==
X-Google-Smtp-Source: ABdhPJxcwsq8BqVpW2dEfZkAakB5/UGSUyhrEITDZK15awu03fwxMBZN2K+3+dzVT1QZ+kcr/A7yLQ==
X-Received: by 2002:a17:906:5a4d:b0:70f:7d1c:664b with SMTP id
 my13-20020a1709065a4d00b0070f7d1c664bmr14201634ejc.540.1654520496961; 
 Mon, 06 Jun 2022 06:01:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170906278600b006febde6d771sm6264367ejc.160.2022.06.06.06.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:01:36 -0700 (PDT)
Message-ID: <ed48193d-5b66-3d0d-de00-ba082f141264@mind.be>
Date: Mon, 6 Jun 2022 15:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220605213113.2366560-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220605213113.2366560-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: fix tmon static
 build with uclibc
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2022 23:31, Fabrice Fontaine wrote:
> Pass LDFLAGS (which will contain -static) to fix the following tmon
> static build failure with uclibc:
> 
> /home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -O3 -Wall -Wshadow -W -Wformat -Wimplicit-function-declaration -Wimplicit-int  -D VERSION=\"1.0\"   tmon.o tui.o sysfs.o pid.o  -o tmon -lm -lpthread -lpanel -lncurses
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
> /home/autobuild/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/x86_64-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/58f4cdb734b68afb02595d004e7ca19a15d1abcc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/linux-tools/linux-tool-tmon.mk.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
> index 15931c3124..56c328c51f 100644
> --- a/package/linux-tools/linux-tool-tmon.mk.in
> +++ b/package/linux-tools/linux-tool-tmon.mk.in
> @@ -9,6 +9,7 @@ LINUX_TOOLS += tmon
>   TMON_DEPENDENCIES = host-pkgconf ncurses
>   TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>   	CC=$(TARGET_CC) \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
>   	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
