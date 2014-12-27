From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 17:45:19 +0100
Subject: [Buildroot] [PATCHv2 2/3] libxmlrpc: improve curl-config patch
In-Reply-To: <1419697556-32541-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419697556-32541-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419697556-32541-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227164519.GJ4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 17:25 +0100, Thomas Petazzoni spake thusly:
> The curl-config patch that makes sure to not use curl-config from the
> PATH but the curl-config program specified at configure time was
> forgetting a number of other places. So we change the strategy, and
> make the configure.in script define a $CURL_CONFIG variable that can
> be used in Makefiles where appropriate.
> 
> This means we need to run autoconf (but not AUTORECONF = YES since the
> package uses autoconf but not automake).
> 
> This fixes build failures in cases where a curl-config program is in
> the PATH. Fixes:
> 
>   http://autobuild.buildroot.org/results/06b/06b7eada721483eb57adde147768a1f306b7d0d7/
>   (and many similar ones)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested against one of the autobuild failures, although I was not able
to reproduce it beforehand]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../libxmlrpc/0004-use-correct-curl-config.patch   | 82 ++++++++++++++++++++--
>  package/libxmlrpc/libxmlrpc.mk                     |  9 ++-
>  2 files changed, 86 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libxmlrpc/0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
> index ada0bd2..c0646d3 100644
> --- a/package/libxmlrpc/0004-use-correct-curl-config.patch
> +++ b/package/libxmlrpc/0004-use-correct-curl-config.patch
> @@ -1,9 +1,10 @@
>  Use correct curl-config program
>  
> -Instead of calling again curl-config in src/Makefile (which ends up
> +Instead of calling directly curl-config in src/Makefile (which ends up
>  calling the wrong curl-config: the one in the PATH instead of the one
> -pointed at by the environment variables at configure time), let's use
> -the CURL_LDADD variable which was computed at configure time.
> +pointed at by the environment variables at configure time), let's
> +define a CURL_CONFIG variable that contains the path to the proper
> +curl-config program, and use it where appropriate.
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  
> @@ -16,7 +17,80 @@ Index: b/src/Makefile
>     TRANSPORT_MODS += blddir/lib/curl_transport/curlmulti
>     TRANSPORT_MODS += blddir/lib/curl_transport/lock_pthread
>  -  TRANSPORT_LIBDEP += $(shell curl-config --libs)
> -+  TRANSPORT_LIBDEP += $(CURL_LDADD)
> ++  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
>   endif
>   ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
>     TRANSPORT_MODS += blddir/lib/libwww_transport/xmlrpc_libwww_transport
> +Index: b/config.mk.in
> +===================================================================
> +--- a/config.mk.in
> ++++ b/config.mk.in
> +@@ -32,6 +32,7 @@
> + LSOCKET = @LSOCKET@
> + WININET_LDADD = @WININET_LDADD@
> + WININET_LIBDIR = @WININET_LIBDIR@
> ++CURL_CONFIG = @CURL_CONFIG@
> + CURL_LDADD = @CURL_LDADD@
> + CURL_LIBDIR = @CURL_LIBDIR@
> + LIBWWW_LDADD = @LIBWWW_LDADD@
> +Index: b/configure.in
> +===================================================================
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -550,6 +550,8 @@
> +     dnl So we don't do any check now.  If we find out there's a problem with
> +     dnl older Curls, we will revisit that.
> + 
> ++    AC_SUBST(CURL_CONFIG)
> ++
> +     CURL_LDADD=$($CURL_CONFIG --libs)
> +     AC_SUBST(CURL_LDADD)
> + 
> +Index: b/lib/curl_transport/Makefile
> +===================================================================
> +--- a/lib/curl_transport/Makefile
> ++++ b/lib/curl_transport/Makefile
> +@@ -29,7 +29,7 @@
> + 
> + $(SRCDIR)/common.mk: srcdir blddir
> + 
> +-CURL_VERSION := $(shell curl-config --vernum)
> ++CURL_VERSION := $(shell $CURL_CONFIG --vernum)
> + 
> + # Some time at or before Curl 7.12, <curl/types.h> became an empty file
> + # (no-op).  Some time after Curl 7.18, <curl/types.h> ceased to exist.
> +@@ -43,7 +43,7 @@
> +   CFLAGS_LOCAL += -DNEED_CURL_TYPES_H
> + endif
> + 
> +-CURL_INCLUDES := $(shell curl-config --cflags)
> ++CURL_INCLUDES := $(shell $CURL_CONFIG --cflags)
> + # We expect that curl-config --cflags just gives us -I options, because
> + # we need just the -I options for 'make dep'.  Plus, it's scary to think
> + # of what any other compiler flag would do to our compile.
> +Index: b/src/cpp/test/Makefile
> +===================================================================
> +--- a/src/cpp/test/Makefile
> ++++ b/src/cpp/test/Makefile
> +@@ -20,7 +20,7 @@
> + LIBS := $(shell $(XMLRPC_C_CONFIG) client --ldadd)
> + 
> + ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
> +-  LIBS += $(shell curl-config --libs)
> ++  LIBS += $(shell $CURL_CONFIG --libs)
> + endif
> + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
> +   LIBS += $(shell libwww-config --libs)
> +Index: b/tools/common.mk
> +===================================================================
> +--- a/tools/common.mk
> ++++ b/tools/common.mk
> +@@ -15,7 +15,7 @@
> +   CLIENT_LDLIBS += $(shell libwww-config --libs)
> + endif
> + ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
> +-  CLIENT_LDLIBS += $(shell curl-config --libs)
> ++  CLIENT_LDLIBS += $(shell $CURL_CONFIG --libs)
> + endif
> + ifeq ($(MUST_BUILD_WININET_CLIENT),yes)
> +   CLIENT_LDLIBS += $(shell wininet-config --libs)
> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> index 1b771e2..c3788d6 100644
> --- a/package/libxmlrpc/libxmlrpc.mk
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -10,10 +10,17 @@ LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Su
>  LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
>  LIBXMLRPC_LICENSE_FILES = doc/COPYING
>  LIBXMLRPC_INSTALL_STAGING = YES
> -LIBXMLRPC_DEPENDENCIES = libcurl
> +LIBXMLRPC_DEPENDENCIES = libcurl host-autoconf
>  LIBXMLRPC_CONFIG_SCRIPTS = xmlrpc-c-config
>  LIBXMLRPC_MAKE = $(MAKE1)
>  
> +# Using autoconf, not automake, so we cannot use AUTORECONF = YES.
> +define LIBXMLRPC_RUN_AUTOCONF
> +       cd $(@D); $(HOST_DIR)/usr/bin/autoconf
> +endef
> +
> +LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
> +
>  LIBXMLRPC_CONF_OPTS = \
>  	$(if $(BR2_USE_WCHAR),,ac_cv_header_wchar_h=no) \
>  	$(if $(BR2_INSTALL_LIBSTDCPP),,--disable-cplusplus) \
> -- 
> 2.1.0
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
