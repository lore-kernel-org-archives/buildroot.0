Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71FBCED618
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 07:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9438101C;
	Wed,  9 Oct 2024 07:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7ebQMnLOOuz; Wed,  9 Oct 2024 07:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79BD18112B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79BD18112B;
	Wed,  9 Oct 2024 07:26:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8161BF868
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 07:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDCBC607A3
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 07:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAatzpEe4Jfl for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 07:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01D1A60609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D1A60609
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01D1A60609
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 07:26:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso3114455e9.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 00:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728458780; x=1729063580;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg3A3VqyWYPrvbSMY/5gkkmTbRi/b0YINVVKPQ3swCk=;
 b=MEqkKIq0qfHIdiXMvi0KJJDwUPjeZFuQSbqTmTHKSWYquu6+/bzxrTlNn9DFF5QND6
 CLObMsqORU4Vt0YtEdmELCsPKXkvYwiYjvXnAUj7LPAFR6lFXy3WS2ap8Esbubdi4yt0
 A37tV/aPlDhZu7HMmPHPpoo1Xwu1PCK1lJr1d2ZZJU3EIxd7GDGJjG6okqG9nolwuhoh
 guwtAyX29V5gomYCD5zr6jr0vXy36UJKcn5NipkCIYS8nMOi9HGiiw3Cviwo+f0aYKKU
 2tir4BPzogY6I8F6VTHhpmsGC/v7lu8NyX2R2Jf6qBbS421dRXCLfv0AtVQjRvvlERlI
 NtFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYbylxh7sRKWiKkMTvUT9qrjqQj9rN2Z3AADDvgeV59oxOCywNQa8iYlA2tiLeDBPzP//qva5R1Dw=@buildroot.org
X-Gm-Message-State: AOJu0YzZhyJjfFPnHtrZMz4sKuYdhZI1estkB8UNPeRbbBkMcKyFHK9x
 NM+IMr4z0QwBD8CRXkU2WKjyaFmZ+G3R9CyAoxa3x6k38fprEbcgxaNZVnNGo0Q=
X-Google-Smtp-Source: AGHT+IEKPABGwfjX7u3XIJISXdIql/ArRygIuLFQ3URrU0OaycfpLkuSKoAZWfD3FrCaW92EPkP8Yg==
X-Received: by 2002:adf:fbcf:0:b0:374:c7cd:8818 with SMTP id
 ffacd0b85a97d-37d293405cemr3380428f8f.22.1728458780462; 
 Wed, 09 Oct 2024 00:26:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430d59b2412sm11075225e9.32.2024.10.09.00.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 00:26:19 -0700 (PDT)
Message-ID: <d2ded792-0749-4187-b5a2-ed43710dc8fc@mind.be>
Date: Tue, 8 Oct 2024 22:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
 <20240904142509.3295502-2-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240904142509.3295502-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728458780; x=1729063580; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pg3A3VqyWYPrvbSMY/5gkkmTbRi/b0YINVVKPQ3swCk=;
 b=FQ7YfiYHcxwP2MnFwva/BdD/P7f06a/QOjJww6lIjneakcgYEWRpHyXockjLa4foOh
 O8Oy77DupyVpsemESxk68iyUP1Qz/UC8KNaZLMxofidtWPMWzFWqcDwpeEKthiR1gxZk
 IN+Wsv2V23TRzuB0YBBxihrKFyhmj8BO8/iKAAEwSDwz/DSEbEYn7A9pppyWmyqcBeDg
 6JKvaoJGBtmlYSgTjGNP/TYnViZ6CWgQBWHTs8ih24/EoGpUBh9b/9RKY9nrlGQxHQT9
 Lpl/4OtucO0Ap08DVUpHQXXqwapHR1RB3fOQg3582b3oZPZHPykOU3n8p1fe7lzFkYXY
 8HXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FQ7YfiYH
Subject: Re: [Buildroot] [PATCH v2 2/5] package/mender-grubenv: Fix
 per-package building
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/09/2024 16:25, Adam Duskett wrote:
> Normally, two packages should never touch the same file. However, the
> mender-grubenv package is a special case, as its sole purpose is to overwrite
> the grub.cfg file.
> 
> As per-package directory building has no guarantee that the grub package is
> rsynced to the target directory before the mender-grubenv package, this leads
> to the possiblity that mender-grubenvs grub.conf file is overwritten with the
> stock grub2 packages grub.conf file.
> 
> Instead of a MENDER_GRUBENV_INSTALL_I386_CFG and MENDER_GRUBENV_INSTALL_EFI_CFG
> being part if MENDER_GRUBENV_INSTALL_IMAGES_CMDS, move them to
> TARGET_FINALIZE_HOOKS. This guarantees that the grub.cfg provided by the
> mender-grubenv package is installed after grub.conf provided by the grub2
> package.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mender-grubenv/mender-grubenv.mk | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
> index 8679ad9236..a6d8d48d43 100644
> --- a/package/mender-grubenv/mender-grubenv.mk
> +++ b/package/mender-grubenv/mender-grubenv.mk
> @@ -11,7 +11,6 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
>   # Grub2 must be built first so this package can overwrite the config files
>   # provided by grub.
>   MENDER_GRUBENV_DEPENDENCIES = grub2
> -MENDER_GRUBENV_INSTALL_IMAGES = YES
>   
>   MENDER_GRUBENV_MAKE_ENV = \
>   	$(TARGET_CONFIGURE_OPTS) \
> @@ -34,12 +33,13 @@ MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
>   
>   define MENDER_GRUBENV_INSTALL_I386_CFG
>   	mkdir -p $(BINARIES_DIR)/boot-part/grub
> -	cp -dpfr $(@D)/mender_grub.cfg \
> +	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
>   		$(TARGET_DIR)/boot/grub/grub.cfg
>   	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
>   		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
>   		$(BINARIES_DIR)/boot-part/
>   endef
> +MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
>   endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
>   
>   ifeq ($(BR2_TARGET_GRUB2_HAS_EFI_BOOT),y)
> @@ -51,13 +51,14 @@ MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/EFI/BOOT
>   
>   define MENDER_GRUBENV_INSTALL_EFI_CFG
>   	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
> -	cp -dpfr $(@D)/mender_grub.cfg \
> +	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
>   		$(TARGET_DIR)/boot/EFI/BOOT/grub.cfg
>   	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
>   		$(BINARIES_DIR)/efi-part/EFI/BOOT
>   	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub-mender-grubenv \
>   		$(BINARIES_DIR)/efi-part/
>   endef
> +MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_EFI_CFG
>   endif # BR2_TARGET_GRUB2_HAS_EFI_BOOT
>   
>   ifeq ($(BR2_PACKAGE_MENDER_GRUBENV)$(BR_BUILDING),yy)
> @@ -86,9 +87,4 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
>   	echo 'ENV_DIR=/boot/grub-mender-grubenv' > $(TARGET_DIR)/etc/mender_grubenv.config
>   endef
>   
> -define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
> -	$(MENDER_GRUBENV_INSTALL_I386_CFG)
> -	$(MENDER_GRUBENV_INSTALL_EFI_CFG)
> -endef
> -
>   $(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
