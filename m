From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 10:18:44 +0100
Subject: [Buildroot] [PATCH 2/3] libargon2: add new package
In-Reply-To: <20191108082112.5541-2-p.debruijn@unilogic.nl>
References: <20191108082112.5541-1-p.debruijn@unilogic.nl>
 <20191108082112.5541-2-p.debruijn@unilogic.nl>
Message-ID: <20191108101844.4107ab18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Fri,  8 Nov 2019 09:21:11 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> ---

We need your Signed-off-by.

>  package/Config.in                             |  1 +
>  ...argon2-dont-fail-on-existing-symlink.patch | 12 +++++++
>  .../0002-libargon2-fix-cross-compile.patch    | 34 +++++++++++++++++++
>  package/libargon2/Config.in                   |  6 ++++
>  package/libargon2/libargon2.hash              |  3 ++
>  package/libargon2/libargon2.mk                | 25 ++++++++++++++
>  6 files changed, 81 insertions(+)

Could you add an entry in the DEVELOPERS file for this new package ?

> diff --git a/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch b/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
> new file mode 100644
> index 0000000000..1a65486554
> --- /dev/null
> +++ b/package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
> @@ -0,0 +1,12 @@
> +diff -Nurpd a/Makefile b/Makefile
> +--- a/Makefile	2017-12-27 20:56:31.000000000 +0100
> ++++ b/Makefile	2019-11-07 09:52:49.554284682 +0100
> +@@ -176,7 +176,7 @@ install: $(RUN) libs
> + 	$(INSTALL) -d $(INST_LIBRARY)
> + 	$(INSTALL) $(LIBRARIES) $(INST_LIBRARY)
> + ifdef LINKED_LIB_SH
> +-	cd $(INST_LIBRARY) && ln -s $(notdir $(LIB_SH) $(LINKED_LIB_SH))
> ++	cd $(INST_LIBRARY) && ln -sf $(notdir $(LIB_SH) $(LINKED_LIB_SH))
> + endif
> + 	$(INSTALL) -d $(INST_BINARY)
> + 	$(INSTALL) $(RUN) $(INST_BINARY)

Since the project is maintained with Git, please use patches generated
with "git format-patch", with a proper commit log and Signed-off-by.

Also, make sure to submit this patch to the upstream project.

> diff --git a/package/libargon2/0002-libargon2-fix-cross-compile.patch b/package/libargon2/0002-libargon2-fix-cross-compile.patch
> new file mode 100644
> index 0000000000..b50b8ddb52
> --- /dev/null
> +++ b/package/libargon2/0002-libargon2-fix-cross-compile.patch
> @@ -0,0 +1,34 @@
> +From cd1c1d8d204e4ec4557e358013567c097cb70562 Mon Sep 17 00:00:00 2001
> +From: Vika <kisik21@fireburn.ru>
> +Date: Mon, 26 Aug 2019 14:05:22 +0300
> +Subject: [PATCH] Fix cross-compilation on some systems
> +
> +Some Linux distributions (e.g. NixOS, where this issue was spotted) don't provide an unprefixed ar when cross-compiling. This PR aims to fix this.
> +
> +See[NixOS/nixpkgs#67490](https://github.com/NixOS/nixpkgs/pull/67490) for information on where did it start.

Please add your Signed-off-by here.

> +---
> + Makefile | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 837e7f7..38f16fc 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -123,6 +123,8 @@ ifdef LINKED_LIB_EXT
> + LINKED_LIB_SH := lib$(LIB_NAME).$(LINKED_LIB_EXT)
> + endif
> + 
> ++# Some systems don't provide an unprefixed ar when cross-compiling.
> ++AR=ar
> + 
> + LIBRARIES = $(LIB_SH) $(LIB_ST)
> + HEADERS = include/argon2.h
> +@@ -182,7 +184,7 @@ $(LIB_SH): 	$(SRC)
> + 		$(CC) $(CFLAGS) $(LIB_CFLAGS) $(LDFLAGS) $(SO_LDFLAGS) $^ -o $@
> + 
> + $(LIB_ST): 	$(OBJ)
> +-		ar rcs $@ $^
> ++		$(AR) rcs $@ $^
> + 
> + .PHONY: clean
> + clean:
> diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
> new file mode 100644
> index 0000000000..1f9a5f435f
> --- /dev/null
> +++ b/package/libargon2/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBARGON2
> +	bool "libargon2"

No dependencies on toolchain features? Could you test this package with
./utils/test-pkg, just to make sure it builds in most configurations ?

> +	help
> +	  A modern pass hashing algorithm
> +
> +	  https://password-hashing.net/#argon2
> diff --git a/package/libargon2/libargon2.hash b/package/libargon2/libargon2.hash
> new file mode 100644
> index 0000000000..43fdb5467b
> --- /dev/null
> +++ b/package/libargon2/libargon2.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 eaea0172c1f4ee4550d1b6c9ce01aab8d1ab66b4207776aa67991eb5872fdcd8  libargon2-20171227.tar.gz

Please add a hash for the license file.

> +
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> new file mode 100644
> index 0000000000..204af49148
> --- /dev/null
> +++ b/package/libargon2/libargon2.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# libargon2
> +#
> +################################################################################
> +
> +LIBARGON2_VERSION = 20171227		# 20190702 is not recognized by php7.3
> +LIBARGON2_SITE = $(call github,P-H-C,phc-winner-argon2,$(LIBARGON2_VERSION))
> +LIBARGON2_LICENSE = CC0
> +LIBARGON2_LICENSE_FILES = LICENSE
> +LIBARGON2_INSTALL_STAGING = YES
> +
> +define LIBARGON2_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) OPTTARGET=$(GCC_TARGET_ARCH)

Could you give some details about the values expected for OPTTARGET ?
Indeed, GCC_TARGET_ARCH only has a value on MIPS, NDS32, x86 and
RISC-V. On all other architectures, it is empty as far as I can see. So
I am really not sure GCC_TARGET_ARCH is what you want here.

> +define LIBARGON2_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBARGON2_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef

In all these commands, I suppose you have used $(MAKE1) because you
faced some parallel build issues with this package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
