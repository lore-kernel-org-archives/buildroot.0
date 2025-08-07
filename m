Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABBC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD841405A0;
	Thu,  7 Aug 2025 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwyOfgmiddlX; Thu,  7 Aug 2025 18:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBCEF405B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCEF405B3;
	Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2046610A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA066063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOVgVzs1lRzG for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C5BF60604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C5BF60604
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C5BF60604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so1118070f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591085; x=1755195885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ut9A0zzdQ9Ge6kpCB5oTz4ltAY5bezIE9vvmGhoYIc=;
 b=Lq0D7b4JQhUQtFh5afRf6HzOVKjxEBFrnlbbU3DJISrb3z6fCu0jnrooQ7VsLA7Vfk
 GA+mVsZuDd+97Euhp8GxKjGch6H+cZv/Hkx6brYwYrNhhN1AT1URmlA0/LG6hKTQ8F/f
 d49Ho97PhkIRDDhHQy1Tf7+5wPVHfY1dE/JCh9R3r8YipN8sbq3zrjcwWDSpNRcZsYSh
 RkUrmJAzp2YBNVfa/3JlLttl7n3RSZ/d/y+IA1QxkD/WM8oRl1cEz/hvLCDEAQBeETwn
 5dDxBik2JVSTiBqyixcZgMkiHMcUcwDeCW4TJM2sc1S6SPNv9Zm4Thml7ia19FQPnEdV
 +WNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaJOYpWhtPMB7C5xkhicZY/NYYsc87fQ5qah6uwiCrVY/GTTUkx6oQxaHDMLxPZg/G9SLHWFVHxuk=@buildroot.org
X-Gm-Message-State: AOJu0Yzgy18WL8YfkGvrj6NQQzTrtfmc/R6f8g3Oxsyfyl4YN86NOLsU
 45OPR60bZBTlZSEaxDGD2BKSodSXrnvinRwFg3jItNK0EbZ+WxLL2wTOb/AGcOA5dKhYCpF0d0a
 A/YQ+
X-Gm-Gg: ASbGnct4Q+8c0qDYQwvxtpuFNaGnsLU/O3WaHxjphpWLYfUooJoc51VXXOSGQ7p5lQK
 tIK5qz3XsoeBkjOXi2tudvaRtWjIPiJOQZwIN+kfBa0m+tdjNDw0ZWOLh9Q6bvHAdjqk/0STKhm
 rvZU8uytf+81oefzTQQ5eTMICrc2f9QY75s5uqBo4dQkKoF7SFNKcffYFXDTg2V9tulAE20SOzu
 5yL9MUK4rDmmAhVwip2bwRodpbfj3gdMdweQK/o4a6EmpBkQEhiqeUKbF1kxgVSTTwmP4zD3l2Y
 CMdA4OuldK2fwJoc/4ilWPd0QmvcNpE4jWMaf5IOfN7d+jIe04sLXuHLNT9jsTC7I/lKNctGLmh
 LYO1xWdeCKHpKdA==
X-Google-Smtp-Source: AGHT+IHI/l1rjRoLVEWcAI3scz+bulukOAZQ3u5bQ57/sJV7ZmVaX2yF+MJ9A2Hd5CAxurIDu4yzjA==
X-Received: by 2002:a05:6000:290c:b0:3b7:899c:e887 with SMTP id
 ffacd0b85a97d-3b900b4f687mr207592f8f.24.1754591085445; 
 Thu, 07 Aug 2025 11:24:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58400f5sm100430085e9.2.2025.08.07.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:45 -0700 (PDT)
To: stefan.nickl@gmail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:44 +0200
Message-ID: <20250807182444.726224-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729172639.46544-1-Stefan.Nickl@gmail.com>
References: <20250729172639.46544-1-Stefan.Nickl@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591085; x=1755195885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ut9A0zzdQ9Ge6kpCB5oTz4ltAY5bezIE9vvmGhoYIc=;
 b=RSt5a/YSrTU2qojajI6l8iFzVtrHLi8Lqdm+VClENEYYTcWCoG7iT2jxZuKH7LPWXK
 ohtyirhO932NygJB0gSxzytiJPr8sxdKcxUb+zMMIdNHIFkuvx3c/iiUdTksi6E5+uCs
 sl2cxZi05NoBviS2rgGoR5NREBiWnNNMPlmKqr/L8gUlmuCqlGZreP3kpggnG51AqHa9
 lS47FwlLFfLXxxAieofNIP7fHSnqBGwvk7dyaVVlnfFZbm1BEfFIkc8z3fsAL4ysypSE
 xzQer749n0iWxg8+h9emEFEnvfh6LlIOd6acl3wEh443jM9NNXDrNHdfTjg9ARSTwRQX
 YATg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RSt5a/YS
Subject: Re: [Buildroot] [PATCH v2] package/modem-manager: Add option to
 enable AT commands via D-Bus
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Changes v1 -> v2:
>   - Don't split LIBQRTR section
> 
>  package/modem-manager/Config.in        | 6 ++++++
>  package/modem-manager/modem-manager.mk | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index 6990996a86..e03447b96c 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -38,6 +38,12 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
>  comment "QRTR support needs a toolchain w/ headers >= 4.15"
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
>  
> +config BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS
> +	bool "at-via-dbus support"
> +	help
> +	  This option enables support for issuing AT commands
> +	  over the D-Bus interface.
> +
>  endif
>  
>  comment "modemmanager needs a toolchain w/ wchar, threads, dynamic library"
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 932c163175..899e3071a5 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -48,6 +48,12 @@ else
>  MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS),y)
> +MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=true
> +else
> +MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  MODEM_MANAGER_DEPENDENCIES += systemd
>  MODEM_MANAGER_CONF_OPTS += \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
