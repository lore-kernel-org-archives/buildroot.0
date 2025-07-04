Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6064C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E8A83CE2;
	Fri,  4 Jul 2025 06:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OE3UE9fBGxcY; Fri,  4 Jul 2025 06:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5973E832EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5973E832EA;
	Fri,  4 Jul 2025 06:48:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F1E7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3761B404B5
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 013N_2M9-vrA for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 391744040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391744040D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 391744040D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so6161805e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611693; x=1752216493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MSCmGB2OyM+G7+rpssah+8+RtBJ3JvyTgbDsrdnAR+E=;
 b=aKNSiop8bPAdfGmUGEz6Q9n1YXyrzVG/TFxnIv+VtkZruT4jiI4C4r9RHVmsOsL9BH
 3WvQm9l3koYi8s+FsmXAK05wGJBU2w0flZ1DLUXRmJbcENwAqIis2A60TVEuy7kPvCSj
 bgpPyuCgoiRbcaRNwJcxHVSTC+nwUhqORcI7FdfrvfkHKtqaWKaC8orYTqeKPacv+oXI
 +54WPWtS+9J5hEGVDR/VgeJX6eNXRCiiD5bfMxeizN84gZiyMOXnPKH8WsqWUXysN3Er
 IskqtTk21QqfYdzOOOfUEQeavji/XG6YC5iTFp0M++P/irWWQWpsEpFX7H2dQ0aBGPXy
 KBEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfk31YVGE8eb073no+bHRHxuqdx3khrZhw/RYx2hUOPv0t9FivE8hEWv1py2KYk2rgdwXhd0/8dQs=@buildroot.org
X-Gm-Message-State: AOJu0Yzym0OL7N24w1tmTq0EyvKa+Uc9cv7LRiwOyuuiX/Pl/aa6siEN
 Hu8MQa2HzGBQPOvTRq8nwmxX8j4R8kUPcSHgV9T0au/OLLQwbVn6hQ+NmXDZMjBQtbU=
X-Gm-Gg: ASbGncsukbK2oSRvbcgLs8VBp5ZqPDervcNHePNSBtjHbWANrcvhU5z0gi+pXxeMTBe
 SMBniyDZDHeoVYnGOTq3jz6PZANBEyThRgWG7h4NGGXQWlC5FIeF87S8983crk7kveY0e9NMDOm
 c7gGFTkdX4Aehgj0ilM3zX4s0t+ohBsYpBfTTONN5jyQSWhSuVVVKTtWLREa+5gLmfKakJshdFc
 BSA4O8uhezvl2rYmhX59xj08Gv2bC/DNRy3qWK/Xbs6RcOYhMjkqaPg0O4swmxwI44OoP0IYUK+
 7BJ42wOdCV2h/wITxrgRrHyTfM+75bcONvM9JpfdOaTTzLv2M3alozskTSqqsZjrElFTXZVpXLE
 eR76P0LbKMQ==
X-Google-Smtp-Source: AGHT+IFf9Xwq+AFzWRpO1vEW/aI749yDPnRei+4AK2qQiuTyyAA2OrQBcN4SpWzrNOYuYoKYxsbiXg==
X-Received: by 2002:a05:600c:45cf:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-454b4e779camr7137525e9.8.1751611693243; 
 Thu, 03 Jul 2025 23:48:13 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453a85b3016sm77820055e9.0.2025.07.03.23.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:12 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:11 +0200
Message-ID: <20250704064811.4065589-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
References: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611693; x=1752216493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MSCmGB2OyM+G7+rpssah+8+RtBJ3JvyTgbDsrdnAR+E=;
 b=BH8VEDKSD4owq7+bTu9tG6LvECBP5bVw/Aj5/7XGVbnE1lN1D8BeVTZU4W9EHmHTzX
 IX0YRiu707EEEUYqXVK1dzGkJplUs5hpVqpDxzvV6VujSbiVOkikUx+gC5yZWPpygUdM
 osUIeDZ1UpkkmIbsl1wn1jSRNymWDqxCL26zMnYRasky51LvThlDSq7+FhtFoefVatMa
 xOCpSvA35x4WC30fyI5k3NWdAXYsHJdwdt7h0DccNEv8n56XQTIyuG9ofqEajXiuIx55
 4FEp/Sqr5V/MYnSYpfZ6jGw5t5w3sTyWpiWRTYCU+iSldQqrpYIAw8JqB6Xq4cJRSCi3
 i9Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BH8VEDKS
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

Applied to 2025.05.x. Thanks

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
