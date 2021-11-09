Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12B9C433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F72619F9
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F72619F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 443B3403C3;
	Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQY3vbBTORVW; Tue,  9 Nov 2021 22:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54D40403BA;
	Tue,  9 Nov 2021 22:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2F0F1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CB2608CF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-slwwEmqwyp for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE8D2608CE
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:18:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id f8so2448154edy.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=83y/MpEGHuzYEzHyRKa3+BNNC0EgAPUAo7iw11xruCo=;
 b=VcYiuJQASk/lwT6KOsDp5pEwBUUikwQhMcW6BKgOwiM/KD3Q9fkR7MIZ0Bojh5upMD
 t/HMGyJvLAQ/4Y+QxkMzcDLvc7zKxo7Ovf1Mw2DxeDHwxLP8iI1QhPA1ToJ42cknYJ+z
 CIXN3f0+7Rul7VP+h5xf9D+1CQURwxfNsrJ63QfO09kGqQJCdAYsod4FKx7NminLzJOu
 w6CZzE0Svz+CfeKJhntYAr/dO+9o0FnAUYhjw+Eok8WrD43fmo9zBGm7PekWs1Bd0iSV
 HcXWXz5w3BXmXcsmMN8zAlWjcvjzv1R4qHTihojnFXpeFFnHhxu6NVgQpV5YVQ70u4UC
 Np5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=83y/MpEGHuzYEzHyRKa3+BNNC0EgAPUAo7iw11xruCo=;
 b=F/9bQ/S6RheBrWqphZiZdRbM6KTcO5GDQbYx+hrXEc9R96RMeh2No2AT1RS7gB1Kjc
 kWePhg43cpk+4yr3JJCTcuiIEyZNQKP9Pp521Jj24TdDspOys/qC+Mt7e/YSCC9eWl3v
 4Fo2JrN49lJULnx5X/9+rUb1ICbiiS3gOdi8MS93ih1Fi1rLJXem1SIfdC2ymesKRNH7
 7ir4h18d/g1jHY/r3dQuaVOFFte26rvbvabK66ETVJ+KdcutxmfJVUqdUcr8bgmGJUX2
 hRH7xHG9RYhFYPGJGiAzf1ntgIBwJk+qllClTGkcIcPHHQU5DoPBzcHfpmVKmdkTPmnH
 WzvA==
X-Gm-Message-State: AOAM533UFQyR7Szc6E189kV4W15/yFjC6BzxY7Ztw1HNKetysQw1lRNT
 OTtB7O68QDnaJZTPMLgtbeUwUqoKNS4Xqw==
X-Google-Smtp-Source: ABdhPJxlAyh8uZuPc3Lq4zlU+H4PyiUuk8x8bV/UvSRtrT9eiU2cbHgqISgbSmq9MCRUrUGsnTnNAQ==
X-Received: by 2002:a17:907:72c9:: with SMTP id
 du9mr13765321ejc.37.1636496337962; 
 Tue, 09 Nov 2021 14:18:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b11sm12440736ede.52.2021.11.09.14.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:18:57 -0800 (PST)
Message-ID: <ee479e08-aec0-6f6d-04cc-7f3f6e9add1c@mind.be>
Date: Tue, 9 Nov 2021 23:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211105193243.2530585-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105193243.2530585-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/janet: link with -latomic if
 needed
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



On 05/11/2021 20:32, Fabrice Fontaine wrote:
> Link with -latomic if needed to avoid the following build failure since
> bump to version 1.18.1 in commit
> 1ffdab3eac6ea111e37fcc5077f8a64b611c55be and
> https://github.com/janet-lang/janet/commit/eb0b37f7296611a411b9a86d9d65fe620b0454d8:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: janet.p/meson-generated_.._janet.c.o: in function `janet_abstract_incref':
> janet.c:(.text+0x2790): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8d204d8f065e6e4bc1376edd1f639864b3c69c0b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/janet/janet.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/janet/janet.mk b/package/janet/janet.mk
> index 20917ec8fa..71e9e08e62 100644
> --- a/package/janet/janet.mk
> +++ b/package/janet/janet.mk
> @@ -15,6 +15,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
>   JANET_CONF_OPTS += -Ddynamic_modules=false
>   endif
>   
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +JANET_LDFLAGS += -latomic
> +endif
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>   JANET_CONF_OPTS += -Dsingle_threaded=true
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
