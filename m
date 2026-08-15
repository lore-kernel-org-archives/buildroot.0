Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBD4C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1E7D407B3;
	Sat, 15 Aug 2026 19:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sqofyWf_Udg; Sat, 15 Aug 2026 19:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10E4140807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786821943;
	bh=MYyUUlEFMgIguaCRSRnovOQucq8ZJpDguH8DhwvsjvI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cnJpN0WauZQtbyuNyqU7crnoVd6hkULimEX+/bJsZI5Hr9S9U6yVIsKTIu5rjyTbn
	 jEoDX+hD39q9GMJ5VhmnD3diOJE54nmUcOo4N/DEkJ8KBY3bP2ON29RjGsg22GQTih
	 7VeTozG1JjuJfL7iW8ObrJbrMKtUhBEroE3xA8QlYtpxPzXwntonUVhvDB/l301/7y
	 OWpsD28WIkfZ1lKnC6Nm3vWnPVfaVctToPo6w0naXC+nwIIvvZMQulpY9MBp6ol2K0
	 q9WqO693HPrvtruHUaxse3c/yeR5Smi1zRKLqCf0YF9swr4r6oQtxxEurfLAQs0yJL
	 /sA3Owom35E4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10E4140807;
	Sat, 15 Aug 2026 19:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5467A337
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4677A4008C
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Od7ZMFYk1OpP for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 19:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 061F34006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061F34006F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 061F34006F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 19:25:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E203C780368;
 Sat, 15 Aug 2026 21:25:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 21:25:34 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 21:25:34 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260811-heaptrack-v3-1-772180a6e654@bootlin.com>
References: <20260811-heaptrack-v3-1-772180a6e654@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <9de991fb9ed19fb13d2079c3dafde7d5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3] package/heaptrack: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Thanks for the patch. I have few comments, see below.

On 11/08/2026 12:15, Luca Ceresoli via buildroot wrote:
> Add heaptrack, a memory allocation tracer toolkit.
> 
> This implementation builds all the command line components, not the
> heaptrack_gui graphical visualization program.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
[...]
> diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
> new file mode 100644
> index 000000000000..12e33ff2c219
> --- /dev/null
> +++ b/package/heaptrack/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_HEAPTRACK
> +	bool "heaptrack"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
> +	depends on BR2_USE_WCHAR # boost, elfutils
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # 
> boost-filesystem

This package is failing to build with uclibc toolchains. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2762905573

heaptrack uses LM_ID_BASE which is not supported by uclibc:
https://invent.kde.org/sdk/heaptrack/-/blob/master/src/track/heaptrack_env.cpp#L33
https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/include/dlfcn.h#L46-L54

You could either try to fix that issue, or disable the package for
uclibc toolchains by adding:

     depends on !BR2_TOOLCHAIN_USES_UCLIBC # no dlmopen() support

with the corresponding comment.

> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libunwind
> +	depends on !BR2_STATIC_LIBS # libunwind, elfutils
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_IOSTREAMS
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	# For heaptrack_print
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_LIBUNWIND
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Heaptrack traces all memory allocations and annotates these
> +	  events with stack traces. Dedicated analysis tools then allow
> +	  you to interpret the heap memory profile to find hotspots,
> +	  memory leaks, allocation hotspots and temporary allocations.
> +
> +	  Zstandard offers better (de)compression performance compared
> +	  with gzip/zlib, making heaptrack faster and datafiles smaller,
> +	  so enabling BR2_PACKAGE_ZSTD is recommended.
> +
> +	  https://apps.kde.org/heaptrack/
> +
> +comment "heaptrack needs a toolchain w/ C++, threads, wchar, gcc >= 
> 4.9, dynamic library"
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
> +	depends on !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_USE_WCHAR \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> +		|| BR2_STATIC_LIBS
[...]
> diff --git a/package/heaptrack/heaptrack.mk 
> b/package/heaptrack/heaptrack.mk
> new file mode 100644
> index 000000000000..ef12f9d189fe
> --- /dev/null
> +++ b/package/heaptrack/heaptrack.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# heaptrack
> +#
> +################################################################################
> +
> +HEAPTRACK_SITE_METHOD = git
> +HEAPTRACK_SITE = https://invent.kde.org/sdk/heaptrack.git
> +HEAPTRACK_VERSION = 3e6cce3d210a6672fe6f92de0bed567c49b7a9c5
> +HEAPTRACK_LICENSE = LGPL-2.1-or-later, GPL-2.0-or-later 
> (heaptrack_interpret)
> +HEAPTRACK_LICENSE_FILES = \
> +	LICENSES/LGPL-2.1-only.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/LGPL-2.1-or-later.txt \
> +	LICENSES/BSL-1.0.txt \
> +	LICENSES/MIT.txt \
> +	LICENSES/Apache-2.0.txt \
> +	LICENSES/BSD-3-Clause.txt
> +HEAPTRACK_DEPENDENCIES = host-pkgconf boost libunwind zlib elfutils

Could you sort dependencies, please?

HEAPTRACK_DEPENDENCIES = host-pkgconf boost elfutils libunwind zlib

> +HEAPTRACK_CONF_OPTS += -DHEAPTRACK_BUILD_GUI=OFF 
> -DHEAPTRACK_BUILD_PRINT=ON

Since it's the first _CONF_OPTS assignement, could you
remove the '+', please?

HEAPTRACK_CONF_OPTS = -DHEAPTRACK_BUILD_GUI=OFF ...

> +
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +HEAPTRACK_DEPENDENCIES += zstd
> +endif
> +
> +$(eval $(cmake-package))
> diff --git a/support/testing/tests/package/test_heaptrack.py 
> b/support/testing/tests/package/test_heaptrack.py
> new file mode 100644
> index 000000000000..de3d5441efa4
> --- /dev/null
> +++ b/support/testing/tests/package/test_heaptrack.py
> @@ -0,0 +1,40 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestHeaptrack(infra.basetest.BRTest):
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
> +    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +    # needed by heaptrack.
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.42"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_HEAPTRACK=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", 
> "rootfs.cpio")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a57",
> +                                    "-m", "256M",
> +                                    "-initrd", cpio_file])
> +
> +        self.emulator.login()
> +
> +        self.assertRunOk("/usr/bin/heaptrack --version")
> +        self.assertRunOk("/usr/bin/heaptrack /bin/busybox")

Maybe we could make this test slightly more complex,
to have a bit more allocations, and also printing the
recorded data.

For example:

self.assertRunOk("heaptrack -o /tmp/ls.heaptrack ls -al /")
self.assertRunOk("heaptrack_print --file /tmp/ls.heaptrack.gz")

> ---
> base-commit: d4f3bea066947fdee49a12ebd84cba54a872d43f
> change-id: 20260731-heaptrack-cd4f6f8fcec8
> 
> Best regards,
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Could you send an updated patch addressing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
