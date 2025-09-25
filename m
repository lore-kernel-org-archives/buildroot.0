Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487DDCAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005026152F;
	Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aikM2yZXfPCP; Thu, 25 Sep 2025 20:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C775F61531
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C775F61531;
	Thu, 25 Sep 2025 20:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EF55177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812618439B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofF98yGVrq55 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8129384396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8129384396
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8129384396
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so10123645e9.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831401; x=1759436201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ee8wfUXySj0qRdxkiukyh8sityZoYPzTjDgQ1gbNDf0=;
 b=FTz0gJo7LXv2BgUNzTm1h7loWbPNkMKyBdcdI+zHXHe3SsGNRREguu7VyP3ddhBMiw
 HezsEq9hGqK/qATK3JkB1PFRtsDemHJP9BIEfWzjWjqk3UT4YjY3HJsN1pGmXiMliTcm
 VmqXq7xa3D5rDL8+CHLwHLBNmDklDjdAtgRIOUn77OmZpK8JRs59TAaqdljhQGmwsQiw
 8kK0gEIlR64B4MSlWiOvP+BBOTdTRzYivpucIthqOIf9nv/ow1/TRm9WJmaVGwL0SRlA
 Mjn3uCvIhD02v/linvgMW2aFTa3xmKq5IL2G2X8boiAzGO1W7UIVjoNwMxdjp1ymU+Y7
 kFXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQNxvmILL+XF1KOi2XS2YpKlNkLyd2xo1Esr6c4A6aL86QT7Q97nl0SiUyFOtbYqOnQxre45mT6OU=@buildroot.org
X-Gm-Message-State: AOJu0YxEjRlUijfU96S8KEEb45WsKIYy7j92hLCLRjAmbzM5tQROUf6u
 I9DSFBFxNylzaYmstiRvU802/aFdSoWiyyQAKEHaAy8XqRAGqJwQFVZkAqUiVd1y+oE=
X-Gm-Gg: ASbGnctDYd9xmYtYWM5VC9R5i3XCUt7le/ainf/Mj1FJe+JQnMQjW1rc28Rl6scw4Fn
 rsnUm3Vy9Vcfcf8p19S62459lGTSiECei8/I8PbEzsu/ALqta4fuaqvdq/7K5J4qCOIaDJokw3I
 Y5vIyFL4yDVs/zXmjgjHVMo4q32Ap6c3yyIkgNtcQ10l0LtME8IHFu/WaWfCfEsBTKXHPAUyAwB
 tGzBqs8svmvP34UH/tsXuc58sXiDQa9LJNHbQmVayqBJwpnzUYJBYa6KWCMnef9tUf/ADEcQoX4
 fjxoAVvSpjkLFqRp8Zt+fx9UUokRr6kHNoycLu1Y8pWeeq0kb8/sFxHWP2kkIutv1Ba5hk7cSSf
 J3IO7n7PcotqAFc8=
X-Google-Smtp-Source: AGHT+IGapTUZnPufPKwb5hbEUuzJ/8Sfpi07GddS5IY25kht3HdAmOP6V/rWwwrPxsRGaraaSDTPdw==
X-Received: by 2002:a05:600c:1c8e:b0:46e:1f86:aeba with SMTP id
 5b1f17b1804b1-46e329f819dmr54991745e9.17.1758831401362; 
 Thu, 25 Sep 2025 13:16:41 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31ea3sm87505925e9.12.2025.09.25.13.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:41 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:40 +0200
Message-ID: <20250925201640.43225-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915185448.11118-1-ju.o@free.fr>
References: <20250915185448.11118-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831401; x=1759436201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ee8wfUXySj0qRdxkiukyh8sityZoYPzTjDgQ1gbNDf0=;
 b=NnM39kKPwFF66SF3W3wFHgLPo3S4rIfRBbr8TirdiRt+EAE1YOZyAH4HuqhCmtaNnU
 0pjRTF/grAjv/c6cYcZ1FkWDGPY+IBiiDo5hbR4YWh9f/tbcnCzGGMXLXOf49i3g/a+R
 Ju9vbnOFn7Vbdu261jzX2nxSTJjraMFAPrH0PZUmBlbXmgUGKGaVVo9LhUTBi+NzXG0b
 NqlLJtAieug0GnRmVFdNoLOHnZxt+F6KO/4NjZcPD1RYnEyIvuAFPHJTyABkXUQPyEI4
 r4Ge8bFwh0L9/OMBah1Jj2XwoFALBsNQiCagAgBTG2NSeWD63yDuFaOvuYmatG3yMzTm
 KrJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NnM39kKP
Subject: Re: [Buildroot] [PATCH 1/3] boot/boot-wrapper-aarch64/Config.in:
 switch homepage URL to https
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
> Buildroot commit [1] ("package: replace git:// URLs with https://
> URLs where possible") switched _SITE URL from git to https, but did
> not updated the package homepage in Config.in.
> 
> This commit updates it to match the package _SITE URL.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6626bf7c5fc1f5f47fcade03090de212a6121db3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  boot/boot-wrapper-aarch64/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
> index dfefb7a9fd..7271336166 100644
> --- a/boot/boot-wrapper-aarch64/Config.in
> +++ b/boot/boot-wrapper-aarch64/Config.in
> @@ -11,7 +11,7 @@ menuconfig BR2_TARGET_BOOT_WRAPPER_AARCH64
>  	  possible to start an Aarch64 kernel inside the available
>  	  software simulators for the Aarch64 architecture.
>  
> -	  git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
> +	  https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
>  
>  if BR2_TARGET_BOOT_WRAPPER_AARCH64
>  
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
