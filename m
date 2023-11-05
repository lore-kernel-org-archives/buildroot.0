Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2F4C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 17:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF07400D6;
	Sun,  5 Nov 2023 17:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF07400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIjMNIgPbPF2; Sun,  5 Nov 2023 17:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 944F6408C8;
	Sun,  5 Nov 2023 17:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 944F6408C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FCEE1BF342
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0848882015
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0848882015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftyVgHN0HyRo for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 17:57:52 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8A481FFE
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 17:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8A481FFE
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507cee17b00so4739505e87.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 09:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699207070; x=1699811870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbZVKVT1/rAL1ypzoDp1I8Q3Y2cDsBdmlvsLsWP5hSU=;
 b=myidtKn/b8lsD2ajpMN5GLTBBwHuiqj0SPljEtiuDEZd53DSW01I5HNLdYy+4Uz6cV
 RKvNsqFec0yQZ75DNz/SX2oN/s+3h9S3OwZlQNu7qSR2Z1s8PjtYBDARTh/BFd7DvRZT
 2SzDwz9wjvK6Tdds4dKgELiAGcKLs+DJWXMxPwuspUmxK7OPaay2gLWjxqyr9H0brg3R
 gefNzdWKrVyfF3uSanKeXzM7/69cIElQUhz9rTGk7lBPRd6UwuqPakdMDiP35fRxptAk
 u2KIoiVqwvmMXRJlSkKZazfyjRfbb5X+9aCDuzHOYV/0R+SILpjdLOffCGMNe9zW5Wby
 zNTA==
X-Gm-Message-State: AOJu0Ywza8roFX1NbTNRhZOx2Qx+Y964+RQffJ5UDUxDyZcqU703dbbP
 a6z89V+G6/3BCyY4QLR3iNmFFA==
X-Google-Smtp-Source: AGHT+IFaEpL3Uhp2nQ9t2WUkrgAKLwoGbzLC1Z1jk0KM2sfAYULQyPf7UiXht5qmzMN84tin+wJzNA==
X-Received: by 2002:a05:6512:3c98:b0:509:493a:7d64 with SMTP id
 h24-20020a0565123c9800b00509493a7d64mr9853926lfv.41.1699207069640; 
 Sun, 05 Nov 2023 09:57:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ss25-20020a170907c01900b009dd7bc622fbsm2661555ejc.113.2023.11.05.09.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 09:57:49 -0800 (PST)
Message-ID: <73d7f53b-b52e-45fd-af74-dd24d2e5bf85@mind.be>
Date: Sun, 5 Nov 2023 18:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-6-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-6-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699207070; x=1699811870; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UbZVKVT1/rAL1ypzoDp1I8Q3Y2cDsBdmlvsLsWP5hSU=;
 b=eB/iPIOULvS8btF3W73OjdnQXbcM/U1ccMrLMzdOPvsXD+My/8lJih210zGJxO/0R8
 UzmJgxISLy+7TkTag/EFMDGiaWRvOtSfXxqsKOfUqKEp12eHYY+HS5VsXgf3OVUU1RVf
 xdUKLttEZEGQtKkOhtxOnQKCP6SAxVvufFGasy2O7V63CuYsXguq9+XqqDtAiEq7RCZR
 XKXYhj+agoQlUk12pRlyuUVwft3fQ2JEG2u3nbMU1YyS4ll3UvwBnL0niA2jW3DOWAH2
 O1ZySKahFsXotbTCE0k+JEi5iBQogA04cs5uHiLjuAlpT1RChxWlv7ouv5C/55uMPcx6
 HOtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eB/iPIOU
Subject: Re: [Buildroot] [PATCH v3 5/8] package/petitboot: fix shutdown
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

  Hi Reza,

