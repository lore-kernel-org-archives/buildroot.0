Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D9CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE0781ADE;
	Wed,  2 Oct 2024 20:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grT1krf_NV2m; Wed,  2 Oct 2024 20:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBB438120F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB438120F;
	Wed,  2 Oct 2024 20:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00E411BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8D11840D5
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b01eHBo_h0gK for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBEBE840FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBEBE840FC
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBEBE840FC
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:15:42 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7a99fd5beb6so111659985a.0
 for <buildroot@buildroot.org>; Wed, 02 Oct 2024 13:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727900136; x=1728504936;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9KFppr7k2pleF57G8SZwTbkkiYSJaUAX9wSVx1ehjg=;
 b=k72WlgiwyCDY7ojGWGFrEeU9HAe4J1SBsTy6AUKyPe7yFIFjhim5Qt8ujAlTufd4PP
 20vkAsRbd8UOlYCexzElumhhGHi8qhLr/H2exIpe0H/k4SzCK8xHRFsDm453bj6Vy6uk
 eoxmMgCZ/iMMPJ0VLvqUXfwKKkcoVs24TDheLrd9zqBm+CWVJ+D8tz/WGHA4OkeRrGGK
 rqkt0SldrvCvgJpgrYeElE4CpLIIAifT2j7UKDKyPlXaR/pefr9izur9eewQVyf2tg11
 P/TWH2xy2gES7K1EkA4KMC56Tb3pIdadIo57PwYCS/PpXoZ3hgn5Z5tNgRU4V4Q+1Boj
 Cmiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfprbcDHVo6h5vsVYLSwf75Y8ieoxx3lLSmdUuES+ANLffrwyD05/n28EuE7PjhSdzWXixQUQ0Hq4=@buildroot.org
X-Gm-Message-State: AOJu0Ywe8ahd9zz7gUJ+zvbNtSqmgMeL9lDP+Kaxd4hjgzo00F+I2z8z
 Sk7Gn+q+H8Am9Z2qseA1ZJ3TR9oF2ODf7bRQ6MDxlk8NdAGCR17iOl/Gb1Jnx1k=
X-Google-Smtp-Source: AGHT+IHAzuNles+bFhEL+ZEgGWu1+cOndJUqDBkGgTFt3VHDhe1IsmX2I5PP6t7lvuZGcFgCi5Ylpw==
X-Received: by 2002:a05:620a:28ce:b0:7ab:3516:56c1 with SMTP id
 af79cd13be357-7ae67e3176cmr140555885a.14.1727900135545; 
 Wed, 02 Oct 2024 13:15:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae37858404sm652467285a.129.2024.10.02.13.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:15:35 -0700 (PDT)
Message-ID: <cceac9f9-b679-4270-a066-813e56dcd043@mind.be>
Date: Wed, 2 Oct 2024 22:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
 <20240904142509.3295502-2-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240904142509.3295502-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727900136; x=1728504936; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w9KFppr7k2pleF57G8SZwTbkkiYSJaUAX9wSVx1ehjg=;
 b=OxWsvNwWD9DB/z9ox0pXNSUcA39B07WnzkRi7BtPWd2lULwXfIHJEt3b2iyYaM8zbQ
 QEDbRYSBa7g286Bqv2KS7+0pDhizU9nGodJ27PCOVLeb51SChHWHgFVVky1bzhoGRrzv
 fmjPOKiH42cTuCJyPtDUjuf7xH13Sw5GHHiLNpvIMMkk4agCFGggmWXtsLBOyefeQWtA
 /BnGniECCIXBVQiQLA+VCJFNbGTGe7xPULb4Msxix/fk/5qE2tYW7Pz3bFfZmVbagP3y
 LI/523PHGUcGnMQ7tkyRjuoScIqXvcBlUbXyPePdJjxvo5rK2HiYovaygN4iS8i8po8D
 QxLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OxWsvNwW
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

  This feels pretty hacky. One problem with it for example is that those files 
are not properly accounted for in packages-file-list.txt.

  An alternative is to use a similar approach as we use for busybox. busybox 
depends on all packages that provide the same functionality as busybox itself, 
and it checks if a program is already installed and if so doesn't install it. So 
we can do the same with grub2: add a dependency on mender-grubenv, and only 
install grub.cfg if it doesn't exist yet.

  That is unfortunately still a bit hacky because then grub2 has to "know" about 
this unrelated package mender-grubenv. For busybox this is more or less 
defendible because busybox "knows" it implements that particular program, but 
for grub2 it makes no sense. This approach does, however, have a correct 
packages-file-list.txt.

  A better alternative is to fix the problem with PPD itself. I think it is as 
"simple" as making sure that the target rsync (and other rsyncs) are done in the 
order of dependencies. Of course, traversing a dependency graph in shell or in 
make functions is pretty difficult, and calling back into a sub-make to handle 
this isn't very attractive either. Worse, that still doesn't solve the issue, 
because a package A that depends on grub2 but has no relation with 
mender-grubenv will still be rsync'ed concurrently with mender-grubenv and 
_will_ contain grub.cfg as well. The solution for that would be to target-rsync 
only the files that actually belong to the package (i.e. the contents of 
.file-list.txt), but that is again a big change with possibly unexpected effects.

  Bottom line: I can't ask you to fix PPD itself :-)


  So, in the end, this patch is probably the way to go.

  Still, this is not related to the rest of the series, so I'm going to leave it 
in patchwork for a little bit just in case someone comes up with a better approach.

  Please ping me in case I haven't merged it yet in a week or so.

  Regards,
  Arnout


> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
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
