Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2447DC6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 19:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7589C41B8D;
	Fri, 10 Mar 2023 19:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7589C41B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtjSZlAzgKNX; Fri, 10 Mar 2023 19:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7503941B98;
	Fri, 10 Mar 2023 19:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7503941B98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBB551BF2F0
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B23A160FCB
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 19:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B23A160FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq-pi-uFRH_f for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 19:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328CC60AF1
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 328CC60AF1
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 19:53:33 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id cw28so25115202edb.5
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 11:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678478012;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGF8or90H5lVnHLlKPDRdvRVt/Uu22W7tJEWBe1q9Gg=;
 b=y+Vl7mlgwll007ejyei+jFhPGVt5cX8uCRTU6maaHWxgCm94q/uDHsQ/qBoevg9w7z
 Skp9N/aoivXKvMT6Gf5vgaykwV2vDmVxUdMDxo4GJ4yTRc+kzcDzVTe6tMDEZY4YQekJ
 MgcxCN+2+u2tPFXRMY0YvhYyxsiDr6M2yJ2idqaazVDNwX+CYhUHOwrO1vEVjpJhukR7
 n/0eU574VJRuJLWhygSNX0JveEgCBwEgAU3F9thj64AXKMeD4udcY3SO3UXDA7MA3/7a
 iQu2nCCiFovOqci5z20wlaX65eokrncPrQRr0duBDSWZvlAcKCNgzusd7BG3uVvS/25U
 JBIQ==
X-Gm-Message-State: AO0yUKVWfDQkS2D3bWxJLOvge3CWX6Fcewkeovg0h8QiBNklFEDRrzd5
 PKusqYK/REA8fJE8fyqlLBVNBg==
X-Google-Smtp-Source: AK7set98LGtn2WLJ6LOugP5W1LAUDOXn/Hfv9fuV9SGHsUAD1+gY2C2GqwFpr6BmAqXV7k8b11gKzg==
X-Received: by 2002:a17:906:3448:b0:8f8:b3a6:cc6b with SMTP id
 d8-20020a170906344800b008f8b3a6cc6bmr25542597ejb.58.1678478012212; 
 Fri, 10 Mar 2023 11:53:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a50c242000000b004c10b4f9ebesm414556edf.15.2023.03.10.11.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:53:31 -0800 (PST)
Message-ID: <8ceb02ef-fa78-017f-e001-cded17a6abf6@mind.be>
Date: Fri, 10 Mar 2023 20:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230310171407.429975-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230310171407.429975-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678478012;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eGF8or90H5lVnHLlKPDRdvRVt/Uu22W7tJEWBe1q9Gg=;
 b=cjtfHFwgZmEaQWVp6qhXnB791TALwwGunaaLvoW1Lsrm8f9XZ/ns7SH74MUzxjIIFK
 znuqTIzZhNO7q6Odh1BAfTv379Qw7DL1BPWVRP6f24T9LCjFvYDuVlcZuzIR26N9/hsK
 BGRZ/3gwGyr1os6alG8fVfpb6WotRv79E0xIM7kVeSYf3AuYrRSUQsiCDySDdUcCoxy7
 Cyn618uwzCWQuI0ahotJzUAGD9sMPLSjL0ETZRVdOqcok1SPLPaW/HhKAkGoTqqwBHUn
 G81mgE5WklSID4cRBmeefLArcT+1pOJiB1RGBVxiBhmaSpDsN+vo8OumBWsDrLNf6rzO
 yPZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cjtfHFwg
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-qxl:
 Update broken URL in Config.in helptext
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



On 10/03/2023 18:14, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/x11r7/xdriver_xf86-video-qxl/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
> index 40f61fd69f..0c6b13eda2 100644
> --- a/package/x11r7/xdriver_xf86-video-qxl/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
>   	help
>   	  QEMU QXL paravirt video driver
>   
> -	  http://www.spice-space.org/page/XorgQXL
> +	  https://gitlab.freedesktop.org/xorg/driver/xf86-video-qxl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
