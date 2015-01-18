From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 18 Jan 2015 23:23:46 +0100
Subject: [Buildroot] [RFC] python-lxml: add target package variant
In-Reply-To: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
References: <1421619459-26270-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_ksk2RqtAHWqQHCaPeGGR4VLiD37X=HMOtzwaHz8yZp-Eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 18, 2015 at 11:17 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                  |  1 +
>  package/python-lxml/Config.in      | 10 ++++++++++
>  package/python-lxml/python-lxml.mk |  4 +++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-lxml/Config.in
>
> diff --git a/package/Config.in b/package/Config.in
> index 266de13..366e393 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -519,6 +519,7 @@ menu "external python modules"
>         source "package/python-json-schema-validator/Config.in"
>         source "package/python-keyring/Config.in"
>         source "package/python-libconfig/Config.in"
> +       source "package/python-lxml/Config.in"
>         source "package/python-mad/Config.in"
>         source "package/python-markdown/Config.in"
>         source "package/python-markupsafe/Config.in"
> diff --git a/package/python-lxml/Config.in b/package/python-lxml/Config.in
> new file mode 100644
> index 0000000..70096e7
> --- /dev/null
> +++ b/package/python-lxml/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_LXML
> +       bool "python-lxml"
> +       select BR2_PACKAGE_LIBXML2
> +       select BR2_PACKAGE_LIBXSLT
> +       help
> +         The lxml XML toolkit is a Pythonic binding for the C libraries
> +         libxml2 and libxslt.
> +
> +         http://lxml.de/
> +
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 758ce87..292031b 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -20,6 +20,8 @@ PYTHON_LXML_LICENSE_FILES = \
>  # So, we use setuptools.
>  PYTHON_LXML_SETUP_TYPE = setuptools
>
> -PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
> +PYTHON_LXML_DEPENDENCIES = libxml2 libxslt host-libxslt
>
> +
> +$(eval $(python-package))
>  $(eval $(host-python-package))

After adding host-xslt I don't have compiler errors, but linking:

>>> python-lxml 3.4.1 Building
(cd /home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1//;
PATH="/home/user/Documents/versioned/buildroot/output/host/bin:/home/user/Documents/versioned/buildroot/output/host/sbin:/home/user/Documents/versioned/buildroot/output/host/usr/bin:/home/user/Documents/versioned/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PYTHONPATH="/home/user/Documents/versioned/buildroot/output/target/usr/lib/python2.7/sysconfigdata/:/home/user/Documents/versioned/buildroot/output/target/usr/lib/python2.7/site-packages/"
_python_sysroot=/home/user/Documents/versioned/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
_python_prefix=/usr _python_exec_prefix=/usr
/home/user/Documents/versioned/buildroot/output/host/usr/bin/python
setup.py build  )
Building lxml version 3.4.1.
Building without Cython.
Using build configuration of libxslt 1.1.28
Building against libxml2/libxslt in the following directory:
/home/user/Documents/versioned/buildroot/output/host/usr/lib
/home/user/Documents/versioned/buildroot/output/host/usr/lib/python2.7/distutils/dist.py:267:
UserWarning: Unknown distribution option: 'bugtrack_url'
  warnings.warn(msg)
running build
running build_py
copying src/lxml/includes/lxml-version.h ->
build/lib.linux-x86_64-2.7/lxml/includes
running build_ext
building 'lxml.etree' extension
/home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -fPIC
-I/home/user/Documents/versioned/buildroot/output/host/usr/include
-I/home/user/Documents/versioned/buildroot/output/host/usr/include/libxml2
-I/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/src/lxml/includes
-I/home/user/Documents/versioned/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python2.7
-c src/lxml/lxml.etree.c -o
build/temp.linux-x86_64-2.7/src/lxml/lxml.etree.o -w
/home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-shared build/temp.linux-x86_64-2.7/src/lxml/lxml.etree.o
-L/home/user/Documents/versioned/buildroot/output/host/usr/lib
-L/home/user/Documents/versioned/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
-lxslt -lexslt -lxml2 -lz -lm -lpython2.7 -o
build/lib.linux-x86_64-2.7/lxml/etree.so
/home/user/Documents/versioned/buildroot/output/host/usr/lib/libxslt.so:
file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
error: command '/home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc'
failed with exit status 1
package/pkg-generic.mk:182: recipe for target
'/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/.stamp_built'
failed
make: *** [/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/.stamp_built]
Error 1

The whole stuff tries to link against host variant.  Samuel Martin, do
you have any idea?

Yegor
