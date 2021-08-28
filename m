Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493B9C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:59:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8BEB60ED5
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8BEB60ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA8C42641;
	Sat, 28 Aug 2021 11:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEp4TkdAvdhJ; Sat, 28 Aug 2021 11:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38534264B;
	Sat, 28 Aug 2021 11:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0251BF27C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AEF4012F
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OlHKilp7i9D5 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 11:59:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AC91400CB
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 11:59:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g18so7115271wrc.11
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g9kYEx/W84OzIEIJ1k/hJ/L9AG3LRenE4wnI5BWeV/A=;
 b=IclWIpxseKY4dRG7d7Nq7xaZmHswNi9Sb6tdmEX6fALjoahtf2atSUXZHGlW77EyAx
 S9g6ihfrRzfB01b00mgL+3+0G6octaH9p+YXYA85nXMrBmVd9zK1ca/YbiobKrWjRr7j
 NzgoIqo4AwpcBteKmm6J98aLZr/5FeeJnckX7TSJXSn1ngxc9iLd0oVtzs2Q60zMPzAn
 nbQ4uCP6nKljXc5H8q7jnD7Albi81Pn3DM15pWFcJAIQvPVy4iDgZocdTkk+4EZFnZVQ
 Fo5/iOoaqieosOMs4YfldtbLPh+XkJb1xolTqiYCQMkK5Ux249G8UukHTgpl/353vGhA
 vErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g9kYEx/W84OzIEIJ1k/hJ/L9AG3LRenE4wnI5BWeV/A=;
 b=tX1GCMONk4Uz3tXQESP+jNTvO074HPXIvwAcpeguljofH+pnMFtIktiE2zSvu72aDI
 /TRX9nMlGCVj90HqTNmxlk23nIEZcOkmFc9/vLTx1/V+GSNLBhwD5w5OLZRI7niKi3le
 Vtjzc1mGOjJLkHkem6o3iQbkZBw9SbSTWXDSbaP/MjjNsk0+9fZtcSyk20IPyvjiPC2b
 XgvkU4eBrqoyZukcRW2ha+JktKeMaJ13BZ/Yvg6nf1+dQLU/tGheSUYb4LWtLSgInmgM
 G9C9wNLCvLG+jk9PymYHzKd1YhajvMKY7vtb0C0eRuRUQ/tdElTfElQoYcTgrKwkP33Z
 9H2Q==
X-Gm-Message-State: AOAM530kSb09ZbM5kh4sVuY8PDQfWaEolEKxtjCp0DsMaDbIw7OJmJQz
 I2hcAy0PNT5m9dPN8smqcbPlJee1L7BnMg==
X-Google-Smtp-Source: ABdhPJxuRr4bYP/z5x5vqYOtOHbZCwn+o391ILAoCbYh23m/p1lvsn2/3QzpkO3SJSiScOG0VFwX5A==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr16231224wrj.98.1630151985357; 
 Sat, 28 Aug 2021 04:59:45 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id n14sm9094202wrx.10.2021.08.28.04.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 04:59:45 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210822194644.3260223-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <758e14a9-d79f-449a-dab0-1ec85a989458@mind.be>
Date: Sat, 28 Aug 2021 13:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822194644.3260223-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] support/testing: test_atf: bump the custom
 version to v2.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 22/08/2021 21:46, Romain Naour wrote:
> This version bump is needed to pass the ATF test with
> hardening option enabled (-fstack-protector-strong)
> 
> With the version v2.2, ATF fail due to undefined references:
> 
> ./build/juno/release/bl2u/arm_tzc400.o: In function `arm_tzc400_setup':
> arm_tzc400.c:(.text.arm_tzc400_setup+0x10): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0x18): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0xb8): undefined reference to `__stack_chk_guard'
> arm_tzc400.c:(.text.arm_tzc400_setup+0xcc): undefined reference to `__stack_chk_fail'
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 I've added a reference to the build failure
(https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842591), explained a bit
why it fails, and applied to master, thanks.


 Regards,
 Arnout

> ---
>  support/testing/tests/boot/test_atf.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index a9d5b67ac7..4fcb9b241c 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -10,7 +10,7 @@ class TestATFVexpress(infra.basetest.BRTest):
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2"
> +        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>          BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
