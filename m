From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 17:28:08 +0200
Subject: [Buildroot] [Patch v3 2/2] rust: new package
In-Reply-To: <1468533676-10894-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468533676-10894-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <04ff8891-64d4-a0d5-f7de-6f36cbb18e9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-07-16 00:01, Eric Le Bihan wrote:
> This new package provides the compiler for the Rust programming language.
> 
> Currently, only the host variant is built.

 Since we don't have any package (yet) that uses rust, it is never going to be
built. This is annoying. However, we were thinking that maybe this (and go)
should get user-visible Config.in options. They are really cross-compilers
(although in a much simpler way than gcc), so it is really part of buildroot's
mission to offer these to users even without packages that use them. Fortran is
another example of this.

 There is a bit of doubt of whether this should go in the "Host tools" menu or
in the "toolchain" menu. We're thinking that the toolchain menu is plenty
confusing as it is, so just add it to host tools.


> The internal build process is as follows:
> 
>  1. rustc-stage0, provided by rust-bootstrap, is used to build
>     rustc-stage1.
>  2. rust-stage1 builds the final Rust compiler (rust-stage2)
>     and the standard library for the host architecture.
>  3. the standard library for the target architecture is build.
> 
> The Rust compiler uses LLVM as its backend, compiled with support for
> x86, ARM, PowerPC and MIPS architectures.

 I guess it uses a bundled LLVM? Would it be possible to unbundle that at some
point?

> 
> To properly build the standard library for the target, two files are
> needed:
> 
>  - the target configuration: a Makefile fragment telling the build system
>    about the cross-compiler and such.
>  - the target specification: a JSON file describing the target
>    architecture to the LLVM backend.
> 
> These files are generated with a Python script which takes info from the
> Buildroot configuration: `rust-target-gen`.

 This bit we really don't like. First of all there is the issue that it's a lot
of code. Second, we don't like it when a python script is required for the build.

 I'm trying to understand what it does, and as far as I can see it does two things:

0. Find a "similar target", which is basically the output of
   ls $(@D)/mk/cfg/$(ARCH)-*-linux-$(LIBC)$(ABI)

1. Generate the target .mk file, which is basically updating an existing one
with something very similar to KCONFIG_SET_OPT. I.e. a sed and an echo.

2. Generate the target .spec file, which parses the SPEC_DATABASE_CONTENTS,
finds the line corresponding to the $(ARCH) and $(LIBC)$(ABI) combination, gets
the options to fill in from that, and substitutes them in the template json file.

 IMHO all of the above can easily be done directly in the .mk file. I'd normally
ask to offload things into a shell script, but here it is really trivial. The
SPEC_DATABASE_CONTENTS should be expanded into a set of ifeq's that set some
variables, and then those variables should be used in a sed call to create the
.json file from a template .json.in file


> When compiling Rust code with this compiler, the generated program only
> depends on the target C library, as it is statically linked to the Rust
> standard library.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in.host                             |   1 +
>  ...monize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch |  53 ++++
>  .../0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch |  73 +++++
>  ...eclaration-in-mipsel-unknown-linux-gnu.mk.patch |  26 ++

 What's the upstream status?

