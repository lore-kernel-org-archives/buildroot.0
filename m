Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26530C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C211740120;
	Tue,  7 Feb 2023 17:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C211740120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eqjMxrUw3gc; Tue,  7 Feb 2023 17:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7CB040A68;
	Tue,  7 Feb 2023 17:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7CB040A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8011BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 315D581323
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315D581323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2nrEQAFZFjh for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23CFF80FB0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23CFF80FB0
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:16:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d14so14256704wrr.9
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lhUNms1XAptgg5eE9w2X4fYUhOk6IM6aoM3QxMisRzU=;
 b=mlzSZ1/EdVEl5uY9wjnS6YFmXJlMi2IyeB3Jkmdh3W/XCmQyj+DFoO2P37qDAlo7P2
 rDZ8uGBIXoq/nw4MCYluYCozlzNMdfhT0/vZwBpzkQKFhUa6+hnroU7ldS5fF1d5aUIR
 OfjwozFV3NJFlkfuCXiWfh2mkLCFUHV1NXbF+F8NTKHsPALjwov1wBT+/zLpL38HeV+6
 XtETrlH/lpklxchnUU0chn4hvLQvQXPHC83JlU+r4DHG4wEYV/2YfwV8zyT7Eg3YdJua
 1V2ugKEbcfCvgLGTk+QivPGMJ5A8BRwxbLjOLXmJWTCcnmjUlZOBELvqUPVEockuywIa
 v1ww==
X-Gm-Message-State: AO0yUKWZmg50vFvoobHaUdSxgEFSmf5sHWC/pRCAnnKclGWB4G4+Ao4j
 15yS9G9ITxp3CYGMQ/pXdvjpjACDUpSwtgKE
X-Google-Smtp-Source: AK7set8bxD/LVqajjGIKBc5titrKvFE0wR8DMhf06YWn2ZTBF/SWvOCjiYhA5XaPAkZ24D58vF8VsQ==
X-Received: by 2002:adf:dd44:0:b0:242:1b0d:9c58 with SMTP id
 u4-20020adfdd44000000b002421b0d9c58mr3538552wrm.69.1675790205396; 
 Tue, 07 Feb 2023 09:16:45 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adff5cc000000b002c3db5057b6sm9893295wrp.22.2023.02.07.09.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:16:44 -0800 (PST)
Message-ID: <65c21c58-0a25-50b0-0e35-f8b4da7abac3@mind.be>
Date: Tue, 7 Feb 2023 18:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115114840.9027-1-nolange79@gmail.com>
 <20230115114840.9027-2-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230115114840.9027-2-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lhUNms1XAptgg5eE9w2X4fYUhOk6IM6aoM3QxMisRzU=;
 b=XCds/dn0CDzrxcusfxd9Zg2z6RLlMWyoh9bDTgFOVviVGWOf8+ubdnVR0mKUk5rB48
 4ySNY3Dg8at36ZLml6ByWByKOcK2gdfLBRcuLUM8KRZ3cjfay/qTIF+LDXqIm0aquH40
 FgSWcZo0wfkRaOBt4AoMrsjrcHQ36cDiVYUZ7yL315VjGYvPmcbqxKIwKLol3JWX8IZu
 9KxofeGiJPN7ivE1vuppxmLReApe8qzHNNTcepALM+OqVL1PG5ZyhI6DgZSuygK/CP3Z
 Yu0rKdgrWle7c97iqQKWtMKjIKrZbQzvomTTIT+TfeM7P8HcCzpGfpX9UReZ1hZfzGXP
 z6hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XCds/dn0
Subject: Re: [Buildroot] [PATCH v8 2/4] package/systemd: Add config option
 for sysupdate feature
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 12:48, Norbert Lange wrote:
> Support the new feature added with v251,
> requires openssl.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/systemd/Config.in  | 12 ++++++++++++
>   package/systemd/systemd.mk |  7 ++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index f35305c0be..9278772951 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -481,6 +481,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
>   
>   	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
>   
> +config BR2_PACKAGE_SYSTEMD_SYSUPDATE
> +	bool "enable sysupdate support"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK

  AFAIU, sysupdate uses its own particular way of doing A/B updates (by updating 
the GPT partition table) which is only supported by systemd-boot. Although I 
suppose it's possible to write a U-Boot script that does the same thing... So I 
added a note here to that effect. I don't suppose you actually used this option?


  Applied to master, thanks.

  Regards,
  Arnout


> +	help
> +	  systemd-sysupdate atomically updates the host OS, container
> +	  images, portable service images or other sources, based on
> +	  the transfer configuration files described in sysupdate.d.
> +
> +	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
> +
>   config BR2_PACKAGE_SYSTEMD_SYSUSERS
>   	bool "enable sysusers support"
>   	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b0597f9bb4..f49d34d32f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -91,7 +91,6 @@ SYSTEMD_CONF_OPTS += \
>   	-Dsulogin-path=/usr/sbin/sulogin \
>   	-Dsystem-gid-max=999 \
>   	-Dsystem-uid-max=999 \
> -	-Dsysupdate=false \
>   	-Dsysvinit-path= \
>   	-Dsysvrcnd-path= \
>   	-Dtelinit-path= \
> @@ -489,6 +488,12 @@ else
>   SYSTEMD_CONF_OPTS += -Dsysext=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
> +SYSTEMD_CONF_OPTS += -Dsysupdate=true
> +else
> +SYSTEMD_CONF_OPTS += -Dsysupdate=false
> +endif
> +
>   ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
>   SYSTEMD_CONF_OPTS += -Dnetworkd=true
>   SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
