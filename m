From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 09:12:57 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/jitterentropy-library: new
 package
In-Reply-To: <20191021213839.46139-1-matthew.weber@rockwellcollins.com>
References: <20191021213839.46139-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191022091257.08fed224@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 21 Oct 2019 16:38:38 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> diff --git a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
> new file mode 100644
> index 0000000000..5234b072b1
> --- /dev/null
> +++ b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
> @@ -0,0 +1,43 @@
> +From f94975948ff259f86b14d36d3f3ede2e41e41ff4 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Mon, 9 Sep 2019 20:42:14 -0500
> +Subject: [PATCH] Makefile: cleanup install
> +
> +- drop install of man pages

Please leave the man page installation in place, so that the patch is
acceptable upstream, and submit the patch as a pull request on Github.

> +- don't strip library install
> +- force symlink creation
> +- create include folder before copying headers

The only thing that could be controversial here is the removal of the
library stripping. If upstream does not want to remove it, then I'd suggest:

INSTALL_STRIP = install -s

with:

	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/

so that we can override INSTALL_STRIP from the Buildroot .mk file.

This should make the change acceptable upstream.

> +JITTERENTROPY_LIBRARY_VERSION = 2.1.2
> +JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
> +JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0, BSD-3-Clause
> +JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
> +JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
> +
> +define JITTERENTROPY_LIBRARY_BUILD_CMDS
> +	# CFLAGS is being forced to not optimize for the case where Clang doesn't
> +	# respect "#pragma GCC optimize" in jitterentropy-base.c
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-O0"

Why do we care about Clang ? It is not supported as a Buildroot
compiler for the moment. When it will, perhaps we will have some
BR2_TOOLCHAIN_USES_GCC and BR2_TOOLCHAIN_USES_CLANG options, so that
packages can do whatever hacks they need depending on the compiler
being used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
