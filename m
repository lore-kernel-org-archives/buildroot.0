Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CAED3F09D
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D09F409AD;
	Wed, 28 Jan 2026 17:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UiWeenxe72u; Wed, 28 Jan 2026 17:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4636E408B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769621064;
	bh=syWWWzrNuBFot7Y+JmCo42Jz8ac3KJrTh24fK4zjoiI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gDcOKazRUQtSgXI5q1wgbfNj/tx6Mmb0adx04Kai+PuQlVRCIy0hfn2VHZ3c1kppC
	 ngl3JPbg1V85SMcF6dqi6WDnhfq8VS9QWkHjFzBqUT7DnN53QMJU3exElF/R6mV7v2
	 V0vzDVZTP3DiffSlpoDH/lcVMGwHNg+muofzly30NFPp1ZYSvSIrO3aG3QeJplyrVl
	 pmFbwgxvMNuDk4xzUmkCG3Yt9d5EPOfgsXfXiSvNaV/6LdIy8TV6rEw54RvskaC0kS
	 mnb7itSlCrXcTk83DXljZha3Cc4e2mEMV7PVmMF9nLbpskqT/eGAUZyCyDcEzW00tl
	 jEQUhJfWa3bFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4636E408B6;
	Wed, 28 Jan 2026 17:24:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB501AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FDD840591
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYpqXkUjHX83 for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E56D3408E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E56D3408E3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E56D3408E3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:24:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4F7AB97AC12; Wed, 28 Jan 2026 18:24:18 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 28 Jan 2026 18:24:17 +0100
Message-ID: <20260128172417.342753-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106200115.1985522-5-bernd@kuhls.net>
References: <20260106200115.1985522-5-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1769621058; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=HcbT+SpIeV3dvWUaxs9I+3OOUqxB/rg7M0dQZSsUDq0=;
 b=axB03ve+WV4y4FpyHWPibLw68OERamoOeaQa16uHwl/Rrs84oIupFYe0Qdx4b2N0tyD8jq
 VzUYuix3yYiUeOHJS5vcuqxdwMZh7m7KE/uIZ5ygfd+JJAcFKIEPkQeq3edyEwHJduDLwJ
 7LHsPGGMV5q91pxooDWgOIOmmrvgMl9aNX51HgXe5hRrcT6u2dqwmkfSxqlf/uHE4bjKmV
 CWKZvyfW0dZZ45cHdARFrVDLTCHBsshWUKs75lHe+EcIfhlxhArAAFGm4UBZdhrlLR9Pl8
 lFZaEBSuI+6/kOWNAa7dPd+tTDtacdoaAet4rnpQOAwETwE9cYRi4vPKJfcDsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=axB03ve+
