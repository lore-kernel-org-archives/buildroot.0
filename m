Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96256C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3FA60AF5;
	Fri,  4 Jul 2025 06:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et1OnZ509EKW; Fri,  4 Jul 2025 06:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7880960B6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7880960B6B;
	Fri,  4 Jul 2025 06:47:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB3F21EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C241240FA6
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krzlRKa_6X0H for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FCEE40FA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCEE40FA3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FCEE40FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so3878685e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611616; x=1752216416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XndfI+du5K5MuO8USk/2clunNo2Rv9w2Wb4GlA5P5cg=;
 b=qkMkNADTMInTSEM0oPaLzJrpAh0RobCBWHod6ut7qon0j8DQe9SvF2jVmi0WYn8GVU
 3hQcScMWdBPgCag1GCFyAmsgnd6CrGtE5JBTuB71HUmameAZdKedcLTOsKAgRvQLkVQI
 zmz5Rv6MlyAieoMY0HW/fifJrthgiJLnV3kykYvH5T0sk2lv9HJflQeABkNVY1cgCj6+
 r0B7Buo05RPX7IUaJoO9dNQYQJxZYcwlWOKoyPF+vaqOrxmlrQ3B+FkmJ+U7CNrq3CRB
 trxQjkENW7pbqZPzV8skwsH2UolRHm9U+6PB0FrncAnX+p4xgQ/V9dtuCiBs7uRzzQpG
 msoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMtaJt6DxD1+Ao4dcIbllyoy4eoWmT4jprejz2sOgq6r3QAKT4Ai4sgAJRNMjT+/WZuFYy2ReGoIw=@buildroot.org
X-Gm-Message-State: AOJu0YzorG1y2yA7vOomJ21PflOFT7zL8rejs2PJ6iPQb7pK1xRzpP/m
 sIlc0BB9lB+DupevpbGab5wKPhDRMleld0Sm3gwMJM4ODlYdZ97UIoKXB79XlFgUMnuPT7A8ybU
 jkeGG
X-Gm-Gg: ASbGncvOo2j2K/wYzc/DFVB5Sl86PV+50Phv6eY+u/V3/lkp+kJYvvTX38GFo4xwoTu
 s5N8wrG+oLHmVbW+2Qt8iz/mOnhS3Mqg3h1LVHFPcRCateTh1aZMwSWPWwEd0RJbjivKLMjUvEf
 TG3NGDZDKLDDdLzQRIe511UgqfyQ/GNjqRdo/p8y52FzMyQfzbatAPsLUDDskW0wJNoBtUF1hld
 bz2nFk3kaF89jWVBNEhy6ZZFx1vrYdDbNojfJ1e5M6y4pzZR43vbIxq5zy6MAZVMsVyCKDxUqr4
 sR24RXBX94FKQ6ZDQ3adaIeATDnuCq6RWpG9Se+BgVfBeiwB5cPYQNbOwOZnwh126V14iqAIoDx
 ezItOZQAsFQ==
X-Google-Smtp-Source: AGHT+IH15yjmZeaNqqNXJ6Z/k9onQZoMBEWwvkM4pZdqRTmiOPq3T9fACi3/GV0dxUE2l5ySx6XDFg==
X-Received: by 2002:a05:600c:4b94:b0:450:d3a1:95e2 with SMTP id
 5b1f17b1804b1-454b1f63f49mr11246985e9.9.1751611615558; 
 Thu, 03 Jul 2025 23:46:55 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a99693f2sm47359635e9.5.2025.07.03.23.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:54 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:53 +0200
