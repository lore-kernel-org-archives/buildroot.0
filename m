From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 14 Sep 2016 13:34:55 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: add patch to get
	pkg-config file
In-Reply-To: <20160914093428.19378-1-joerg.krause@embedded.rocks>
References: <20160914093428.19378-1-joerg.krause@embedded.rocks>
Message-ID: <1473852895.19492.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2016-09-14 at 11:34 +0200, J?rg Krause wrote:
> Apply a patch from upstream to install a pkg-config file for
> libupnpp.
> 
> Add a note to the .mk file that autoreconf is necessary for this
> patch, too.
> 
> Fetch from:
> https://github.com/medoc92/libupnpp/commit/9f03bb0e7b47e2843edea6f25e
> d9eabbfb6412df
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> ?package/libupnpp/0002-Add-pkg-config-file.patch | 63
> +++++++++++++++++++++++++
> ?package/libupnpp/libupnpp.mk????????????????????|??4 +-
> ?2 files changed, 66 insertions(+), 1 deletion(-)
> ?create mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch
> 
> diff --git a/package/libupnpp/0002-Add-pkg-config-file.patch
> b/package/libupnpp/0002-Add-pkg-config-file.patch
> new file mode 100644
> index 0000000..377b5e0
> --- /dev/null
> +++ b/package/libupnpp/0002-Add-pkg-config-file.patch
> @@ -0,0 +1,63 @@
> +From 22ec8e3a2b54a4e1fd1340a592f49829d6cde735 Mon Sep 17 00:00:00
> 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Sun, 11 Sep 2016 22:26:33 +0200
> +Subject: [PATCH] Add pkg-config file
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Add a pkg-config file.
> +
> +Fetched from:
> +https://github.com/medoc92/libupnpp/commit/9f03bb0e7b47e2843edea6f25
> ed9eabbfb6412df
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + Makefile.am????|??3 +++
> + configure.ac???|??1 +
> + libupnpp.pc.in | 12 ++++++++++++
> + 3 files changed, 16 insertions(+)
> + create mode 100644 libupnpp.pc.in
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 2d20b9b..39559e9 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -112,3 +112,6 @@ nobase_include_HEADERS = \
> + libupnpp_la_LDFLAGS = -version-info $(VERSION_INFO)
> +?
> + libupnpp_la_LIBADD = $(LIBUPNPP_LIBS)
> ++
> ++pkgconfigdir = $(libdir)/pkgconfig
> ++pkgconfig_DATA = libupnpp.pc
> +diff --git a/configure.ac b/configure.ac
> +index 9ff2058..89525b3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -90,4 +90,5 @@ AC_SUBST(LIBUPNPP_LIBS)
> + AC_SUBST(VERSION_INFO)
> +?
> + AC_CONFIG_FILES([Makefile])
> ++AC_CONFIG_FILES([libupnpp.pc])
> + AC_OUTPUT
> +diff --git a/libupnpp.pc.in b/libupnpp.pc.in
> +new file mode 100644
> +index 0000000..90f4b2b
> +--- /dev/null
> ++++ b/libupnpp.pc.in
> +@@ -0,0 +1,12 @@
> ++prefix=@prefix@
> ++exec_prefix=@exec_prefix@
> ++libdir=@libdir@
> ++includedir=@includedir@
> ++
> ++Name: @PACKAGE_NAME@
> ++Description: C++ wrapper for libupnp
> ++Version: @PACKAGE_VERSION@
> ++Requires: libcurl libupnp
> ++Libs: -L${libdir} -lupnpp
> ++Libs.private: -lexpat -lpthread -lrt
> ++Cflags: -I${includedir}
> +--?
> +2.9.3
> +
> diff --git a/package/libupnpp/libupnpp.mk
> b/package/libupnpp/libupnpp.mk
> index ab1ce8b..d712c21 100644
> --- a/package/libupnpp/libupnpp.mk
> +++ b/package/libupnpp/libupnpp.mk
> @@ -10,7 +10,9 @@ LIBUPNPP_LICENSE = GPLv2+
> ?LIBUPNPP_LICENSE_FILES = COPYING
> ?LIBUPNPP_INSTALL_STAGING = YES
> ?LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
> -# touching configure.ac in 0001-Check-for-std-future.patch
> +# touching configure.ac in:
> +#???0001-Check-for-std-future.patch
> +#???0002-Add-pkg-config-file.patch
> ?LIBUPNPP_AUTORECONF = YES
> ?
> ?# configure script fails to link against the dependencies of libupnp

I'll resend this patch as part of a set of patches to fix issues with
upmpdcli.

Best regards
J?rg Krause
