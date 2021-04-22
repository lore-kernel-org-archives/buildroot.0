From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 22:51:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/uftrace: new package
In-Reply-To: <20210408194631.313188-1-asafka7@gmail.com>
References: <20210408194631.313188-1-asafka7@gmail.com>
Message-ID: <20210422225149.25af3320@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Thu,  8 Apr 2021 22:46:31 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
> new file mode 100644
> index 0000000000..20425a9c48
> --- /dev/null
> +++ b/package/uftrace/uftrace.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# uftrace
> +#
> +################################################################################
> +
> +UFTRACE_VERSION = 0.9.4
> +UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
> +UFTRACE_LICENSE = GPL-2.0
> +UFTRACE_LICENSE_FILES = COPYING
> +
> +# uftrace always compiles a small test program to check if elfutils exists, so
> +# there's no special flag for it, we just need to make sure it's installed.
> +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> +UFTRACE_DEPENDENCIES += elfutils
> +endif

> +
> +define UFTRACE_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) ARCH=$(BR2_ARCH) $(MAKE) -C $(@D)
> +endef

Why don't you use the configure script? It is not autotools-based, but
the official build instructions suggest to use it:

    $ ./configure
    $ make
    $ sudo make install

The configure script allows to explicit disable unused feature, using
--without-<foo> options.

Could you have a look at this?

Also, the manual says that on ARM, only ARM >= v6 is supported. So this
probably means that:

config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
        bool
        default y if BR2_arm

should instead be:

	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
