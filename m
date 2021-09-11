Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0581C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B321961214
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B321961214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB4B82B84;
	Sat, 11 Sep 2021 16:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsOIrvjBRSlv; Sat, 11 Sep 2021 16:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C2182786;
	Sat, 11 Sep 2021 16:25:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BCF41BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7908D82786
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id feZLfrCiEjIA for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:25:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85A2F82778
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:25:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j13so7215225edv.13
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6U1GFR08mdu3bdEO/iutDnRCQddWJVJL+nsXU+DzMlc=;
 b=LjhNhjbBISw9OaLm6kG+gK6sjMq6lVMSTzdKL2u6JsKCGwFJV6Rl/5UPjjuPGHlvqb
 yfxPkYvoSSNjVUML+bFZvX0CGtZPCcHK2AaLk+ETsscPf6OJW6SX5s8OskxOKEpVjzWA
 bjzwuny3k2YoJ3YnK0msD9QXuxD98MvDqvPMon2Dh3itzr7bKGUNW72Se9UjiIYlK+tE
 noQF1o58JFI6sHAgoF4cM8FvmHy6Ipj4Xh0KV3FnVec66pbbZvo5vrAKJlXjTjiegQ5u
 1FQpKoIvj70K2nOke6U7fJN4A/HEVy03UhtDIIqNHgFYTQDSIUIJETiYAOPPbcKiYT5a
 hsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6U1GFR08mdu3bdEO/iutDnRCQddWJVJL+nsXU+DzMlc=;
 b=RSjMcB3UXhtIpVbtIlA3UmKmXdXjOO9U9pFx280agOIbUQ0/HkTnZBp0kuRo5FYaxv
 jw2Y6wk4y0CiXHT4qiDqzXaAUdpOQPAWdEdadaqSnmAxqB6fY4u+3byTWkWv8ik5mmmX
 LOaYZpxeJeguYfpmLyYIfMVDNcYiyZIMPzlW0qSKsA0HBQn4ut3ue4+33KxWDmkBKDb+
 BlAvF0RRMlHSjfQqdONIoVhVhz7ML+3hHBIZfypK0SK9V8BFfbpQsNZ7oreO0YFGI6rW
 KBbGx7mtJdlSqrGgUM4SkjM81wwgdJBTgWJo6Epbr3i5KLAs9zHWViwuCpEXNMcZFpKQ
 4C6Q==
X-Gm-Message-State: AOAM532zwWHVMWGLO8fZg9fcEeWK/ZsAVT7gIONqmvoJj4fzafWUJVZp
 qHH6wU7XvzIoOFg4IdvSkIZpbxA5hqP5Wg==
X-Google-Smtp-Source: ABdhPJzc38k9VbnsZJUF6/mk0FaH37Al/rUkqvnIXFOm7zfooP9/Rk7vIMO7b8HmQxweGgEuKzeVmw==
X-Received: by 2002:aa7:c80a:: with SMTP id a10mr4022280edt.174.1631377511858; 
 Sat, 11 Sep 2021 09:25:11 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bi3sm1130498edb.91.2021.09.11.09.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 09:25:11 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210831192729.407412-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0cb31cf4-8d61-d3cf-9f11-3319e5f51acd@mind.be>
Date: Sat, 11 Sep 2021 18:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831192729.407412-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [for-next 1/3] toolchain/toolchain-external: update
 Arm ARM toolchain 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 31/08/2021 21:27, Romain Naour wrote:
> Update to gcc 10.3, gdb 10.2, binutils 2.36.1, glibc 2.33.
> 
> Remove BR2_TOOLCHAIN_HAS_NATIVE_RPC since the support for obsolete
> RPC was finally dropped in glibc in 2.32 (2020-08-04).
> 
> See "Release Note":
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#
> 
> Tested with qemu_arm_vexpress_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 All three applied to master, thanks.

[snip]
> -TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2020.11
> -TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
> +TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
> +TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel

 I wonder, why don't we set version to 10.3-2021.07? Is release-monitoring or
CPE tracking this package?

 Regards,
 Arnout

>  
> -TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
> +TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
>  
>  $(eval $(toolchain-external-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
