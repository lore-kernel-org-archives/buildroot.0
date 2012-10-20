From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 17:55:38 +0200
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <5082C97A.4090207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/09/12 16:29, Stefan Fr?berg wrote:
>
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>

  Finally got 'round to reviewing this patch.  Review only, no testing.

> ---
>   package/gnash/Config.in                            |   20 +++
>   package/gnash/gnash-0.8.10-amf-include.patch       |   45 +++++
>   package/gnash/gnash-0.8.10-cve-2012-1175.patch     |   63 +++++++
>   package/gnash/gnash-0.8.10-external-dejagnu.patch  |   24 +++
>   package/gnash/gnash-0.8.10-gettext-macro.patch     |  170 ++++++++++++++++++++
>   package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch |   52 ++++++
>   package/gnash/gnash-0.8.10-kde4-libdir.patch       |   12 ++
>   package/gnash/gnash-0.8.10-klash.patch             |   12 ++
>   package/gnash/gnash-0.8.10-npapi-sdk.patch         |   29 ++++
>   package/gnash/gnash.mk                             |   45 +++++
>   10 files changed, 472 insertions(+), 0 deletions(-)
>   create mode 100644 package/gnash/Config.in
>   create mode 100644 package/gnash/gnash-0.8.10-amf-include.patch
>   create mode 100644 package/gnash/gnash-0.8.10-cve-2012-1175.patch
>   create mode 100644 package/gnash/gnash-0.8.10-external-dejagnu.patch
>   create mode 100644 package/gnash/gnash-0.8.10-gettext-macro.patch
>   create mode 100644 package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch
>   create mode 100644 package/gnash/gnash-0.8.10-kde4-libdir.patch
>   create mode 100644 package/gnash/gnash-0.8.10-klash.patch
>   create mode 100644 package/gnash/gnash-0.8.10-npapi-sdk.patch
>   create mode 100644 package/gnash/gnash.mk
>
> diff --git a/package/gnash/Config.in b/package/gnash/Config.in
> new file mode 100644
> index 0000000..437b8d8
> --- /dev/null
> +++ b/package/gnash/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_GNASH
> +	bool "Enable Adobe Flash support with GNU gnash"
> +	select BR2_PACKAGE_AGG
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_GST_FFMPEG
> +	select BR2_PACKAGE_GCONF
> +	select BR2_PACKAGE_GIFLIB
> +	select BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_FIREFOX

  Gnash is a stand-alone executable, no?  It can also run without
firefox, right?

> +	help
> +	  Gnash is the GNU Flash movie player and browser plugin. This is useful for watching
> +	  YouTube videos or simple flash animations.
> +
> +	  Currently, Gnash can play SWF files up to version 7, and 80% of ActionScript 2.0.
> +	  For full, open source Flash support you could try to use Lightspark with Gnash.
> +	  That is, for newer SWF files Lightspark will be used and it will fallback to
> +	  using Gnash with older versions.

  Word wrap help text at 80 columns (where tab counts as 8).

> +
> +	  http://ftp.gnu.org/pub/gnu/gnash

  http://www.gnashdev.org/ or http://www.gnu.org/software/gnash/ seems
more appropriate.

> +

  Trailing empty line.

> diff --git a/package/gnash/gnash-0.8.10-amf-include.patch b/package/gnash/gnash-0.8.10-amf-include.patch
> new file mode 100644
> index 0000000..983fa6b
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-amf-include.patch
> @@ -0,0 +1,45 @@

  Missing explanation + SOB.

> +diff -ur a/cygnal/libnet/cque.h b/cygnal/libnet/cque.h
> +--- a/cygnal/libnet/cque.h	2012-01-19 20:17:47.000000000 +0100
> ++++ b/cygnal/libnet/cque.h	2012-02-23 20:13:39.000000000 +0100
> +@@ -25,8 +25,9 @@
> + #include<boost/thread/condition.hpp>
> + #include<deque>
> +
> ++#include "../libamf/amf.h"
> + #include "getclocktime.hpp"
> +-#include "buffer.h"
> ++#include "../libamf/buffer.h"

  That's weird...  It would seem that gnash wouldn't compile for anyone without
this patch...

