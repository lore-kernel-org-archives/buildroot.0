Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927BEC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:13:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D84461002
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D84461002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01C2C42552;
	Wed, 25 Aug 2021 20:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyrXBACgOkEc; Wed, 25 Aug 2021 20:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3240342556;
	Wed, 25 Aug 2021 20:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 648AD1BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5381B40117
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BrHoqWrp0aun for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:13:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E02240139
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:13:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n27so973683eja.5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2qgKDkAU4uh4ImJBtOKIEg0t1BGvJ2HTvrOJ7tqTZdY=;
 b=YISQ6rQ7cYxMquC+lUW6vObDkHZeJEjQkQxCrT2/Fut/F8INGTKDWc3Ip1tBDuwmMk
 hbuq/QWAHjGAiCmj1oIwp62U04xvZjPJ6EYPHjqWRa7KYsTgkL/lz6eYKFoUrrjHIQfp
 EXMsc6S45qTMEBHeHLHzKGULPrviZBLmYHyFO4vixTnmngnxLm72DX8gEuldizlsjApw
 Niq8lZDyUo7LYagGp3v4smE1WpwKhaKUaWwsUYO0/c3AyoRrwefqBJzPTqM1hsAIW9cx
 R2ck1R5ScgnoO1OX5ob/EUryAqkBxGKTg0BuyCGdQo8/qdp/Az0KIXhLw/AIew1yF3gT
 C1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2qgKDkAU4uh4ImJBtOKIEg0t1BGvJ2HTvrOJ7tqTZdY=;
 b=icHkaB60HWWDNrIrzJcSWgTKV571FNOiuHiZwqnkLGAuC3dRkmi5CMLF35GW9fDnhe
 c0Zgmwn8E7iHIvXsJZ+uly23hm3Aea0DPLvwrabQvQGDn597V1O1LzwKx3+GtTbtEj5S
 RZEbx0Tlnw3Y8L6Ic/D+mGmE1rzxWplB0kUXd+WepEtWqIg6TYyVS95wht9DPdToeeob
 Sn5z40mnAqyArJC9vPndFLia/PXAy6uoIEwTUGSu5kjijiyITrn7tcccPPCh1TUzhtnj
 T9TXknzJr/fK2fO0QEe4irMhc8IJWBYsAllMwcl3OrfkKNMr4qFbkyLl4qUcXygeS9L5
 ySew==
X-Gm-Message-State: AOAM531lOuTnHLerPiP7t+QsN8D4HpuXaLWz8ulgC6fYgjHHOb5FMoFt
 m1A+hY93418cVT3ZBTnXGh5z5L1rHy5Y2w==
X-Google-Smtp-Source: ABdhPJw9gqca+Rt0c4jgXdbPRVWU94ZaNKh9lq4VirQu5UzZ3hZsWjy57KVCj8txWVKzgUSUSM76eg==
X-Received: by 2002:a17:907:7856:: with SMTP id
 lb22mr418311ejc.264.1629922417134; 
 Wed, 25 Aug 2021 13:13:37 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p23sm303694ejc.19.2021.08.25.13.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:13:36 -0700 (PDT)
To: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org
References: <20210825151659.59671-1-glex.spb@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <66e3f1dc-4b00-0e6c-9b3d-028364a4ed10@mind.be>
Date: Wed, 25 Aug 2021 22:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825151659.59671-1-glex.spb@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: Fix alsa-plugins
 compatibility
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 17:16, Gleb Mazovetskiy wrote:
> Previously, alsa-plugins would not work if alsa-utils was installed
> after it. This happened because:
> 
> 1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
> 2. alsa-utils removes these files during installation ( rm -rf $(TARGET_DIR)/usr/share/alsa/;)
> 
> The `rm -rf` command was originally added as part of the fix for
> https://bugs.buildroot.org/show_bug.cgi?id=1573 11 years ago.
> 
> The intention might have been to allow for unconfiguring some options
> and then rebuilding alsa-utils. However, this is a scenario that does
> not work anyway.
> 
> The simplest fix for the `alsa-plugins` compatibility issue appears to
> be to remove the `rm -rf` command.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

 Applied to master, thanks.

 Excellent commit message!

 Regards,
 Arnout

> ---
>  package/alsa-utils/alsa-utils.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 2658c827a0..427280c1e6 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -77,7 +77,6 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
>  	fi
>  	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
>  		mkdir -p $(TARGET_DIR)/usr/share/; \
> -		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
>  		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
>  	fi
>  endef
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
