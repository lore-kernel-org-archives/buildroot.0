Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB7CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 18:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9327F60BBC;
	Sun, 17 Sep 2023 18:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9327F60BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkCjQEWbtlEe; Sun, 17 Sep 2023 18:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E4060BD9;
	Sun, 17 Sep 2023 18:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E4060BD9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 601111BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31DE6403CA
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DE6403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dT4EFbJtmb-D for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 18:44:06 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71433403B8
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 18:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71433403B8
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9adcb89b48bso305254366b.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694976244; x=1695581044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/L2Iq7uEJhgpoIOR0ViRIX/uppDap/2VpZ2VWqBwdE=;
 b=wRItSu4Fw/sOqbRQpMv6A02eOQs/q0Yp8H6N92JTLRoCNuvv42Lu3HAsEBOX6pRIs7
 d3pHMtvRUZo007XwGnWPraFJy1DejcIB/Afg5qrOK4u6AeFcZonlCyuZmc/9NbjWOOrL
 Ln6315Zm4yxBvBfvEGTE8/7l9dxOoeeP9DpiXo9TeavC2E4HBS0DZdh3+9Pv9SMsYyZm
 0MN5F2fWSQ/TM4bbyd6otP/g+sb74n+XezLE+ZEMRZ8TUi3GD7CjSYwRTlueuJa79RF9
 Jrev6+maxBuOXWH5jy6PLKwg/acPGolSulxWeZOByKBtLWwJx7WwlRqDfZnSUv615O4z
 ljBg==
X-Gm-Message-State: AOJu0YyUT0LSyzB8CkUjcBN8Ig0jTYRlyEj4JLByhu/0J1ZeJzHhSSba
 y+5xdGauHHusVAjjccBGDRei4w==
X-Google-Smtp-Source: AGHT+IFHe7zdMDT1ZQE5vLEWYVJdXffD3xKJzAz6W1yZkaqq0/vkFpaOWe7EMOTz3JBTKzdCCsD+sQ==
X-Received: by 2002:a17:906:51d0:b0:9a1:abae:8d30 with SMTP id
 v16-20020a17090651d000b009a1abae8d30mr6112265ejk.47.1694976244017; 
 Sun, 17 Sep 2023 11:44:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gv23-20020a170906f11700b0098ec690e6d7sm5316735ejb.73.2023.09.17.11.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 11:44:02 -0700 (PDT)
Message-ID: <3756a0b6-4b33-a4e5-18c4-f65c41ec3da1@mind.be>
Date: Sun, 17 Sep 2023 20:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-3-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-3-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694976244; x=1695581044; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/L2Iq7uEJhgpoIOR0ViRIX/uppDap/2VpZ2VWqBwdE=;
 b=YuAFyiCIVoKpuDiSRgX3a4/clZDGLa2EagQBinZAZTSp6QVuY6Lg2un85JkM+xSD+W
 n6f7RaaFvNavLCF3Iwd/qiE9GfeUzlBq8OlT0YLp8dUjcOTuiqfUDwJVIaJs1Kf0kSnG
 e5BSAQ59j4H0kKSYo7a4zKs+ZTpTIc5XRQHNqL2l15lvsGdiSJ/DHVGna+rSp3IUk2Ys
 ATb+tD+2BTGNSa9NiZtik6arN4qkp5upFbSmPbDkMVkrnoxruk4YJ0b3stiD6Q6eYjZX
 CPIxV5FP+eoIJf5UoEDmwJQLK8OpwBQQi+SdMm3Udlngvh2OT5UbJ1NNiDOxmY0zMdt4
 o9XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YuAFyiCI
Subject: Re: [Buildroot] [PATCH v2 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/09/2023 17:58, Reza Arbab wrote:
> Install a udev rule to run the petitboot UI on commonly-known consoles
> instead of getty. To prevent the kernel's console output from trampling
> the UI, also add a sysctl file to reduce the kernel log levels to
> KERN_ALERT.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
> v2:
> * Add ttyGF* to list of commonly-known consoles.
> * Don't select BR2_TARGET_GENERIC_GETTY by default.
> 
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
> index 000000000000..e5c188387bc5
> --- /dev/null
> +++ b/package/petitboot/petitboot-console-ui.rules
> @@ -0,0 +1,5 @@
> +# spawn a petitboot UI on common user-visible interface devices
> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"

  In general, it's quite likely that there are some serial ports where some 
device is connected rather that a console (e.g. GPS, Bluetooth, cell modem, 
...). So starting pb-console on "anything that looks ike a serial port" is a bad 
idea.

  In Buildroot, we by default assume that the console is on /dev/console - which 
is why that is the default for BR2_TARGET_GENERIC_GETTY_PORT. If it's needed to 
run pb-console on a different port or ports than the default /dev/console, then 
that's a system-specific configuration.

  I see no way we can have this generic assumption of "all ttys need pb-console" 
in Buildroot.

  It _does_ make sense, however, to put pb-console on /dev/console. However, 
wouldn't it make more sense to do that in inittab instead of with a udev rule - 
like the getty line?

  BTW, I don't understand why you even have a KERNEL filter. Anything that is a 
tty could be the console, no?


> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 8d220f88f45a..556d41230237 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>   	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
> +		$(TARGET_DIR)/etc/sysctl.d/petitboot.conf
>   	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>   	ln -sf /usr/sbin/pb-udhcpc \
>   		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
> diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
> new file mode 100644
> index 000000000000..02ab8e3275b5
> --- /dev/null
> +++ b/package/petitboot/sysctl.conf
> @@ -0,0 +1 @@
> +kernel.printk = 1 1 1 1

  I'm not sure how useful this is... There is still output from the init scripts 
coming on the console, so why block the kernel output but not those? In 
addition, by the time we get to S10udev (or definitely by the time we get to the 
inittab stuff), most kernel output has already passed.

> diff --git a/system/Config.in b/system/Config.in
> index 24798dc06803..9587dd9ce4db 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>   
>   menuconfig BR2_TARGET_GENERIC_GETTY
>   	bool "Run a getty (login prompt) after boot"
> -	default y
> +	default y if !BR2_PACKAGE_PETITBOOT

  Ugh, this is super ugly to have to do something petitboot-specific in the 
system menu. But I don't readily know a better way to do this.

  Regards,
  Arnout

>   
>   if BR2_TARGET_GENERIC_GETTY
>   config BR2_TARGET_GENERIC_GETTY_PORT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
