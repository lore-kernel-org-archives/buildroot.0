From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 18 Jan 2015 18:27:11 +0100
Subject: [Buildroot] [PATCH 01/11 v4] package/python-lxml: new package
In-Reply-To: <24d0ff88170493e141dd07c29c3bcf262a67692f.1421582718.git.yann.morin.1998@free.fr>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
 <24d0ff88170493e141dd07c29c3bcf262a67692f.1421582718.git.yann.morin.1998@free.fr>
Message-ID: <CAGm1_ksf4gvkx5A4PjxDax=ZQvewETuQL=O5=BmZ8h=UrNrKYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 18, 2015 at 1:11 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The lxml XML toolkit is a Pythonic binding for the C libraries libxml2
> and libxslt.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ---
> This is a host-only package for now, because I only needed it to build
> opengl-registry.
> ---
>  package/python-lxml/python-lxml.hash |  2 ++
>  package/python-lxml/python-lxml.mk   | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 package/python-lxml/python-lxml.hash
>  create mode 100644 package/python-lxml/python-lxml.mk
>
> diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
> new file mode 100644
> index 0000000..470a245
> --- /dev/null
> +++ b/package/python-lxml/python-lxml.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  069594837d0376a1bacf5cc42aa9a1be2e1c1396dc62f7d07f7358afecd34adf  lxml-3.4.1.tgz
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> new file mode 100644
> index 0000000..758ce87
> --- /dev/null
> +++ b/package/python-lxml/python-lxml.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# python-lxml
> +#
> +################################################################################
> +
> +PYTHON_LXML_VERSION = 3.4.1
> +PYTHON_LXML_SITE = http://lxml.de/files
> +PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
> +
> +# Not including the GPL, because it is used only for the test scripts.
> +PYTHON_LXML_LICENSE = BSD-3c, Others
> +PYTHON_LXML_LICENSE_FILES = \
> +       LICENSES.txt \
> +       doc/licenses/BSD.txt \
> +       doc/licenses/elementtree.txt \
> +       src/lxml/isoschematron/resources/rng/iso-schematron.rng
> +
> +# python-lxml can use either setuptools, or distutils as a fallback.
> +# So, we use setuptools.
> +PYTHON_LXML_SETUP_TYPE = setuptools
> +
> +PYTHON_LXML_DEPENDENCIES = libxml2 libxslt
> +
> +$(eval $(host-python-package))

Trying to build lxml as normal package and get following error:

running build_ext
building 'lxml.etree' extension
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/src
creating build/temp.linux-x86_64-2.7/src/lxml
/home/user/Documents/versioned/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -fPIC
-I/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/src/lxml/includes
-I/home/user/Documents/versioned/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/python2.7
-c src/lxml/lxml.etree.c -o
build/temp.linux-x86_64-2.7/src/lxml/lxml.etree.o -w
In file included from src/lxml/lxml.etree.c:239:0:
/home/user/Documents/versioned/buildroot/output/build/python-lxml-3.4.1/src/lxml/includes/etree_defs.h:14:31:
fatal error: libxml/xmlversion.h: No such file or directory
 #include "libxml/xmlversion.h"
                               ^
compilation terminated.

What should I pass to setup.py? Should I pass include path to
include/libxml2? How does it work for the host-package?

Yegor
