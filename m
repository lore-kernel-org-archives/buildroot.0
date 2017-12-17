From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 10:21:13 +0100
Subject: [Buildroot] [PATCH 1/3] add new package proj
In-Reply-To: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20171217102113.4d65cf6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied your patch, after doing a number of changes. First of all,
I've renamed it to "proj: new package", which is the convention when
adding new package. Then, the DEVELOPERS change has been squashed in
the patch adding the package.

On Sun, 17 Dec 2017 00:52:59 +0100, Zoltan Gyarmati wrote:

> diff --git a/package/proj/Config.in b/package/proj/Config.in
> new file mode 100644
> index 0000000..0dd92cc
> --- /dev/null
> +++ b/package/proj/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PROJ
> +	bool "proj"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  proj.4 is a standard UNIX filter function which converts geographic 
> +	  longitude and latitude coordinates into cartesian coordinates
> +	  (and vice versa), and it is a C API for software developers to include
> +	  coordinate transformation in their own software.

Lines too long and trailing whitespace here, I've fixed this up.

> +# Fetched from http://download.osgeo.org/proj/proj-4.9.3.tar.gz.md5
> +md5 d598336ca834742735137c5674b214a1 proj-4.9.3.tar.gz

A md5 hash alone is not sufficient, so I've added a sha256 hash. While
I was at it, I've added a hash for the license file as well.

> +PROJ_VERSION = 4.9.3
> +PROJ_SOURCE = proj-$(PROJ_VERSION).tar.gz
> +PROJ_SITE = http://download.osgeo.org/proj
> +PROJ_LICENSE = MIT

I've added PROJ_LICENSE_FILES

> +PROJ_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))

Last but not least, I've switched to using the provided autotools build
system, because it correctly handled building a static library. Indeed,
your package using CMake was failing to build in static-only
configurations.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
