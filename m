From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Jul 2016 01:36:08 +0200
Subject: [Buildroot] [PATCH 3/3] package/transmission: add optional
 support for libminiupnpc/libnatpmp
In-Reply-To: <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <624cdb0c-6839-8b5b-3928-bc730bbc2a9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-07-16 00:18, Bernd Kuhls wrote:
> Transmission bundles copies of both libraries and uses them if they are
> not provided by the system. This patch allows transmission to use the
> system libraries of libminiupnpc/libnatpmp.

 Our policy up to now has always been to never use the bundled versions if we
package the system version.

 However, how is it possible that these packages depend on !STATIC while
transmission does not? !FLAT is implied in USE_MMU so that one is OK.

 Regards,
 Arnout

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/transmission/0003-miniupnpc-cross.patch | 31 +++++++++++++++++++++++++
>  package/transmission/transmission.mk            | 11 +++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 package/transmission/0003-miniupnpc-cross.patch
> 
> diff --git a/package/transmission/0003-miniupnpc-cross.patch b/package/transmission/0003-miniupnpc-cross.patch
> new file mode 100644
> index 0000000..5037c2e
> --- /dev/null
> +++ b/package/transmission/0003-miniupnpc-cross.patch
> @@ -0,0 +1,31 @@
> +Fix libminiupnpc version detection
> +
> +Problem is known upstream: https://trac.transmissionbt.com/ticket/6140
> +
> +For buildroot we know the libminiupnpc version so we hard-code 2.0.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
> +--- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
> ++++ transmission-2.92/configure.ac	2016-07-02 21:48:13.452385686 +0200
> +@@ -386,18 +386,7 @@
> + dnl MINIUPNPC_API_VERSION and we won't have to figure
> + dnl it out on our own
> + if test "x$upnp_version" = "xunknown" ; then
> +-  AC_RUN_IFELSE(
> +-    [AC_LANG_PROGRAM(
> +-      [#include <stdlib.h>
> +-       #include <miniupnpc/miniupnpc.h>],
> +-      [#ifdef MINIUPNPC_API_VERSION
> +-       return EXIT_SUCCESS;
> +-       #else
> +-       return EXIT_FAILURE;
> +-       #endif]
> +-    )],
> +-    [upnp_version=">= 1.7"]
> +-  )
> ++  upnp_version="2.0"
> + fi
> + 
> + dnl Or maybe it's miniupnp 1.6
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index c8d3773..e0cfc2d 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -21,6 +21,17 @@ TRANSMISSION_CONF_OPTS = \
>  TRANSMISSION_LICENSE = GPLv2 or GPLv3 with OpenSSL exception
>  TRANSMISSION_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
> +TRANSMISSION_DEPENDENCIES += libminiupnpc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBNATPMP),y)
> +TRANSMISSION_DEPENDENCIES += libnatpmp
> +TRANSMISSION_CONF_OPTS += --enable-external-natpmp
> +else
> +TRANSMISSION_CONF_OPTS += --disable-external-natpmp
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
>  TRANSMISSION_CONF_OPTS += --enable-utp
>  else
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