>  package/rust/Config.in.host                        |  14 +
>  package/rust/rust-target-gen                       | 315 +++++++++++++++++++++
>  package/rust/rust.hash                             |   2 +
>  package/rust/rust.mk                               |  67 +++++
>  8 files changed, 551 insertions(+)
>  create mode 100644 package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
>  create mode 100644 package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
>  create mode 100644 package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
>  create mode 100644 package/rust/Config.in.host
>  create mode 100755 package/rust/rust-target-gen
>  create mode 100644 package/rust/rust.hash
>  create mode 100644 package/rust/rust.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 6d61f19..e21b02e 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -32,6 +32,7 @@ menu "Host utilities"
>  	source "package/patchelf/Config.in.host"
>  	source "package/pwgen/Config.in.host"
>  	source "package/qemu/Config.in.host"
> +	source "package/rust/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
>  	source "package/squashfs/Config.in.host"
>  	source "package/sunxi-tools/Config.in.host"
> diff --git a/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch b/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
> new file mode 100644
> index 0000000..6c09495
> --- /dev/null
> +++ b/package/rust/0001-Harmonize-use-of-CROSS_PREFIX_-in-mk-cfg-.mk.patch
> @@ -0,0 +1,53 @@
> +From 23d9dbfb3ad4a8d5d5997738e8b1436d076898e9 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Tue, 19 Apr 2016 10:49:20 +0200
> +Subject: [PATCH 1/3] Harmonize use of CROSS_PREFIX_* in mk/cfg/*.mk
> +
> +Use CROSS_PREFIX_ in Makefile fragments for cross-compiling on Linux
> +wherever possible.
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + mk/cfg/mips-unknown-linux-gnu.mk   | 9 +++++----
> + mk/cfg/mipsel-unknown-linux-gnu.mk | 9 +++++----
> + 2 files changed, 10 insertions(+), 8 deletions(-)
> +
> +diff --git a/mk/cfg/mips-unknown-linux-gnu.mk b/mk/cfg/mips-unknown-linux-gnu.mk
> +index 65b0877..0fe95de 100644
> +--- a/mk/cfg/mips-unknown-linux-gnu.mk
> ++++ b/mk/cfg/mips-unknown-linux-gnu.mk
> +@@ -1,8 +1,9 @@
> + # mips-unknown-linux-gnu configuration
> +-CC_mips-unknown-linux-gnu=mips-linux-gnu-gcc
> +-CXX_mips-unknown-linux-gnu=mips-linux-gnu-g++
> +-CPP_mips-unknown-linux-gnu=mips-linux-gnu-gcc -E
> +-AR_mips-unknown-linux-gnu=mips-linux-gnu-ar
> ++CROSS_PREFIX_mips-unknown-linux-gnu=mips-linux-gnu-
> ++CC_mips-unknown-linux-gnu=gcc
> ++CXX_mips-unknown-linux-gnu=g++
> ++CPP_mips-unknown-linux-gnu=gcc -E
> ++AR_mips-unknown-linux-gnu=ar
> + CFG_LIB_NAME_mips-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_mips-unknown-linux-gnu=lib$(1).a
> + CFG_LIB_GLOB_mips-unknown-linux-gnu=lib$(1)-*.so
> +diff --git a/mk/cfg/mipsel-unknown-linux-gnu.mk b/mk/cfg/mipsel-unknown-linux-gnu.mk
> +index 4dadfc2..9340c46 100644
> +--- a/mk/cfg/mipsel-unknown-linux-gnu.mk
> ++++ b/mk/cfg/mipsel-unknown-linux-gnu.mk
> +@@ -1,8 +1,9 @@
> + # mipsel-unknown-linux-gnu configuration
> +-CC_mipsel-unknown-linux-gnu=mipsel-linux-gnu-gcc
> +-CXX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-g++
> +-CPP_mipsel-unknown-linux-gnu=mipsel-linux-gnu-gcc
> +-AR_mipsel-unknown-linux-gnu=mipsel-linux-gnu-ar
> ++CROSS_PREFIX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-
> ++CC_mipsel-unknown-linux-gnu=gcc
> ++CXX_mipsel-unknown-linux-gnu=g++
> ++CPP_mipsel-unknown-linux-gnu=gcc
> ++AR_mipsel-unknown-linux-gnu=ar
> + CFG_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).a
> + CFG_LIB_GLOB_mipsel-unknown-linux-gnu=lib$(1)-*.so
> +--
> +2.1.4
> +
> diff --git a/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch b/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
> new file mode 100644
> index 0000000..c694c39
> --- /dev/null
> +++ b/package/rust/0002-Expand-CC-to-gcc-in-x86-mk-cfg-.cfg.patch
> @@ -0,0 +1,73 @@
> +From a371eb06fef803dcf9894fa0ad6941341887d2d8 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Tue, 19 Apr 2016 12:51:29 +0200
> +Subject: [PATCH 2/3] Expand $(CC) to gcc in x86 mk/cfg/*.cfg
> +
> +Expand $(CC) and friends to gcc and introduce empty CROSS_PREFIX_ in
> +Makefile fragments for cross-compilation of i586, i686 and x86_64 Linux
> +platforms to allow use of Sourcery CodeBench toolchains.
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + mk/cfg/i586-unknown-linux-gnu.mk   | 9 +++++----
> + mk/cfg/i686-unknown-linux-gnu.mk   | 9 +++++----
> + mk/cfg/x86_64-unknown-linux-gnu.mk | 9 +++++----
> + 3 files changed, 15 insertions(+), 12 deletions(-)
> +
> +diff --git a/mk/cfg/i586-unknown-linux-gnu.mk b/mk/cfg/i586-unknown-linux-gnu.mk
> +index 0609f36..45af3b8 100644
> +--- a/mk/cfg/i586-unknown-linux-gnu.mk
> ++++ b/mk/cfg/i586-unknown-linux-gnu.mk
> +@@ -1,8 +1,9 @@
> + # i586-unknown-linux-gnu configuration
> +-CC_i586-unknown-linux-gnu=$(CC)

 I guess this makes it unupstreamable, because this will break support for
clang, no?

> +-CXX_i586-unknown-linux-gnu=$(CXX)
> +-CPP_i586-unknown-linux-gnu=$(CPP)
> +-AR_i586-unknown-linux-gnu=$(AR)
> ++CROSS_PREFIX_i686-unknown-linux-gnu=
                  ^5

> ++CC_i586-unknown-linux-gnu=gcc
> ++CXX_i586-unknown-linux-gnu=g++
> ++CPP_i586-unknown-linux-gnu=gcc -E
> ++AR_i586-unknown-linux-gnu=ar
> + CFG_LIB_NAME_i586-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_i586-unknown-linux-gnu=lib$(1).a
> + CFG_LIB_GLOB_i586-unknown-linux-gnu=lib$(1)-*.so
> +diff --git a/mk/cfg/i686-unknown-linux-gnu.mk b/mk/cfg/i686-unknown-linux-gnu.mk
> +index 88c0907..aa4ce42 100644
> +--- a/mk/cfg/i686-unknown-linux-gnu.mk
> ++++ b/mk/cfg/i686-unknown-linux-gnu.mk
> +@@ -1,8 +1,9 @@
> + # i686-unknown-linux-gnu configuration
> +-CC_i686-unknown-linux-gnu=$(CC)
> +-CXX_i686-unknown-linux-gnu=$(CXX)
> +-CPP_i686-unknown-linux-gnu=$(CPP)
> +-AR_i686-unknown-linux-gnu=$(AR)
> ++CROSS_PREFIX_i686-unknown-linux-gnu=
> ++CC_i686-unknown-linux-gnu=gcc
> ++CXX_i686-unknown-linux-gnu=g++
> ++CPP_i686-unknown-linux-gnu=gcc -E
> ++AR_i686-unknown-linux-gnu=ar
> + CFG_LIB_NAME_i686-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_i686-unknown-linux-gnu=lib$(1).a
> + CFG_LIB_GLOB_i686-unknown-linux-gnu=lib$(1)-*.so
> +diff --git a/mk/cfg/x86_64-unknown-linux-gnu.mk b/mk/cfg/x86_64-unknown-linux-gnu.mk
> +index 044c687..bdd88cd 100644
> +--- a/mk/cfg/x86_64-unknown-linux-gnu.mk
> ++++ b/mk/cfg/x86_64-unknown-linux-gnu.mk
> +@@ -1,8 +1,9 @@
> + # x86_64-unknown-linux-gnu configuration
> +-CC_x86_64-unknown-linux-gnu=$(CC)
> +-CXX_x86_64-unknown-linux-gnu=$(CXX)
> +-CPP_x86_64-unknown-linux-gnu=$(CPP)
> +-AR_x86_64-unknown-linux-gnu=$(AR)
> ++CROSS_PREFIX_x86_64-unknown-linux-gnu=
> ++CC_x86_64-unknown-linux-gnu=gcc
> ++CXX_x86_64-unknown-linux-gnu=g++
> ++CPP_x86_64-unknown-linux-gnu=gcc -E
> ++AR_x86_64-unknown-linux-gnu=ar
> + CFG_LIB_NAME_x86_64-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_x86_64-unknown-linux-gnu=lib$(1).a
> + CFG_LIB_GLOB_x86_64-unknown-linux-gnu=lib$(1)-*.so
> +--
> +2.1.4
> +
> diff --git a/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch b/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
> new file mode 100644
> index 0000000..00d338f
> --- /dev/null
> +++ b/package/rust/0003-Fix-CPP-declaration-in-mipsel-unknown-linux-gnu.mk.patch
> @@ -0,0 +1,26 @@
> +From f6d8c8f6dcdbabead3a06ed8f592143afaad16ba Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Tue, 19 Apr 2016 12:57:24 +0200
> +Subject: [PATCH 3/3] Fix CPP declaration in mipsel-unknown-linux-gnu.mk
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + mk/cfg/mipsel-unknown-linux-gnu.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mk/cfg/mipsel-unknown-linux-gnu.mk b/mk/cfg/mipsel-unknown-linux-gnu.mk
> +index 9340c46..aaa18c2 100644
> +--- a/mk/cfg/mipsel-unknown-linux-gnu.mk
> ++++ b/mk/cfg/mipsel-unknown-linux-gnu.mk
> +@@ -2,7 +2,7 @@
> + CROSS_PREFIX_mipsel-unknown-linux-gnu=mipsel-linux-gnu-
> + CC_mipsel-unknown-linux-gnu=gcc
> + CXX_mipsel-unknown-linux-gnu=g++
> +-CPP_mipsel-unknown-linux-gnu=gcc
> ++CPP_mipsel-unknown-linux-gnu=gcc -E
> + AR_mipsel-unknown-linux-gnu=ar
> + CFG_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).so
> + CFG_STATIC_LIB_NAME_mipsel-unknown-linux-gnu=lib$(1).a
> +--
> +2.1.4
> +
> diff --git a/package/rust/Config.in.host b/package/rust/Config.in.host
> new file mode 100644
> index 0000000..ca11d38
> --- /dev/null
> +++ b/package/rust/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_RUST_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_arm  || BR2_aarch64 || BR2_i386 \
> +		|| BR2_mips || BR2_mipsel  || BR2_x86_64
> +	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5

 So ARMV7M is OK?

 I also think it depends on !BR2_x86_i486.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
> +	# triggers ICE on trunc_int_for_mode, at explow.c:56
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
> +
> +comment "host-rust needs a toolchain w/ gcc >= 5"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_aarch64
> diff --git a/package/rust/rust-target-gen b/package/rust/rust-target-gen
[snip]
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> new file mode 100644
> index 0000000..7126d23
> --- /dev/null
> +++ b/package/rust/rust.mk
> @@ -0,0 +1,67 @@
> +################################################################################
> +#
> +# rust
> +#
> +################################################################################
> +
> +RUST_VERSION = 1.10.0
> +RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.gz
> +RUST_SITE = https://static.rust-lang.org/dist
> +RUST_LICENSE = Apache-2.0, MIT

 Can you specify which license applies to what?

> +RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +
> +HOST_RUST_DEPENDENCIES = host-rust-bootstrap host-python toolchain host-jemalloc

 We'll probably want to unbundle llvm eventually. But I'm OK with doing that
later, as part as introducing llvm support in buildroot.

> +
> +define HOST_RUST_GEN_CONF
> +	package/rust/rust-target-gen \
> +		--mode conf \
> +		--prefix=$(notdir $(TARGET_CROSS)) \
> +		--input $(@D) \
> +		--output $(@D)/mk/cfg/$(GNU_TARGET_NAME).mk \
> +		$(GNU_TARGET_NAME)
> +endef
> +
> +define HOST_RUST_GEN_SPEC
> +	package/rust/rust-target-gen \
> +		--mode spec \
> +		--input $(@D) \
> +		--output $(HOST_DIR)/etc/rustc/$(GNU_TARGET_NAME).json \

 I think it would fit more under staging dir. E.g. we put toolchainfile.cmake
under $(STAGING_DIR)/usr/share/buildroot, this one is a bit similar.

> +		$(GNU_TARGET_NAME)
> +endef
> +
> +HOST_RUST_PRE_CONFIGURE_HOOKS += \
> +	HOST_RUST_GEN_CONF \
> +	HOST_RUST_GEN_SPEC
> +
> +HOST_RUST_MAKE_ENV = RUST_TARGET_PATH=$(HOST_DIR)/etc/rustc
> +HOST_RUST_MAKE_OPTS = $(if $(VERBOSE),VERBOSE=1)
> +
> +# Though not using autotools, Rust follows the ./configure convention, in its
> +# own way...
> +define HOST_RUST_CONFIGURE_CMDS
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
> +		./configure \
> +		--target=$(GNU_TARGET_NAME) \
> +		--prefix="$(HOST_DIR)/usr" \
> +		--jemalloc-root="$(HOST_DIR)/usr/lib" \
> +		--enable-local-rust \
> +		--local-rust-root="$(HOST_RUST_BOOTSTRAP_DIR)/rustc" \
> +		--disable-docs \
> +		--disable-manage-submodules \
> +		--sysconfdir="$(HOST_DIR)/etc" \
> +		--localstatedir="$(HOST_DIR)/var/lib" \
> +		--datadir="$(HOST_DIR)/usr/share" \
> +		--infodir="$(HOST_DIR)/usr/share/info")

 Could we conditionally add --enable-ccache (and pass CCACHE=...) ?


 Regards,
 Arnout

> +endef
> +
> +define HOST_RUST_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) $(MAKE) \
> +		$(HOST_RUST_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define HOST_RUST_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) $(MAKE) \
> +		$(HOST_RUST_MAKE_OPTS) -C $(@D) install
> +endef
> +
> +$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
