From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 00:02:07 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: new package
In-Reply-To: <1444858103-556-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Wed, 14 Oct 2015 23:28:23 +0200")
References: <1444858103-556-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <871tcq34bk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch adds python-pillow, the friendly python image library fork.
 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks, have you tested it with both python 2.7 and 3.x?

> ---
 >  package/Config.in                      |  1 +
 >  package/python-pillow/Config.in        | 53 ++++++++++++++++++++++++++++++++++
 >  package/python-pillow/python-pillow.mk | 36 +++++++++++++++++++++++
 >  3 files changed, 90 insertions(+)
 >  create mode 100644 package/python-pillow/Config.in
 >  create mode 100644 package/python-pillow/python-pillow.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index f686f13..7ba23f0 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -633,6 +633,7 @@ menu "External python modules"
 >  	source "package/python-nfc/Config.in"
 >  	source "package/python-numpy/Config.in"
 >  	source "package/python-pam/Config.in"
 > +	source "package/python-pillow/Config.in"
 >  	source "package/python-posix-ipc/Config.in"
 >  	source "package/python-protobuf/Config.in"
 >  	source "package/python-psutil/Config.in"
 > diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
 > new file mode 100644
 > index 0000000..7e19aec
 > --- /dev/null
 > +++ b/package/python-pillow/Config.in
 > @@ -0,0 +1,53 @@
 > +config BR2_PACKAGE_PYTHON_PILLOW
 > +	bool "python-pillow"
 > +	help
 > +	  Pillow is the "friendly" PIL fork by Alex Clark and Contributors. PIL is
 > +	  the Python Imaging Library by Fredrik Lundh and Contributors.
 > +
 > +	  https://pypi.python.org/pypi/Pillow/
 > +
 > +if BR2_PACKAGE_PYTHON_PILLOW
 > +
 > +config BR2_PACKAGE_PYTHON_PILLOW_JPEG
 > +	bool "JPEG support"
 > +	select BR2_PACKAGE_JPEG_LIBRARY

The option is simply called BR2_PACKAGE_JPEG.

> +	default n

'n' is the default value of a symbol, so you can drop it here and for
the other options.


> +++ b/package/python-pillow/python-pillow.mk
 > @@ -0,0 +1,36 @@
 > +################################################################################
 > +#
 > +# python-pillow
 > +#
 > +################################################################################
 > +
 > +PYTHON_PILLOW_VERSION = 3.0.0
 > +PYTHON_PILLOW_SITE = $(call github,python-pillow,Pillow,$(PYTHON_PILLOW_VERSION))
 > +PYTHON_PILLOW_DEPENDENCIES = python-setuptools
 > +PYTHON_PILLOW_SETUP_TYPE = distutils

Please also add license info.

> +
 > +ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_JPEG),y)
 > +PYTHON_PILLOW_DEPENDENCIES += jpeg

Is there no way of disabling support? If so, I think we should get rid
of the explicit Config.in options and just enable support for the
libraries that are enabled in the buildroot configuration, as it will
add jpeg support if you have libjpeg enabled no matter if
PYTHON_PILLOW_JPEG is enabled or not (if libjpeg happens to get built
before pillow).

E.G.
PYTHON_PILLOW_DEPENDENCIES = \
      $(if $(BR2_PACKAGE_JPEG),jpeg) \
      $(if $(BR2_PACKAGE_ZLIB),zlib) \
      ..

It unfortunately doesn't build here because it looks in /usr/include for
host headers:

/home/peko/source/buildroot/output-hest/host/usr/bin/arm-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -DHAVE_LIBJPEG -DHAVE_LIBZ -I/usr/include/freetype2 -I/home/peko/source/buildroot/output-hest/build/python-pillow-3.0.0/libImaging -I/home/peko/source/buildroot/output-hest/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -I/usr/local/include -I/usr/include -I/home/peko/source/buildroot/output-hest/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python3.4m -I/usr/include/x86_64-linux-gnu -c libImaging/UnpackYCC.c -o build/temp.linux-x86_64-3.4/libImaging/UnpackYCC.o
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/freetype2'
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/freetype2'
..
arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/lib64'
error: command '/home/peko/source/buildroot/output-hest/host/usr/bin/arm-linux-gcc' failed with exit status 1
package/pkg-generic.mk:188: recipe for target '/home/peko/source/buildroot/output-hest/build/python-pillow-3.0.0/.stamp_built' failed

Looking at setup.py I see a number of host header/library locations and
host architecture checks, so that won't work for cross compilation.


-- 
Bye, Peter Korsgaard
