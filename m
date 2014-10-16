From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Oct 2014 10:15:25 +0200
Subject: [Buildroot] [PATCH v3] cppunit: Added package
In-Reply-To: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <543F7E9D.4060401@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

> CppUnit is the C++ port of the famous JUnit framework for unit testing.
> Test output is in XML or text format for automatic testing and GUI
> based for supervised tests.
>
> http://www.freedesktop.org/wiki/Software/cppunit/
>
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
> Changes v2 -> v3:
>   - use the release tarball instead of the git repository (suggested by
> 		 arnout at mind.be)
>   - fix the Licence (suggested by arnout at mind.be)
>   - add upstream and locally compute .hash (suggested by
> 		 arnout at mind.be)
> ---
> Changes v1 -> v2:
>   - used AUTORECONF option (suggested by romain.naour at openwide.fr)
>   - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)
> ---
>   package/Config.in            |  1 +
>   package/cppunit/Config.in    | 12 ++++++++++++
>   package/cppunit/cppunit.hash |  5 +++++
>   package/cppunit/cppunit.mk   | 14 ++++++++++++++
>   4 files changed, 32 insertions(+)
>   create mode 100644 package/cppunit/Config.in
>   create mode 100644 package/cppunit/cppunit.hash
>   create mode 100644 package/cppunit/cppunit.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 93e148d..8d6e047 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -840,6 +840,7 @@ menu "Other"
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
> +	  http://www.freedesktop.org/wiki/Software/cppunit/
> +
> +comment "cppunit needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
> new file mode 100644
> index 0000000..ad45455
> --- /dev/null
> +++ b/package/cppunit/cppunit.hash
> @@ -0,0 +1,5 @@
> +# hash from: http://dev-www.libreoffice.org/src/cppunit-1.13.2.tar.gz:
> +md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
> +
> +# no upstream hash for the following:
> +sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz
> diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
> new file mode 100644
> index 0000000..89268b7
> --- /dev/null
> +++ b/package/cppunit/cppunit.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# cppunit
> +#
> +################################################################################
> +
> +CPPUNIT_VERSION = cppunit-1.13.2

This should be

CPPUNIT_VERSION = 1.13.2

and ...

> +CPPUNIT_SOURCE = $(CPPUNIT_VERSION).tar.gz

that should be

CPPUNIT_SOURCE = cppunit-$(CPPUNIT_VERSION).tar.gz

but because this is the default value of <PKG>_SOURCE variable,
so this line is not needed.

Regards,
Jerzy

> +CPPUNIT_SITE = http://dev-www.libreoffice.org/src
> +CPPUNIT_INSTALL_STAGING = YES
> +CPPUNIT_LICENSE = LGPLv2.1+
> +CPPUNIT_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
