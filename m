Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86048C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E500405B3;
	Sun, 14 Jul 2024 20:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iB5OZN90s6Vg; Sun, 14 Jul 2024 20:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A4E405BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58A4E405BB;
	Sun, 14 Jul 2024 20:56:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12F6D1BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C635D40444
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2FXrl8Ho_rY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE031402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE031402A8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE031402A8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:56:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D23C8FF802;
 Sun, 14 Jul 2024 20:56:03 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:56:02 +0200
To: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
Message-ID: <20240714225602.65ffd43e@windsurf>
In-Reply-To: <20240408013859.732937-3-matt.stav.taylor@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408013859.732937-3-matt.stav.taylor@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720990564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhjvQ1kSDRSUcuQtprdC5Ok45yftbmW2k01zQT9aYTg=;
 b=YPascieazRsiet/oVhm4eQz42cmH9EeCGC8URHu/wMgc23FfkvFgOGPdf+CFkTuRpoV+zp
 XoXGf2hWNkaMuwCHjwYjxdQOGrzriAEZzCHH7ivbCOLDTmr7TXAvuArOMhDNdaqPZr0kuY
 a9QUumVe2/Sl6+ZKg2uh8XSRyyRe8vxLmZQJNqqZYREyoUya3WOzEY4pxZjQ6WA2mKF/AG
 Ho661RSzp8rbeKryYMFU8daWZ4t+Q52k7DZ7lbfiIymuV8iGZ+wRt0hKZVphicuxQc5mSY
 VyoGr91zTvlcnDGk0KZ7FRrlVV5v7/4af1Rj8Vq5UeGjnmTXZt+4jy0c+x6nMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YPasciea
Subject: Re: [Buildroot] [PATCH 2/2] package/bcachefs-tools: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon,  8 Apr 2024 02:38:45 +0100
Matt Staveley-Taylor <matt.stav.taylor@gmail.com> wrote:

> Add the bcachefs-tools package. Note that this does not teach buildroot
> how to create bcachefs filesystems.
> 
> Signed-off-by: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>

I wanted to apply this, but unfortunately, there is a major issue in
your package: it doesn't actually cross-compile. Indeed, when you do:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

nothing tells the build system that it should use the cross-compiler.
And indeed it doesn't: it compiles everything with "cc". On my system,
it fails because I don't have liburcu installed system-wide, so it
couldn't include urcu/list.h.

The canonical way to cross-compile Makefile-based packages is to do:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

where TARGET_CONFIGURE_OPTS is provided by Buildroot, and contains CC,
LD, CFLAGS, etc. which are correct for cross-compilation.

Unfortunately, passing this makes the build of this package to fail
horribly.

I have made many more changes in your package, you will find my latest
version at:

  https://github.com/tpetazzoni/buildroot/commit/1d1a29b7fedcb9287afd98c2d8a6618af2b6e2df

I will comment below on the things that I have fixed.


> diff --git a/package/bcachefs-tools/Config.in b/package/bcachefs-tools/Config.in
> new file mode 100644
> index 0000000000..2c7cbcf406
> --- /dev/null
> +++ b/package/bcachefs-tools/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_BCACHEFS_TOOLS
> +	bool "bcachefs-tools"
> +	depends on BR2_USE_MMU # util-linux
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_HAS_UDEV

You missed several dependencies of the packages you select. Basically
for every package you select, you need to check if it has "depends on"
and replicate them. The final code I had looks like this:

	depends on BR2_USE_MMU # util-linux, keyutils
	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu
	depends on !BR2_STATIC_LIBS # keyutils
	depends on BR2_PACKAGE_HAS_UDEV
	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
	depends on BR2_INSTALL_LIBSTDCPP # liburcu

> +	select BR2_PACKAGE_KEYUTILS
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LIBSODIUM
> +	select BR2_PACKAGE_LIBURCU
> +	select BR2_PACKAGE_LZ4
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_ZSTD
> +	help
> +	  Bcachefs filesystem utilities
> +
> +	  https://bcachefs.org/
> +
> +comment "bcachefs-tools needs udev"
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
> +comment "bcachefs-tools needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

So these need to be updated as well:


comment "bcachefs-tools needs udev"
	depends on BR2_USE_MMU
	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
	depends on !BR2_PACKAGE_HAS_UDEV

comment "bcachefs-tools needs a toolchain w/ threads, C++, dynamic library"
	depends on BR2_USE_MMU
	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
		BR2_STATIC_LIBS || \
		!BR2_INSTALL_LIBSTDCPP

> diff --git a/package/bcachefs-tools/bcachefs-tools.hash b/package/bcachefs-tools/bcachefs-tools.hash
> new file mode 100644
> index 0000000000..def2762bea
> --- /dev/null
> +++ b/package/bcachefs-tools/bcachefs-tools.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  f2125c10494e484611e77a32c301e1cbd5cf6f247808cf1c2c7987c68c7ebd8c  bcachefs-tools-vendored-1.6.4.tar.zst

You have forgotten the hash of the license file. But I had forgotten as
well.

> diff --git a/package/bcachefs-tools/bcachefs-tools.mk b/package/bcachefs-tools/bcachefs-tools.mk
> new file mode 100644
> index 0000000000..1a4ca15e8d
> --- /dev/null
> +++ b/package/bcachefs-tools/bcachefs-tools.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# bcachefs-tools
> +#
> +################################################################################
> +
> +BCACHEFS_TOOLS_VERSION = 1.6.4
> +BCACHEFS_TOOLS_SOURCE = bcachefs-tools-vendored-$(BCACHEFS_TOOLS_VERSION).tar.zst
> +BCACHEFS_TOOLS_SITE = https://evilpiepirate.org/bcachefs-tools
> +BCACHEFS_TOOLS_LICENSE = GPL-2.0
> +BCACHEFS_TOOLS_LICENSE_FILES = COPYING
> +BCACHEFS_TOOLS_DEPENDENCIES = host-rustc host-clang keyutils libaio libsodium liburcu lz4 udev util-linux zlib zstd

That line was a bit too long, so I split it with one package per line.

> +
> +define BCACHEFS_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

This probably needs $(TARGET_CONFIGURE_OPTS) as discussed above.

> +endef
> +
> +define BCACHEFS_TOOLS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" PREFIX=/usr install

Likewise.

> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

The host-generic-package is to create host packages (compiled
natively), and it isn't used anywhere here, so I dropped this line.
Only generic-package is needed to create a target package
(cross-compiled for the target).

Here is a Buildroot configuration that couldn't build your package:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BCACHEFS_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

In order to validate your package, make sure it builds with the
following sequence:

$ make clean
$ cat > .config <<EOF
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BCACHEFS_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set
EOF
$ ./utils/docker-run make olddefconfig
$ ./utils/docker-run make

Could you have a look and submit a v2 which fixes this problem? No need
to resent your PATCH 1/2 as I applied it to master. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
