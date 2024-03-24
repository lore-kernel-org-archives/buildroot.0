Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F008C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC45740B2C;
	Sun, 24 Mar 2024 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TxkzHE7tBdr; Sun, 24 Mar 2024 17:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6D6F40AEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D6F40AEA;
	Sun, 24 Mar 2024 17:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 087F51BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EACA181C56
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDINKpSkCl2W for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDBC481BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDBC481BD6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDBC481BD6
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:04:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41485fe355bso3667395e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299846; x=1711904646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbShpSXS5wowfBvtI8IVNwwr2b90dsb5EMueaQ65hKA=;
 b=Ae8AtECoQt6qhSK/AbCXc4BlGnt27yXX+OYDj1kvBYQ4O7jipa+hKC/3BDQxtsfRpx
 0InBosv3015vVSfDZzE3KFwWa4CCaQwBX/n4wCJLMy3AKprs0P80fQUsXpPjAODQ7dGn
 3++rOzbm7Lsy6mXJbRD9j/ogLvMwPom4f3nlDLk049PkmfCVXz0OsO3Znc5EVPUx1AiR
 SOWEYhkkF8CfuaeQfSvDXJW8OqIV1Fuj6urvnWWJfQFixkl1slZz7twul/vuywE/UeSC
 cyZCHymHSafbLoWi2WG/4tUHc/4FeCU5cBWNjXvSCRJIVRxjQ1Fo8fK0oQSXt9BXbc8R
 iC7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsLZLCm+Ta/GPCTbfvq/S0Uwe0+u/YOpKTk8Gwj6JWVrkfzdrRyFi+MLYCSUCgT9xAFL2OmcGbHwUwkAIeioAPYr0scRpotQ==
X-Gm-Message-State: AOJu0YzVgavTx26+Mcv2Twc+siGadVsDr8GmKe/cqFfM5hQHzSvrMSFR
 +87685Tww+oioOLSxfZfIl6FqIoXqI9BFqSkEKC/jtbnGhrJq3ucJWstQ8AuwfY=
X-Google-Smtp-Source: AGHT+IHVFst4Acl8zbOzgP/TxTatC3vaNpDqqgTcJrApnqpRH48jY4bafkQMWSccE0VB/lPRJ85cYQ==
X-Received: by 2002:a05:600c:a41:b0:414:4d82:ec01 with SMTP id
 c1-20020a05600c0a4100b004144d82ec01mr3425533wmq.21.1711299845778; 
 Sun, 24 Mar 2024 10:04:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b0041469869d11sm5705284wms.47.2024.03.24.10.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 10:04:05 -0700 (PDT)
Message-ID: <cc6ca5eb-509e-4abb-a097-e53e5bb86968@mind.be>
Date: Sun, 24 Mar 2024 18:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
References: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
In-Reply-To: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299846; x=1711904646; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbShpSXS5wowfBvtI8IVNwwr2b90dsb5EMueaQ65hKA=;
 b=BaA5R0IpH6OvO1R2nso0Uo1x9+erOEQaKD+NVqVkovc5CpmFC+ZWVAqzZ/s3J0EZwQ
 TxKT8i8MbEOvW+gZBhr92LmGqYV5n6Se8Wb+aqlFkProkABlnrs6q4ISJ7a/WIC2mgAO
 69rpPQlrW7hD8cmKXNeNIOxoYEaVWKrr9sa6AaTVZjezuT1JlhXucgYq0cBYYA+xQult
 IggwFQD9sG94UJKRBTH24v9P+L5wJmo8MmAO+dkv8/OS/d0VYtaV1I9N2qFq7w8uHs9a
 uhCYh/W4Jg5Ar7yfqUbg5U864qqo5B8QATiM7Q1gqqFYJbLOEYxTBkn+/OtCfiF6eXVn
 j7YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BaA5R0Ip
Subject: Re: [Buildroot] [PATCH v4 1/3] configs/avenger96_defconfig: bump
 U-Boot version to 2024.01
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2024 13:23, Javad Rahimipetroudi wrote:
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

  Please note that your From: adress is @essensium.com while your signoff is 
@mind.be. I think that you need to set the sendemail.from config to fix that.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> ---
> Changes v3 -> v4:
>    - Improve commit message
>    - Modify commit title
> Changes v2 -> v3:
>    - ATF upgrade moved to another commit (suggested by Peter)
> 
> Changes v1 -> v2:
>    - Uboot version fixed to 2024.01
>    - Unnecessary variable removed from ATF additional build args
> 
> ---
>   configs/avenger96_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
> index 536899583c..82702bcfc7 100644
> --- a/configs/avenger96_defconfig
> +++ b/configs/avenger96_defconfig
> @@ -41,7 +41,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_DTB=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
