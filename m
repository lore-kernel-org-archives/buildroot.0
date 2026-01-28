Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5398DD3F083
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E5F40C5E;
	Wed, 28 Jan 2026 17:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzg4AfAG2Ogz; Wed, 28 Jan 2026 17:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF1240A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621086;
	bh=RTkAQdOO+EJH1bSHl4mVrGr47LxVQvxZEYfKtzlN/Ko=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b3PzC6Szwn67GbkbPedWdRnwOLD0y2fjqER0p7o1n4qceiwzqxjOui/4YcdrlaHfh
	 FXxBdnmMgHF4SMOrURttLGEDpjNaWHRRMbps60dLlyT8fk21zhXZUQ38Fh5ZpgJhz1
	 OjXnsz7ChuBhtk2WfM9jQWw2nZ3j7aELh7rhc71+/CftmNPRwE23YiEyqSUkYCGYTz
	 M5bnZw6ypoLL5tBNcZjDWrDjosWfA90KXyB2RFqAiZTYvrwOYuvOQGM5OU9p1wf9G9
	 E6lmQ4gYrmV711tepkuFhI/vrpcj68rcBoAOU2B1K7b/BqU/0y5JHPVBsTHzRi52J2
	 zs/RHb9XO+yrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF1240A06;
	Wed, 28 Jan 2026 17:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41E541AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2467280C42
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W_ebxDDYIhJ for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D001B80C33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D001B80C33
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D001B80C33
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5685B97AB22; Wed, 28 Jan 2026 18:24:29 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:29 +0100
Message-ID: <20260128172429.343111-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-10-bernd@kuhls.net>
References: <20260106200115.1985522-10-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621070; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DS5QaR2C37h6wJRbbT7bWSZex1fQT+w+CycHYTjSQ4c=;
 b=VErjB70EpbYm8R9sMsV09StA0G4K2KAePpLLhDHvkhpd+pmHm5sdbusZpOfZgW7dMPeGiO
 J6CBVmMjRGyz8s5B4cDP6WETuOf0/IVdnW676X+S+gNG/9gxva+qO/hVuXrkU3du4sx7/r
 ER4EOFl8SfYXFvJR82wGjGy505Az7WiOF6NQlMvqTtfYQTl8nYxBNs/d3aLvZovoc/IxM0
 JKH8xDNa4PhHcGM68b7QmpvJh3QASL0l2WKPc83ZW92w65z8pYfsBfLni8s6j7c3lHQHO4
 baX/mvWAtEqF57dz049/w3oQWnd3phltX28HLvTEVHIKFBQHGgnnGpNoMEQCDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VErjB70E
