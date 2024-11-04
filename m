Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE0AD1BDE5
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 19:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3822E60752;
	Mon,  4 Nov 2024 19:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urCay1ONfZvj; Mon,  4 Nov 2024 19:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B4D606F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B4D606F1;
	Mon,  4 Nov 2024 19:31:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71FCBB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F8080C38
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwNQMMx7aNTX for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 19:31:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8324C80C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8324C80C36
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8324C80C36
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 19:31:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so40246325e9.1
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 11:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730748698; x=1731353498;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xeTXzJYNwh7wNItr2MCxnOk8dzuoxEH2AW+Vn6OPhao=;
 b=AWLY3wE69tmyTC0dw+guIO8j8v6eENW6Qb8nci6Hoj8Z+RM+yaeSldIFJIG8ArHzrV
 GFm3T0Ahn1yoVyrHpHQhpXxC/i28jZv3O2RiUWNpfJZShzYRVfDn+/4Ylq0InbErjbjL
 DgEUXNv24nKBf7H0TDdCVa5kfUUUdCK/fzvXjVNjz76tRjbkN9fdNWVHQcOs+2IF2Si4
 bKWPq03/deweLT476Je5g7/+gnyXDQMuDJJxha1xuvzNp825fyxWZ20bv35NvVAcKCSQ
 TQPpzzZ4rXIXJAQH3h61YKyPrxob1DOuAue+xzk8+4+uQeRfNaQeQZsILhpCwyt+fROW
 rw/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7sgpiiudKwgRSJlNBYZF2Ooq2rsQRMzrdgdnnGPg9MuvcU5Aob0NqZZQlgYR0Cd+AwJylyMCwug=@buildroot.org
X-Gm-Message-State: AOJu0YyC7mTe7MZIYkoyivX1yeEB9PVpg9NZRjNq0a1pLSSzK8j1m6tn
 1MfyUjWhhOGss9rzHFGRF4C5B8J5mgwJX+aYJVInckueewdvIceiRyUbcCNXz0QD3xPrhb6Ez09
 Q
X-Google-Smtp-Source: AGHT+IG+cE9VbMYgotOev7VD8UjKXLp6PR2BZhF5hWJEck0I9/WdND/t+pygVK0sW4EO0+GqHI328Q==
X-Received: by 2002:a05:600c:1d18:b0:431:40ca:ce6e with SMTP id
 5b1f17b1804b1-4319ad2c716mr306961745e9.31.1730748698134; 
 Mon, 04 Nov 2024 11:31:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e94cdsm162112755e9.28.2024.11.04.11.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 11:31:37 -0800 (PST)
Message-ID: <c9bfc18d-9590-40d1-8e77-15ae3f4dc85a@mind.be>
Date: Mon, 4 Nov 2024 20:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 yann.morin.1998@free.fr
References: <20240812052101.2920141-1-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20240812052101.2920141-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730748698; x=1731353498; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xeTXzJYNwh7wNItr2MCxnOk8dzuoxEH2AW+Vn6OPhao=;
 b=MLYnOHzin2dy/s4rrJL0DZ3cPr6fAhpTQnzxSCQsC9OQpJRNbg17ITJriQF61iS6fX
 X3WxBwFIZiUGGih/WcHTC3X2ihAUmrz0WWNF1SJL0gVwQFzc01uLJlQG5uqPvCxTO4je
 klPn1EBjYhJRDbzFVLDH6tI2Gh/k/6rykASfEpZWs9BjUD20/X+n4cP/aETHnDgsfBHR
 8bag99J+ZBiKnD0fIi8cQwvcsHs0pZ3Nvtm8wEA5byfuJVbIfgbUvQd9sBVWVeV5lLaG
 vojEgxDj33Ost7MnPrtQ8z/0ognRR1qbo1iI1+bLG8FET5V+8fEP2WmkfddZz8vs7xPi
 Vp9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MLYnOHzi
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Neal, all,

  Not a review this time but an open question!

On 12/08/2024 07:21, Neal Frager via buildroot wrote:
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot- 
> xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vek280-revB"

  This DEVICE_TREE= option is already used in 21 defconfigs (and 13 of those are 
Xilinx defconfigs ;-)  Perhaps it is time to create an explicit uboot/Config.in 
option for it? Ideally the config interface would be similar to the options we 
have for Linux.

  Regards,
  Arnout

> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
> +BR2_TARGET_UBOOT_FORMAT_DTB=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
