Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCBEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08E3640A67;
	Mon, 21 Mar 2022 21:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyiWlYOLhNsV; Mon, 21 Mar 2022 21:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 971FD408C1;
	Mon, 21 Mar 2022 21:56:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85E021BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81DCC8427B
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7qcftgs1uBU for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:56:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 600D984242
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:56:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t1so19547832edc.3
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hC5G2rkIfH+IQlASE17UMaNOOQetEkc14qUVN31ZC+k=;
 b=FsP3sg3+pVDqwYIY/poqiVvRLP7VwdwyxhrWXHyyjZBcmBrMx6HFs4reKqvQ9ktWjK
 OK4Gs37S5ggVS5/t3UySXQr5IBaNU1ORGvkJBDZqjrhWZ+DGaILvCdEBf9PkcrPO1lUr
 HHnIPoJjSTjMJu6kSPydqFIEJFltCvXJOZePeIQNev+R4LE89MGBWGaF4nL/9/9gSrdW
 jM3LzL9IPiidLO8OAAPuVqnV3M5bBGxy0RPQw6o2A+XWt48kj+HrqJh7RqhEaYR+WVu7
 XEtoZYSinuOIQ0Y8iFFXK5aDU2pm9JaVGOXtqnvNg1N1Q5JmU9wj2wBbQHy2KAN9l1R4
 b9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hC5G2rkIfH+IQlASE17UMaNOOQetEkc14qUVN31ZC+k=;
 b=RAoCUciyBzzE7RSoK2lzbosut6AyZW7RZ1MO9ityfoLP+7Erp/iyMES4B9OSQxqtIM
 yZkqmPxxw2WNKBel5lNMP9na8AI12RvAS6Qqwfd0zcBNyAsrNOS6nZ0IuO5AYOxTjqaI
 H+mATTFFI8X4PEeTqTWzZKgBQ7zmH9r7SQyvgf9hN3Vb6bd1wes8MB3TkGLAkuIsGbR5
 hgpcKUV4k4U/cdioXU13IPth8Zkt4zemlHpI7lHECO14CHhboWhTHhkk54DhqA+7DiXC
 f+0P1vKiKyrJVc+0hqjC2M08RfE1ZgzmPsQ0fAiRmN6OxtDJdjHzKqs7FnMZpYACCEgq
 cLGQ==
X-Gm-Message-State: AOAM5323Kfw1fjDSe68bvwE+nno7741gFKUj8YFglU7imP6sYG69keQx
 wfhP6gtvZFkK903RnnD1ccp+Ak4q0bqAug==
X-Google-Smtp-Source: ABdhPJyiJJPVe3Nt47+Le/7LP/dPU+iTBSnbimvxXbEmRu7GlND2396aIo5AhrzdHfcOWdZMWMAykQ==
X-Received: by 2002:a05:6402:1d4d:b0:419:430b:5734 with SMTP id
 dz13-20020a0564021d4d00b00419430b5734mr6504156edb.212.1647899802362; 
 Mon, 21 Mar 2022 14:56:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05640227cc00b004192114e521sm3827528ede.60.2022.03.21.14.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:56:42 -0700 (PDT)
Message-ID: <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
Date: Mon, 21 Mar 2022 22:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: "Sassen, Rutger" <rsassen@comecer.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2022 12:06, Sassen, Rutger wrote:
> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.

  I've added a reference to the documentation.

> 
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
> Changes v2 -> v3:
> - in Config.in use if statement instead of depends (suggested by Peter
> Seiderer)
> - mention the filename overlay_map.dtb in the help text (suggested by
> Peter Seiderer)
> 
> Changes v1 -> v2:
> - instead of always copying overlay_map.dtb, make it configurable
> (suggested by Peter Seiderer)
> - do not copy README since it a special case, only needed when
> installing overlays to a non-standard location (suggested by Peter
> Seiderer)
> 
> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
> 
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
> package/rpi-firmware/Config.in | 12 ++++++++++++
> package/rpi-firmware/rpi-firmware.mk | 7 +++++++
> 2 files changed, 19 insertions(+)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 8070dc3019..36054353f8 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> overlays, to support HATs (Hardware Attached on Top, add-on
> modules).
> 
> +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP

  In the end, I don't think this option is very useful. So I removed it...

> + bool "Install DTB overlay map"
> + default n
> + help
> + Say 'y' here if you need to support multiple hardware targets
> + and you need overlay_map.dtb for target dependent mapping of
> + overlay names to one of several overlay implementations.
> +
> +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
> config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
> bool "vcdbg"
> depends on BR2_arm # prebuilt arm binary, rpi-userland
> diff --git a/package/rpi-firmware/rpi-firmware.mk 
> b/package/rpi-firmware/rpi-firmware.mk
> index b46a7f5270..800b560070 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> endef
> endif
> 
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> + $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb 
> $(BINARIES_DIR)/rpi-firmware/overlays/

... reducing the patch to just this single line.

  Please check if the commit [1] does what you need, if not I can recover the 
original patch with the Config.in option.

  Applied to master, thanks.

  Regards,
  Arnout

[1] 
https://git.buildroot.org/buildroot/commit/?id=da38cdead909aa133b9c468ddebf3f67c8d198f2



> +endef
> +endif
> +
> # Install prebuilt libraries if RPI_USERLAND not enabled
> ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> define RPI_FIRMWARE_INSTALL_TARGET_LIB
> @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> $(RPI_FIRMWARE_INSTALL_CONFIG)
> $(RPI_FIRMWARE_INSTALL_DTB)
> $(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
> + $(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
> endef
> 
> $(eval $(generic-package))
> -- 
> 2.20.1
> 
> 
> *Disclaimer*
> 
> This email communication is CONFIDENTIAL. If you are not the intended recipient, 
> you may not use, copy or disclose to anyone the message or any information 
> contained in the message and I ask that you please notify me by return email and 
> delete this communication immediately. Thank you.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
