From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Aug 2018 09:52:03 +0200
Subject: [Buildroot] [PATCH v4 1/1] python-kivy: new package
In-Reply-To: <20180830033305.10193-1-joseph.kogut@gmail.com>
References: <20180830033305.10193-1-joseph.kogut@gmail.com>
Message-ID: <20180830095203.4262ebdc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

On Wed, 29 Aug 2018 20:33:05 -0700, Joseph Kogut wrote:

> Changes v3 -> v4:
> - Remove dependency on glibc (tested on aarch64 w/ musl and X11 window
>   provider, sdl2 still segfaults)

segfault at runtime or build time ?

> diff --git a/DEVELOPERS b/DEVELOPERS
> index bd8095bd20..1792af78fb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1,4 +1,4 @@
> -# Syntax:
> +	# Syntax:

Spurious change.

>  #
>  # N:	Firstname Lastname <email>
>  # F:	file pattern or directory
> @@ -1027,6 +1027,16 @@ F:	package/pdbg/
>  F:	board/qemu/ppc64le-pseries/
>  F:	configs/qemu_ppc64le_pseries_defconfig
>  
> +N:	Joseph Kogut <joseph.kogut@gmail.com>
> +F:	package/gconf/
> +F:	package/libnss/
> +F:	package/python-cython/
> +F:	package/python-kivy/
> +F:	package/python-raven/
> +F:	package/python-schedule/
> +F:	package/python-websockets/
> +F:	package/python-xlib/

Lots of unrelated changes in here. In this commit, you should only be
adding an entry for package/python-kivy/. If you want to appear in the
DEVELOPERS file for other packages, send a separate patch for that.


> diff --git a/package/python-kivy/Config.in b/package/python-kivy/Config.in
> new file mode 100644
> index 0000000000..e4b89a74c1
> --- /dev/null
> +++ b/package/python-kivy/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PYTHON_KIVY
> +	bool "python-kivy"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_HOST_PYTHON_CYTHON

Is Cython a mandatory dependency, or an optional one like with
python-falcon ?

> +	select BR2_PACKAGE_LIBPNG # runtime
> +	select BR2_PACKAGE_MTDEV # runtime

Are you sure these are really runtime dependencies ? They are dlopen'ed
at runtime ?

> diff --git a/package/python-kivy/python-kivy.hash b/package/python-kivy/python-kivy.hash
> new file mode 100644
> index 0000000000..8949bc643f
> --- /dev/null
> +++ b/package/python-kivy/python-kivy.hash
> @@ -0,0 +1,4 @@
> +# sha256 locally computed
> +sha256	794e45cc7bcc7882f7cd95f1673bc6701f3215a20a54c915cac0c5e46a449b4c  python-kivy-1.10.1.tar.gz
> +# License file, locally calculated
> +sha256	282b3d8735ef6cbdcf8cc480947d50e0aea4ad1cc931d41f3f6a6bc23956f2d6  LICENSE
> diff --git a/package/python-kivy/python-kivy.mk b/package/python-kivy/python-kivy.mk
> new file mode 100644
> index 0000000000..fbb80c59cd
> --- /dev/null
> +++ b/package/python-kivy/python-kivy.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# python-kivy
> +#
> +################################################################################
> +
> +PYTHON_KIVY_VERSION = 1.10.1
> +PYTHON_KIVY_SITE = $(call github,kivy,kivy,$(PYTHON_KIVY_VERSION))
> +PYTHON_KIVY_SETUP_TYPE = distutils
> +PYTHON_KIVY_LICENSE = MIT
> +PYTHON_KIVY_LICENSE_FILES = LICENSE
> +PYTHON_KIVY_DEPENDENCIES = host-python-cython libgl
> +
> +ifeq ($(BR2_PACKAGE_GSTREAMER),y)
> +PYTHON_KIVY_DEPENDENCIES += gstreamer
> +PYTHON_KIVY_ENV += USE_GSTREAMER=1
> +endif

Perhaps an explicit USE_GSTREAMER=0 in an "else" condition would be
good. Ditto for all other options: we generally try to explicitly
disable features.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
