Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30150C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 04:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0FA41CA3;
	Wed,  8 Dec 2021 04:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGRvATxRU8ER; Wed,  8 Dec 2021 04:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E28141C94;
	Wed,  8 Dec 2021 04:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E98C1BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 04:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC1040965
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 04:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysL51SkYYWZs for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 04:44:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54B3F400C7
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 04:44:33 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u22so1899902lju.7
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 20:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fCy2nul+bIC2BhiWO49NyXVeC75yk4q/fHYWzLd0sWM=;
 b=Jzxom8RDcYhTFNgYnWt9Dc8281aPwkr1aUpXS2Qpmii1pBjUQLNlX93jyk5JwSxg7w
 wt1ate5yYFJ5sx0fvS7jnHmpJu5frL6GBQZzSNHfrK5vtbe0qG3xDr8I5VF4Cb34kdJ8
 PAg/FwNZv5W/uaau9S4PuMzRAy9Cb7d1ChQTVNbDzCypf18Ip9hF9LNJnwFoHfjQpGVV
 T43yk1AixqAAtf+6X3AVs+xm40Q3fxJv2Jlybum9wBw0Mn0G24KQ1j1Pj0nsFX2jq2Jr
 31ehNsZIOh2oV8WUZuE3bJ2zdukKTk2y4TL8VT+TVcrKviloV4T8D4RYYGluB/wkmCwQ
 ysuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCy2nul+bIC2BhiWO49NyXVeC75yk4q/fHYWzLd0sWM=;
 b=O95kAK0upr1pBzClb4E/Vadb1+MOHDEERrfyu9aOjUCkgvy6wOcB3DkcneLkiu3LL5
 aJxKl8nDnKRxpyayu5c6rJGL00HxHT7CgCTx6xBB2PeAChB5bvz9Z0ysUH41cG0Hl3YT
 3YJRjWi2QZi8V2Lt18gzxC7dnLyAH9j8Oee7CEUmYsbskur2jvRVP8B60Byo6YGZZm34
 EAtR5Rf8CSA79uAQLeKYYCxPVDg6QU7zoKbtEbVD6Wd1kgNEtlZq7+avMZ8xYydXtNpk
 vM3fDGlYgB1ZMb+IQ+dv+/sgal7LXEmStGFB6QH7GC8wQv25WW+7nzOFXpynWMNsc0Pm
 Hxuw==
X-Gm-Message-State: AOAM5307EqqeklJA+TGnvppFQLqAXJFWuJ5009lGtXKOvPWD7sqz0bhM
 cwyhS0iKReZMTT+fng9nZ8c=
X-Google-Smtp-Source: ABdhPJy5pQRpHgcq3ekU2DsG6x9fy3JJetf0i5WUv1kuUZrDF+dZixyA5wKmRzlFkPj9aN87VagXUw==
X-Received: by 2002:a2e:7114:: with SMTP id m20mr46459668ljc.229.1638938670998; 
 Tue, 07 Dec 2021 20:44:30 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id j19sm174594ljq.9.2021.12.07.20.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 20:44:30 -0800 (PST)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211208010816.3186969-1-aduskett@gmail.com>
 <20211208010816.3186969-2-aduskett@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <450b3c3d-946e-94f7-fed1-1fd8a11dccba@gmail.com>
Date: Wed, 8 Dec 2021 05:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208010816.3186969-2-aduskett@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 2/2] package/watchdogd: enable selinux
 watchdog module for refpolicy
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 12/8/21 2:08 AM, Adam Duskett wrote:
> This is needed for watchdogd to work with SELinux.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>


Acked-by: Joachim Wiberg <troglobit@gmail.com>

> ---
>  package/watchdogd/watchdogd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
> index b666b56433..1a9d04d938 100644
> --- a/package/watchdogd/watchdogd.mk
> +++ b/package/watchdogd/watchdogd.mk
> @@ -11,6 +11,7 @@ WATCHDOGD_LICENSE_FILES = LICENSE
>  WATCHDOGD_CPE_ID_VENDOR = troglobit
>  WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
>  WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
> +WATCHDOGD_SELINUX_MODULES = watchdog
>  
>  ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
>  WATCHDOGD_CONF_OPTS += --disable-builtin-tests
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
