From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:19:01 +0100
Subject: [Buildroot] [PATCH] pimd: new package
In-Reply-To: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
References: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171203001901.62499b79@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 13:24:02 -0200, Sergio Prado wrote:

> diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
> new file mode 100644
> index 000000000000..cd9427094a61
> --- /dev/null
> +++ b/package/pimd/pimd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# pimd
> +#
> +################################################################################
> +
> +PIMD_VERSION = 2.3.2
> +PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
> +PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_VERSION)
> +
> +PIMD_LICENSE = BSD-3-Clause
> +PIMD_LICENSE_FILES = LICENSE
> +
> +PIMD_MAKE_OPTS = CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
> +PIMD_CONF_OPTS = --embedded-libc
> +endif
> +
> +$(eval $(autotools-package))

I was a bit confused at first, because when I looked at the code in
http://troglobit.com/project/pimd/, it was using a traditional
configure.ac and Makefile.am, which surely shouldn't require passing
CROSS and CC at build time, and which also doesn't have any
--embedded-libc option.

The reason is that 2.3.2, which was released in March 2016, predates
the introduction of autotools as the build system.

Therefore, I see two possibilities here:

 - You stick with 2.3.2. In this case, you should use generic-package
   and not autotools-package, because at 2.3.2, pimd is clearly not an
   autotools-package. It's not because it works by chance with the
   current autotools-package infrastructure that a future subtle change
   in the autotools-package infrastructure, which is valid for real
   autotools package, will break this non-autotools package.

 - You move to the latest Git commit, which really uses an autotools
   based build system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
