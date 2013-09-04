From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Sep 2013 22:17:46 +0200
Subject: [Buildroot] [PATCH 1/1] Eigen: new package
In-Reply-To: <1378322721-27028-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1378322721-27028-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <5227956A.2080407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Matt,

  Thanks for your patch. I have a few small comments below. Care to fix 
and resubmit?

On 09/04/13 21:25, Matt Weber wrote:
> Target packages -> Libraries -> Other -> Eigen
>
> Eigen - a C++ template library for linear algebra

  We don't usually put any commit message if it's a simple new package. 
However, I really like how you put the menu tree in your commit message. 
 From the patch, it is not visible to which menu it is added, so that 
really helps.

>
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
>   package/Config.in       |    1 +
>   package/eigen/Config.in |   16 ++++++++++++++++
>   package/eigen/eigen.mk  |   24 ++++++++++++++++++++++++
>   3 files changed, 41 insertions(+), 0 deletions(-)
>   create mode 100644 package/eigen/Config.in
>   create mode 100644 package/eigen/eigen.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a94cb62..6fe9e14 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -617,6 +617,7 @@ source "package/libcofi/Config.in"
>   source "package/classpath/Config.in"
>   source "package/cppcms/Config.in"
>   source "package/elfutils/Config.in"
> +source "package/eigen/Config.in"

  In my alphabet, eigen comes before elfutils :-)

>   source "package/fftw/Config.in"
>   source "package/libargtable2/Config.in"
>   source "package/argp-standalone/Config.in"
> diff --git a/package/eigen/Config.in b/package/eigen/Config.in
> new file mode 100644
> index 0000000..ee68bc8
> --- /dev/null
> +++ b/package/eigen/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_EIGEN
> +	bool "eigen"
> +	help
> +	  Eigen is a C++ template library for linear algebra: vectors,
> +	  matrices, and related algorithms. It is versatile, fast, elegant
> +	  and works on many platforms (OS/Compilers).
> +
> +	  Eigen doesn't have any dependencies other than the C++ standard library.
> +	  The CMake build system is used to build the documentation, unit-tests,
> +	  and to automate installation. If you just want to use Eigen, you can
> +	  use the header files right away. There is no binary library to link
> +	  to and no configured header file. Eigen is a pure template library
> +	  defined in the headers.

  Minor nit: this could be rephrased a little to have only the 
buildroot-relevant part, i.e.: "This package only installs header files 
to the include path. If you just want to use Eigen, you can use the 
header files right away. There is no binary to link to. Eigen is a pure 
template library defined in the headers."

> +
> +	  http://eigen.tuxfamily.org/
> +
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> new file mode 100644
> index 0000000..2580f0b
> --- /dev/null
> +++ b/package/eigen/eigen.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# Eigen - a C++ template library for linear algebra
> +#
> +#############################################################
> +EIGEN_VERSION = 3.2.0
> +EIGEN_VERSION_HASH = ffa86ffb5570
> +EIGEN_SITE    = http://bitbucket.org/eigen/eigen/get/$(EIGEN_VERSION).tar.bz2
> +EIGEN_SOURCE  = eigen-eigen-$(EIGEN_VERSION_HASH).tar.bz2

  There is something fishy about this.
http://bitbucket.org/eigen/eigen/get/3.2.0.tar.bz2/eigen-eigen-ffa86ffb5570.tar.bz2 

fails for me. I think you mean:

EIGEN_SITE    = http://bitbucket.org/eigen/eigen/get
EIGEN_SOURCE  = $(EIGEN_VERSION).tar.bz2


> +EIGEN_LICENSE = MPL2

  Should be:

EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1

  There is also the Minpack license but for me that's close enough to 
BSD-3c to be covered by it. And there are some pieces LGPLv2.1+, but 
since other pieces are strictly LGPLv2.1 I think we don't have to specify 
the +.

> +EIGEN_LICENSE_FILES = COPYING*

  I'm afraid you have to specify all files explicitly.

> +EIGEN_INSTALL_STAGING = YES

  You may also want EIGEN_INSTALL_TARGET = NO.

> +
> +# This package only consists of headers that need to be
> +# copied over to the sysroot for compile time use
> +define EIGEN_INSTALL_STAGING_CMDS
> +	cp -af $(@D)/Eigen $(STAGING_DIR)/usr/include/

  I would first do a $(RM) -r $(STAGING_DIR)/usr/include/Eigen
and remove the -f from cp. That makes it more idempotent.

> +endef
> +
> +define EIGEN_UNINSTALL_STAGING_CMDS
> +	rm -rf $(STAGING_DIR)/usr/include/Eigen
> +endef

  Uninstall commands are no longer needed.


  Regards,
  Arnout

> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
