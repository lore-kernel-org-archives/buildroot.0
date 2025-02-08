Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D3C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 15:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A50606A7;
	Sat,  8 Feb 2025 15:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRnzkCfps-lc; Sat,  8 Feb 2025 15:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B95A606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B95A606BE;
	Sat,  8 Feb 2025 15:21:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35480CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 199F941416
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T373a2DRfVcn for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 15:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1D374134A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1D374134A
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1D374134A
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 15:21:22 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-308a559bdf7so15444351fa.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 07:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739028080; x=1739632880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLvJB44KP3yjkVa/2Jp7yD4maa7ysrtidLf5Actj3vo=;
 b=DpE0BvTyxEnlSkjIb1cPx0TMPB8MFVhEbliFXmBQZZIqNmIoVd7b9IU9vaWknR8atH
 hI3dyPEYHdaP6TncQqhUy/yR2LUnieYJ1YTwJW0UNOxJFD0Z6w5tejDju0e8lgPOrsd5
 l5VD/3Me5C5oUuRDGr5//J32xfaSBq/ZWgIeiptloJ1wntayOVmJY02LhzubSS4DoSwx
 qD2z7vK/Nda2VeCU3nfRmiA80DXJVYfnFl9SOuG6h2Xj+ix6SNySfgNTqKOmUfqS5qMe
 fxvgNe5zy38FXHX3LltQXqWx+O/nY6gCgtKgjxRXznWfenI8cpHBDY4gk4MukVJ8KKJG
 K1pA==
X-Gm-Message-State: AOJu0YxibtKCFMQYLDp2nGlw2IW9g5rUcOTd7KLm245fxGp+8z3iKwcq
 UpVwdET0BxzPprO3DLJHjErF3ambMQ3mcvUA5/xRf26JB2whJonePGhj6zn6
X-Gm-Gg: ASbGncvXtx1gleK59Amj7DBmSn9FaBMp9d+c8cjBydzEJa1NQrliydeziqrkWVhfj0w
 oGyvtIcYM2dAxuH0YS5A6Z3yoBFnt3YeGJI0sV/ibxWDSRY8JVSLzkrmEeCEJrk2tjlaRthQKGo
 zOZd1g+cuJJMZ5zkp4iTIbxTkg6tldDeezwSlIc4G3P3DXXp0IVK9RZxXsKtk4cZ9BLxh5rgTa0
 n8cVUgqUm+2DHtRUiQfPrwsKc/Eh1DrHH3//2GUY1P/LlN+TtpA5J93CtGEcqcl/D/ceElKL/GK
 E3YUcdYItA==
X-Google-Smtp-Source: AGHT+IESYxDbrcavhKQS0Sq1aUhCKjV5UXSa4LqrBzZSR+7VnC0zeps4hmNlRjOAh3FK0Bsbp9EXgQ==
X-Received: by 2002:a2e:a98e:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-307e5a8d9c7mr22840941fa.32.1739028079515; 
 Sat, 08 Feb 2025 07:21:19 -0800 (PST)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307e09a1df7sm6938131fa.23.2025.02.08.07.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 07:21:17 -0800 (PST)
Date: Sat, 8 Feb 2025 18:21:15 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com
Message-ID: <Z6d2a0EFzy16IcFh@curiosity>
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739028080; x=1739632880; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cLvJB44KP3yjkVa/2Jp7yD4maa7ysrtidLf5Actj3vo=;
 b=mftvvtMtY5cmoxP1/0QD07dpc0qWpcoGiuiyM4ryUI/t+6Txzi+KXdDt9Q96osU7Cn
 mqeSkHiL7I4laTR3Tsg8ScXiN4FO/echBSvbYodOqcE+y4Pjab9WmPlC0Ge5LaE0f5Nk
 jBChHzIWVA9wtsKZpND6roenTvo6jTocduVjLDAEXm5j/gZtT5Kf/Hxi9YFbLlx6UOe0
 iXTMUxaiB83qnoiR8bRTBAqhaiCoWh3u5pO5Ctb27PpBBt04+J7d/JRJgBMeAVjTZ2sB
 8WORTErKc3R9F8Jyfj4xuUQGxQ8csoFkUBk6cpLFjrjsbiTkwiHyeXd0LenDuSgj1gzH
 GjXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mftvvtMt
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Sat, Feb 08, 2025 at 12:12:03AM +0100, Dario Binacchi wrote:
> The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
> download servers"), among other things, adds the connection timeout
> parameter to the default scp command:

...

> Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/uboot.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a31010..6bbdc4151fac 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
>  	ARCH=$(UBOOT_ARCH) \
>  	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
>  	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> -	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> +	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
> +	SCP=$(word 1, $(SCP))
>  
>  # Disable FDPIC if enabled by default in toolchain
>  ifeq ($(BR2_BINFMT_FDPIC),y)
> -- 
> 2.43.0

Thanks for the fix ! I received several autobuild reports for OrangePi
boards today and tested your fix for some of them. Here are the links:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932579
https://gitlab.com/buildroot.org/buildroot/-/jobs/9054932525

Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
