Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3EEC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B32884693;
	Wed,  5 Jun 2024 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td7qeGnOY4g7; Wed,  5 Jun 2024 20:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786EA848CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786EA848CD;
	Wed,  5 Jun 2024 20:53:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8C3F1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FFE61170
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rM1Z9umPXKv for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC5A260604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5A260604
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC5A260604
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:53:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4213870aafdso3274375e9.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 13:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717620797; x=1718225597;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfaxwVb0QH68uCXEFg0Vz6N7M9mTJIou3TuEOkpQnbY=;
 b=N/+kwER4SVnq1+pq6Ad1vNjVlIo3kpJTnrfr2OVpY57CjueWAweyulKFginYIcUNuv
 jNz+q4gBxnyPFj7yf8PqX1L0OygFO4ZL1n4idjEchVrLnjHbbP0iSCKeJKST33VW8fKt
 sDDayMcAfJAbOaJ18LmX/nbuIHsZSLZNodq7+Rxv/OZVo624h2oqWYTlJXp8QJjDhvbf
 Uu3ghKUCiGXdVl7fhjt9YFXM0HGYCmfGdWihr8dIwyOycuDCuKtKYQkwCbQdKEjaWt3c
 a3tX1xgkNx6E2xYFhPEafi8frNdXqGALWKnuqr7nc7ybHP0oLXS7CQ3RY8LJ5Ga1uvMO
 WvHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWDSIoJDwAjgH8f47tuSrx/hdV9kIlxGzJTfi0iWjlAH0CO5PLoEICIJAt0El+DeMdfAaBVkhb7vfRfhhWUPstE7qKPZSsyw==
X-Gm-Message-State: AOJu0YxBl5PqRGEed7dilswuiZEMImGPunF44dcfKXY/WcuffLImq/ue
 Jr50pj4VN+a2vj1Dq0RlBYEUCzmMbkxJ7SEzMJqxjW0nFf0NQkZWe4VRRhc5hio=
X-Google-Smtp-Source: AGHT+IHEKiO8VcCl+y/VsiW2XUycne5T8ITujm1uKHjs3oyeGU2A7x+rz27mm6NoIq8Y9F7Je0t1vg==
X-Received: by 2002:a05:600c:524b:b0:421:494c:9e92 with SMTP id
 5b1f17b1804b1-421562de244mr29178745e9.14.1717620797424; 
 Wed, 05 Jun 2024 13:53:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd269sm38975e9.42.2024.06.05.13.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 13:53:16 -0700 (PDT)
Message-ID: <6476235f-0b7f-410e-b056-df620d3632ca@mind.be>
Date: Wed, 5 Jun 2024 22:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240605090440.2400647-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240605090440.2400647-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717620797; x=1718225597; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gfaxwVb0QH68uCXEFg0Vz6N7M9mTJIou3TuEOkpQnbY=;
 b=YjZ5TxcnU9GGmAHS+LW0rHEStS2mKhJ9ruzBcBZoFYY9MU0/hpc5a2/QA/7v05rTTp
 xRslaxn1n/0tFbMG852dY7ij04MRkMeppzglrMrzxdA/tAYCOijV3Qtk7+TngH1BLzRa
 fAnskvQc0/pcCl4XlOgiHB1o5dS0ag92YfjImSbS3EoiA5TgUeJ2K+TDbu5X9qEURj1Y
 NJL1uw/HKzzCsXh1oTBayfUFst5RaFTsDNvA5PdpapVVVK05KwW4qYFHEaFPpYQBMH+H
 xTPpCNZwordtElsJI9PnACbXKMiS3x411VwSWk+6VnMKzkElfeSj/fzdhrIjiGGjF1Cj
 mztw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YjZ5Txcn
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: don't use stack
 protection if BR2_SSP_NONE=y
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2024 11:04, Dario Binacchi wrote:
> The openssh package enables the use of compiler's stack protection by
> default, but allows this feature to be disabled using the
> "--without-stackprotect" configuration option.
> 
> The patch disables the compilation of openssh with the compiler's stack
> protector if the Buildroot option BR2_SSP_NONE is selected, thus ensuring
> that the package is built consistently with the Buildroot configuration.

  If that's the only reason, I'm not sure that it is worth doing this... A 
convincing reason to always disable SSP is if it leads to build failures (e.g. 
the toolchain doesn't include the SSP library so building with stack-protector 
enabled will just not work). But I guess that's not happening in your case (I 
think only uClibc can really be built without SSP support, and probably the 
openssh configure script discovers that SSP is not supported...)

  It's like the other hardening options IMHO - we do set a global default, and 
that should be considered a _minimum_ hardening level, but packages may still 
opt to enable hardening by themselves as long as it's stronger than the global 
default.

> All this also affects the size of the binaries created by the compilation.

  How big is that difference?


  Regards,
  Arnout

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   package/openssh/openssh.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index d7f4db59ca3d..699b084a5705 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -22,6 +22,7 @@ OPENSSH_CONF_OPTS = \
>   	--sysconfdir=/etc/ssh \
>   	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
>   	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
> +	$(if $(BR2_SSP_NONE),--without-stackprotect,) \
>   	--disable-lastlog \
>   	--disable-utmp \
>   	--disable-utmpx \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
