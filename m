From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Oct 2014 10:51:28 +0200
Subject: [Buildroot] [PATCH v3] cppunit: Added package
In-Reply-To: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <543F8710.4010708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, still a few details :-)

On 15/10/14 22:22, Sebastien Bourdelin wrote:
> CppUnit is the C++ port of the famous JUnit framework for unit testing.
> Test output is in XML or text format for automatic testing and GUI
> based for supervised tests.
> 
> http://www.freedesktop.org/wiki/Software/cppunit/
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
> Changes v2 -> v3:
>  - use the release tarball instead of the git repository (suggested by
> 		 arnout at mind.be)
>  - fix the Licence (suggested by arnout at mind.be)
>  - add upstream and locally compute .hash (suggested by
> 		 arnout at mind.be)
> ---
> Changes v1 -> v2:
>  - used AUTORECONF option (suggested by romain.naour at openwide.fr)
>  - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)

 Excellent changelog BTW!

> ---
>  package/Config.in            |  1 +
>  package/cppunit/Config.in    | 12 ++++++++++++
>  package/cppunit/cppunit.hash |  5 +++++
>  package/cppunit/cppunit.mk   | 14 ++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/cppunit/Config.in
>  create mode 100644 package/cppunit/cppunit.hash
>  create mode 100644 package/cppunit/cppunit.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 93e148d..8d6e047 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -840,6 +840,7 @@ menu "Other"
>  	source "package/clapack/Config.in"
>  	source "package/classpath/Config.in"
>  	source "package/cppcms/Config.in"
> +	source "package/cppunit/Config.in"

 I didn't look at this before, but:

 I think this fits better in the Development tools menu, even though it's a
library. I'm not 100% sure, though, so it's up to you.

>  	source "package/eigen/Config.in"
>  	source "package/elfutils/Config.in"
>  	source "package/fftw/Config.in"
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

 We already know where the source comes from; instead, you should refer to the
URL that gives the hash:
http://www.freedesktop.org/wiki/Software/cppunit/

> +md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz

 I verified that this is correct.

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

 No, the version is 1.13.2

> +CPPUNIT_SOURCE = $(CPPUNIT_VERSION).tar.gz

 Once the VERSION has been corrected, this is the default so it's not needed to
give the CPPUNIT_SOURCE.

> +CPPUNIT_SITE = http://dev-www.libreoffice.org/src
> +CPPUNIT_INSTALL_STAGING = YES
> +CPPUNIT_LICENSE = LGPLv2.1+
> +CPPUNIT_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))


 Unfortunately, it fails to build for platforms without shared libraries (e.g.
blackfin FLAT). Probably easy to fix (seems to be a case of some forgotten
#ifdef's), but it's easier to just add

	depends on !BR2_BINFMT_FLAT


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
