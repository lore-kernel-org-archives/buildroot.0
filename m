Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD8CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F99E82079;
	Tue, 26 May 2026 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biVQ5Q5ssP4L; Tue, 26 May 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67DCA8207A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779824231;
	bh=E0a7672/lN7iZG6TdtwjFIU0TVe3NYtuwK2L4AhY21Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TuA6Q7dsPNKox9Hg3BVBVsbDEdZUA9llhPrRNDTDjNswk6kQJRXPPABolUhoBqDYK
	 169TPza1U9WJ2jUplrWPhJVCpaafV7JN/6IzEuKXaytVNQ28aSPCq4C+v98EEIOESa
	 QH+QG0xfDti/plLUY6Ft88KII6YaLYBPtNUqUPZAmKMTNmm/9n2F/y/7VsCLiiPlur
	 XQKMaQyA+4Hdnoq062aRhsLxNFJBHQyUSOg8on8ilHFHbaAYYPFagAyamMDA4uhanY
	 iVVyDGCswIawtcW6q/gzqVXwjV3Qo44AGwoNQQF0Hjle9RRy8yGmeRPSKb/2GF5DQ1
	 xrW/yCaC8wn2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67DCA8207A;
	Tue, 26 May 2026 19:37:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C668297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F576108F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixasiS6Lo0YY for <buildroot@buildroot.org>;
 Tue, 26 May 2026 19:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 414CE606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414CE606C0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 414CE606C0
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11E46B97C635; Tue, 26 May 2026 21:37:05 +0200 (CEST)
Message-ID: <c160823f-1e17-4140-a395-da65d69d39a4@rnout.be>
Date: Tue, 26 May 2026 21:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christopher Obbard <obbardc@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
 <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779824225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=meXmDvcyxQ2mSSKJ7qnWP27EM2HDsJmIliylD4v5lWo=;
 b=SlVABvfzHsG4oIB1q+YjruT00tnrJnoqLbebvwbQ/mMog5oL/dqrGShPnokUTS19WCAkzP
 HaAFhSquW8wUIqLAcDoygGTMeI+aZu9b/Kv3osYqaSgh08z/PHmtjK7XHGM1tfdaIP04S3
 Jpdsj1e6/4la1WE3g7ZLAIjMR8GJ8tjuIbEwqqKRZ3Kx2M8uV7xpmliWMiINj0SUo5Xpmt
 dnRyF5crHJ1kioXLqn6RK3qWV6mGRW2ec63s4y2XusTV9IVZIgUKivc3DOl0IaTRqr9o56
 rSCjSYTJkv4N9Plfzt8w4B5XLhnRww9tX+8jaeBZBMq0bsh7vQomIlljYVXxPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=SlVABvfz
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/efibootguard: new boot package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Christopher,

On 24/05/2026 19:23, Christopher Obbard wrote:
> This patch adds a new boot package to Buildroot to build the
> EFI Boot Guard bootloader from the https://github.com/siemens/efibootguard
> repository.
> 
> EFI Boot Guard can be chainloaded as an EFI application or used as a
> standalone bootloader and can be useful when booting A/B systems.
> 
> Add a recipe to build the EFI bootloader application, user-space
> tooling & host tooling (both of which are used to manage EFI Boot Guard
> configuration).
> 
> EFI Boot Guard can be built for multiple architectures, but this initial
> patch only builds the EFI bootloader for x86_64.

  Any particular reason for that? With utils/test-pkg it should be easy enough 
to test if all the architectures indeed work (or at least build).

> Signed-off-by: Christopher Obbard <obbardc@gmail.com>
[snip]
> diff --git a/boot/efibootguard/Config.in b/boot/efibootguard/Config.in
> new file mode 100644
> index 0000000000..47fd478e8b
> --- /dev/null
> +++ b/boot/efibootguard/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_x86_64

  Is there actually platform-specific code in efibootguard? I had a very quick 
look and couldn't find anything right away. But of course, it requires a 
watchdog, and all the mentioned watchdog drivers are x86-specific AFAIK.

> +	depends on BR2_USE_MMU

  Where does the MMU dependency come from? Is it just copied from gnu-efi? If 
so, it's better to use

	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS

It's probably better to do that anyway, we like to make sure that for every 
select there is a corresponding depends on for its dependencies.

> +
> +config BR2_TARGET_EFIBOOTGUARD
> +	bool "efibootguard"
> +	depends on BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GNU_EFI
> +	select BR2_PACKAGE_PCIUTILS if BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS

  This select should move to the BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS option 
itself.

