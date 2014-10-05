From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 12:08:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/libplist: fix python support
In-Reply-To: <1412502007-9902-2-git-send-email-s.martin49@gmail.com>
References: <1412502007-9902-1-git-send-email-s.martin49@gmail.com>
 <1412502007-9902-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20141005100843.GE4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-10-05 11:40 +0200, Samuel Martin spake thusly:
> This patch:
> - fixes the python3 support detection in the libplist CMake code;
> - correctly sets the dependencies and configure options in libplist.mk.

Rather than trying to fix a 3-year old release (1.6), can't we have a look at
bumping to the latest release, 1.11, which is 'only' 6-month old?

I'll give it a spin.

Regards,
Yann E. MORIN.

> Fixes:
>   http://autobuild.buildroot.net/results/efb/efba806b9a40a5e9c6bca7e591747ca2102fa1d5/
> 
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...support-python2-and-python3-when-defining.patch | 27 ++++++++++++++++++++++
>  package/libplist/libplist.mk                       | 13 +++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
> 
> diff --git a/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch b/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
> new file mode 100644
> index 0000000..a5218e8
> --- /dev/null
> +++ b/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
> @@ -0,0 +1,27 @@
> +From 114d242a3b6b749b404cda80304e621556325d34 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Sun, 5 Oct 2014 10:13:06 +0200
> +Subject: [PATCH] cmake: swig: support python2 and python3 when defining
> + DISTUTILS_PYTHON_ILIBRARY_PATH
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + swig/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/swig/CMakeLists.txt b/swig/CMakeLists.txt
> +index 379cb95..ae6f0e7 100644
> +--- a/swig/CMakeLists.txt
> ++++ b/swig/CMakeLists.txt
> +@@ -9,7 +9,7 @@ SWIG_ADD_MODULE( plist python plist.i )
> + SWIG_LINK_LIBRARIES( plist plist plist++ ${PYTHON_LIBRARIES} )
> + 
> + EXEC_PROGRAM("${PYTHON_EXECUTABLE}"
> +-    ARGS "-c 'try:\n import distutils.sysconfig; print distutils.sysconfig.get_python_lib(plat_specific=1)\nexcept: pass\n'"
> ++    ARGS "-c 'from __future__ import print_function\ntry:\n import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))\nexcept: pass\n'"
> +     OUTPUT_VARIABLE DISTUTILS_PYTHON_ILIBRARY_PATH
> +     )
> + 
> +-- 
> +2.1.2
> +
> diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
> index 87f09c6..1e44fff 100644
> --- a/package/libplist/libplist.mk
> +++ b/package/libplist/libplist.mk
> @@ -12,4 +12,17 @@ LIBPLIST_MAKE = $(MAKE1)
>  LIBPLIST_LICENSE = LGPLv2.1+
>  LIBPLIST_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> +LIBPLIST_DEPENDENCIES += \
> +	python$(if $(BR2_PACKAGE_PYTHON3),3) \
> +	host-swig
> +LIBPLIST_CONF_OPTS += \
> +	-DENABLE_PYTHON=ON \
> +	-DSWIG_EXECUTABLE=$(SWIG)
> +else
> +LIBPLIST_CONF_OPTS += \
> +	-DENABLE_PYTHON=OFF \
> +	-DSWIG_EXECUTABLE=SWIG_EXECUTABLE-NOTFOUND
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
