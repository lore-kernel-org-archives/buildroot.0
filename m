From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 17:08:11 +0200
Subject: [Buildroot] [PATCH 1/1] introduce nwipe package [r2]
In-Reply-To: <1444857745-16506-1-git-send-email-chaduffy@cisco.com>
References: <1444857745-16506-1-git-send-email-chaduffy@cisco.com>
Message-ID: <20151016170811.596ee987@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles,

On Wed, 14 Oct 2015 16:22:25 -0500, Charles Duffy wrote:
> From: Charles Duffy <charles@dyfis.net>
> 
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>

Thanks for this new version. For new version, it is customary to change
the title of the patch this way:

	[PATCH v2] ....

To do this, use:

	git format-patch --subject-prefix="PATCH v2"

> ---

Also, we generally try to put a changelog here, that describes what
changed since v1. See also
http://buildroot.org/downloads/manual/manual.html#submitting-patches.

Finally, the title of your commit should ideally be:

	nwipe: new package

that's kind of our convention for new packages, and generally our
commit titles are always:

	<package>: <description>

> diff --git a/package/nwipe/0001-parted-use-autoconf-module.patch b/package/nwipe/0001-parted-use-autoconf-module.patch
> new file mode 100644
> index 0000000..b78cf95
> --- /dev/null
> +++ b/package/nwipe/0001-parted-use-autoconf-module.patch

All patches should have a description + Signed-off-by. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> + # Checks for header files.
> +--- nwipe-0.17.orig/src/Makefile.am	2014-10-19 14:49:22.000000000 -0500
> ++++ nwipe-0.17/src/Makefile.am	2015-10-14 16:06:34.763419154 -0500
> +@@ -7,3 +7,5 @@
> + # the previous manual Makefile
> + bin_PROGRAMS = nwipe
> + nwipe_SOURCES = context.h isaac_rand.c logging.h options.h prng.h nwipe.c gui.c isaac_rand.h method.h pass.c device.c gui.h isaac_standard.h mt19937ar-cok.c nwipe.h mt19937ar-cok.h pass.h device.h logging.c method.c options.c prng.c version.c version.h
> ++nwipe_CFLAGS = ${PARTED_CFLAGS}
> ++nwipe_LDADD = ${PARTED_LIBS}

Using $(...) instead of ${...} is more common in Makefiles.

> diff --git a/package/nwipe/0002-use-off64t_not_lofft.patch b/package/nwipe/0002-use-off64t_not_lofft.patch
> new file mode 100644
> index 0000000..3c4c7a3
> --- /dev/null
> +++ b/package/nwipe/0002-use-off64t_not_lofft.patch

Please also add a description + Signed-off-by here.

Did you get the change to submit those patches to the upstream nwipe
project?


> diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
> new file mode 100644
> index 0000000..7c13f30
> --- /dev/null
> +++ b/package/nwipe/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NWIPE
> +	bool "nwipe"
> +	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_PARTED

When you select a package, you need to replicate the dependencies of
this package into your package (yes it's silly, but that's how the
kconfig stuff works). So since parted depends on wchar support, you
need to:

	depends on BR2_USE_WCHAR # parted

> +	help
> +	  nwipe thoroughly overwrites block devices, forked from a component at
> +	  the core of the venerable DBAN.
> +	
> +	  https://github.com/martijnvanbrummelen/nwipe

And here add:

comment "nwipe needs a toolchain w/ wchar"
	depends on BR2_USE_MMU
	depends on !BR2_USE_WCHAR

> diff --git a/package/nwipe/nwipe.mk b/package/nwipe/nwipe.mk
> new file mode 100644
> index 0000000..58f560f
> --- /dev/null
> +++ b/package/nwipe/nwipe.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# nwipe
> +#
> +################################################################################
> +
> +NWIPE_VERSION = 0.17
> +NWIPE_SITE = $(call github,martijnvanbrummelen,nwipe,$(NWIPE_VERSION))
> +NWIPE_DEPENDENCIES = ncurses parted host-pkgconf
> +NWIPE_LICENSE = GPLv2
> +NWIPE_LICENSE_FILES = COPYING
> +NWIPE_AUTORECONF = YES
> +
> +$(eval $(autotools-package))

This looks good.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
