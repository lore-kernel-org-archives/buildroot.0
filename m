From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Sep 2015 00:00:58 +0200
Subject: [Buildroot] [PATCH 3/3] Adding support for uclibcpp library
In-Reply-To: <1442127768-26447-3-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <1442127768-26447-3-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <20150914000058.778ddf3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

The commit title should probably be:

	toolchain: add support for the uclibcpp library

On Sun, 13 Sep 2015 03:02:48 -0400, Chris Wardman wrote:
> uclibcpp is built as an alternative to the standard libstdc++ library

The question is how does it replace the libstdc++ provided by gcc? Does
it simply overwrite it? So you're building C++ support in gcc normally
and then overwrite the libstdc++ from gcc with uclibcpp ?

Also, how compatible is it with the C++ standard? I.e will people be
able to build arbitrary C++ libraries/applications with this smaller
C++ library, or is it limited to a certain subset of the C++ standard?

> diff --git a/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch b/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch
> new file mode 100644
> index 0000000..851b87e
> --- /dev/null
> +++ b/package/uclibcpp/0.2.4/uclibcpp-0001-minor-fixes.patch

The patches shouldn't start with the package name, so a proper name is:

	0001-minor-fixes.patch

However, I believe this patch is really mixing too many things. Can you
split this uclibcpp patch into smaller piece, each fixing one
particular problem?

Also, since we're supporting only one version of uclibcpp at a time,
there is no need to put the patch in a 0.2.4/ subdirectory of
package/uclibcpp/. Just put them directly in package/uclibcpp.

> +I have no clude why they wrote the Unwind_Exception_Class variable that way, but that doesn't compile

Please wrap the patch description to 80 columns, and don't use first
person wording.

> +diff -uNr uClibc++-0.2.4/src/_ct_chr.cpp uc_new/src/_ct_chr.cpp
> +--- uClibc++-0.2.4/src/_ct_chr.cpp	1969-12-31 19:00:00.000000000 -0500
> ++++ uc_new/src/_ct_chr.cpp	2015-01-15 16:29:21.478634145 -0500
> +@@ -0,0 +1,18 @@
> ++#include <_ansi.h>
> ++#include <ctype.h>
> ++
> ++int _DEFUN(isspace, (c),int c){
> ++  switch(c){
> ++  case ' ': 
> ++  case '\r':
> ++  case '\n':
> ++  case '\b':
> ++  case '\t':
> ++    return true;
> ++  }
> ++  return false;
> ++}
> ++
> ++int _DEFUN(isdigit, (c), int c){
> ++  return ('0' <= c && c <= '9');
> ++}

newlib is not providing isspace() and isdigit() ?

> diff --git a/package/uclibcpp/Config.in b/package/uclibcpp/Config.in
> new file mode 100644
> index 0000000..d0a962a
> --- /dev/null
> +++ b/package/uclibcpp/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_UCLIBCPP
> +       bool "uClibc++ C++ library"
> +       depends on BR2_TOOLCHAIN_BUILDROOT_NEWLIB
> +       depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> +       help

Please use tab for indentation.

> +	Uclibc++ library support. Smaller than libvstdc++

And one tab + two spaces for the help text. Also, fix the typo in the
description (libvstdc++ -> libstdc++) and maybe extend the description
with more details (difference between the original libstdc++ and
uclibcpp one).

> +
> +
> +

Unneeded empty lines.

