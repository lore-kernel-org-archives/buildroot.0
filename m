From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:35:13 +0200
Subject: [Buildroot] [PATCH] package/systemtap: new package
In-Reply-To: <20200609231257.275131-1-ralphs@netwinder.org>
References: <20200609231257.275131-1-ralphs@netwinder.org>
Message-ID: <20200912143513.6cd2a98e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ralph,

Thanks a lot for posting this! I think it would be useful to have
systemtap support in Buildroot.

On Tue,  9 Jun 2020 19:12:57 -0400
Ralph Siemsen <ralphs@netwinder.org> wrote:

> SystemTap provides a simple command line interface and scripting
> language for writing instrumentation for a live running kernel plus
> user-space applications.
> 
> This is a minimal implementation; not all supported features of
> systemtap are enabled.

We need your Signed-off-by line on the patch, otherwise we can't apply
it.

>  package/Config.in              |  1 +
>  package/systemtap/Config.in    | 10 ++++++++++
>  package/systemtap/systemtap.mk | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 43 insertions(+)

We will need an entry in the DEVELOPERS file for this new package.

> diff --git a/package/systemtap/Config.in b/package/systemtap/Config.in
> new file mode 100644
> index 0000000000..9194b86caf
> --- /dev/null
> +++ b/package/systemtap/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SYSTEMTAP
> +	bool "systemtap"
> +	select BR2_PACKAGE_ELFUTILS # -ldw
> +	select BR2_PACKAGE_PYTHON3

When you "select" options, you need to replicate the "depends on" of
the options you're selecting. So in this case, you would need:

	depends on !BR2_PACKAGE_PYTHON # python3
	depends on BR2_USE_WCHAR # elfutils, python3
	depends on BR2_USE_MMU # python3
	depends on !BR2_STATIC_LIBS # elfutils, python3
	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

and then a Config.in comment:

comment "systemtap needs a glibc or uclibc toolchain w/ wchar, dynamic library, threads"
	depends on !BR2_PACKAGE_PYTHON
	depends on BR2_USE_MMU
	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

> diff --git a/package/systemtap/systemtap.mk b/package/systemtap/systemtap.mk
> new file mode 100644
> index 0000000000..d9228f25ca
> --- /dev/null
> +++ b/package/systemtap/systemtap.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# systemtap
> +#
> +################################################################################
> +
> +SYSTEMTAP_VERSION= release-4.2
> +SYSTEMTAP_SITE = https://sourceware.org/git/systemtap.git
> +SYSTEMTAP_SITE_METHOD = git

They have tarballs at https://sourceware.org/systemtap/ftp/releases/,
it probably makes sense to use them.

> +SYSTEMTAP_DEPENDENCIES = elfutils python3
> +
> +# Systemtap includes cpython support. To cross-compile this
> +# seems to require setting _PYTHON_SYSCONFIGDATA_NAME. The
> +# following was adapted from package/pkg-python.mk
> +
> +SYSTEMTAP_MAKE_ENV = \
> +        PATH=$(BR_PATH) \
> +        $(TARGET_CONFIGURE_OPTS) \
> +        LDSHARED="$(TARGET_CROSS)gcc -shared" \
> +        PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +        PYTHONNOUSERSITE=1 \
> +	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
> +        _python_sysroot=$(STAGING_DIR) \
> +        _python_prefix=/usr \
> +        _python_exec_prefix=/usr

I think you could directly re-use PKG_PYTHON_DISTUTILS_ENV:

SYSTEMTAP_MAKE_ENV = $(PKG_PYTHON_DISTUTILS_ENV)

We're already using PKG_PYTHON_DISTUTILS_ENV in a number of packages
(i2c-tools, libselinux, libpwquality, opencv3).

> +# Note that systemtap has additional optional dependencies,
> +# such as libvirt and xml for vir support, java support, and
> +# avahi and nss for compile server support. These are not
> +# currently handled by this build script.

Do these optional dependencies have ./configure options? If so, they
should be explicitly disabled:

SYSTEMTAP_CONF_OPTS = \
	--disable-foo \
	--disable-bar

Do you think you could rework the patch to address the above issues,
and send an updated version ?

Thanks a lot,

Thomas

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