Subject: Re: [Buildroot] [PATCH v2 9/9] package/lockdev: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The package was removed from Debian in 2016:
> https://tracker.debian.org/news/738763/removed-103-16-from-unstable/
> "Obsolete and replaced by flock"
> 
> and causes build errors with musl.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9fa/9fa9323bac3ee1720396bb34fefb3017125e5a85/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy                              |  7 +++
>  package/Config.in                             |  1 -
>  ...-static-library-and-headers-separate.patch | 44 --------------
>  package/lockdev/Config.in                     |  6 --
>  package/lockdev/lockdev.hash                  |  5 --
>  package/lockdev/lockdev.mk                    | 58 -------------------
>  6 files changed, 7 insertions(+), 114 deletions(-)
>  delete mode 100644 package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
>  delete mode 100644 package/lockdev/Config.in
>  delete mode 100644 package/lockdev/lockdev.hash
>  delete mode 100644 package/lockdev/lockdev.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index e97fd0ebb2..4d9e2df986 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_LOCKDEV
> +	bool "lockdev removed"
> +	select BR2_LEGACY
> +	help
> +	  lockdev was no longer maintained upstream, so it has been
> +	  dropped.
> +
>  config BR2_PACKAGE_DBUS_TRIGGERD
>  	bool "dbus-triggerd removed"
>  	select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index 52ca6d19d3..0f96ec2527 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1698,7 +1698,6 @@ menu "Filesystem"
>  	source "package/liblockfile/Config.in"
>  	source "package/libnfs/Config.in"
>  	source "package/libsysfs/Config.in"
> -	source "package/lockdev/Config.in"
>  	source "package/physfs/Config.in"
>  endmenu
>  
> diff --git a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch b/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
> deleted file mode 100644
> index d5a498a19e..0000000000
> --- a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 0dcd2368c3e23a5cc1cc4a979d9c241ed9302236 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@openwide.fr>
> -Date: Sun, 4 Jan 2015 16:06:07 +0100
> -Subject: [PATCH] Makefile: install static library and headers separately
> -
> -Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ----
> - Makefile | 12 +++++++-----
> - 1 file changed, 7 insertions(+), 5 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index e27dcbd..ecf52d1 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -45,12 +45,10 @@ perl-lib:	static
> - 	cd LockDev && make OPTIMIZE="-O2 -g -Wall"
> - 	cd LockDev && make test
> - 
> --.PHONY: install install_dev install_dbg install_doc install_run 
> --install:	install_dev install_dbg install_doc install_run
> -+.PHONY: install install_dev install_dbg install_doc install_run install_static
> -+install:	install_dev install_dbg install_doc install_run install_static
> - 
> --install_dev:	${static} src/lockdev.h
> --	install -m755 -d	${libdir}
> --	install -m644 ${static}	${libdir}
> -+install_dev:	src/lockdev.h
> - 	install -m755 -d	${incdir}
> - 	install -m644 src/lockdev.h	${incdir}
> - 	install -m644 src/ttylock.h	${incdir}
> -@@ -69,6 +67,10 @@ install_doc:	docs/lockdev.3
> - 	install -m755 -d	${mandir}/man3
> - 	install -m644 docs/lockdev.3	${mandir}/man3
> - 
> -+install_static:	${static}
> -+	install -m755 -d	${libdir}
> -+	install -m644 ${static}	${libdir}
> -+
> - install_run:	${shared}
> - 	install -m755 -d	${libdir}
> - 	install -m644 ${shared}	${libdir}
> --- 
> -1.9.3
> -
> diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
> deleted file mode 100644
> index 4b386f4ab0..0000000000
> --- a/package/lockdev/Config.in
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -config BR2_PACKAGE_LOCKDEV
> -	bool "lockdev"
> -	help
> -	  Library for locking devices.
> -
> -	  No upstream site, primary site is Debian.
> diff --git a/package/lockdev/lockdev.hash b/package/lockdev/lockdev.hash
> deleted file mode 100644
> index e32466dfe7..0000000000
> --- a/package/lockdev/lockdev.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_1.0.3-1.6.dsc
> -sha256  ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82  lockdev_1.0.3.orig.tar.gz
> -sha256  a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e  lockdev_1.0.3-1.6.diff.gz
> -# Locally calculated
> -sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  LICENSE
> diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
> deleted file mode 100644
> index e491b132d3..0000000000
> --- a/package/lockdev/lockdev.mk
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -################################################################################
> -#
> -# lockdev
> -#
> -################################################################################
> -
> -LOCKDEV_VERSION_MAJOR = 1
> -LOCKDEV_VERSION = $(LOCKDEV_VERSION_MAJOR).0.3
> -LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
> -LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
> -LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
> -LOCKDEV_LICENSE = LGPL-2.1
> -LOCKDEV_LICENSE_FILES = LICENSE
> -LOCKDEV_INSTALL_STAGING = YES
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -LOCKDEV_BUILD_ARGS = static
> -LOCKDEV_INSTALL_ARGS = install_static
> -else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -LOCKDEV_BUILD_ARGS = static shared
> -LOCKDEV_INSTALL_ARGS = install_run install_static
> -else # BR2_SHARED_LIBS
> -LOCKDEV_BUILD_ARGS = shared
> -LOCKDEV_INSTALL_ARGS = install_run
> -endif
> -
> -# Make the code believe we are using a C library compatible with
> -# glibc, which for the purpose of lockdev is actually true.
> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -LOCKDEV_BUILD_ARGS += CFLAGS="$(TARGET_CFLAGS) -D__GNU_LIBRARY__"
> -endif
> -
> -ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
> -define LOCKDEV_CREATE_LINKS_STAGING
> -	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
> -	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
> -endef
> -
> -define LOCKDEV_CREATE_LINKS_TARGET
> -	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
> -endef
> -endif
> -
> -define LOCKDEV_BUILD_CMDS
> -	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LOCKDEV_BUILD_ARGS)
> -endef
> -
> -define LOCKDEV_INSTALL_STAGING_CMDS
> -	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS) install_dev
> -	$(LOCKDEV_CREATE_LINKS_STAGING)
> -endef
> -
> -define LOCKDEV_INSTALL_TARGET_CMDS
> -	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
> -	$(LOCKDEV_CREATE_LINKS_TARGET)
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