> diff --git a/package/uclibcpp/uclibcpp.config b/package/uclibcpp/uclibcpp.config
> new file mode 100644
> index 0000000..4e2d0ec
> --- /dev/null
> +++ b/package/uclibcpp/uclibcpp.config
> @@ -0,0 +1,54 @@
> +#
> +# Automatically generated make config: don't edit
> +#
> +
> +#
> +# Target Features and Options
> +#
> +UCLIBCXX_HAS_FLOATS=y
> +UCLIBCXX_HAS_LONG_DOUBLE=y
> +UCLIBCXX_HAS_TLS=y
> +WARNINGS="-Wall"
> +BUILD_EXTRA_LIBRARIES=""
> +HAVE_DOT_CONFIG=y
> +
> +#
> +# String and I/O Stream Support
> +#
> +# UCLIBCXX_HAS_WCHAR is not set
> +UCLIBCXX_IOSTREAM_BUFSIZE=32
> +UCLIBCXX_HAS_LFS=y
> +UCLIBCXX_SUPPORT_CDIR=y
> +UCLIBCXX_SUPPORT_CIN=y
> +UCLIBCXX_SUPPORT_COUT=y
> +UCLIBCXX_SUPPORT_CERR=y
> +# UCLIBCXX_SUPPORT_CLOG is not set
> +
> +#
> +# STL and Code Expansion
> +#
> +UCLIBCXX_STL_BUFFER_SIZE=32
> +UCLIBCXX_CODE_EXPANSION=y
> +UCLIBCXX_EXPAND_CONSTRUCTORS_DESTRUCTORS=y
> +UCLIBCXX_EXPAND_STRING_CHAR=y
> +UCLIBCXX_EXPAND_VECTOR_BASIC=y
> +UCLIBCXX_EXPAND_IOS_CHAR=y
> +UCLIBCXX_EXPAND_STREAMBUF_CHAR=y
> +UCLIBCXX_EXPAND_ISTREAM_CHAR=y
> +UCLIBCXX_EXPAND_OSTREAM_CHAR=y
> +UCLIBCXX_EXPAND_FSTREAM_CHAR=y
> +UCLIBCXX_EXPAND_SSTREAM_CHAR=y
> +
> +#
> +# Library Installation Options
> +#
> +UCLIBCXX_RUNTIME_PREFIX="/usr"
> +UCLIBCXX_RUNTIME_INCLUDE_SUBDIR="/include"
> +UCLIBCXX_RUNTIME_LIB_SUBDIR="/lib"
> +UCLIBCXX_RUNTIME_BIN_SUBDIR="/bin"
> +UCLIBCXX_EXCEPTION_SUPPORT=y
> +IMPORT_LIBSUP=y
> +# IMPORT_LIBGCC_EH is not set
> +BUILD_STATIC_LIB=y
> +BUILD_ONLY_STATIC_LIB=y
> +# DODEBUG is not set
> diff --git a/package/uclibcpp/uclibcpp.mk b/package/uclibcpp/uclibcpp.mk
> new file mode 100644
> index 0000000..dfe8ede
> --- /dev/null
> +++ b/package/uclibcpp/uclibcpp.mk
> @@ -0,0 +1,28 @@

Missing comment header. Also please add a hash file (see
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash).
Maybe I forgot to say that in my review of your newlib package, but
please do it there as well.

> +UCLIBCPP_VERSION = 0.2.4
> +UCLIBCPP_SOURCE = uClibc++-$(UCLIBCPP_VERSION).tar.bz2

The last version is from May 2012, like uClibc itself. Is it a dead
project like uClibc ? If so, then I'm a bit worried in packaging
something so fundamental as the standard C++ library if it isn't
maintained.

There has been a few commits since the last release, see
http://git.uclibc.org/uClibc++/log/. But it still doesn't seem to be
very active. According to the website, there is not even a mailing list
for it.

You could use the .tar.xz tarball instead of .tar.bz2.

> +UCLIBCPP_LICENSE = LGPLv3

Some quick inspection indicates LGPLv2.1+

> +UCLIBCPP_SITE = http://cxx.uclibc.org/src/
> +
> +UCLIBCPP_INSTALL_STAGING = YES
> +
> +UCLIBCPP_DEPENDENCIES = host-gcc-final

All target packages depend on "toolchain", which has host-gcc-final as
part of its dependencies. However maybe, what you need is to have this
uclibcpp package built *before* any other target package that uses C++,
no? If so, then toolchain/toolchain/toolchain.mk needs to be modified
to add uclibcpp as a dependency when it is enabled. And of course,
uclibcpp.mk should specify UCLIBCPP_ADD_TOOLCHAIN_DEPENDENCY = NO.

> +
> +UCLIBCPP_KCONFIG_FILE = $(TOPDIR)/package/uclibcpp/uclibcpp.config

$(TOPDIR)/ not needed.

> +
> +UCLIBCPP_MAKE_FLAGS = CROSS=$(TARGET_CROSS)
> +
> +define UCLIBCPP_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(UCLIBCPP_MAKE_FLAGS)
> +endef
> +
> +define UCLIBCPP_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR) install
> +endef
> +
> +define UCLIBCPP_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
> +endef
> +
> +$(eval $(kconfig-package))
> +
> +

Unneeded empty lines at the end of the file.

> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 88ebe8c..3904f44 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -60,5 +60,6 @@ endchoice
>  source "toolchain/toolchain-buildroot/Config.in"
>  source "toolchain/toolchain-external/Config.in"
>  source "toolchain/toolchain-common.in"
> +source "package/uclibcpp/Config.in"

This should go in toolchain/toolchain-buildroot/Config.in.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
