From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Oct 2014 18:29:04 +0200
Subject: [Buildroot] [PATCH 1/1] cppunit: Added package
In-Reply-To: <1412279910-12645-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1412279910-12645-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <543D4F50.8090208@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

Le 02/10/2014 21:58, Sebastien Bourdelin a ?crit :
> CppUnit is the C++ port of the famous JUnit framework for unit testing.
> Test output is in XML or text format for automatic testing and GUI
> based for supervised tests.
>
> http://www.freedesktop.org/wiki/Software/cppunit/
> Signed-off-by: Sebastien Bourdelin<sebastien.bourdelin@savoirfairelinux.com>
> ---
>   package/Config.in          |  1 +
>   package/cppunit/Config.in  | 12 ++++++++++++
>   package/cppunit/cppunit.mk | 27 +++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+)
>   create mode 100644 package/cppunit/Config.in
>   create mode 100644 package/cppunit/cppunit.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2ad72bc..5cde341 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -831,6 +831,7 @@ menu "Other"
>   	source "package/clapack/Config.in"
>   	source "package/classpath/Config.in"
>   	source "package/cppcms/Config.in"
> +	source "package/cppunit/Config.in"
>   	source "package/eigen/Config.in"
>   	source "package/elfutils/Config.in"
>   	source "package/fftw/Config.in"
> diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
> new file mode 100644
> index 0000000..91700b8
> --- /dev/null
> +++ b/package/cppunit/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CPPUNIT
> +	bool "cppunit"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  CppUnit is the C++ port of the famous JUnit framework for unit testing.
> +	  Test output is in XML or text format for automatic testing and GUI
> +	  based for supervised tests.
> +
> +	http://www.freedesktop.org/wiki/Software/cppunit/
> +
> +comment "cppunit needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
> new file mode 100644
> index 0000000..47d27be
> --- /dev/null
> +++ b/package/cppunit/cppunit.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# cppunit
> +#
> +################################################################################
> +
> +CPPUNIT_VERSION = cppunit-1.13.2
> +CPPUNIT_SITE = git://anongit.freedesktop.org/git/libreoffice/cppunit/
> +CPPUNIT_INSTALL_STAGING = YES
> +CPPUNIT_LICENSE = GPLv2
> +CPPUNIT_LICENSE_FILES = COPYING
> +
> +define CPPUNIT_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +CPPUNIT_PRE_CONFIGURE_HOOKS += CPPUNIT_RUN_AUTOGEN

Why not using CPPUNIT_AUTORECONF = YES here ?
It seems that autoreconf mechanism works.

> +
> +define CPPUNIT_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		./configure \
> +		--host=$(GNU_TARGET_NAME) \
> +		--prefix=/usr \
> +		$(TARGET_CONFIGURE_OPTS) \
> +	)
> +endef

It's already done in pkg-autotools.mk, so you can remove this.

> +
> +$(eval $(autotools-package))

Have you tested cppunit over several toolchain configuration ?
Otherwise, looks good.

Best regards,
Romain Naour
