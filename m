From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Sep 2015 09:56:18 +0100
Subject: [Buildroot] [PATCH v4 1/2] micropython: new package
In-Reply-To: <1442446199-15963-2-git-send-email-judge.packham@gmail.com>
References: <CAFOYHZB-oynjvUKa9CkHvBpvw+kuSuPLgWrZZwEOr7YSQOvW0g@mail.gmail.com>
 <1442446199-15963-1-git-send-email-judge.packham@gmail.com>
 <1442446199-15963-2-git-send-email-judge.packham@gmail.com>
Message-ID: <55FA8032.7080809@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On 09/17/2015 12:29 AM, Chris Packham wrote:
> Micro Python is a lean and fast implementation of the Python 3
> programming language that is optimised to run on a microcontroller.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/micropython
output/target/usr/bin/micropython: ELF 32-bit MSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

One more comment below. Please scroll down.

> ---
>  package/Config.in                          |  1 +
>  package/micropython/0001-fix-version.patch | 22 ++++++++++++++++++++
>  package/micropython/Config.in              | 12 +++++++++++
>  package/micropython/micropython.mk         | 32 ++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 package/micropython/0001-fix-version.patch
>  create mode 100644 package/micropython/Config.in
>  create mode 100644 package/micropython/micropython.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fc35f12..94ac406 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -509,6 +509,7 @@ menu "Lua libraries/modules"
>  endmenu
>  endif
>  	source "package/lutok/Config.in"
> +	source "package/micropython/Config.in"
>  	source "package/moarvm/Config.in"
>  	source "package/mono/Config.in"
>  if BR2_PACKAGE_MONO
> diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
> new file mode 100644
> index 0000000..1bf2992
> --- /dev/null
> +++ b/package/micropython/0001-fix-version.patch
> @@ -0,0 +1,22 @@
> +Always use the fallback behaviour for determining the version number
> +
> +When built from within buildroot the micropython build process detects
> +that it is inside a git repository and ends up using the buildroot
> +version number instead of the correct micropython version number.
> +
> +Signed-off-by: Chris Packham <judge.packham@gmail.com>
> +---
> +diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
> +--- micropython-v1.4.5-old/py/makeversionhdr.py	2015-08-12 00:42:30.000000000 +1200
> ++++ micropython-v1.4.5/py/makeversionhdr.py	2015-09-16 10:21:06.698962836 +1200
> +@@ -70,9 +70,7 @@
> + 
> + def make_version_header(filename):
> +     # Get version info using git, with fallback to docs/conf.py
> +-    info = get_version_info_from_git()
> +-    if info is None:
> +-        info = get_version_info_from_docs_conf()
> ++    info = get_version_info_from_docs_conf()
> + 
> +     git_tag, git_hash, ver = info
> + 
> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
> new file mode 100644
> index 0000000..3ad38d6
> --- /dev/null
> +++ b/package/micropython/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_MICROPYTHON
> +	bool "micropython"
> +	select BR2_PACKAGE_LIBFFI
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Micro Python is a lean and fast implementation of the Python 3
> +	  programming language that is optimised to run on a microcontroller.
> +
> +	  http://micropython.org
> +
> +comment "micropython needs a toolchain w/ thread"

threads (in plural)

This is something the maintainer can amend for you, I guess, so you
don't need to send another patch.

Regards,

Vincent.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> new file mode 100644
> index 0000000..2d7c924
> --- /dev/null
> +++ b/package/micropython/micropython.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# micropython
> +#
> +################################################################################
> +
> +MICROPYTHON_VERSION = v1.4.5
> +MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
> +MICROPYTHON_LICENSE = MIT
> +MICROPYTHON_LICENSE_FILES = LICENSE
> +MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
> +
> +# Use fallback implementation for exception handling on architectures that don't
> +# have explicit support.
> +ifeq ($(BR2_powerpc),y)
> +MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
> +endif
> +
> +define MICROPYTHON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
> +		CROSS_COMPILE=$(TARGET_CROSS) \
> +		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
> +endef
> +
> +define MICROPYTHON_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
> +		DESTDIR=$(TARGET_DIR) \
> +		PREFIX=$(TARGET_DIR)/usr \
> +		install
> +endef
> +
> +$(eval $(generic-package))
> 
