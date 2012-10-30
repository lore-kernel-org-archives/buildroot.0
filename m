From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 13:48:56 +0100
Subject: [Buildroot] [PATCH] package: add linknx
In-Reply-To: <1351599843-24291-3-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351599843-24291-3-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121030134856.7240e871@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Hermant,

On Tue, 30 Oct 2012 13:24:02 +0100, Gregory Hermant wrote:
> +config BR2_PACKAGE_LINKNX
> +	bool "linknx"
> +	select BR2_PACKAGE_LIBPTHSEM
> +	help
> +	  Linknx is only one component of a bigger project.The goal is to get

Nitpick: missing space after dot.

> +	  the maximum comfort and flexibility from a KNX domotic system while
> +	  keeping the smallest possible resource consumption.

This explanation is not very helpful "Linknx is only one component of a
bigger project". Which bigger project?

> +
> +	  http://belnet.dl.sourceforge.net/sourceforge/linknx/
> +
> +if BR2_PACKAGE_LINKNX
> +
> +config BR2_PACKAGE_LINKNX_LUA
> +	bool "lua support"
> +	depends on BR2_PACKAGE_LINKNX

Dependency not needed, you are already inside a if
BR2_PACKAGE_LINKNX ... endif clause.

> +	select BR2_PACKAGE_LUA

I am not sure we want a 'select' here. For things that require 'big'
stuff like an interpreter, we generally use a 'depends on '.

> +	help
> +	  Enable Lua support.
> +
> +endif
> diff --git a/package/linknx/linknx-0.0.1.30-fix-pthsem-config-issue.patch b/package/linknx/linknx-0.0.1.30-fix-pthsem-config-issue.patch
> new file mode 100644
> index 0000000..82649f0
> --- /dev/null
> +++ b/package/linknx/linknx-0.0.1.30-fix-pthsem-config-issue.patch
> @@ -0,0 +1,33 @@
> +From 8129fd135b0674017854fd722105eb0558cd3987 Mon Sep 17 00:00:00 2001
> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
> +Date: Mon, 22 Oct 2012 15:29:43 +0200
> +Subject: [PATCH] Prevent pthsem-config script to return bad include path.
> +
> +During the bcusdk configuration step, the script pthsem-config
> +is used to return some parameters about the pthsem library location.
> +Unfortunately this script returns host include path and prevents
> +the bcusdk build.
> +
> +Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> +---
> + configure |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 843e017..f77d5a9 100755
> +--- a/configure
> ++++ b/configure
> +@@ -15958,8 +15958,8 @@ if test ".$with_pth" != .no; then
> +                                         if test ".$_pth_version" != .; then
> +                         _pth_location=`$_dir/pthsem-config --prefix`
> +                         _pth_type="installed"
> +-                        _pth_cppflags=`$_dir/pthsem-config --cflags`
> +-                        _pth_cflags=`$_dir/pthsem-config --cflags`
> ++#                       _pth_cppflags=`$_dir/pthsem-config --cflags`
> ++#                       _pth_cflags=`$_dir/pthsem-config --cflags`
> +                         _pth_ldflags=`$_dir/pthsem-config --ldflags`
> +                         _pth_libs=`$_dir/pthsem-config --libs --all`
> +                         _pth_found=yes

Same comment as previous package: fix pthsem-config instead of hacking
all other packages on top of it.

Or even better (but takes more time): add pkg-config support to all
those packages.

> +
> diff --git a/package/linknx/linknx-0.0.1.30-link-with-libdl-when-lua-enabled.patch b/package/linknx/linknx-0.0.1.30-link-with-libdl-when-lua-enabled.patch
> new file mode 100644
> index 0000000..22fea47
> --- /dev/null
> +++ b/package/linknx/linknx-0.0.1.30-link-with-libdl-when-lua-enabled.patch
> @@ -0,0 +1,27 @@
> +From 6e377c72555ffc5f9b729292b802440f155854d7 Mon Sep 17 00:00:00 2001
> +From: Gregory Hermant <gregory.hermant@calao-systems.com>
> +Date: Mon, 29 Oct 2012 17:45:43 +0100
> +Subject: [PATCH] Link with libdl when lua is enabled
> +
> +
> +Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> +---
> + src/Makefile.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.in b/src/Makefile.in
> +index 9eccf8d..90e02f0 100644
> +--- a/src/Makefile.in
> ++++ b/src/Makefile.in
> +@@ -184,7 +184,7 @@ top_build_prefix = @top_build_prefix@
> + top_builddir = @top_builddir@
> + top_srcdir = @top_srcdir@
> + AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LOG4CPP_CFLAGS) $(LUA_CFLAGS)
> +-linknx_LDADD = ../ticpp/libticpp.a $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) -lm
> ++linknx_LDADD = ../ticpp/libticpp.a $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) -lm -ldl
> + linknx_SOURCES = linknx.cpp logger.cpp ruleserver.cpp objectcontroller.cpp eibclient.c threads.cpp timermanager.cpp  persistentstorage.cpp xmlserver.cpp smsgateway.cpp emailgateway.cpp knxconnection.cpp services.cpp suncalc.cpp  luacondition.cpp ioport.cpp ruleserver.h objectcontroller.h threads.h timermanager.h persistentstorage.h xmlserver.h smsgateway.h emailgateway.h knxconnection.h services.h suncalc.h luacondition.h ioport.h logger.h
> + all: all-am
> + 
> +-- 
> +1.7.9.5
> +

The Makefile.am should be patched instead, and the package marked
_AUTORECONF=YES.

> diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
> new file mode 100644
> index 0000000..219eca4
> --- /dev/null
> +++ b/package/linknx/linknx.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# linknx
> +#
> +#############################################################
> +
> +LINKNX_VERSION = 0.0.1.30
> +LINKNX_SOURCE = linknx-${LINKNX_VERSION}.tar.gz
> +LINKNX_SITE = http://sourceforge.net/projects/linknx/files/linknx/linknx-0.0.1.30/

Please use a http://downloads.sourceforge.net URL, like we do for all
other Sourceforge-hosted packages.

> +LINKNX_LICENSE = GPLv2+
> +LINKNX_LICENSE_FILES = COPYING
> +LINKNX_INSTALL_STAGING = YES
> +LINKNX_INSTALL_TARGET = YES

Last line not needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