> +	help
> +	  EFI Boot Guard is a UEFI bootloader intended for robust
> +	  A/B style updates. It arms a hardware watchdog before
> +	  handing over control to the OS and supports a fail-safe
> +	  boot mechanism to roll back if a boot attempt fails.
> +
> +	  https://github.com/siemens/efibootguard
> +
> +if BR2_TARGET_EFIBOOTGUARD
> +
> +config BR2_TARGET_EFIBOOTGUARD_X86_64
> +	bool "x86-64"
> +	depends on BR2_x86_64
> +	help
> +	  Select this option if the platform you're targeting has a
> +	  64 bits EFI BIOS.

  I don't see why such an option should be user-selectable. The target 
architecture is sufficient, no? In addition, it is not even used in the .mk file...


> +
> +config BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
> +	bool "install tools"
> +	help
> +	  Install the efibootguard user-space tools (e.g.
> +	  bg_printenv and bg_setenv) on the target. These tools
> +	  allow reading and updating efibootguard's configuration
> +	  in user-space.
> +
> +endif # BR2_TARGET_EFIBOOTGUARD
> diff --git a/boot/efibootguard/Config.in.host b/boot/efibootguard/Config.in.host
> new file mode 100644
> index 0000000000..845c14c079
> --- /dev/null
> +++ b/boot/efibootguard/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_TARGET_HOST_EFIBOOTGUARD
> +	bool "host efibootguard"
> +	help
> +	  Build efibootguard companion tools for the host. These
> +	  can be used during image creation to inspect and
> +	  modify the efibootguard configuration data.
> +
> +	  https://github.com/siemens/efibootguard
> diff --git a/boot/efibootguard/efibootguard.hash b/boot/efibootguard/efibootguard.hash
> new file mode 100644
> index 0000000000..6f5a5cf25c
> --- /dev/null
> +++ b/boot/efibootguard/efibootguard.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  6c68c541311dcc8c2be0042f7887acc2a24d2ac68a88d426380fdbda9f476ae8  efibootguard-0.22.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
> new file mode 100644
> index 0000000000..c40cef13ac
> --- /dev/null
> +++ b/boot/efibootguard/efibootguard.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# efibootguard
> +#
> +################################################################################
> +
> +EFIBOOTGUARD_VERSION = 0.22
> +EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
> +EFIBOOTGUARD_LICENSE = GPL-2.0-only
> +EFIBOOTGUARD_LICENSE_FILES = COPYING
> +
> +EFIBOOTGUARD_DEPENDENCIES = \
> +	gnu-efi \
> +	host-autoconf-archive
> +
> +ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
> +EFIBOOTGUARD_DEPENDENCIES += pciutils

  For the host package, there is no dependency on host-pciutils (which doesn't 
exist anyway) but otherwise the options are the same. Is the pciutils dependency 
perhaps optional?

> +EFIBOOTGUARD_INSTALL_TARGET = YES
> +else
> +EFIBOOTGUARD_INSTALL_TARGET = NO
> +endif
> +
> +EFIBOOTGUARD_INSTALL_IMAGES = YES
> +
> +EFIBOOTGUARD_AUTORECONF = YES
> +
> +EFIBOOTGUARD_AUTORECONF_OPTS = \
> +	-I $(HOST_DIR)/share/autoconf-archive
> +
> +EFIBOOTGUARD_CONF_OPTS = \
> +	--with-gnuefi-sys-dir=$(STAGING_DIR) \
> +	--with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
> +	--with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
> +	--disable-completion \
> +	--disable-tests
> +
> +# TODO: Perhaps take inspiration from Debian patch https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/always-override-stack-protector-variables-in-EFI-bui.patch?ref_type=heads

  Although that is a good patch (at first sight), it's something that should be 
upstream, and anyway has no relationship with the -no-pie. So I'd just remove 
this comment.

> +EFIBOOTGUARD_CONF_ENV = \
> +	LDFLAGS="$(LDFLAGS) -no-pie"
> +
> +define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -d $(BINARIES_DIR)/efibootguard
> +	$(INSTALL) -m 0644 $(@D)/efibootguardx64.efi $(BINARIES_DIR)/efibootguard/

  Why in a subdirectory and not directly in BINARIES_DIR?

  Regards,
  Arnout


> +endef
> +
> +HOST_EFIBOOTGUARD_DEPENDENCIES = \
> +	host-autoconf-archive
> +
> +HOST_EFIBOOTGUARD_AUTORECONF = YES
> +
> +HOST_EFIBOOTGUARD_AUTORECONF_OPTS = \
> +	-I $(HOST_DIR)/share/autoconf-archive
> +
> +HOST_EFIBOOTGUARD_CONF_OPTS = \
> +	--disable-bootloader \
> +	--disable-completion \
> +	--disable-tests
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