Subject: Re: [Buildroot] [PATCH v2 4/9] package/criu: remove package
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
> The criu package was added in Nov 2023, and then bumped once in
> December 2023. Since then, it has never been bumped again, and all
> follow-up fixes were provided by other people than the original
> package submitter listed in the DEVELOPERS file.
> 
> criu has seen several upstream releases since then, and most notably
> is causing a number of build issues in our autobuilders:
> 
>   https://autobuild.buildroot.net/?reason=criu-3.19
> 
> The package was never updated to those newer upstream releases, and
> the autobuilder issues have not been addressed.
> 
> Therefore, let's drop this package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  Config.in.legacy       |  7 ++++
>  DEVELOPERS             |  1 -
>  package/Config.in      |  1 -
>  package/criu/Config.in | 52 ----------------------------
>  package/criu/criu.hash |  3 --
>  package/criu/criu.mk   | 77 ------------------------------------------
>  6 files changed, 7 insertions(+), 134 deletions(-)
>  delete mode 100644 package/criu/Config.in
>  delete mode 100644 package/criu/criu.hash
>  delete mode 100644 package/criu/criu.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a2d48b2f7c..062a9ebd5a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_CRIU
> +	bool "criu has been removed"
> +	help
> +	  criu was removed from Buildroot as it was insufficiently
> +	  maintained. It can be re-added if someone volunteers to
> +	  maintain it.
> +
>  config BR2_PACKAGE_GCONF
>  	bool "gconf package removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c5553960f5..c0f9279f8d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2255,7 +2255,6 @@ F:	support/testing/tests/package/test_python_pytest.py
>  F:	support/testing/tests/package/test_python_pytest_asyncio.py
>  
>  N:	Marcus Folkesson <marcus.folkesson@gmail.com>
> -F:	package/criu/
>  F:	package/libcamera/
>  F:	package/libcamera-apps/
>  F:	package/libostree/
> diff --git a/package/Config.in b/package/Config.in
> index ee63ab9d39..628a1f0aa6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2785,7 +2785,6 @@ menu "System tools"
>  	source "package/coreutils/Config.in"
>  	source "package/cpulimit/Config.in"
>  	source "package/cpuload/Config.in"
> -	source "package/criu/Config.in"
>  	source "package/crun/Config.in"
>  	source "package/daemon/Config.in"
>  	source "package/dc3dd/Config.in"
> diff --git a/package/criu/Config.in b/package/criu/Config.in
> deleted file mode 100644
> index 04a2080041..0000000000
> --- a/package/criu/Config.in
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -# criu only builds on certain architectures
> -config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> -	bool
> -	default y if BR2_ARM_CPU_ARMV6
> -	default y if BR2_ARM_CPU_ARMV7A
> -	default y if BR2_ARM_CPU_ARMV7M
> -	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
> -	default y if BR2_aarch64
> -	default y if BR2_x86_64
> -	default y if BR2_powerpc64le # Only support powerpc64 with LE
> -	# CRIU has "some" support for s390 but it is not included due to
> -	# BE/LE endian issues.
> -	depends on BR2_USE_MMU # libcap
> -	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -
> -config BR2_PACKAGE_CRIU
> -	bool "criu"
> -	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> -	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp, protobuf
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
> -	depends on !BR2_STATIC_LIBS # protobuf, libbsd
> -	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
> -	depends on BR2_USE_WCHAR # libbsd
> -	select BR2_PACKAGE_HOST_PYTHON3_SSL
> -	select BR2_PACKAGE_PROTOBUF
> -	select BR2_PACKAGE_PROTOBUF_C
> -	select BR2_PACKAGE_LIBAIO
> -	select BR2_PACKAGE_LIBBSD
> -	select BR2_PACKAGE_LIBCAP
> -	select BR2_PACKAGE_LIBNET
> -	select BR2_PACKAGE_LIBNL
> -	select BR2_PACKAGE_PYTHON3
> -	help
> -	  Checkpoint/Restore In Userspace (CRIU), is a software
> -	  tool for the Linux operating system to make it possible
> -	  to freeze a running application and checkpoint it to
> -	  persistent storage as a collection of files.
> -
> -	  https://criu.org/Main_Page
> -
> -comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
> -	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
> -		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
> -		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
> -		|| !BR2_HOST_GCC_AT_LEAST_7
> diff --git a/package/criu/criu.hash b/package/criu/criu.hash
> deleted file mode 100644
> index c3fcdbc03f..0000000000
> --- a/package/criu/criu.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256  990cdd147cb670a5d5d14216c2b5c2fc2b9a53ef19396569a6413807ba2a6aa2  criu-3.19.tar.gz
> -sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
> diff --git a/package/criu/criu.mk b/package/criu/criu.mk
> deleted file mode 100644
> index 3b72a1131e..0000000000
> --- a/package/criu/criu.mk
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -################################################################################
> -#
> -# CRIU
> -#
> -################################################################################
> -
> -CRIU_VERSION = 3.19
> -CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
> -
> -CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
> -CRIU_LICENSE_FILES = COPYING images/LICENSE
> -
> -CRIU_DEPENDENCIES =\
> -	host-pkgconf \
> -	host-protobuf-c \
> -	host-python3 \
> -	host-python-pip \
> -	libaio \
> -	libbsd \
> -	libcap \
> -	libnet \
> -	libnl \
> -	protobuf \
> -	protobuf-c \
> -	python3
> -
> -CRIU_MAKE_ENV =\
> -	$(TARGET_MAKE_ENV) \
> -	$(TARGET_CONFIGURE_OPTS) \
> -	CROSS_COMPILE=$(TARGET_CROSS) \
> -	WERROR=0
> -
> -# Remap to match the used in criu.
> -ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
> -CRIU_MAKE_ENV += ARCH=x86
> -else ifeq ($(BR2_NORMALIZED_ARCH),"powerpc")
> -CRIU_MAKE_ENV += ARCH=ppc64
> -else ifeq ($(BR2_NORMALIZED_ARCH),"arm64")
> -CRIU_MAKE_ENV += ARCH=aarch64
> -else
> -CRIU_MAKE_ENV += ARCH=$(BR2_NORMALIZED_ARCH)
> -endif
> -
> -ifeq ($(BR2_ARM_CPU_ARMV6),y)
> -CRIU_MAKE_ENV += SUBARCH=armv6
> -else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> -CRIU_MAKE_ENV += SUBARCH=armv7
> -else ifeq ($(BR2_ARM_CPU_ARMV7M),y)
> -CRIU_MAKE_ENV += SUBARCH=armv7
> -else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> -CRIU_MAKE_ENV += SUBARCH=armv8
> -endif
> -
> -# Criu needs Kernel Checkpoint/restore support which is not enabled
> -# by default.
> -define CRIU_LINUX_CONFIG_FIXUPS
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_CHECKPOINT_RESTORE)
> -endef
> -
> -define CRIU_BUILD_CMDS
> -	rm -rf $(@D)/images/google/protobuf/descriptor.proto
> -	cp -a  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto \
> -		$(@D)/images/google/protobuf/descriptor.proto
> -	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
> -		PREFIX=/usr
> -endef
> -
> -define CRIU_INSTALL_TARGET_CMDS
> -	$(CRIU_MAKE_ENV) $(MAKE) -C $(@D) \
> -		PREFIX=/usr \
> -		DESTDIR=$(TARGET_DIR) \
> -		install-criu \
> -		install-lib \
> -		install-compel
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
