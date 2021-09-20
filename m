Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A7FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:18:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CCD60F38
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 09:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CCD60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0387E4025C;
	Mon, 20 Sep 2021 09:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dfob6IUbIgSo; Mon, 20 Sep 2021 09:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BF4240179;
	Mon, 20 Sep 2021 09:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7BFE1BF36E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9122240209
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 09:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3wmGSuujNESs for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 09:18:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 697E740200
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 09:18:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id t6so58657283edi.9
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I0EANPnk5WngRjs2UVY7DRKUKHgKolLVnrDO56RckXo=;
 b=EnJyLOv86IvW0xNgxYAKwu1KLIL1ElGvjsUIuuqzgdA1KPWoMb15t4wkFqoJxkkhIx
 DFpIU6NBOKtg4yypKxyqGZfYnAONVIzGH54hbCz/2iBZkel67kIJSrGBGFTG4QlCRcXI
 eMCp6+wSOSFjvbFLAFKaijMpyjQoqI/xEufyKopXtqx7BEGvvbEv7PoxTY3YC7FlWJ6m
 8fHceoHpH9a7D5RCCHNAvdeNKVZP9M9cdlkfxBZZc+/Hj3ZeFZ7ReYvHqJu1m+pAmP4l
 8C7nU2UNiEd4armh7Ya3YSyJSEQXLWbP1YHQ0dMEA0twUVgcJlyjhPUtnWQvzwZfUfaq
 /YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I0EANPnk5WngRjs2UVY7DRKUKHgKolLVnrDO56RckXo=;
 b=0tRZRTMQXm11gFJillPRKbENY9qtg2WpWI6rh4uamMfxIttWMyuWRHQ/cZXDo8UrVT
 VID+plHqQ3i2T2P6sojRzUPvHtYL9sFio0OBmgcMdgoHni2CoOlBaz2j4WGmV3z8JA4H
 AS8LcLKf20bisdLG1tONfdDDJ9lGPw55pAvK3QVOUYRh0bOhml0lpz91vzNKBnl4qnQb
 zW7hwhDRDJNUvA+sFl5qRT1SyFVxZaUyYcblM9oMDftqD/QjnUOL9zX0p/D4hV93l/nN
 TB/QuuptYBv+p3hSRY9ttpc2EJFr5WGNaEQuiOnLP/KInvFPUn0RFQsDDQpe52mojHFJ
 889w==
X-Gm-Message-State: AOAM530htl5wlAHstc6rVLMzZPcpTod3W20NdR2QCksA+78ntSYGsskF
 EBDsMY3jzDHDiIItLW147AB2nQ==
X-Google-Smtp-Source: ABdhPJzhQCus9Z53zMSjtm9KYOioip3IJaXJrHcR4xREJQbKjCn6STkiKELXeNtIcPvGQGbBjSxoEA==
X-Received: by 2002:a17:906:f8d4:: with SMTP id
 lh20mr27996729ejb.382.1632129515418; 
 Mon, 20 Sep 2021 02:18:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z12sm6633591edx.66.2021.09.20.02.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 02:18:35 -0700 (PDT)
Message-ID: <f8756bf0-c955-f301-299e-f5d8c0aabe04@mind.be>
Date: Mon, 20 Sep 2021 11:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
 <20210919150904.04051568@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919150904.04051568@windsurf>
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 15:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 19 Sep 2021 14:35:56 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> -ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
>>> -ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
>>> -ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
>>> +ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
>>> +ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_A_TOOLCHAIN_VERSION)
>>> +ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
>>
>>    Err, this can't be right... 'gnu-rm' stands for "GNU-based toolchain for
>> Cortex-R and Cortex-M", and "arm-none-eabi" means it's a toolchain without libc...
>>
>>    So either someone made a huge mistake at ARM, or you haven't actually tested
>> this patch :-)

  Or, of course, I can't read and I see 
toolchain/toolchain-external/toolchain-external-arm-arm instead of 
package/arm-gnu-a-toolchain...

  Worse still: I didn't see that the old one already *was* arm-none-eabi, it was 
just specified at the end of the tarball name instead of at the beginning.


> It was tested to build code for a Cortex-M4.
> 
> This package was originally introduced to build ARM 32-bit code in the
> context of TF-A (boot/arm-trusted-firmware/). At the very beginning,
> was submitted by a Marvell person, who also had to build code for a
> Cortex-M3 co-processor IIRC, but then was taken over by a person from
> Amarula, who needed it to build ARM 32-bit code running on a Cortex-A.
> 
> If it's truly a bare-metal toolchain with no libraries, it should not
> matter, right? You just pass to gcc -march=XYZ, and it will produce the
> right code. However, my understanding is that those bare-metal
> toolchains do have some libraries built for the target, which can
> potentially get linked with the code produced.

  Yeah, you get libgcc and libstdc++ from the gcc source. libstdc++ is probably 
not used . libgcc may not be linked in either if -nostdlib is used (which it 
probably is).


> So, long story short: do we need arm-gnu-a-toolchaind and
> arm-gnu-rm-toolchain packages ?

  Easy to check: build a bunch of the defconfigs which set 
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y. And maybe double-check 
if indeed ATF doesn't link with libgcc.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
