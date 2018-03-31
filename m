From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 31 Mar 2018 19:06:50 +0200
Subject: [Buildroot] [PATCH] libfreenect: new package.
In-Reply-To: <20180316165607.17627-1-connor@farmbot.io>
References: <20180316165607.17627-1-connor@farmbot.io>
Message-ID: <8490618c-5b4b-04b4-76b2-b71869648767@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Connor,

Thanks for your contribution!

Le 16/03/2018 ? 17:56, Connor Rigby a ?crit?:
> libfreenect is a userspace driver for the Microsoft Kinect.
> 
> Signed-off-by: Connor Rigby <connor@farmbot.io>
> ---

Can you add a DEVELOPERS file entry for libfreenect ?

>  package/Config.in                    |  1 +
>  package/libfreenect/Config.in        | 32 +++++++++++++++++++++++++++++++
>  package/libfreenect/libfreenect.hash |  2 ++
>  package/libfreenect/libfreenect.mk   | 37 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 72 insertions(+)
>  create mode 100644 package/libfreenect/Config.in
>  create mode 100644 package/libfreenect/libfreenect.hash
>  create mode 100644 package/libfreenect/libfreenect.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 449ffcc47b..22bd7e9c7d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1203,6 +1203,7 @@ menu "Hardware handling"
>  	source "package/libatasmart/Config.in"
>  	source "package/libcec/Config.in"
>  	source "package/libfreefare/Config.in"
> +	source "package/libfreenect/Config.in"
>  	source "package/libftdi/Config.in"
>  	source "package/libftdi1/Config.in"
>  	source "package/libgphoto2/Config.in"
> diff --git a/package/libfreenect/Config.in b/package/libfreenect/Config.in
> new file mode 100644
> index 0000000000..f0680980fc
> --- /dev/null
> +++ b/package/libfreenect/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_LIBFREENECT
> +	bool "Libfreenect"
> +  select BR2_PACKAGE_LIBUSB
> +	help
> +    libfreenect is a userspace driver for the Microsoft Kinect.
> +
> +	  https://openkinect.org/wiki/Main_Page

There are several coding style issue with Config.in and libfreenect.mk

$ ./utils/check-package package/libfreenect/*
package/libfreenect/Config.in:3: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:5: help text: <tab><2 spaces><62 chars>
(http://nightly.buildroot.org/#writing-rules-config-in)
package/libfreenect/Config.in:12: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:13: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:14: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:15: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:16: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:17: help text: <tab><2 spaces><62 chars>
(http://nightly.buildroot.org/#writing-rules-config-in)
package/libfreenect/Config.in:20: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:21: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:22: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:23: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:24: help text: <tab><2 spaces><62 chars>
(http://nightly.buildroot.org/#writing-rules-config-in)
package/libfreenect/Config.in:27: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:28: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:29: should be indented with one tab
(http://nightly.buildroot.org/#_config_files)
package/libfreenect/Config.in:30: help text: <tab><2 spaces><62 chars>
(http://nightly.buildroot.org/#writing-rules-config-in)
package/libfreenect/libfreenect.mk:6: should be a blank line
(http://nightly.buildroot.org/#writing-rules-mk)
package/libfreenect/libfreenect.mk:14: expected indent with tabs


> +
> +if BR2_PACKAGE_LIBFREENECT
> +
> +config BR2_PACKAGE_LIBFREENECT_PYTHON2
> +  bool "Libfreenect Python Wrapper"

Use lower case.

> +  depends on BR2_PACKAGE_LIBFREENECT

This is not needed since this option is available if libreenect is selected.

> +  depends on BR2_PACKAGE_PYTHON

Do you know if the Python wrapper is really python 2 only ?

> +  depends on BR2_PACKAGE_PYTHON_NUMPY

Since this option depends on python, you can select python-numpy here.

> +  help
> +    build python wrapper for libfreenect.
> +
> +config BR2_PACKAGE_LIBFREENECT_EXAMPLES
> +  bool "Libfreenect examples"
> +  depends on BR2_PACKAGE_LIBFREEGLUT

Same here, remove the dependency

> +  depends on BR2_PACKAGE_LIBGLU
> +  help
> +    build examples for libfreenect.

Usually, we don't build tests and examples.
If there is a good reason to build libfreenect examples, select libglu package
and add libglut reverse dependencies.

> +
> +config BR2_PACKAGE_LIBFREENECT_OPENCV
> +  bool "Libfreenect opencv wrapper"
> +  depends on BR2_PACKAGE_OPENCV

Same here, select opencv and add reverse dependencies.

> +  help
> +    build opencv wrapper for Libfreenect.
> +
> +endif
> diff --git a/package/libfreenect/libfreenect.hash b/package/libfreenect/libfreenect.hash
> new file mode 100644
> index 0000000000..d662ac3225
> --- /dev/null
> +++ b/package/libfreenect/libfreenect.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 5f22c9a0260efd5a31d8e6465bb06b2b389f61b8f7714e0b42b7b20314e5ef59  libfreenect-v0.5.7.tar.gz

Recently Buildroot added support for license file hash check.
This hash should be listed here.

> diff --git a/package/libfreenect/libfreenect.mk b/package/libfreenect/libfreenect.mk
> new file mode 100644
> index 0000000000..53413e1a01
> --- /dev/null
> +++ b/package/libfreenect/libfreenect.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# libfreenect
> +#
> +################################################################################

Add a new line

Otherwise it look good, can you send an updated version?
I'll mark this version "Changes requested" in patchwork.

Best regards,
Romain


> +LIBFREENECT_VERSION = v0.5.7
> +LIBFREENECT_SITE = $(call github,OpenKinect,libfreenect,$(LIBFREENECT_VERSION))
> +LIBFREENECT_INSTALL_STAGING = YES
> +LIBFREENECT_DEPENDENCIES = libusb host-pkgconf
> +LIBFREENECT_LICENSE = Apache-2.0, GPL-2.0+
> +LIBFREENECT_LICENSE_FILES = APACHE20 GPL2> +
> +LIBFREENECT_CONF_OPTS  = -DBUILD_REDIST_PACKAGE=OFF -DBUILD_C_SYNC=ON \
> +                         -DBUILD_CPP=ON -DBUILD_OPENNI2_DRIVER=OFF
> +
> +ifeq ($(BR2_PACKAGE_LIBFREENECT_PYTHON2),y)
> +LIBFREENECT_DEPENDENCIES += python python-numpy
> +LIBFREENECT_CONF_OPTS += -DBUILD_PYTHON2=ON
> +else
> +LIBFREENECT_CONF_OPTS += -DBUILD_PYTHON2=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBFREENECT_EXAMPLES),y)
> +LIBFREENECT_DEPENDENCIES += libfreeglut libglu
> +LIBFREENECT_CONF_OPTS += -DBUILD_EXAMPLES=ON
> +else
> +LIBFREENECT_CONF_OPTS += -DBUILD_EXAMPLES=OFF
> +endif
> +
> +ifeq ($(BR2BR2_PACKAGE_LIBFREENECT_OPENCV),y)
> +LIBFREENECT_DEPENDENCIES += opencv
> +LIBFREENECT_CONF_OPTS += -DBUILD_CV=ON
> +else
> +LIBFREENECT_CONF_OPTS += -DBUILD_CV=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
