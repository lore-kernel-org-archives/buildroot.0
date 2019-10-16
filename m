From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 23:51:46 +0200
Subject: [Buildroot] [PATCH v3] package/caps: new package
In-Reply-To: <20191014112655.25540-1-joerg.krause@embedded.rocks>
References: <20191014112655.25540-1-joerg.krause@embedded.rocks>
Message-ID: <20191016235146.55a5b718@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Oct 2019 13:26:55 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> From: Martin Bark <martin@barkynet.com>
> 
> CAPS is a collection of audio plugins comprising virtual guitar
> amplification and a small range of basic classic effects, signal
> processors and generators of often elementary and occasionally
> exotic nature.
> 
> The plugins aim to satisfy the highest demands in sound quality
> with maximal computational efficiency and zero latency.
> 
> Note, that the original patch [1] dates back in 2014.
> 
> [1] https://patchwork.ozlabs.org/patch/376822/

I have applied, but after doing a few changes. See below.

> diff --git a/package/caps/0001-Fix-cross-compilation.patch b/package/caps/0001-Fix-cross-compilation.patch
> new file mode 100644
> index 0000000000..6bb7111537
> --- /dev/null
> +++ b/package/caps/0001-Fix-cross-compilation.patch
> @@ -0,0 +1,82 @@
> +From d9861488a91b9e6b96b8bfae8c2b94f90d8d421b Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Tue, 5 Aug 2014 21:59:23 +0100
> +Subject: [PATCH] Fix cross compilation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Corrections to Makefile to correctly use CXX and CXXFLAGS when compiling
> +c++ code.
> +
> +Signed-off-by: Martin Bark <martin@barkynet.com>
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This patch was not needed. But using a slightly more elaborate logic in
caps.mk, I could avoid this patch entirely.

> diff --git a/package/caps/0002-Fix-stdint-types-with-musl.patch b/package/caps/0002-Fix-stdint-types-with-musl.patch
> new file mode 100644
> index 0000000000..23002c072e
> --- /dev/null
> +++ b/package/caps/0002-Fix-stdint-types-with-musl.patch
> @@ -0,0 +1,54 @@
> +From 626e60a82120961ccee117dfcb5c28f72f8a26e5 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Wed, 28 Aug 2019 11:25:49 +0200
> +Subject: [PATCH] Fix stdint types with musl
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fetched from:
> +https://github.com/dsacre/meta-lad/blob/master/recipes-multimedia/lv2/caps-lv2/fix-stdint-types-with-musl.patch
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Could you submit this patch to the author of caps ?

> diff --git a/package/caps/Config.in b/package/caps/Config.in
> new file mode 100644
> index 0000000000..798ef74462
> --- /dev/null
> +++ b/package/caps/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_CAPS
> +	bool "caps"
> +	depends on BR2_INSTALL_LIBSTDCPP

caps unconditionally builds a shared library, so I've added a depends
on !BR2_STATIC_LIBS here.

> +CAPS_VERSION = 0.9.26
> +CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
> +CAPS_SITE = http://quitte.de/dsp
> +CAPS_LICENSE = GPLv3

And now that I looked again at this, it is wrong, it should be:

CAPS_LICENSE = GPL-3.0+

Could you send a follow-up patch to fix this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
