Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605C7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0843E84CCE;
	Fri, 10 Dec 2021 19:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCpepsCJbaul; Fri, 10 Dec 2021 19:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5475084CC8;
	Fri, 10 Dec 2021 19:12:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0444F1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 004A9426E3
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76glNrEGR_zK for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E982B41CF7
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:11:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id t5so32598724edd.0
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+IEObWu2rKOK33nucTORb9ylhHUhO9HKECjiGnDXX1Q=;
 b=OnROaqIisyVzu8gI60leqZyJ4XcNGAAuaCA2nEpGLzotNS19XZ2h+l67O0bDQ4C4d0
 un01yPSE+1X8sSOi2GUtufDvijdNX+v1bRsx1Wv8ZxdbTKpDPdofwTX3jkcEJLFBTSNC
 itKDOVKtbKiNE1T/PYMr/Z8zA/OaLqJmHSWGyVXVvRR7PcKolDwifiFgT+F3t+z+cE6c
 5DhRyOXOs0eCVTNQfGxfw/yNIrJlqC7pTUXJ9/T2ncefUxnQeOQjAmeWk2e5aeWGF4Ur
 PnmIiOODGRW8a0TZy9QVsuoRV65TO6QpuXE4OeBBW1zrD10HX7Zmyw6A62fN6BEmC7KT
 qo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+IEObWu2rKOK33nucTORb9ylhHUhO9HKECjiGnDXX1Q=;
 b=JoiJTrOn5AmY9hIL7tJMnrmy6H3g3Lj/fpKFsowCeIfD+trcDhBWV2ZXLbGtGqcbCv
 Fj9eidVrVNILNRpgnjZ51MMm6g11S/zx0LZMPrTx4eFjP4nFe63M2VF2heFFBh5Zl31l
 qklfBTyD8g1Lg+Yoo97MeKW1ppAFfQoXCNjGgvG1tAzVHlhwmRMUY7/Ab1iC+48mVMuv
 tgQganUYYl6cNLmEP+arewsru+gM3E72VAGTsZqHewKuWJ8jBJ9qtt9uJCcQfWZ89Jbm
 iAcg3WXUbF3l2uRgEdpGKLgZMdXiCnSsl02inUjYgvUX7pxHiqJ6u8wuGTeNSBVzhCY/
 T6dA==
X-Gm-Message-State: AOAM531M3NTsnIspDd4t/C/JLc35wPAOCAdjsR1zhesQz9OV9S5FFsK2
 eq79dmtYf7CIsyynpsRujhOCtSeNRS7fQQ==
X-Google-Smtp-Source: ABdhPJw3RHi44spUbTbkCbDAkDd5l1bmdPRmwkbEYiBE9L8U6EONAPCKqauSCKUkWqH4sbiRZ+zEZg==
X-Received: by 2002:a17:906:1256:: with SMTP id
 u22mr26806835eja.317.1639163518087; 
 Fri, 10 Dec 2021 11:11:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hd18sm1828137ejc.84.2021.12.10.11.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:11:57 -0800 (PST)
Message-ID: <a5f9fe31-c960-46ba-2f1a-d06449af126c@mind.be>
Date: Fri, 10 Dec 2021 20:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20211115144620.80555-1-kory.maincent@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211115144620.80555-1-kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/rpi-firmware: update vcdbg runtime
 dependencies
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
Cc: mahyar.koshkouei@gmail.com, thomas.petazzoni@bootlin.com,
 martin@barkynet.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2021 15:46, Kory Maincent wrote:
> We used to select the rpi-userland to make the vcdbg tool work but it
> conflict with the use of mesa. It implies we can not install vcdbg with
> mesa libraries but it is false. We could use the prebuilt libraries from
> the rpi-firmware sources to run vcdbg.
> 
> This patch removes the select dependency of rpi-userland package and
> installs the prebuilt libraries needed by vcdbg only if rpi-userland
> is not selected.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rpi-firmware/Config.in       |  1 -
>   package/rpi-firmware/rpi-firmware.mk | 11 +++++++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index f5a25c5680..d8bcc8ba96 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -98,7 +98,6 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
>   	depends on BR2_arm # prebuilt arm binary, rpi-userland
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
> -	select BR2_PACKAGE_RPI_USERLAND
>   	help
>   	  Install vcdbg, to help debug communication with the GPU.
>   
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index d74f7155c7..743a259dc3 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -32,12 +32,23 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>   endef
>   endif
>   
> +# Install prebuilt libraries if RPI_USERLAND not enabled
> +ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +define RPI_FIRMWARE_INSTALL_TARGET_LIB
> +	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
> +		$(TARGET_DIR)/usr/lib/libvcos.so
> +	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
> +		$(TARGET_DIR)/usr/lib/libdebug_sym.so
> +endef
> +endif
> +
>   ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
>   define RPI_FIRMWARE_INSTALL_TARGET_CMDS
>   	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
>   		$(TARGET_DIR)/usr/sbin/vcdbg
>   	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
>   		$(TARGET_DIR)/usr/lib/libelftoolchain.so
> +	$(RPI_FIRMWARE_INSTALL_TARGET_LIB)
>   endef
>   endif # INSTALL_VCDBG
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