On 09/10/2023 17:17, Reza Arbab wrote:
> There are a few ways to set HOST_PROG_SHUTDOWN that enable us to
> successfully kexec the new kernel chosen from the petitboot menu.
> 
> 1. HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>      `- bb-kexec-reboot does 'exec kill -QUIT 1'
>          |- init sends SIGTERM to pb-console
>          |   `- pb-console does 'trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM'
>          `- init runs 'null::restart:/usr/sbin/kexec-restart'
>              `- kexec-restart does '/usr/sbin/kexec -f -e'
> 
> 2. HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
>      `- kexec-restart does '/usr/sbin/kexec -f -e'
> 
> 3. unset HOST_PROG_SHUTDOWN (default is /sbin/shutdown)
>      `- petitboot tries, in order:
>          |- 1. '/sbin/shutdown -r now'
>          |      `- file not found
>          |- 2. '/usr/sbin/kexec -e'
>          `- 3. '/usr/sbin/kexec -e -f'
> 
> If we're using busybox init, do (1). This performs a proper shutdown
> before the kexec, giving us nice console output with a terminal reset
> and the "booting..." notification. Otherwise, fall back to (2).

  This doesn't explain _why_ this is the proper approach, or why the current one 
needs to be fixed.

  It seems to me that (1) would be the proper thing to do for sysvinit, openrc 
and systemd based init as well (not that anyone would be crazy enough to put 
systemd in a petitboot image, I hope...). So, if I understand correctly, what 
needs to be fixed is when init is not an actual init, but something trivial like 
a single shell script. So at the very least, the condition should change I think.

  But then, BR2_INIT_NONE is not a reliable indication that PID 1 is not a real 
init. So I think it would be better to instead decide at runtime which approach 
to take. That could be done for instance by looking at /proc/1/exe and comparing 
it with /sbin/init - if they are the same, we have a real init; if not, we 
probably have a shell or some such.

  But maybe I misunderstand the reasoning completely.

  Also, why don't we simply always do (2)? The only difference is the message on 
pb-console, and normally it would anyway be pb-console that triggers the boot so 
it would already have shown something, I expect?

> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/kexec-restart |  8 ++++++++
>   package/petitboot/petitboot.mk  | 16 ++++++++++++++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
>   create mode 100755 package/petitboot/kexec-restart
> 
> diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
> new file mode 100755
> index 000000000000..62fbea114513
> --- /dev/null
> +++ b/package/petitboot/kexec-restart
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +/usr/sbin/kexec -f -e
> +
> +while :
> +do
> +	sleep 1
> +done
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 0992111cb1ec..5c7913b560b1 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -21,7 +21,6 @@ PETITBOOT_CONF_OPTS = \
>   	--without-twin-x11 \
>   	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
>   	HOST_PROG_KEXEC=/usr/sbin/kexec \

  This leaves a trailing backslash here, as reported by check-package.

> -	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>   
>   # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
>   # package.
> @@ -46,6 +45,17 @@ else
>   PETITBOOT_CONF_OPTS += --without-fdt
>   endif
>   
> +ifeq ($(BR2_INIT_BUSYBOX),y)
> +PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
> +define PETITBOOT_INITTAB
> +	grep -q kexec-restart $(TARGET_DIR)/etc/inittab || \
> +		printf "\nnull::restart:/usr/sbin/kexec-restart\n" >> $(TARGET_DIR)/etc/inittab

  So, if I understand correctly, previously this wasn't booting _at all_? I 
mean, it would just reboot instead of kexec'ing like it should?


  I've marked the patch as Changes Requested.

  Regards,
  Arnout


> +endef
> +PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_INITTAB
> +else
> +PETITBOOT_CONF_OPTS += HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
> +endif
> +
>   define PETITBOOT_POST_INSTALL
>   	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
>   		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
> @@ -53,8 +63,10 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
>   	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
> -	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
> +		$(TARGET_DIR)/usr/sbin/kexec-restart
>   	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>   	ln -sf /usr/sbin/pb-udhcpc \
>   		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
