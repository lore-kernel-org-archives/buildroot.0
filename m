Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6305C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:56:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB9160FC0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EB9160FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D79582F32;
	Sat, 11 Sep 2021 20:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qO3BTA4rtulg; Sat, 11 Sep 2021 20:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E822827CE;
	Sat, 11 Sep 2021 20:56:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A63B01BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 946BB415DC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mrc__C0-u1vy for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEEAC406F3
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:56:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id x11so11855059ejv.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nNGpkdJqoJR0CObaEXlj6VD/iL3vQ1mHgyCXA4/V3K8=;
 b=KFxR2m9e/55OWP8gmF6h46LGSDnJozsBy+q348ZxKDdq0i4Ikwuxb8v1hPYh2ZwtWd
 XQYbk5dQyFq8jVx1GJSqAIZ4N4HlB8ZgE+0PCn9mgOff7sZv36BYW9iOFd/D2a5DakC0
 Mk1vAdFhCoWpDbKS2FTOUWZJxmxRJKNUSELmoeefR+GJClSkDzpX9AVd7GwLlIciuL6A
 1HGPFUmXMw/7PF+tT5aAeWJpFhp0MYsmsW2lMrFcmMzMhmschs8knDgi2eNrvI69QCf8
 g3pW2b50+8xA7/gg++CwKO/yexZed41O7UNQCytBAFMy8C7cy5S4Nen2agZn0+4oz6r8
 Fs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nNGpkdJqoJR0CObaEXlj6VD/iL3vQ1mHgyCXA4/V3K8=;
 b=C8kfCKWAvnxpec1+DD3WurkS9LgeQd3cEXLcNDOGh7JSMou0/tvrSAhL3Ug59nATiQ
 AzOmHbNntke8LZJO2EUvcw0rM7NkKzIr7E3wJsgQ1JEmcG2kbTkmnpwcNn9/LRV4mbY5
 OJoYSqmOR826zGwtOfpYPkuARYArUBcBt0rmw5Qz1glX+y9EbQZLK8u/wyalOG5iv36w
 PnJPOm7snLY2DI/jZl93/Qu1enNuDVrIEC3TuSVnDAfJsn12V9WVbV4prXRDyLkQTwgF
 LQmFSn4wyqVY9dEbFEUQmTPjzgzdYQcIg+gd1iseLQR6RUK5TVjRQN00uPQvML4n2rhM
 ppFw==
X-Gm-Message-State: AOAM530aeDz2dpfFfawtCc5g1G/egnNQXa0Qw51irzT4ZM8ZCC/Fg+xE
 5O+RTYR/KRytlfsnYtx6CEzWEw==
X-Google-Smtp-Source: ABdhPJysGl1v1kidFB3XMY9nczXuxf/eQup3exvdSJy/dRcaQoCJ5WQ6x+de4MSYKkPAirrc/feklw==
X-Received: by 2002:a17:906:848f:: with SMTP id
 m15mr4451211ejx.11.1631393791123; 
 Sat, 11 Sep 2021 13:56:31 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h13sm1412560edr.4.2021.09.11.13.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:56:30 -0700 (PDT)
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20210910140925.28138-1-heiko.thiery@gmail.com>
 <20210910140925.28138-3-heiko.thiery@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <41a7b4bc-1b0d-34a0-d0be-72a3b47649f7@mind.be>
Date: Sat, 11 Sep 2021 22:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910140925.28138-3-heiko.thiery@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: copy ATF bl31 binary to
 uboot package dir
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 16:09, Heiko Thiery wrote:
> If the U-Boot image is to be built with binman and the ATF binary is
> used, the file is expected in the toplevel directory.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

 Applied to master, thanks. I've updated the commit message to reflect that it's
not related to binman.

 Regards,
 Arnout

> ---
>  boot/uboot/uboot.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4f3c9b7c3a..1a840d9cc1 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -162,8 +162,16 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
>  UBOOT_DEPENDENCIES += arm-trusted-firmware
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
>  UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> +define UBOOT_COPY_ATF_FIRMWARE
> +	cp $(BINARIES_DIR)/bl31.elf $(@D)/
> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>  else
>  UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
> +define UBOOT_COPY_ATF_FIRMWARE
> +	cp $(BINARIES_DIR)/bl31.bin $(@D)/
> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ATF_FIRMWARE
>  endif
>  endif
>  
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
