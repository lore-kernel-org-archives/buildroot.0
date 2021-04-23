From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 18:25:53 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/uftrace: new package
In-Reply-To: <20210423161620.117894-1-asafka7@gmail.com>
References: <20210423161620.117894-1-asafka7@gmail.com>
Message-ID: <20210423182553.2a050892@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Fri, 23 Apr 2021 19:16:20 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The uftrace tool is to trace and analyze execution of a
> program written in C/C++.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Thanks a lot for the new iteration!

> +UFTRACE_VERSION = 0.9.4
> +UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
> +UFTRACE_LICENSE = GPL-2.0
> +UFTRACE_LICENSE_FILES = COPYING
> +
> +# uftrace always compiles a small test program to check if elfutils exists, so
> +# there's no special flag for it, we just need to make sure it's installed.
> +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> +UFTRACE_DEPENDENCIES += elfutils
> +else
> +UFTRACE_CONFIGURE_OPTS = --without-libelf

Use a += here.

> +endif
> +
> +define UFTRACE_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure \
> +		--arch=$(BR2_ARCH) \
> +		--prefix=/usr \
> +		$(UFTRACE_CONFIGURE_OPTS) \
> +		-o $(@D)/.config)

It would also make sense to pass all the other --without-<foo> options
for dependencies that we don't support for the moment.

> +endef
> +
> +define UFTRACE_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)

Is TARGET_CONFIGURE_OPTS still needed now? If configure does a proper
job, $(TARGET_MAKE_ENV) should be sufficient.

> +endef
> +
> +define UFTRACE_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

Ditto here.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
