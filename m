From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:47:52 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
Message-ID: <20161030164752.GA18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-10-29 14:08 +0200, Romain Naour spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds a new package for the Analog Devices external
> toolchain for the Blackfin architecture. As of this commit, the code
> is currently not used, but it will be used as soon as the external
> toolchain infrastructure gets introduced in a future commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-blackfin-uclinux/Config.in  | 17 ++++++++++
>  .../Config.in.options                              |  6 ++++
>  .../toolchain-external-blackfin-uclinux.hash       |  3 ++
>  .../toolchain-external-blackfin-uclinux.mk         | 36 ++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
> new file mode 100644
> index 0000000..8b299e8
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
> +	bool "Blackfin.uclinux.org 2014R1"
> +	depends on BR2_bfin
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_USE_WCHAR
> +	select BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	help
> +	  Toolchain for the Blackfin architecture, from
> +	  http://blackfin.uclinux.org.
> diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
> new file mode 100644
> index 0000000..a13cbba
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
> @@ -0,0 +1,6 @@
> +if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
> +
> +config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> +	default "toolchain-external-blackfin-uclinux"

This make-it-a-provider-of-a-not-yet-existing-virtual-pakage makes me
really chill... :-/

But see [*] below...

> +endif
> diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
> new file mode 100644
> index 0000000..b320d94
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
> +sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> new file mode 100644
> index 0000000..0c3eb9b
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# toolchain-external-blackfin-uclinux
> +#
> +################################################################################
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION = 2014R1-RC2
> +
> +ifeq ($(BR2_BINFMT_FLAT),y)
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-uclinux
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_PREFIX = bfin-uclinux
> +else
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-linux-uclibc
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_PREFIX = bfin-linux-uclibc
> +endif
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR = $(firstword $(subst -, ,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)))
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SITE = http://downloads.sourceforge.net/project/adi-toolchain/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)/i386
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SOURCE = blackfin-toolchain-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_STRIP_COMPONENTS = 3
> +
> +# Special handling for Blackfin toolchain, because of the split in two
> +# tarballs, and the organization of tarball contents. The tarballs
> +# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> +# which themselves contain the toolchain. This is why we strip more
> +# components than usual.
> +define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
> +	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS) | \
> +		$(TAR) --strip-components=3 -C $(@D) $(TAR_OPTIONS) -
> +endef
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
> +
> +$(eval $(toolchain-external-package))

[*] Ditto: this use-a-not-yet-existing-infra is not nice.

I think you could very well:

 1- introduce an empty infra that does nothing at all, except it does
    exist;

 2- introduce the virtual package. It would not kick any dependency
    until much later, but it would exist.

 3- add the per pre-built toolchain packages liek you did

 4- implement the new infra

 5- turn toolchain/toolchain-external/toolchain-external.mk from a
    generic package to a virtual package

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
