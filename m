Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795BFC3DA60
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 10:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2368C4029F;
	Thu, 18 Jul 2024 10:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyIOS7WBHy4Q; Thu, 18 Jul 2024 10:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D0B40281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D0B40281;
	Thu, 18 Jul 2024 10:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD2C11BF371
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 10:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EF481E34
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 10:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bP9LBIM0L4ul for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 10:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D69F8193E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D69F8193E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D69F8193E
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 10:04:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42795086628so974035e9.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 03:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721297095; x=1721901895;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m+77DZYwFyBAcfjjzST4Nh4h4d8plQy+wKYjmNFJ9Zs=;
 b=ooRPjBTvTASJSD5/XwI8p+K7dJbJCnHgXwlUqQ/J1Pa2g9OeEVKF6U1m4ZylEoHsi8
 pFmNwEIbRVoHcL0Qeo7rrOJDOXnedjkDl6R05IqFoNujeVeVdjznOQaxYCPvkFxCwvXJ
 59aeYLu9L0jwTzLze8CxLK5RE9iWoA0idXruRgTfQaVclFuwsEVp5aiXMrcreCDLdKly
 8IpQwzmqJBsaQi+J7lI2H2/XCuRi3kK3LPSRCLnoaqSAyVZDFR+Iepx678ZMUJGcjjaf
 bInlvO9zN00eQLK83wds7wGEcC2ftr+NbcoUlUhUF+MwSk2yDOGfeQGDHLeougRKpqUJ
 oeXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU74Z2k8SmSOdTcCjVxy4XPbpfdPxG9Aamg9XIz9P89knI5g/Zvo1Ljwf+Q/CIuY3/4tja2FO/LDUkReg2ZLBg56kAdGY3HzA==
X-Gm-Message-State: AOJu0Yy5pnsI8d/7BfAffK5p+i0KtHDLPRcvGzigAnbu4nMkhvAQXS3V
 DO/A2untGZ8E8Ee2KQghGHfzDABAKOYLQ0/fOM6Qd1lbSPIum99BS8uWzmBf29U=
X-Google-Smtp-Source: AGHT+IGbkMVAoJtzPcRYNRgSNdfI5BLGS21GGirU63yQ4GRUXbpd7/9R7SSIMuOkWAY8OC3FVbf/tA==
X-Received: by 2002:a05:600c:3147:b0:426:6f31:a605 with SMTP id
 5b1f17b1804b1-427c2cbff32mr29591045e9.17.1721297095448; 
 Thu, 18 Jul 2024 03:04:55 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a3c09csm5850965e9.9.2024.07.18.03.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 03:04:54 -0700 (PDT)
Message-ID: <23725f14-d243-45da-b096-948c5e063aa7@mind.be>
Date: Thu, 18 Jul 2024 12:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryce Johnson <bryce@redpinelabs.com>, buildroot@buildroot.org
References: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721297095; x=1721901895; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+77DZYwFyBAcfjjzST4Nh4h4d8plQy+wKYjmNFJ9Zs=;
 b=OUkh4hTW/2UPQxdnhYb0WkoETYTpzTz+hcmMK9HBm+zWFpcfCPDf7Og2BFOnMWVsWn
 u9mjBVwayPRILWghfSEFNudE8rSdY6l3v4Vipg9wAdVDl2+zj4B8+bto4TBb19SGulbg
 PVmngK//l9Oo8bRos6Cc54ncB9Xa93DoJFN6/NA0DZvGpHns8P5/i7TU9jax5gXaZ0Hy
 9eeG/iNOYm4CZwDjYJ1hWXySw3mctP6GNvlZR2OHelIWzcr8xZNBB3EVDlOOjyXHEJzI
 VCEVVcZTqz1fychoMgbMbylFbkEWhav6k0G/NHo0pBEL0EXlK0nkqqPwHEKleq3QT1LG
 sXcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OUkh4hTW
Subject: Re: [Buildroot] [PATCH] package/connman: Remove wpa_supplicant
 selection for wifi
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: martin@barkynet.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2024 23:14, Bryce Johnson wrote:
> Connman wifi works both with IWD and wpa_supplicant.  You don't want
> BR2_PACKAGE_WPA_SUPPLICANT selected when using IWD.

  But you still need one of them, right? We normally do that with a condition like:

	select BR2_PACKAGE_WPA_SUPPLICANT if !BR2_PACKAGE_IWD

(or the other way round, of course).

> 
> ---
>   package/connman/Config.in | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index af3e1f69f6..44a3b41fb2 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -45,8 +45,6 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
> 
>   config BR2_PACKAGE_CONNMAN_WIFI
>          bool "enable WiFi support"
> -       select BR2_PACKAGE_WPA_SUPPLICANT # runtime
> -       select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime

  Actually, we would typically only enable it automatically in the .mk file, 
something like

ifneq ($(BR2_PACKAGE_IWD)$(BR2_PACKAGE_WPA_SUPPLICANT),)
CONNMAN_CONF_OPTS += --enable-wifi
else
CONNMAN_CONF_OPTS += --disable-wifi
endif

  But since we already have the explicit option, I guess we should keep it.

  Regards,
  Arnout

>          help
>            Enable WiFi support (scan and static/dhcp interface
>            setup). ConnMan detects the start of wpa_supplicant
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
