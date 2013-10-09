From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 15:09:02 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <1381320976-948-1-git-send-email-alvaro.gamez@hazent.com>
References: <CAM+bi4vJbFEGdDKMjJxesqR8T=g=KQkgeZpaLNy=1L_FsDkrPA@mail.gmail.com>
 <1381320976-948-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

On Wed, Oct 9, 2013 at 2:16 PM, Alvaro G. M <alvaro.gamez@hazent.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/Config.in                                  |  1 +
>  package/libxmlrpc/Config.in                        | 10 ++++++++
>  .../libxmlrpc-01-fix-gennmtab-build.patch          | 25 ++++++++++++++++++
>  .../libxmlrpc-02-fix-non-cplusplus-build.patch     | 27 +++++++++++++++++++
>  .../libxmlrpc/libxmlrpc-03-non-wchar-build.patch   | 24 +++++++++++++++++
>  .../libxmlrpc-04-use-correct-curl-config.patch     | 22 ++++++++++++++++
>  package/libxmlrpc/libxmlrpc.mk                     | 30 ++++++++++++++++++++++
>  7 files changed, 139 insertions(+)
>  create mode 100644 package/libxmlrpc/Config.in
>  create mode 100644 package/libxmlrpc/libxmlrpc-01-fix-gennmtab-build.patch
>  create mode 100644 package/libxmlrpc/libxmlrpc-02-fix-non-cplusplus-build.patch
>  create mode 100644 package/libxmlrpc/libxmlrpc-03-non-wchar-build.patch
>  create mode 100644 package/libxmlrpc/libxmlrpc-04-use-correct-curl-config.patch
>  create mode 100644 package/libxmlrpc/libxmlrpc.mk

We have had a long discussion on two buildroot developer days about
the format of the number in patch names. I thought we had decided to
use a four-digit format to correspond to the patches generated with
git. So this should be 0001, 0002, etc.
However, this may be mis-remembered by me, so I'm including some of
the people involved in that discussion to this mail...

>
> diff --git a/package/Config.in b/package/Config.in
> index 9aa9d81..3c44f67 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -727,6 +727,7 @@ source "package/libjson/Config.in"
>  source "package/libroxml/Config.in"
>  source "package/libxml-parser-perl/Config.in"
>  source "package/libxml2/Config.in"
> +source "package/libxmlrpc/Config.in"
>  source "package/libxmlpp/Config.in"

This alphabetical order is not correct, libxmlrpc should come after libxmlpp.

