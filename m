From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jul 2016 22:24:21 +0200
Subject: [Buildroot] [Patch v3 2/3] python-meson: new package
In-Reply-To: <1466796149-25218-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160703202421.GC3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, All,

On 2016-06-24 21:22 +0200, Eric Le Bihan spake thusly:
> This new package provides the host variant of the Meson Build System, an
> open source build system meant to be both extremely fast, and as user
> friendly as possible.

This should be named "meson", not "python-meson".

> More precisely, Meson creates configuration files for the Ninja build
> system.
> 
> Besides building Meson, it generates a cross-compilation configuration
> file ("$(HOST_DIR)/etc/meson/cross-compilation.conf") as well as a
> wrapper for QEMU ("$(HOST_DIR)/usr/bin/meson-exe-wrapper"), used to
> perform checks when cross-compiling (hence the dependency on host-qemu).

We've (briefly) discussed this patch during the summer camp, and we all
believe that this dependency on host-qemu is really ugly.

We're not very much interested in having this in Buildroot in the state
it is in this patch. Especially since (as far as I could see) you do not
provide a package that uses meson (do you plan on sending one?).

However, after looking a bit at the Meson documentation, especially
about cross-compilation, it appears that we can avoid having to ru nsuch
"target" tests.

For example (from the Meson doc itself):

    sizeof_int = 4
    sizeof_wchar_t = 4
    sizeof_void* = 4

    alignment_char = 1
    alignment_void* = 4
    alignment_double = 4

    has_function_printf = true

    c_args = ['-DCROSS=1', '-DSOMETHING=3']
    c_link_args = ['-some_link_arg']

Also, if you look (in the meson sources) at cross/ubuntu-armhf.txt:

    [binaries]
    # we could set exe_wrapper = qemu-arm-static but to test the case
    # when cross compiled binaries can't be run we don't do that
    c = '/usr/bin/arm-linux-gnueabihf-gcc'
    cpp = '/usr/bin/arm-linux-gnueabihf-g++'
    ar = '/usr/arm-linux-gnueabihf/bin/ar'
    strip = '/usr/arm-linux-gnueabihf/bin/strip'
    pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'
    
    [properties]
    root = '/usr/arm-linux-gnueabihf'
    
    has_function_printf = true
    has_function_hfkerhisadf = false
    
    [host_machine]
    system = 'linux'
    cpu_family = 'arm'
    cpu = 'armv7' # Not sure if correct.
    endian = 'little'

So, if we can feed it all the required config options, we can probably
avoid running qemu.

The basic idea is that we start with a simple such config file, which we
preseed with the obvious things. Then, as we add more packages, we can
complement that file step by step.

We'd basically have a few start-point files:
  - per architecture
  - per C library
  - optionally, a meson-basd package would generate its own blob

Those files would be concatenated to form the cross-compilation.conf.

Or so this is the overall idea.

Do you think this is an possible solution? Would mind looking into it?

Regards,
Yann E. MORIN.

> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/python-meson/cross-compilation.conf.in | 20 +++++++++++++
>  package/python-meson/meson-exe-wrapper.in      |  3 ++
>  package/python-meson/python-meson.hash         |  2 ++
>  package/python-meson/python-meson.mk           | 41 ++++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 package/python-meson/cross-compilation.conf.in
>  create mode 100755 package/python-meson/meson-exe-wrapper.in
>  create mode 100644 package/python-meson/python-meson.hash
>  create mode 100644 package/python-meson/python-meson.mk
> 
> diff --git a/package/python-meson/cross-compilation.conf.in b/package/python-meson/cross-compilation.conf.in
> new file mode 100644
> index 0000000..fc9f1dd
> --- /dev/null
> +++ b/package/python-meson/cross-compilation.conf.in
> @@ -0,0 +1,20 @@
> +# Generated file - do not edit
> +#
> +# Note that, in Meson terminology, what Buildroot calls the "host" system is the
> +# "build" system and the "target" system is called the "host" system.
> +
> +[host_machine]
> +system = 'linux'
> +cpu_family ='@TARGET_ARCH@'
> +cpu = 'generic'
> +endian = '@TARGET_ENDIAN@'
> +
> +[properties]
> +
> +[binaries]
> +c = '@TARGET_CROSS at gcc'
> +cpp = '@TARGET_CROSS at g++'
> +ar = '@TARGET_CROSS at ar'
> +strip = '@TARGET_CROSS at strip'
> +exe_wrapper = '@HOST_DIR@/usr/bin/meson-exe-wrapper'
> +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> diff --git a/package/python-meson/meson-exe-wrapper.in b/package/python-meson/meson-exe-wrapper.in
> new file mode 100755
> index 0000000..5e4415c
> --- /dev/null
> +++ b/package/python-meson/meson-exe-wrapper.in
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> + at HOST_DIR@/usr/bin/qemu- at TARGET_ARCH@ -L @TARGET_DIR@ "$@"
> diff --git a/package/python-meson/python-meson.hash b/package/python-meson/python-meson.hash
> new file mode 100644
> index 0000000..7540c45
> --- /dev/null
> +++ b/package/python-meson/python-meson.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256 372c18e40ffc3fe101f4ab48e8077f048dd774eaf4e87bbea3221908fca74835 python-meson-0.32.0.tar.gz
> diff --git a/package/python-meson/python-meson.mk b/package/python-meson/python-meson.mk
> new file mode 100644
> index 0000000..97a42e6
> --- /dev/null
> +++ b/package/python-meson/python-meson.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# python-meson
> +#
> +################################################################################
> +
> +PYTHON_MESON_VERSION = 0.32.0
> +PYTHON_MESON_SITE = $(call github,mesonbuild,meson,$(PYTHON_MESON_VERSION))
> +PYTHON_MESON_LICENSE = Apache-2.0
> +PYTHON_MESON_LICENSE_FILES = COPYING
> +PYTHON_MESON_SETUP_TYPE = setuptools
> +
> +HOST_PYTHON_MESON_DEPENDENCIES = host-qemu host-ninja
> +HOST_PYTHON_MESON_NEEDS_HOST_PYTHON = python3
> +
> +HOST_PYTHON_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')
> +
> +define HOST_PYTHON_MESON_INSTALL_CROSS_CONF
> +	$(INSTALL) -D -m 0644 package/python-meson/cross-compilation.conf.in \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
> +		-e 's;@TARGET_ARCH@;$(ARCH);g' \
> +		-e 's;@TARGET_ENDIAN@;$(HOST_PYTHON_MESON_TARGET_ENDIAN);g' \
> +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +endef
> +
> +define HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
> +	$(INSTALL) -D -m 0755 package/python-meson/meson-exe-wrapper.in \
> +		$(HOST_DIR)/usr/bin/meson-exe-wrapper
> +	$(SED) 's;@TARGET_ARCH@;$(ARCH);g' \
> +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +		-e 's;@TARGET_DIR@;$(TARGET_DIR);g' \
> +		$(HOST_DIR)/usr/bin/meson-exe-wrapper
> +endef
> +
> +HOST_PYTHON_MESON_POST_INSTALL_HOOKS += \
> +	HOST_PYTHON_MESON_INSTALL_CROSS_CONF \
> +	HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
> +
> +$(eval $(host-python-package))
> -- 
> 2.4.11
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