Message-ID: <20250704064653.4064243-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
References: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611616; x=1752216416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XndfI+du5K5MuO8USk/2clunNo2Rv9w2Wb4GlA5P5cg=;
 b=Sug2sxh11+3NpXF4hmKnVJUdaAWw3txtul7RTdzl5/f0Y10uzVid5ja9zTZbcSxO/F
 WwuAqbCWAfpQ+uIy6hOSZtwAPMkapyrHDCGyeY1X3uWYotnYLoh3WxhA/JRiR/oXlkTc
 5f9oZJRxQ+eIeTa9fvoNq+0zOLiHkzLZvEg6hIi3AKybeVjuRc8/oN8wu60CeeKOg/Fx
 z9LDQS5qfxEzlttXgAVRXmKftVwL2C+Z0RKAsarqlnLSkXVxt9ab3YljRCUwbAG749io
 Qz9BQCgQPZFa8LubDRjdDXtyWjL9NGSk56MtbweJM0iEsNL5rXCeWMdA4+E0Kpocsjv1
 gjyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Sug2sxh1
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: fix install with
 top-level parallel build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> syslinux is... special. It is a target package, but it is installed in
> HOST_DIR *in the target install commands*: in addition to the boot files
> that run on the target, syslinux installs a set of host tools that are
> to be used at build time (e.g. extlinux, to prepare bootable media, like
> an iso96660 image). Then, from HOST_DIR, the actual boot files are
> copied into BINARIES_DIR (i.e. images/); we do it that way because the
> boot files are scattered about everywhere in the build tree, while they
> are all packed together in a single directory once installed.
> 
> However, there is no dependency between the target and image install
> steps. So, when using top-level parallel builds, there is no guarantee
> that the target install commands are finished before the image install
> commands are started.
> 
> We fix that by first installing into a temporary location, as part of
> the build step, and by then copying from there as part of the install
> step. This ensures that the boot files are easily available, without
> needing a dependency on the target install step, that we can't express.
> 
> Note that we do not change the actual installation into HOST_DIR: it can
> be set up differently that our temporary location, and we do not want
> to duplicate that setup here (it's going to diverge over time).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.02.x. Thanks

> ---
>  boot/syslinux/syslinux.mk | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index cc52c49aee..084acc398e 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -56,6 +56,11 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
>  # syslinux build system has no convenient way to pass CFLAGS,
>  # and the internal zlib should take precedence so -I shouldn't
>  # be used.
> +# Install in a temporary location that eases final install into
> +# images/ (see corresponding command, below).
> +# Repeat the target, otherwise syslinux will try to build everything
> +# Repeat LD (and CC) as it happens that some binaries are linked at
> +# install-time.
>  define SYSLINUX_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE1) \
>  		ASCIIDOC_OK=-1 \
> @@ -70,6 +75,10 @@ define SYSLINUX_BUILD_CMDS
>  		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
>  		PYTHON=$(HOST_DIR)/bin/python3 \
>  		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
> +	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(@D)/br-root.temp \
> +		CC="$(TARGET_CC)" \
> +		LD="$(TARGET_LD)" \
> +		-C $(@D) $(SYSLINUX_TARGET) install
>  endef
>  
>  # While the actual bootloader is compiled for the target, several
> @@ -77,6 +86,8 @@ endef
>  # Repeat the target, otherwise syslinux will try to build everything
>  # Repeat LD (and CC) as it happens that some binaries are linked at
>  # install-time.
> +# Don't use the temporarily-installed br-root.temp: HOST_DIR may be setup
> +# differently (merged usr, merged bin...)
>  define SYSLINUX_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
>  		CC="$(TARGET_CC)" \
> @@ -99,15 +110,15 @@ SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.
>  
>  SYSLINUX_C32 = $(call qstrip,$(BR2_TARGET_SYSLINUX_C32))
>  
> -# We install the c32 modules from the host-installed tree, where they
> -# are all neatly installed in a single location, while they are
> +# We install the c32 modules from the temporarily installed tree, where
> +# they are all neatly installed in a single location, while they are
>  # scattered around everywhere in the build tree.
>  define SYSLINUX_INSTALL_IMAGES_CMDS
>  	for i in $(SYSLINUX_IMAGES-y); do \
>  		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
>  	done
>  	for i in $(SYSLINUX_C32); do \
> -		$(INSTALL) -D -m 0755 $(HOST_DIR)/share/syslinux/$${i} \
> +		$(INSTALL) -D -m 0755 $(@D)/br-root.temp/usr/share/syslinux/$${i} \
>  			$(BINARIES_DIR)/syslinux/$${i}; \
>  	done
>  endef
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
