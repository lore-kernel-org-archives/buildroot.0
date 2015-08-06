From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 00:21:17 +0200
Subject: [Buildroot] [PATCH 1/1] ibrdtn
In-Reply-To: <1438865424-5000-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1438865424-5000-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <20150807002117.1149fdf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Sparks,

Thanks for this contribution. Vicente already made a review with some
comments, I'll add some more comments in this review.

On Thu,  6 Aug 2015 22:50:24 +1000, Tom Sparks wrote:
> Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
> ---
>  package/ibrcommon/Config.in    | 13 +++++++++++++
>  package/ibrcommon/ibrcommon.mk | 32 ++++++++++++++++++++++++++++++++
>  package/ibrdtn/Config.in       | 13 +++++++++++++
>  package/ibrdtn/ibrdtn.mk       | 32 ++++++++++++++++++++++++++++++++
>  package/ibrdtnd/Config.in      | 23 +++++++++++++++++++++++
>  package/ibrdtnd/ibrdtnd.mk     | 32 ++++++++++++++++++++++++++++++++

As Vincente said, each package should be added in a separate patch.
Each patch should have a title like this:

	<package>: new package

so, your series should have three patches:

	ibrcommon: new package
	ibrdtn: new package
	ibrdtnd: new package

And indeed each patch should add the package in package/Config.in to
make it visible in menuconfig.

> diff --git a/package/ibrcommon/Config.in b/package/ibrcommon/Config.in
> new file mode 100644
> index 0000000..c1d400b
> --- /dev/null
> +++ b/package/ibrcommon/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_IBRCOMMON
> +	bool "ibrcommon"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  IBR-DTN is a small dtn application that supports:
> +	  Bundle Protocol RFC 5050
> +	  Bundle Security Protocol RFC 6257
> +
> +	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn

Please read the Buildroot manual about adding a comment mentioning the
toolchain dependencies, especially "17.2.4. Dependencies on target and
toolchain options".

> diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
> new file mode 100644
> index 0000000..3a67307
> --- /dev/null
> +++ b/package/ibrcommon/ibrcommon.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# ibrcommon
> +#
> +################################################################################
> +
> +IBRCOMMON_VERSION = 1.0.1
> +IBRCOMMON_SOURCE = ibrcommon-$(IBRCOMMON_VERSION).tar.gz

Not needed, since it is the default value.

> +IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
> +IBRCOMMON_INSTALL_STAGING = YES
> +IBRCOMMON_LICENSE = Apache-2.0
> +IBRCOMMON_LICENSE_FILES = COPYING
> +IBRCOMMON_CONF_OPTS = --with-openssl --with-lowpan   --with-xml 
> +IBRCOMMON_DEPENDENCIES = openssl libnl libxml2
> +
> +# While the configuration system uses autoconf, the Makefiles are
> +# hand-written and do not use automake. Therefore, we have to hack
> +# around their deficiencies by passing installation paths.
> +IBRCOMMON_INSTALL_STAGING_OPTS = 			\
> +	prefix=$(STAGING_DIR)/usr 		\
> +	exec_prefix=$(STAGING_DIR)/usr 		\
> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
> +	install
> +
> +IBRCOMMON_INSTALL_TARGET_OPTS = 			\
> +	prefix=$(TARGET_DIR)/usr 		\
> +	exec_prefix=$(TARGET_DIR)/usr 		\
> +	install
> +
> +
> +

Too many unneeded empty lines.

> +$(eval $(autotools-package))
> diff --git a/package/ibrdtn/Config.in b/package/ibrdtn/Config.in
> new file mode 100644
> index 0000000..9da2b54
> --- /dev/null
> +++ b/package/ibrdtn/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_IBRDTN
> +	bool "ibrdtn"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_IBRCOMMON
> +	help
> +	  IBR-DTN is a small dtn application that supports:
> +	  Bundle Protocol RFC 5050
> +	  Bundle Security Protocol RFC 6257
> +
> +	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
> +
> +

Too many unneeded new lines. Also, you're missing the Config.in comment
about toolchain dependencies.

> diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
> new file mode 100644
> index 0000000..744bd2f
> --- /dev/null
> +++ b/package/ibrdtn/ibrdtn.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# ibrdtn
> +#
> +################################################################################
> +
> +IBRDTN_VERSION = 1.0.1
> +IBRDTN_SOURCE = ibrdtn-$(IBRDTN_VERSION).tar.gz

Unneeded, this is the default.

Same comments for the rest of the patch. Other than those basic
comments, it seems good.

Did you check if your packages work on noMMU platforms? For example, if
they use fork(), they will not work on noMMU platforms, and so you need
to add a BR2_USE_MMU dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
