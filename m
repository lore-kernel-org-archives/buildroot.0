Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB22CA0EC1
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D814E80413;
	Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsE-GVO96dTL; Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C86D803CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C86D803CA;
	Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BF64C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82FC66064B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tE7976-wAgK2 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B493C6063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B493C6063E
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B493C6063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so1307943f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591046; x=1755195846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPtbUbtiB4/0yQZg3QtYKkk+/eq5lCJ9jEOEFHavejc=;
 b=oUNeOxACAZr/AQ7vy86UWc0fn7s3LYU38t79YFqfJOJzZP0zIwTj/QqcaXIpEG9KhL
 FkNSK65Y+Uvmjd9c/aj4EAmkMAzHdttF3ydOepYS+W569uoEj+/eEbDlf+ZTJ8fpdbAU
 a1PMHXm6ORAGmnU7gpp9cOusGIpaf6RSEaMAdgud/r3YhZViKNzM9VVN26IHvd9rB56e
 7pXODATPcLIbkYCcRCwd7Bsc4b0z3iW3h1Hu4LTi0J/6lyo+R6sh5Wl5YtRUKA5Q4WU5
 UH5XybSzKVMm/DILD+U53P0apyQGXc47yRU6nTHCec71yx4g8GQA8WTVcIdTINDR+sKI
 1ZWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR+2KZMa9Ev2W7tRFjnRFQMsdgQg+9lzvS55HfCxrLA2UQPNWq48q2aKXWjmCVEYN06b1735mNjX0=@buildroot.org
X-Gm-Message-State: AOJu0YzsciHQHY2kS+QTTMJp6vTrKr4d9swlVP8aVOvdts3akWQ2i/jK
 juLZ410WLULTyj0A7/L+tlTfahRsyP9QqEKwdHjhb0HWNFABGGATuOqwWOvS4k3ku8k=
X-Gm-Gg: ASbGncuBPszqNglHsfxpZ8fPnNdOJKEe11FIvELAenhAUQwz4ldP1Ih8rCmYOc5QV6d
 j1cIGVppfnYo0nWu4PWyHkaBNn0tMPb3ZJhvUgzPsMO9uf6qvoXIYTL6vfCBBEu6Blkt5MFafp3
 N2KyHtFNwNvuCfeRLo8uhTP8Id0K/QyJ2a/OaJEl2WW0kPjaip9gYiE6eOJHau0nlv888jjLp8s
 pkOcoOcaa39xATJ0RmJvwnpFx8z+tRya1Qw34TluWp7s8eAaSSK4Y78lAc0+tlibcOBm4f2wpal
 SYleCQ7f9PKyL62ZKf2Z5qRlSq9MhGd5d+MOzbkfZ0CaAbZ0eA31BrSNgUqv/S+DzGOnM0IL5Q5
 C9jYJ21SApSjZrw==
X-Google-Smtp-Source: AGHT+IFZ5xpFrqJR4gnKD50sibp+Vc0zMJa+kzz4rDOomIlnT5cbJdv+Rr4nUYMHj1BAr9q5D8Cd2g==
X-Received: by 2002:a05:6000:1ac7:b0:3b7:6d95:56d2 with SMTP id
 ffacd0b85a97d-3b900b449b0mr175295f8f.7.1754591045634; 
 Thu, 07 Aug 2025 11:24:05 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c469582sm27062854f8f.52.2025.08.07.11.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:05 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:04 +0200
Message-ID: <20250807182404.724387-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716143240.1354630-2-fiona.klute@gmx.de>
References: <20250716143240.1354630-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591046; x=1755195846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPtbUbtiB4/0yQZg3QtYKkk+/eq5lCJ9jEOEFHavejc=;
 b=OXxFDeCTEVGYQSZwSjYEuiZBjHkNUos9OqSMBsX041+j1QRD7dlwAT3D+8JvsUzrJj
 6CLTigVL+USrshCLu1LEDdAsgcx+l+GtnH11GmNa0sVMkEohaUU8WQcJsg/HnWk0ZI63
 /J5DhkFbD0JR8nwsKMqhOsXGwFpkIbPopiAHzAILr7zIXlmOPyXNbYkcGZU/ppl+57Gs
 U6g3NZtb8/t/f7NyWM4qfvzNn95U8u4z0vL5Q25+HVXN9c2tIPVYmfghzoaEgo2i+bEB
 g4dbmf4/NhZ3VGWQHySpoPNZc2Vz9DO7EpPk5X9gankCxl0ag1S2wyvZsD4mI+uZItGd
 CVPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OXxFDeCT
Subject: Re: [Buildroot] [PATCH 2/2] package/network-manager: set "nft" path
 if BR2_PACKAGE_NFTABLES=y
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
> Nftables should be preferred over iptables if available, which
> NetworkManager will do if both paths are set.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/network-manager/network-manager.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 8c517c49e6..1bec053c54 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -131,6 +131,10 @@ else
>  NETWORK_MANAGER_CONF_OPTS += -Dnmtui=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NFTABLES),y)
> +NETWORK_MANAGER_CONF_OPTS += -Dnft=/usr/sbin/nft
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OFONO),y)
>  NETWORK_MANAGER_DEPENDENCIES += ofono
>  NETWORK_MANAGER_CONF_OPTS += -Dofono=true
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
