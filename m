From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 14:40:10 +0100
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
Message-ID: <55F6CE3A.8000108@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

more comments:

On 09/14/2015 11:21 AM, Chris Packham wrote:
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> new file mode 100644
> index 0000000..9b5e7d2
> --- /dev/null
> +++ b/package/micropython/micropython.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +# micropython
> +################################################################################
> +MICROPYTHON_VERSION = v1.4.5
> +MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
> +MICROPYTHON_LICENSE = MIT
> +MICROPYTHON_LICENSE_FILES = LICENSE
> +MICROPYTHON_DEPENDENCIES = libffi

micropython calls pkg-config in order to obtain the libraries and cflags
for libffi:

ifeq ($(MICROPY_PY_FFI),1)
LIBFFI_LDFLAGS_MOD := $(shell pkg-config --libs libffi)
LIBFFI_CFLAGS_MOD := $(shell pkg-config --cflags libffi)
CFLAGS_MOD += $(LIBFFI_CFLAGS_MOD) -DMICROPY_PY_FFI=1

So please, add host-pkgconf to MICROPYTHON_DEPENDENCIES. Otherwise it
will fail to compile with an error like this one:

LINK micropython
build/modffi.o: In function `ffifunc_call':
modffi.c:(.text+0x24c): undefined reference to `ffi_call'
modffi.c:(.text+0x260): undefined reference to `ffi_call'
build/modffi.o: In function `mod_ffi_callback':
modffi.c:(.text+0x7b0): undefined reference to `ffi_closure_alloc'
... and many more

> +
> +ifeq ($(BR2_powerpc),y)
> +MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
> +endif
> +
> +define MICROPYTHON_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D)/unix \

Please add $(TARGET_MAKE_ENV) before $(MAKE). You need that in order to
Buildroot set the PATH variable so the pkg-config executable and the
libffi.pc file can be found.

Regards,

Vincent.

> +		CROSS_COMPILE=$(TARGET_CROSS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
> +		install
> +endef
> +
> +$(eval $(generic-package))
> 
