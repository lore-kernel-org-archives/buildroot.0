Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5532DEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2F5C4155C;
	Mon, 19 Jun 2023 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2F5C4155C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPkct00B1TRg; Mon, 19 Jun 2023 20:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15F20405ED;
	Mon, 19 Jun 2023 20:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F20405ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE4651BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B814E405ED
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B814E405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wS1f7pVUo8eB for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:03:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2DA403F8
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB2DA403F8
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:03:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-982a88ca610so465387066b.2
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204997; x=1689796997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/lOh2EaRrD6QYm1jQkV13Y0iyOPJF+k2xS2d/wPlkn8=;
 b=Uc0TZ4+gnd9ZAdvyVuCSDHdfPq3wJsRZC3bsBiv6Y/V5188WR2sZIiPDw0/hDaeA3k
 eWiMo8PvQfIPmjUAYL9Hep8ioCPGA+qTaJDSTT5OhCX338SjgbwjdgtfMvnqMTFQSggV
 yXe+snE+JfK1cjSS18/qnLkyeFfKyIlIQiS/1pSQnVYzBK7HPRFUYzElZMbP2t/f0qoq
 hixCK6RT1PGb89P1k8pahHlr2cI/2QCE8T3dr8kf23Gy1MlbFxzn4gUljEP099AGmTRG
 uuU7oRjawl6V6OOd0xgbPr6NRiIW1lEEHS1pmun3V4I7G3+tPl88RBWIDERxZPVAhc9k
 YoBg==
X-Gm-Message-State: AC+VfDxE7eQ+HNL6i0PUeCyT1Ela+XZS5VypkdHtAtgvcbd/qAKEX/9c
 il0E5Z20B2A/f5EEjmDGvfQcrw==
X-Google-Smtp-Source: ACHHUZ6Q/m7RbH157JXrMwHdrpiP0ubM2iBKF7Y0o4FUq94xIK6A/d5hH5BHfMzss+FOhm30QjWkPw==
X-Received: by 2002:a17:907:e86:b0:988:8fbd:aa0b with SMTP id
 ho6-20020a1709070e8600b009888fbdaa0bmr3688788ejc.6.1687204996934; 
 Mon, 19 Jun 2023 13:03:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a170906b21000b00988b57d5146sm147741ejz.5.2023.06.19.13.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 13:03:16 -0700 (PDT)
Message-ID: <96f20010-4409-a007-962d-a151aecf1843@mind.be>
Date: Mon, 19 Jun 2023 22:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-3-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-3-laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687204997; x=1689796997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/lOh2EaRrD6QYm1jQkV13Y0iyOPJF+k2xS2d/wPlkn8=;
 b=RAglfx8b/VcExB4++/UHwRRyi/oBw/CiMX4m+069hOU8Xh+hJ6P2ocEefBLandBrKF
 v2oW06TPuS/zEeH4RA4G/ZUsZ8x7eNzbcBwhTiIVKIdBKmQIXQS+PxMALutV4FL9k7lp
 NNBGljRzjKXatuZXB0QI6ofwddW3jGIb515pT/iSUVuiSopT8JeXufoZaNPwD0piD5We
 QbzXSC+SwmEP+aRK3n0ql2A2JVHdXaV+N/UGE1RLYPGV2g0mYqxrEUV33yf6pblfXDTm
 pLDDO0uB5MIqG1yMiPbm0IQmUv7wEpV6dskcbiG5XDWknyx5OfBMWZlFgsCnxAGPTp7M
 ORMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RAglfx8b
Subject: Re: [Buildroot] [PATCH v14 2/4] petitboot: start petitboot on all
 tty
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2023 12:50, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   package/petitboot/petitboot-console-ui.rules | 5 +++++
>   package/petitboot/petitboot.mk               | 4 ++++
>   package/petitboot/sysctl.conf                | 1 +
>   system/Config.in                             | 2 +-
>   4 files changed, 11 insertions(+), 1 deletion(-)
>   create mode 100644 package/petitboot/petitboot-console-ui.rules
>   create mode 100644 package/petitboot/sysctl.conf
> 
> diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
> new file mode 100644
> index 000000000000..ceeada256f2b
> --- /dev/null
> +++ b/package/petitboot/petitboot-console-ui.rules
> @@ -0,0 +1,5 @@
> +# spawn a petitboot UI on common user-visible interface devices
> +SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"

  That's the m68k serial port, right? Why just this one and not the dozen of 
other serial ports?

> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"
> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"

  Why only tty0 and not the other VCs?

> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/getty --detach -- -n -i $name 0 linux"

  I don't know if running it on serial ports is a good idea. There's a good 
chance that a serial port is connected to a modem or bluetooth module or GPS or 
... If petitboot is printing stuff on it, that can lead to very hard to debug 
issues.

  I think on almost all boards, there will be only a single serial port that is 
used as the console, and that will be... the console. So the most important one 
on which to start pb-console is /dev/console. And exactly that one is missing!

  If I'm wrong about this, please explain in the commit message why.

  Also, how does this interact with the pb-console started by the init script? A 
bit of explanation in the commit message would be nice.

> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 4d56b73938e7..e74a5ff623ea 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>   	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
> +		$(TARGET_DIR)/etc/sysctl.conf
>   	ln -sf /usr/sbin/pb-udhcpc \
>   		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>   endef
> diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
> new file mode 100644
> index 000000000000..02ab8e3275b5
> --- /dev/null
> +++ b/package/petitboot/sysctl.conf
> @@ -0,0 +1 @@
> +kernel.printk = 1 1 1 1
> diff --git a/system/Config.in b/system/Config.in
> index 1ca7690ea3ba..786ec9a1c6b3 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>   
>   menuconfig BR2_TARGET_GENERIC_GETTY
>   	bool "Run a getty (login prompt) after boot"
> -	default y
> +	default y         if !BR2_PACKAGE_PETITBOOT

  (nitpick) no additional spaces between 'y' and 'if'.

  Regards,
  Arnout

>   
>   if BR2_TARGET_GENERIC_GETTY
>   config BR2_TARGET_GENERIC_GETTY_PORT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
