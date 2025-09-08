Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E05CAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368D442670;
	Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2ygWDnjoIMa; Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FAAF42656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FAAF42656;
	Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 808C2186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674CF4266D
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNvDcFV_tqsP for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6466D4265B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6466D4265B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6466D4265B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d7acso2510170f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328948; x=1757933748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=855A5Dpli/B6hiJs0mUMt3Y21wpMyu+cNVCUfm9GTaI=;
 b=fmXZEJNdnYHf3tb4+zW406ZJkZy/iQNpr1cKlc4u1aFnaegACPWc35JPxQubpgtr1A
 NdkjfoBnbyyKXXk12qHOxrN7ta0fDuhQTvxe9r/FqcD4W1ISVL/IE3Sh6SSKeEXccACI
 ofEejqHxUHCKmRUuJFAKpd9ljKiMn7L0cBdddyrV6KIKyhSZIdlrgs6mlaRh6Dzc5w52
 a21YBtcICL7eZuIkArNfG41lU4G+vnr9u4lKqCyzbvvAb6ta9KBQLXPwiv1HOJuWhfMt
 1SL6G9FQ9dJNf3lBzPXLohRhhhDVq+DB919iscDj+QJqbSVH4XqBlZ2TUZ0JDoN8rTks
 INXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3mhJuznyLaDIhjmn5BJz1Edj6dRlrYstNhZbLtEAchcuqZBCtNG8pqnlofmSiqIWhbn4OcPN6wVQ=@buildroot.org
X-Gm-Message-State: AOJu0Yza9cg5zCHr5eLwfKR0f4m5579q1kHeZGsWefq6BjXb9fkXZfTE
 ZHxZHbJ60lkTUkAqhQJe+9bW5cBteKh7vAiUtaxylmD466UNs/m+st2C00uocnY3VbU=
X-Gm-Gg: ASbGnctg55x8SBXA+/Go7tgWBpAwdoAXvleJVGOvN//F+z/pHttzlcYYWNPEPrDgX+T
 60VYZAZKPgOuQd9oYzfO9+YfZarSwSgwzIdOQX+rF53EJzyJFimmSrVedK0RVJ0+n5VRbu0M0T4
 XliCBrxi6HS+Ev63pJf43yXZE7BZA/CoA0D0i7sLHdlAZEKRlZZ2PyU0g+yuLV6v62iU/Ix3dNe
 mo8E/oUxl7c25A6/1AxrQaqcVnz1UI0Vo8V5AmiNZBLWtpwePHjsmMAqRtzyekzKM4qSXAA/F6V
 AuKpEc19838aezevNYds+M6phwY92Shdf3mO0t+ufC7bkfWGcN0WCjE63cE2n6jOc3cMpI5PUKt
 tnTFIxrPb7PLPidouBziaCrq94yGPTq+GXSxndXDITTjBgoPJHHxLRJ6s6gQjhkTb9Y6cjgVHI6
 kbtjSawcL9jPKid0Nh8D6otMDSxlEV0Wc3sOA=
X-Google-Smtp-Source: AGHT+IEqszq+yMrTnvN6B0kJ3+vf7Yf/A43Nb9D+1yaY0PdDtd42+4dYMhU9lvy3fkxnCx0sIYXFYQ==
X-Received: by 2002:a05:6000:1acf:b0:3d4:15a2:11e9 with SMTP id
 ffacd0b85a97d-3e64d22b88bmr5236011f8f.61.1757328948295; 
 Mon, 08 Sep 2025 03:55:48 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd0869b33sm195363255e9.9.2025.09.08.03.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:48 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:47 +0200
Message-Id: <20250908105547.681720-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819074737.3285946-1-thomas.petazzoni@bootlin.com>
References: <20250819074737.3285946-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328948; x=1757933748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=855A5Dpli/B6hiJs0mUMt3Y21wpMyu+cNVCUfm9GTaI=;
 b=ToI3OhulSJ0MSOekDmlwnd4duJIy7Ql4SsDCK9ltf+7pROOVwzpq/qAYIQJ3eaZCcF
 WUf8Q6riITLKBAQ/FRAhnGGfBeVgxusF1hulFs4c7ja66ozJM/m1ZCKNUnxHrgVVyzeR
 rn3OFA2fRBdpQuNC6nPmFZEXZluSiPLA/T3g73SSWNwCmI9OgS+4DoKOhWxI+Fx5g+9K
 TybTXqwmZCuTCfbrYI3eRBfERTj/RlbJCqB/umfBSsASHmACL3guDC8mZgIeU5Ma0CCU
 4yn1uliggETqj9W1P7t3rGj8LOaIMtYIcASBcgKyMUIxki9XsSv9PxpY+mA0g873HgUJ
 8NAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ToI3Ohul
Subject: Re: [Buildroot] [PATCH] configs/ci20: U-Boot needs host-openssl
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
> Very likely since the bump of U-Boot from 2020.07 to 2024.01 in commit
> dedb7dc6d6543d5ce16ac73f927e0a33806075e1, U-Boot needs host-openssl,
> so let's add the necessary dependency.
> 
> With this change ci20_defconfig builds again:
> 
>   https://gitlab.com/tpetazzoni/buildroot/-/jobs/11054480107
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273114
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  configs/ci20_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
> index 4a66e1ac33..bb4863cb1d 100644
> --- a/configs/ci20_defconfig
> +++ b/configs/ci20_defconfig
> @@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
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