> + #include "network.h"
> + #include "dsodefs.h" //For DSOEXPORT.
> +
> +diff -ur a/cygnal/libnet/sshclient.h b/cygnal/libnet/sshclient.h
> +--- a/cygnal/libnet/sshclient.h	2012-01-19 20:17:47.000000000 +0100
> ++++ b/cygnal/libnet/sshclient.h	2012-02-23 20:13:09.000000000 +0100
> +@@ -32,9 +32,10 @@
> + #include<libssh/sftp.h>
> + }
> +
> ++#include "../libamf/amf.h"
> + #include "cque.h"
> + #include "network.h"
> +-#include "buffer.h"
> ++#include "../libamf/buffer.h"
> +
> + namespace gnash
> + {
> +diff -ur a/cygnal/libnet/sslclient.h b/cygnal/libnet/sslclient.h
> +--- a/cygnal/libnet/sslclient.h	2012-01-19 20:17:47.000000000 +0100
> ++++ b/cygnal/libnet/sslclient.h	2012-02-23 20:13:21.000000000 +0100
> +@@ -36,10 +36,11 @@
> + #include<openssl/err.h>
> + #endif
> +
> ++#include "../libamf/amf.h"
> + #include "dsodefs.h"
> + #include "cque.h"
> + #include "network.h"
> +-#include "buffer.h"
> ++#include "../libamf/buffer.h"
> +
> +
> + namespace gnash
> diff --git a/package/gnash/gnash-0.8.10-cve-2012-1175.patch b/package/gnash/gnash-0.8.10-cve-2012-1175.patch
> new file mode 100644
> index 0000000..9a218d9
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-cve-2012-1175.patch
> @@ -0,0 +1,63 @@
> +From bb4dc77eecb6ed1b967e3ecbce3dac6c5e6f1527 Mon Sep 17 00:00:00 2001
> +From: Benjamin Wolsey<bwy@benjaminwolsey.de>
> +Date: Sat, 10 Mar 2012 14:52:50 +0000
> +Subject: Fix crash in GnashImage.cpp

  You still need to add your Signed-off-by tag here, to keep track of the
delivery path.  At least, that's how I interpret the rules.  Peter?

[snip]
> diff --git a/package/gnash/gnash-0.8.10-external-dejagnu.patch b/package/gnash/gnash-0.8.10-external-dejagnu.patch
> new file mode 100644
> index 0000000..eaffda7
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-external-dejagnu.patch
> @@ -0,0 +1,24 @@

  Missing explanation + SOB.

> +diff -ur a/plugin/npapi/test.cpp b/plugin/npapi/test.cpp
> +--- a/plugin/npapi/test.cpp	2011-03-13 17:47:36.000000000 +0100
> ++++ b/plugin/npapi/test.cpp	2011-03-20 23:52:20.369998096 +0100
> +@@ -35,7 +35,7 @@
> + #include "npfunctions.h"
> + #endif
> + #include "pluginbase.h"
> +-#include "dejagnu.h"
> ++#include<dejagnu.h>
> + #include "../../testsuite/check.h"
> + #include<regex.h>
> +
> +diff -ur a/testsuite/check.h b/testsuite/check.h
> +--- a/testsuite/check.h	2011-02-26 19:11:08.000000000 +0100
> ++++ b/testsuite/check.h	2011-03-20 23:52:32.570998094 +0100
> +@@ -29,7 +29,7 @@
> +
> + #define HAVE_DEJAGNU_H 1 // we ship our own now...
> + #ifdef HAVE_DEJAGNU_H
> +-#include "dejagnu.h"
> ++#include<dejagnu.h>
> +
> + #define info(x) note x
> +
> diff --git a/package/gnash/gnash-0.8.10-gettext-macro.patch b/package/gnash/gnash-0.8.10-gettext-macro.patch

  Missing explanation + SOB.

  I don't understand how this one can be needed, since gnash indirectly depends
on libglib2 which depends on gettext.

> new file mode 100644
> index 0000000..0501f74
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-gettext-macro.patch
> @@ -0,0 +1,170 @@
> +diff -ur a/libdevice/vaapi/VaapiImage.cpp b/libdevice/vaapi/VaapiImage.cpp
> +--- a/libdevice/vaapi/VaapiImage.cpp	2012-01-19 20:17:48.000000000 +0100
> ++++ b/libdevice/vaapi/VaapiImage.cpp	2012-02-23 19:05:13.000000000 +0100
> +@@ -35,7 +35,7 @@
> +     : _format(format)
> +     , _image_data(NULL)
> + {
> +-    log_debug(_("VaapiImage::VaapiImage(): format '%s'\n", string_of_FOURCC(format)));
> ++    log_debug("VaapiImage::VaapiImage(): format '%s'\n", string_of_FOURCC(format));
> +
> +     memset(&_image, 0, sizeof(_image));
> +     _image.image_id = VA_INVALID_ID;
[snip]
> diff --git a/package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch b/package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch
> new file mode 100644
> index 0000000..413744c
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch
> @@ -0,0 +1,52 @@

  Missing explanation + SOB.

> +diff -Naur gnash-0.8.10.alt/libbase/jemalloc.c gnash-0.8.10/libbase/jemalloc.c
> +--- gnash-0.8.10.alt/libbase/jemalloc.c	2012-02-07 09:39:41.000000000 +0100
> ++++ gnash-0.8.10/libbase/jemalloc.c	2012-02-24 18:36:47.000000000 +0100
> +@@ -429,7 +429,7 @@
> + static const bool __isthreaded = true;
> + #endif
> +
> +-#if defined(MOZ_MEMORY_SOLARIS)&&  defined(MAP_ALIGN)&&  !defined(JEMALLOC_NEVER_USES_MAP_ALIGN)
> ++#if defined(MOZ_MEMORY_SOLARIS)&&  defined(MAP_ALIGN)&&  !defined(JEMALLOC_NEVER_USES_MAP_ALIGN) || defined(MOZ_MEMORY_LINUX)

  Add () to make the precedence more explicit.

> + #define JEMALLOC_USES_MAP_ALIGN	 /* Required on Solaris 10. Might improve performance elsewhere. */
> + #endif
> +
> +@@ -2238,6 +2238,7 @@
> + 	 * We don't use MAP_FIXED here, because it can cause the *replacement*
> + 	 * of existing mappings, and we only want to create new mappings.
> + 	 */
> ++#ifdef MOZ_MEMORY_SOLARIS
> + #ifdef MALLOC_PAGEFILE
> + 	if (pfd != -1) {
> + 		ret = mmap((void *)alignment, size, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> +@@ -2252,6 +2253,31 @@
> +
> + 	if (ret == MAP_FAILED)
> + 		ret = NULL;
> ++#else /* !MOZ_MEMORY_SOLARIS */
> ++#ifdef MALLOC_PAGEFILE
> ++	if (pfd != -1) {
> ++		ret = mmap((void *)alignment, size, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> ++		    MAP_NOSYNC, pfd, 0);
> ++	} else
> ++#endif
> ++	       {
> ++		ret = mmap(NULL, size + alignment, PROT_READ | PROT_WRITE, MAP_PRIVATE |
> ++		    MAP_NOSYNC | MAP_ANON, -1, 0);
> ++	}
> ++	assert(ret != NULL);
> ++
> ++	if (ret == MAP_FAILED)
> ++		return NULL;
> ++	
> ++	uintptr_t aligned_ret;
> ++	size_t extra_size;
> ++	aligned_ret = (uintptr_t)ret + alignment - 1;
> ++	aligned_ret&= ~(alignment - 1);
> ++	extra_size = aligned_ret - (uintptr_t)ret;
> ++	munmap(ret, extra_size);
> ++	munmap(ret + extra_size + size, alignment - extra_size);
> ++	ret = (void*)aligned_ret;
> ++#endif /* ifdef MOZ_MEMORY_SOLARIS*/
> + 	return (ret);
> + }
> + #endif
> diff --git a/package/gnash/gnash-0.8.10-kde4-libdir.patch b/package/gnash/gnash-0.8.10-kde4-libdir.patch
> new file mode 100644
> index 0000000..b327944
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-kde4-libdir.patch
> @@ -0,0 +1,12 @@

  Missing explanation + SOB.

  Is this patch relevant?  We don't have KDE in buildroot, so why would
we want patches for it?

> +diff -ur a/macros/kde4.m4 b/macros/kde4.m4
> +--- a/macros/kde4.m4	2011-02-26 19:11:08.000000000 +0100
> ++++ b/macros/kde4.m4	2011-11-25 18:09:25.000000000 +0100
> +@@ -198,7 +198,7 @@
> +       if test -d ${KDE4_PREFIX}/lib64 -a -f /etc/redhat-release; then
> +         KDE4_PLUGINDIR="${KDE4_PREFIX}/lib64/kde4"
> +       else
> +-        KDE4_PLUGINDIR="${KDE4_PREFIX}/lib/kde4"
> ++        KDE4_PLUGINDIR="${KDE4_PREFIX}/${acl_libdirstem}/kde4"
> +       fi
> +     fi
> +     if test x"${with_kde4_servicesdir}" != x ; then
> diff --git a/package/gnash/gnash-0.8.10-klash.patch b/package/gnash/gnash-0.8.10-klash.patch
> new file mode 100644
> index 0000000..e6afec0
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-klash.patch
> @@ -0,0 +1,12 @@
> +diff -ur a/macros/kde4.m4 b/macros/kde4.m4
> +--- a/macros/kde4.m4	2011-02-26 19:11:08.000000000 +0100
> ++++ b/macros/kde4.m4	2011-03-21 00:04:38.845997945 +0100
> +@@ -210,7 +210,7 @@
> +       KDE4_CONFIGDIR="${KDE4_PREFIX}/share/kde4/config"
> +     fi
> +     if test x"${KDE4_APPSDATADIR}" = x ; then
> +-      KDE4_APPSDATADIR="${KDE4_PREFIX}/share/kde4/apps/klash"
> ++      KDE4_APPSDATADIR="${KDE4_PREFIX}/share/apps/klash"
> +     fi
> +
> +   if test x"${ac_cv_path_kde4_incl}" != x ; then
> diff --git a/package/gnash/gnash-0.8.10-npapi-sdk.patch b/package/gnash/gnash-0.8.10-npapi-sdk.patch
> new file mode 100644
> index 0000000..eb54295
> --- /dev/null
> +++ b/package/gnash/gnash-0.8.10-npapi-sdk.patch
> @@ -0,0 +1,29 @@
> +From 983a675c94ecec54ae14593744aa9a2198466499 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?=<mgorny@gentoo.org>
> +Date: Thu, 15 Sep 2011 12:59:55 +0200
> +Subject: [PATCH] Support building against NPAPI-SDK as well.

  Add your SOB.

> +
> +---
> + macros/npapi.m4 |    6 +++++-
> + 1 files changed, 5 insertions(+), 1 deletions(-)
> +
> +diff --git a/macros/npapi.m4 b/macros/npapi.m4
> +index e3bde2f..522bbb1 100644
> +--- a/macros/npapi.m4
> ++++ b/macros/npapi.m4
> +@@ -34,7 +34,11 @@ AC_DEFUN([GNASH_PATH_NPAPI],
> +
> +   if test x$cross_compiling = xno; then
> +     if test x"$PKG_CONFIG" != x -a x"${ac_cv_path_npapi_incl}" = x; then
> +-      $PKG_CONFIG --exists mozilla-plugin&&  NPAPI_CFLAGS="`$PKG_CONFIG --cflags mozilla-plugin`"
> ++      if $PKG_CONFIG --exists npapi-sdk; then
> ++        NPAPI_CFLAGS="`$PKG_CONFIG --cflags npapi-sdk`"
> ++      elif $PKG_CONFIG --exists mozilla-plugin; then
> ++        NPAPI_CFLAGS="`$PKG_CONFIG --cflags mozilla-plugin`"
> ++      fi
> +     fi
> +   fi
> +
> +--
> +1.7.3.4
> +
> diff --git a/package/gnash/gnash.mk b/package/gnash/gnash.mk
> new file mode 100644
> index 0000000..7a2dd8e
> --- /dev/null
> +++ b/package/gnash/gnash.mk
> @@ -0,0 +1,45 @@
> +#############################################################
> +#
> +# gnash
> +#
> +#############################################################
> +
> +GNASH_VERSION = 0.8.10
> +GNASH_SOURCE = gnash-$(GNASH_VERSION).tar.gz
> +
> +# GNU tarball from:
> +# http://ftp.gnu.org/pub/gnu/gnash/$(GNASH_VERSION)/
> +# is broken. It is missing GnashVaapiTexture.h so you
> +# can't even try to build VA API Hardware Accelerated Flash player.
> +# (note that it is not working ... yet)
> +#
> +# http://savannah.gnu.org/bugs/?35612
> +#
> +# That's why we use gentoo one from one of the mirrors.
> +GNASH_SITE = http://ftp.uni-erlangen.de/pub/mirrors/gentoo/distfiles/
> +GNASH_DEPENDENCIES = agg boost gst-ffmpeg firefox gconf giflib openssl
> +GNASH_AUTORECONF = YES
> +
> +GNASH_CONF_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +		 PKG_CONFIG_DIR= \
> +		 PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
> +		 PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
> +		 PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \

  All this shouldn't be necessary.

> +		 CPPFLAGS="`$(PKG_CONFIG_HOST_BINARY) --cflags gdk-pixbuf-2.0`" \
> +		 LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs gdk-pixbuf-2.0` `$(PKG_CONFIG_HOST_BINARY) --libs libva-x11`"

  Better define GNASH_CPPFLAGS and GNASH_LIBS separately and use
those variables here.

> +
> +GNASH_CONF_OPT +=  --enable-gui=gtk --enable-media=ffmpeg --with-sysroot=$(STAGING_DIR)/usr \
> +		   --with-npapi-incl=$(STAGING_DIR)/usr/include/npapi \
> +		   --with-npapi-plugindir=$(TARGET_DIR)/usr/lib/mozilla/plugins \
> +		   --enable-renderer=agg,cairo --enable-doublebuf --enable-visibility --enable-offscreen --enable-ssl

  Shouldn't cairo be a dependency as well?

  Can ssl be made optional with
ifeq ($(BR2_PACKAGE_OPENSSL),y)
GNASH_CONF_OPT += --enable-ssl
GNASH_CONF_DEPENDENCES += openssl
else
GNASH_CONF_OPT += --disable-ssl
endif

?

> +
> +define GNASH_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-plugin

  I would add the install-plugin only if firefox is selected.

> +endef
> +
> +$(eval $(autotools-package))
> +
> +
> +
> +

  Redundant empty lines.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