>  source "package/libxslt/Config.in"
>  source "package/libyaml/Config.in"
> diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
> new file mode 100644
> index 0000000..26e4a52
> --- /dev/null
> +++ b/package/libxmlrpc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBXMLRPC
> +       bool "libxmlrpc"
> +       select BR2_PACKAGE_LIBCURL
> +       help
> +         XML-RPC is a quick-and-easy way to make procedure calls over
> +         the Internet. It converts the procedure call into an XML
> +         document, sends it to a remote server using HTTP, and gets
> +         back the response as XML.
> +
> +         http://xmlrpc-c.sourceforge.net/
> diff --git a/package/libxmlrpc/libxmlrpc-01-fix-gennmtab-build.patch b/package/libxmlrpc/libxmlrpc-01-fix-gennmtab-build.patch
> new file mode 100644
> index 0000000..8cdd932
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc-01-fix-gennmtab-build.patch
> @@ -0,0 +1,25 @@
> +Fix build of host tool
> +
> +genmtab is a tool that needs to be built for the host as it is used
> +during the compilation process of libxmlrpc. Its Makefile needs a bit
> +of tuning to use the conventional CC_FOR_BUILD, CFLAGS_FOR_BUILD and
> +LDFLAGS_FOR_BUILD variables.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/lib/expat/gennmtab/Makefile
> +===================================================================
> +--- a/lib/expat/gennmtab/Makefile
> ++++ b/lib/expat/gennmtab/Makefile
> +@@ -40,9 +40,9 @@
> + dep: dep-common
> +
> + gennmtab.o:%.o:%.c
> +-      $(BUILDTOOL_CC) -c $< -o $@ $(CFLAGS_ALL) $(INCLUDES)
> ++      $(CC_FOR_BUILD) -c $< -o $@ $(CFLAGS_FOR_BUILD) $(INCLUDES)
> +
> + gennmtab:%:%.o
> +-      $(BUILDTOOL_CCLD) -o $@ $(LDFLAGS) $^
> ++      $(CC_FOR_BUILD) -o $@ $(LDFLAGS_FOR_BUILD) $^
> +
> + include depend.mk
> diff --git a/package/libxmlrpc/libxmlrpc-02-fix-non-cplusplus-build.patch b/package/libxmlrpc/libxmlrpc-02-fix-non-cplusplus-build.patch
> new file mode 100644
> index 0000000..efeb9cc
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc-02-fix-non-cplusplus-build.patch
> @@ -0,0 +1,27 @@
> +Handle builds without C++
> +
> +libxmlrpc nicely handles the fact of being built without C++ support,
> +except for one location, fixed by this patch.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/lib/util/Makefile
> +===================================================================
> +--- a/lib/util/Makefile
> ++++ b/lib/util/Makefile
> +@@ -41,11 +41,14 @@
> + LIBOBJS = \
> +   casprintf.o \
> +   cmdline_parser.o \
> +-  cmdline_parser_cpp.o \
> +   getoptx.o \
> +   string_parser.o \
> +   stripcaseeq.o \
> +
> ++ifeq ($(ENABLE_CPLUSPLUS),yes)
> ++LIBOBJS += cmdline_parser_cpp.o
> ++endif
> ++
> + .PHONY: all
> + all: $(LIBOBJS)
> +
> diff --git a/package/libxmlrpc/libxmlrpc-03-non-wchar-build.patch b/package/libxmlrpc/libxmlrpc-03-non-wchar-build.patch
> new file mode 100644
> index 0000000..1f04353
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc-03-non-wchar-build.patch
> @@ -0,0 +1,24 @@
> +Disable wide-char specific code
> +
> +The vast majority of the libxmlrpc code nicely handles the absence of
> +wide char support, except at one location, which is fixed by this
> +patch.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/src/xmlrpc_decompose.c
> +===================================================================
> +--- a/src/xmlrpc_decompose.c
> ++++ b/src/xmlrpc_decompose.c
> +@@ -217,7 +217,11 @@
> +         xmlrpc_strfree(*decompRootP->store.Tstring.valueP);
> +         break;
> +     case 'w':
> ++#if HAVE_UNICODE_WCHAR
> +         free((void*)*decompRootP->store.TwideString.valueP);
> ++#else
> ++      XMLRPC_ASSERT(false);
> ++#endif
> +         break;
> +     case '6':
> +         free((void*)*decompRootP->store.TbitString.valueP);
> diff --git a/package/libxmlrpc/libxmlrpc-04-use-correct-curl-config.patch b/package/libxmlrpc/libxmlrpc-04-use-correct-curl-config.patch
> new file mode 100644
> index 0000000..ada0bd2
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc-04-use-correct-curl-config.patch
> @@ -0,0 +1,22 @@
> +Use correct curl-config program
> +
> +Instead of calling again curl-config in src/Makefile (which ends up
> +calling the wrong curl-config: the one in the PATH instead of the one
> +pointed at by the environment variables at configure time), let's use
> +the CURL_LDADD variable which was computed at configure time.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/src/Makefile
> +===================================================================
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -56,7 +56,7 @@
> +   TRANSPORT_MODS += blddir/lib/curl_transport/curltransaction
> +   TRANSPORT_MODS += blddir/lib/curl_transport/curlmulti
> +   TRANSPORT_MODS += blddir/lib/curl_transport/lock_pthread
> +-  TRANSPORT_LIBDEP += $(shell curl-config --libs)
> ++  TRANSPORT_LIBDEP += $(CURL_LDADD)
> + endif
> + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
> +   TRANSPORT_MODS += blddir/lib/libwww_transport/xmlrpc_libwww_transport
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> new file mode 100644
> index 0000000..956dae9
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# libxmlrpc
> +#
> +################################################################################
> +
> +LIBXMLRPC_VERSION = 1.25.26
> +LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
> +LIBXMLRPC_SITE = "http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/1.25.26"

Why are there quotes around the URL?

> +LIBXMLRPC_LICENSE = BSD-like, Expat, Python 1.5.2 License
> +LIBXMLRPC_LICENSE_FILES = doc/COPYING

Are these three licenses used on identifyable parts of libxmlrpc, such
that you could be more specific, like
BSD-like (partA), Expat (partB) etc.?

Also, what exactly do you mean with BSD-like? Is it possible to map
onto one of the standard strings specified in
http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses
?

And finally, if there are three licenses, I'd expect three license
files, unless the file doc/COPYING accumulates the license texts of
all three licenses. Can you confirm?

> +LIBXMLRPC_INSTALL_STAGING = YES
> +LIBXMLRPC_DEPENDENCIES = libcurl
> +LIBXMLRPC_CONFIG_SCRIPTS = xmlrpc-c-config
> +
> +LIBXMLRPC_CONF_OPT = \
> +       $(if $(BR2_USE_WCHAR),,ac_cv_header_wchar_h=no) \
> +       $(if $(BR2_INSTALL_LIBSTDCPP),,--disable-cplusplus) \
> +       have_curl_config=$(STAGING_DIR)/usr/bin/curl-config \
> +       CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config
> +
> +# Our package uses autoconf, but not automake, so we need to pass
> +# those variables at compile time as well.
> +LIBXMLRPC_MAKE_ENV = \
> +       CC_FOR_BUILD="$(HOSTCC)" \
> +       LD_FOR_BUILD="$(HOSTLD)" \
> +       CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
> +       LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
> +
> +$(eval $(autotools-package))
> --

Best regards,
Thomas
