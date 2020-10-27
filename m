From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 10:36:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/uftrace: new package
In-Reply-To: <CADjnRpL-ufVvdXuGHBXycrkMnhdM3BfKN35g=xjQxp+zwBKj1A@mail.gmail.com>
References: <CADjnRpL-ufVvdXuGHBXycrkMnhdM3BfKN35g=xjQxp+zwBKj1A@mail.gmail.com>
Message-ID: <20201027103643.01576b52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giacomo,

Thanks for your contribution! See below for a number of comments and
suggestions.

On Tue, 27 Oct 2020 00:14:14 +0100
Giacomo Longo <gabibbo97@gmail.com> wrote:

> From 57e136108b4ff900f3b7972f1f1c19a59ef9cf12 Mon Sep 17 00:00:00 2001
> From: Giacomo Longo <gabibbo97@gmail.com>
> Date: Mon, 26 Oct 2020 23:11:41 +0100
> Subject: [PATCH 1/1] package/uftrace: new package
> 
> Hello, first time trying to package something for BuildRoot and
> sending a patch via email.

Your patch should be sent using "git send-email". You can find at
https://git-send-email.io/ instructions on how to set up git send-email.

> The package is a tracing utility similar to ltrace and strace that
> allows profiling of programs and their library calls.
> 
> I have performed a run of ./utils/check-package package/uftrace/* with
> the following result:
> 
> > 78 lines processed
> > 0 warnings generated  
> 
> I have performed a run of ./utils/test-pkg -d ../test-pkg -c
> ../uftrace.config -p uftrace -a
> 
> > 45 builds, 36 skipped, 0 build failed, 0 legal-info failed  

Very good work!

> The only architectures supported upstream are aarch64, arm and x86_64/i386.
> I could not build the program without glibc so it's marked as
> requiring a glibc toolchain.

What specific issues have you encountered with other C libraries ?

> I am looking for some pointers on how to upstream my modification and
> feedback on the patch in its current state.

Read on for more comments :)

> Signed-off-by: Giacomo Longo <gabibbo97@gmail.com>
> ---
> package/Config.in | 1 +
> package/uftrace/Config.in | 41 ++++++++++++++++++++++++++++++++++++
> package/uftrace/uftrace.hash | 3 +++
> package/uftrace/uftrace.mk | 34 ++++++++++++++++++++++++++++++
> 4 files changed, 79 insertions(+)

Could you add an entry to the DEVELOPERS file for this package ?


> diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
> new file mode 100644
> index 0000000000..4912d1d8cc
> --- /dev/null
> +++ b/package/uftrace/Config.in
> @@ -0,0 +1,41 @@
> +config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
> + bool
> + default y if BR2_aarch64
> + default y if BR2_arm
> + default y if BR2_i386
> + default y if BR2_x86_64
> +
> +config BR2_PACKAGE_UFTRACE
> + bool "uftrace"
> + depends on BR2_TOOLCHAIN_USES_GLIBC
> + depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
> + depends on !BR2_STATIC_LIBS
> + select BR2_PACKAGE_ELFUTILS

When you "select" something, you must replicate its depends on. So here
you must replicate:

        depends on BR2_USE_WCHAR
        depends on BR2_TOOLCHAIN_HAS_THREADS

> + select BR2_PACKAGE_UTIL_LINUX

You just need util-linux, and none of its sub-options ? This is quite
odd, very often packages need libuuid, or libmount, etc.

> + select BR2_INSTALL_LIBSTDCPP

You cannot select this: it must be a "depends on".

> + help
> + Tool to trace and analyze execution of a program.
> +
> + https://uftrace.github.io/slide
> +
> +comment "uftrace needs a glibc toolchain w/ C++, dynamic library"
> + depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS ||
> !BR2_INSTALL_LIBSTDCPP

You need to move this comment either before the BR2_PACKAGE_UFTRACE
option, or at the end of file. Due to how kconfig works, if you have
this comment between the BR2_PACKAGE_UFTRACE option and its
sub-options, the sub-options will not properly be "indented" in
menuconfig.

Also, you need to add a:

	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS

so that the comment doesn't appear on architectures where uftrace is
anyway not available.

> +if BR2_PACKAGE_UFTRACE
> +
> +config BR2_PACKAGE_UFTRACE_LUAJIT
> + bool "luajit scripting support"
> + default n

default n is the default, so it's not needed.

> + select BR2_PACKAGE_LUAJIT

When you select, you need to replicate the "depends on" of the options
you're selecting.

> + help
> + Enable luajit scripting support
> +
> +config BR2_PACKAGE_UFTRACE_TUI
> + bool "TUI support"
> + default n

Not needed.

> + depends on BR2_USE_WCHAR

ncurses doesn't depend on wchar, unless you need
BR2_PACKAGE_NCURSES_WCHAR of course.

> + select BR2_PACKAGE_NCURSES
> + help
> + Enable TUI support

Perhaps those two sub-options are not really needed, and you could
simply enable luajit and ncurses support in the .mk file if the
appropriate packages are enabled, like this:

ifeq ($(BR2_PACKAGE_LUAJIT),y)
... enable luajit support ...
else
... disable luajit support ...
endif

> diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
> new file mode 100644
> index 0000000000..4c60962151
> --- /dev/null
> +++ b/package/uftrace/uftrace.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# uftrace
> +#
> +################################################################################
> +
> +UFTRACE_VERSION = v0.9.4
> +UFTRACE_SITE = $(call github,namhyung,uftrace,$(UFTRACE_VERSION))
> +UFTRACE_LICENSE = GPL-2.0+
> +UFTRACE_LICENSE_FILES = COPYING
> +UFTRACE_DEPENDENCIES = elfutils

You are selecting util-linux in the Config.in file, but you don't have
any build dependency on it. Since you have tested with test-pkg, it
seems like indeed util-linux is not a build dependency. Is it a runtime
dependency ? If so, for what tool ?

> +
> +ifeq ($(BR2_PACKAGE_UFTRACE_LUAJIT),y)
> +UFTRACE_DEPENDENCIES += luajit

There is no explicit ./configure option to enable/disable luajit
support ?

> +endif
> +
> +ifeq ($(BR2_PACKAGE_UFTRACE_TUI),y)
> +UFTRACE_DEPENDENCIES += ncurses

Same question here.

> +endif
> +
> +ifeq ($(BR2_aarch64),y)
> +UFTRACE_CONF_OPTS = --arch=aarch64
> +else ifeq ($(BR2_arm),y)
> +UFTRACE_CONF_OPTS = --arch=arm
> +else ifeq ($(BR2_i386),y)
> +UFTRACE_CONF_OPTS = --arch=x86
> +else ifeq ($(BR2_x86_64),y)
> +UFTRACE_CONF_OPTS = --arch=x86_64
> +endif
> +
> +UFTRACE_CONF_OPTS += --without-libpython
> +UFTRACE_CONF_OPTS += --without-capstone

We generally prefer to have the unconditional options like this before
the conditional ones, and written this way:

UFTRACE_CONF_OPTS = \
	--without-libpython \
	--without-capstone

Could you rework your patch to address those comments, and send a new
iteration, preferably with git send-email ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
