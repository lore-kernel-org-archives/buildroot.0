From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 22:29:54 +0200
Subject: [Buildroot] [PATCH v2] eigen: new package
In-Reply-To: <1378389207-31680-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Thu, 5 Sep 2013 08:53:27 -0500")
References: <1378389207-31680-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87ioybxdj1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 Matt> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 Matt> ---
 Matt> Changes v1 -> v2:
 Matt>   * Fixed order of where new pkg was added in package/Config.in (suggested by Arnout)
 Matt>   * Cleaned up pkg description in package/eigen/Config.in (suggested by Arnout)
 Matt>   * Fixed SITE/SOURCE issue.  Ended up switching to a mercurial repo tag instead of
 Matt>     source pkg.  This was because of the download site renaming the archive
 Matt>     to have a different name then what was provided for a download URL.
 Matt>     (version vs hashtag used in archive naming) (suggested by Arnout)
 Matt>   * Cleaned up license list and added all the license files (suggested by Arnout)
 Matt>   * Removed uninstall and added cleanup cmds before the cp in the install staging (suggested by Arnout)

Committed with minor fixes (see below) - Thanks.

 Matt> +config BR2_PACKAGE_EIGEN
 Matt> +	bool "eigen"
 Matt> +	help
 Matt> +	  Eigen is a C++ template library for linear algebra: vectors, 
 Matt> +	  matrices, and related algorithms. It is versatile, fast, elegant 
 Matt> +	  and works on many platforms (OS/Compilers).
 Matt> +
 Matt> +	  This package only installs header files to the include path. 
 Matt> +	  If you just want to use Eigen, you can use the header files 
 Matt> +	  right away. There is no binary to link to. Eigen is a pure 
 Matt> +	  template library defined in the headers.

You have trailing spaces.

 Matt> +
 Matt> +	  http://eigen.tuxfamily.org/
 Matt> +

There shouldn't be an empty line after the URL.

 Matt> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
 Matt> new file mode 100644
 Matt> index 0000000..1a88d90
 Matt> --- /dev/null
 Matt> +++ b/package/eigen/eigen.mk
 Matt> @@ -0,0 +1,22 @@
 Matt> +#############################################################
 Matt> +#
 Matt> +# Eigen - a C++ template library for linear algebra
 Matt> +#
 Matt> +#############################################################

The ##### header lines should be 80 chars and only contain the package
name, and there should be an empty line before the EIGEN_ variables.

 Matt> +# version 3.2
 Matt> +EIGEN_VERSION = ffa86ffb5570
 Matt> +EIGEN_SITE    = https://bitbucket.org/eigen/eigen/
 Matt> +EIGEN_SITE_METHOD = hg
 Matt> +EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 Matt> +EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 Matt> +EIGEN_INSTALL_STAGING = YES
 Matt> +EIGEN_INSTALL_TARGET = NO
 Matt> +
 Matt> +# This package only consists of headers that need to be
 Matt> +# copied over to the sysroot for compile time use
 Matt> +define EIGEN_INSTALL_STAGING_CMDS
 Matt> +	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
 Matt> +	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
 Matt> +endef
 Matt> +
 Matt> +$(eval $(generic-package))
 Matt> -- 
 Matt> 1.7.1

-- 
Bye, Peter Korsgaard
