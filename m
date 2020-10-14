From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 21:26:16 +0200
Subject: [Buildroot] [PATCH v3] package/freeradius-server: new package
In-Reply-To: <20201014170254.6184-1-dgouarin@gmail.com>
References: <20201013195125.6401-1-dgouarin@gmail.com>
 <20201014170254.6184-1-dgouarin@gmail.com>
Message-ID: <20201014212616.797a2dec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Wed, 14 Oct 2020 19:02:54 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> FreeRADIUS is an open source server which implements
> a protocol for remote user Authorization, Authentication
> and Accounting.

Thanks for this contribution. First of all, it would be good to not
send a v3 of freeradius-server alone: always send the entire series.
Otherwise, we can't keep track of the fact that this patch requires
libtalloc.

> Changes v1 -> v2:
>   fix invalid characters in Config.in
> 
> Changes v2 -> v3:
>   As suggested by Matt, merge with pending upstream patch. Included most of it,
>   including patches based on Yocto work :
>   http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
>   Didn't kept all the --without directive, as they do not seem useful, nor
>   the custom INSTALL_TARGET_CMDS.

Changes should go...

> 
> Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> ---

... here.


> diff --git a/package/freeradius-server/0001-host-jlibtool.patch b/package/freeradius-server/0001-host-jlibtool.patch
> new file mode 100644
> index 0000000000..18cebcb4e5
> --- /dev/null
> +++ b/package/freeradius-server/0001-host-jlibtool.patch
> @@ -0,0 +1,17 @@
> +jlibtool.c: while cross compiling, use host CC instead of target CC to build jlibtool
> +
> +Signed-off-by: David Gouarin <dgouarin@gmail.com>

This the upstream project is hosted in Git, we want patches to be
formatted using "git format-patch -N".

> diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
> new file mode 100644
> index 0000000000..456e05a5a9
> --- /dev/null
> +++ b/package/freeradius-server/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_FREERADIUS_SERVER
> +	bool "freeradius-server"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH

Why? We cannot merge packages that don't work with
BR2_COMPILER_PARANOID_UNSAFE_PATH.

> diff --git a/package/freeradius-server/freeradius-server-config.cache b/package/freeradius-server/freeradius-server-config.cache
> new file mode 100644
> index 0000000000..d554b9a9aa
> --- /dev/null
> +++ b/package/freeradius-server/freeradius-server-config.cache
> @@ -0,0 +1,4 @@
> +ax_cv_cc_bounded_attribute=no
> +ax_cv_cc_builtin_bswap64=no
> +ax_cv_cc_builtin_choose_expr=no
> +ax_cv_cc_builtin_types_compatible_p=no

You should not use a cache file, but instead pass those variables in
FREERADIUS_SERVER_CONF_ENV.

> diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
> new file mode 100644
> index 0000000000..a1678b6809
> --- /dev/null
> +++ b/package/freeradius-server/freeradius-server.hash
> @@ -0,0 +1,8 @@
> +# Locally computed
> +sha256  2bf914d471d4409fd72e708e308fa32ca8d01d698c518497a1d4b867d50132ae  freeradius-server-3.0.21.tar.gz
> +sha256  8b9cc1e5d41938be45a368f126a6d1fda03d60a3d622dc75e776be4e90c2d2c6  COPYRIGHT
> +sha256  bf25b952f9f92d0fd0e9da3b61fd60e2bbbe4d5971650238151c8d7420780931  freeradius-avoid-searching-host-dirs.patch
> +sha256  11441c8016fac480b16d160098c25caec6f5031ebc1310b6e523f90b6e27deb5  freeradius-configure.ac-add-option-for-libcap.patch
> +sha256  fe429bf21a1b2f2b6648281ec30599ce1cee6b65aa5089e2cea0dfa89f63f64d  freeradius-configure.ac-allow-cross-compilation.patch
> +sha256  9c19e94062b5dd8150b374a9698230db7fce1132c3c1d801f0370c578107159f  freeradius-fix-error-for-expansion-of-macro.patch
> +

Empty new line at end of file.


> +FREERADIUS_SERVER_VERSION = 3.0.21
> +FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
> +FREERADIUS_SERVER_LICENSE = GPL-2.0
> +FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
> +
> +FREERADIUS_SERVER_PATCH = \
> +	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch \
> +	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch \
> +	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch \
> +	http://cgit.openembedded.org/meta-openembedded/plain/meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch

I am not sure it's a good idea to download those patches: there is
nothing in these URLs that indicate that they will be stable. So I
would prefer if those patches were imported in
package/freeradius-server/. When you do so, please make sure to add
your own Signed-off-by in each of the patch, below the existing
Signed-off-by.

> +
> +FREERADIUS_SERVER_DEPENDENCIES = libtalloc
> +
> +# --cache-file= : some compiler checks are not supported while cross compiling.
> +#   instead of removing those checks, we use a config.cache file
> +FREERADIUS_SERVER_CONF_OPTS += \
> +	--cache-file=freeradius-server-config.cache

As said above: use <pkg>_CONF_ENV.


> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python --with-rlm-python-bin=$(HOST_DIR)/bin/python --with-rlm-python-include-dir=$(STAGING_INCDIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR) --with-rlm_perl

STAGING_INCDIR doesn't exist in Buildroot.

And PYTHON_PYQT5_PYTHON_DIR is completely unrelated, it shouldn't be
used here. Also, pointing an "include dir" option to a library folder
seems dubious.

Finally, having --with-rlm_perl in an option enabling Python support
looks weird.

Note: if you're not using all those optional features, don't support
them: keep an unconditional --without-<foo>, that's perfectly
acceptable.

> +define FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
> +	$(INSTALL) -m 0644 package/freeradius-server/freeradius-server-config.cache $(@D)/freeradius-server-config.cache
> +endef
> +FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_CACHE_FOR_CROSS_COMPILE
> +
> +FREERADIUS_SERVER_MAKE_ENV = R=$(TARGET_DIR) TARGET_DIR=""

What is this doing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
