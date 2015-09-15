From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Sep 2015 11:14:45 +0100
Subject: [Buildroot] [PATCHv2] micropython: new package
In-Reply-To: <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
Message-ID: <55F7EF95.30001@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham, Thomas Petazzoni (license comment),

On 09/15/2015 01:01 AM, Chris Packham wrote:
[snip]
> diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
> new file mode 100644
> index 0000000..8eb3c1f
> --- /dev/null
> +++ b/package/micropython-lib/micropython-lib.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# micropython-lib
> +#
> +################################################################################
> +MICROPYTHON_LIB_VERSION = v0.5
> +MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
> +MICROPYTHON_LIB_LICENSE = various

As Thomas suggested, improve that by listing the licenses. According to
the LICENSE file, everything is MIT unless the setup.py of each module
says something different, so I have done a quick check:

$ find micropython-lib-v0.5/ -type f -name "setup.py" -exec grep license
{} \; | sort -u
      license='MIT',
      license='Python',

So I think it would be enough by just having:

MICROPYTHON_LIB_LICENSE = Python (some modules), MIT (everything else)

Thomas, what do you think?

> +MICROPYTHON_LIB_LICENSE_FILES = LICENSE
> +
> +define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/lib/micropython install

It will not harm to add $(TARGET_MAKE_ENV) before $(MAKE) here as well.

> +endef
> +
> +$(eval $(generic-package))

[snip]

> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> new file mode 100644
> index 0000000..16dc263
> --- /dev/null
> +++ b/package/micropython/micropython.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# micropython
> +#
> +################################################################################
> +MICROPYTHON_VERSION = v1.4.5
> +MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
> +MICROPYTHON_LICENSE = MIT
> +MICROPYTHON_LICENSE_FILES = LICENSE
> +MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
> +
> +# Use fallback implementation for exception handling on architectures that
> +# don't have explicit support.

This comment, are you trying to keep the lines 80 characters long? In
that case, you can put "don't" in the first line.

Regards,

Vincent.

> +ifeq ($(BR2_powerpc),y)
> +MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
> +endif
> +
> +define MICROPYTHON_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
> +		CROSS_COMPILE=$(TARGET_CROSS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		PREFIX=$(TARGET_DIR)/usr \
> +		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
> +		install
> +endef
> +
> +$(eval $(generic-package))
> 
