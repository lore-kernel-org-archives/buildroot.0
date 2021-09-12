Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1013AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460D761050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 460D761050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D399560745;
	Sun, 12 Sep 2021 12:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igRLlgqtOmKK; Sun, 12 Sep 2021 12:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3199D607DB;
	Sun, 12 Sep 2021 12:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA711BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3220840267
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zjE_lHgqr6u for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:42:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E523A40119
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:42:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b10so7915083ejg.11
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lg24k7FVDIy3h9wcF3pUN64reEjH591wmNvIZUj3AVE=;
 b=NuGVPPsr4H16NaXVfPZQ5m3sdxWu8IYV6YvBARP9g8lnd0NwSvjsJMCKbi65JnOxkP
 a8Ewdu2tes3+mscIKZzyTdB+SKJWpsKuRGDnS5tHHg0QNVpkXx0DybgV8bOQLV9fHrm8
 WI1drf28641NzOfK/YBngm63/MB2m46h2YMvZgb8jRhkuW2zCx0IloJivNXE2idyf9OW
 k6Y1Nc5S91rt7p1o6ezIqIEQa56ZhcBDmG6HNbzkwDDbqC//cjhkARitKal8UwL04OXv
 h/N1yR0N+1WQPn9u5Yq98nUbJZ0daiixghCN+oMCVuFBastM9zv5z0TJ1v6DH4kHBJx9
 D4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lg24k7FVDIy3h9wcF3pUN64reEjH591wmNvIZUj3AVE=;
 b=J8Zo5GiQwxJ64tuH0l0f0rbPZr5b78WqVyGBO6M4/kuoNL6VM93LDmFO+u/XpbKpcY
 Q2QlSdtyUmIYcp649f89C1T/mthlTw8Lr6dz5LdO7eAOrdKsAknIgXrAfKhAFJ646exF
 XnPiBVhyf0/LPAKAJrisNiwblhozol2oONmvLPptbiOcv4rjS6Pwt5hVbOFLKviG+I/U
 m+9hMd6PJFeNnGHPDo6hY6BaEIh9IZX1wg4sZDusKJUmkqyXSZtkwUnKX0MWoSsF9s1G
 LkrwfW8140KiF+lDYeXReOnIXnjjBC8qIgewmemChqlky7HzTECKGMmHELK3N0mQQ2vs
 Sq8g==
X-Gm-Message-State: AOAM532HIxWnjbY71oiKCoMfauLOQfNH74qdbqbhfxhsKdsa11qnw4QS
 3+43IoDEuWuogyQOYgX0fJ/OEPCywKrFhQ==
X-Google-Smtp-Source: ABdhPJyIg0YK0iIYx96sTg0q2Bpy4Nbd5BctskHHB5HBrT2cDVMgg185/T5RUaTLxY5Nx/Zn+K1Sjg==
X-Received: by 2002:a17:906:7147:: with SMTP id
 z7mr5089616ejj.94.1631450541998; 
 Sun, 12 Sep 2021 05:42:21 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bm1sm2000300ejb.38.2021.09.12.05.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:42:21 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905193252.1379329-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b48d9861-fb46-7704-9696-44076e4e3aa2@mind.be>
Date: Sun, 12 Sep 2021 14:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905193252.1379329-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/rwmem: needs wchar
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 21:32, Fabrice Fontaine wrote:
> rwmmem needs wchar because of fmt dependency since its addition in
> commit 51a282bcb8dfc26d3a27723383c5a1767653a19d
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c06c27d70aae8bdb39ae43fbe74896e536293c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rwmem/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
> index 0fd9142e92..cd9a7f78f1 100644
> --- a/package/rwmem/Config.in
> +++ b/package/rwmem/Config.in
> @@ -2,9 +2,14 @@ config BR2_PACKAGE_RWMEM
>  	bool "rwmem"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR # fmt
>  	select BR2_PACKAGE_FMT
>  	select BR2_PACKAGE_INIH
>  	help
>  	  Simple program to read/write from/to any location in memory.
>  
>  	  https://github.com/tomba/rwmem
> +
> +comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 5"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
