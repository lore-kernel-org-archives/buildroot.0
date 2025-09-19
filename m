Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEFCCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D23A833A3;
	Fri, 19 Sep 2025 12:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4Grgl8Q39Tu; Fri, 19 Sep 2025 12:58:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB0983196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB0983196;
	Fri, 19 Sep 2025 12:58:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1288AE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDB56109F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw-RBJsvnfl4 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B493B610C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B493B610C8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B493B610C8
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:58:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45f2c5ef00fso16761135e9.1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286682; x=1758891482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xh61ietkktLOx9QBLNi5C5BhNRV3Et2C4u5sXcXnVN4=;
 b=DaG07z6xUHr5YNe03+6xcVoGm+C+MRkmEl6artEK+SrQATQ8AgKVXkx61MXeSD/xyh
 FdrJ3Nj3dpFWGvHLMUysdUoalRVB1jBjny9TdfavI2xln1QPJNjiUMp1UTJHzxmgbHlC
 KfW71DBr2+wDkZFLzVrSyyen4mZ6oRmQp1xHN+x8BPNgqpa/0KiliACx94O0fI9pc2WJ
 HxvQLf8z5h6DCT4gE2rqjkB4KB+xx77LEE194s7UKGoxxeqQeFObgfwqj8eLbEO6ue4a
 T1lzhfL8lWMMuN50DbrjRQL7yX/CWZ6NxFCuZmqqNOg8hJINMkqSumTQiNvJX4Q7V6O0
 tUrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy3bY5xGgnJNuZ2jM+cjH4INeTeZ+u8uqp/krKDmMR6qSbwUQdc76AYIkMRqoJpHVNLruwihdQL5M=@buildroot.org
X-Gm-Message-State: AOJu0YwK4RfkpxPkykTRA7pqnfAQcI4IYqqkTfgQyARHDY6nhCEioYAz
 IjUo1hffexnzYxqLMSS7uEzRnEwZCU50VXQQcIkhSbmmgrOPnMCNS2q4cJAZNTdYjpE=
X-Gm-Gg: ASbGncuG2LfUpLQG/7MeM26cReGcS3GM0Ll/9ppvCZ6b/z2BFYlNTZLvo157ftaOnVp
 PdQiX6qp26FsHvIS6kf4Q/QEKmJukRxR9DSC4lPA2XuGnEHkrSj9NTDyIBsOK3NS2usROXBu5YJ
 IOruEhz4iITvg/u1AcPT3+5ImfEyOmH94/B4h3/siIGv2NqZHZ3DQxLqrrmrIiSY045b7v62WCa
 waM06lzvhfSc/44Puunhi7807hKznyMjIcJZXJ59mFK1vV9Bdcs2VVzc4Tqvq911F0zbbAH5EnO
 nxNKcDcS3qDx+FXHuMNdP+ElfsXz0fGAJgh9IFZvPurfcVmsA0aeeY6AJiiyPYxS9ore4F3wdd9
 ZcZWZRhIsYXzKo5c=
X-Google-Smtp-Source: AGHT+IG3POw6weqbgBqJ6zdZ/f9OX/qqNsUw0sFnrF9e4ywBwZ8XTOsIRSsBJ664D5P0WbADiwtFTg==
X-Received: by 2002:a05:600c:3b20:b0:45b:9912:9f30 with SMTP id
 5b1f17b1804b1-467ead6730bmr24900925e9.6.1758286681748; 
 Fri, 19 Sep 2025 05:58:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbf3bfcsm7902928f8f.58.2025.09.19.05.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:58:01 -0700 (PDT)
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:58:00 +0200
Message-ID: <20250919125800.137779-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911085446.3432160-1-adeep@lexina.in>
References: <20250911085446.3432160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286682; x=1758891482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xh61ietkktLOx9QBLNi5C5BhNRV3Et2C4u5sXcXnVN4=;
 b=cSeofh0if303EtKu3BWd2W1nZrogNO4L4mTgS8LUTAzKoTHxPARgm6bfW9eThIraC6
 8RL6AtvidpY0tpzNq6wsHyR2MtoBYZycpsZvOOcOwCqEAY/fBkCZSbuGWFUAo6/lacAZ
 qRgBqOiSbewqEGmLO4IQh2JNJKNsrVM30rRsQN6HIDNNfoAb9a+8y7FQ9lD0LzLnm/On
 zInNd4OYlltO3bOq3MFT+LThSsCu5h79Pgf/kkPyAnTO4vjhxN24sS4gnaGov4HjPSzq
 01BD4qXrLE8ARUNwTh22/FCfBZ3p0eZfyNt/cbCwULiv74lLeNxWHAo1CNJ3gaMFWzkD
 UTzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cSeofh0i
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs bump driver version to
 latest with support kernel 6.16
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
> - Update driver for kernel 6.16+
> - Update repository link
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Applied to 2025.08.x. Thanks

> ---
>  package/rtl8822cs/Config.in      | 2 +-
>  package/rtl8822cs/rtl8822cs.hash | 2 +-
>  package/rtl8822cs/rtl8822cs.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
> index c827291ae4..2e1c376902 100644
> --- a/package/rtl8822cs/Config.in
> +++ b/package/rtl8822cs/Config.in
> @@ -10,4 +10,4 @@ config BR2_PACKAGE_RTL8822CS
>  	  Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
>  	  repository)
>  
> -          https://github.com/jethome-ru/rtl88x2cs/
> +          https://github.com/jethome-iot/rtl88x2cs/
> diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
> index 1d7c074ff1..2a649fe493 100644
> --- a/package/rtl8822cs/rtl8822cs.hash
> +++ b/package/rtl8822cs/rtl8822cs.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  6150edd8e5d5812831597d4f49a6631a503468c512f85cbe449d853b6caea261  rtl8822cs-0986d5734e7630efea218dae9c16d11a10231819.tar.gz
> +sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
> diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
> index 345e4a0c48..d10388c2e1 100644
> --- a/package/rtl8822cs/rtl8822cs.mk
> +++ b/package/rtl8822cs/rtl8822cs.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -RTL8822CS_VERSION = 0986d5734e7630efea218dae9c16d11a10231819
> -RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
> +RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
> +RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
>  RTL8822CS_LICENSE = GPL-2.0
>  
>  RTL8822CS_MODULE_MAKE_OPTS = \
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
