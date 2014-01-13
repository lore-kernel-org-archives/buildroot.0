From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jan 2014 16:20:28 +0800
Subject: [Buildroot] [PATCH 02/14] libenca: new package
In-Reply-To: <1389549208-19078-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140113162028.688f4e7f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Jan 2014 18:53:16 +0100, Maxime Hadjinlian wrote:
> Extremely Naive Charset Analyser.
> 
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/libenca/Config.in                          |  6 ++++
>  package/libenca/libenca-1.9-dont-build-tools.patch | 33 ++++++++++++++++++++++
>  package/libenca/libenca-1.9-fix-clean.patch        | 22 +++++++++++++++
>  package/libenca/libenca-1.9-fix-prefix.patch       | 19 +++++++++++++

We don't want the version number of package in the patch file names,
but we do want sequence numbers. So:

	libenca-000-<something>.patch
	libenca-001-<something>.patch

> diff --git a/package/libenca/libenca-1.9-dont-build-tools.patch b/package/libenca/libenca-1.9-dont-build-tools.patch
> new file mode 100644
> index 0000000..43b3420
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-dont-build-tools.patch
> @@ -0,0 +1,33 @@
> +diff -ruN libenca-1.9.orig/Makefile.in libenca-1.9/Makefile.in
> +--- libenca-1.9.orig/Makefile.in	2011-07-23 20:02:58.304328321 -0400
> ++++ libenca-1.9/Makefile.in	2011-07-23 20:03:34.246328297 -0400
> +@@ -78,7 +78,7 @@


> diff --git a/package/libenca/libenca-1.9-fix-clean.patch b/package/libenca/libenca-1.9-fix-clean.patch
> new file mode 100644
> index 0000000..9c206ad
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-fix-clean.patch
> @@ -0,0 +1,22 @@
> +--- libenca-1.9.orig/src/Makefile.in	2011-07-23 20:19:28.744327998 -0400
> ++++ libenca-1.9/src/Makefile.in	2011-07-23 20:22:47.894327936 -0400

> diff --git a/package/libenca/libenca-1.9-fix-prefix.patch b/package/libenca/libenca-1.9-fix-prefix.patch
> new file mode 100644
> index 0000000..6fd195b
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-fix-prefix.patch
> @@ -0,0 +1,19 @@
> +--- libenca-1.9.orig/configure
> ++++ libenca-1.9/configure

We generally prefer to patch the Makefile.am and the configure.{in,ac}
script, and set <foo>_AUTORECONF = YES.

> +#############################################################
> +#
> +# libenca
> +#
> +#############################################################

80 # signs are needed now.

> +
> +LIBENCA_VERSION = 1.9
> +LIBENCA_SITE = http://dl.cihar.com/enca
> +LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.bz2
> +LIBENCA_INSTALL_STAGING = YES
> +LIBENCA_LICENSE = GPLv2
> +LIBENCA_LICENSE_FILES = COPYING
> +
> +LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes
> +LIBENCA_CONF_ENV += ac_cv_file__dev_urandom=yes
> +LIBENCA_CONF_ENV += ac_cv_file__dev_arandom=no
> +LIBENCA_CONF_ENV += ac_cv_file__dev_srandom=no
> +LIBENCA_CONF_ENV += yeti_cv_func_scanf_modif_size_t=yes

Use (i.e on one line) :

LIBENCA_CONF_ENV = \
	bleh=yes \
	foo=bar \
	bar=bleh

> +define LIBENCA_MAKE_HOST_TOOL
> +cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c

Instead with one tab.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
