From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 17 Jul 2013 07:48:17 -0300
Subject: [Buildroot] [PATCH v2] icecast: new package
In-Reply-To: <20130717102510.GA24544@localhost>
References: <1374055607-24500-1-git-send-email-elezegarcia@gmail.com>
 <20130717121905.36d0e71f@skate> <20130717102510.GA24544@localhost>
Message-ID: <20130717104816.GA324@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 17, 2013 at 07:25:11AM -0300, Ezequiel Garcia wrote:
> On Wed, Jul 17, 2013 at 12:19:05PM +0200, Thomas Petazzoni wrote:
> > Dear Ezequiel Garcia,
> > 
> > On Wed, 17 Jul 2013 07:06:47 -0300, Ezequiel Garcia wrote:
> > 
> > > +diff -Naur icecast-2.3.3/m4/xiph_curl.m4 icecast-2.3.3-patched/m4/xiph_curl.m4
> > > +--- icecast-2.3.3/m4/xiph_curl.m4	2012-06-11 13:45:26.000000000 -0300
> > > ++++ icecast-2.3.3-patched/m4/xiph_curl.m4	2013-07-17 06:58:02.000000000 -0300
> > > +@@ -48,28 +48,10 @@
> > > + dnl
> > > + dnl Now check if the installed libcurl is sufficiently new.
> > > + dnl
> > > +-AC_CHECK_HEADERS([curl/curl.h],, curl_ok="no") 
> > > + AC_MSG_CHECKING(for libcurl)
> > > +-if test "$curl_ok" = "yes"
> > > +-then
> > > +-    AC_RUN_IFELSE(AC_LANG_SOURCE([
> > > +-#include <curl/curl.h>
> > > +-int main()
> > > +-{
> > > +-    return 0;
> > > +-}
> > > +-]),,[curl_ok="no"])
> > > +-fi
> > > +-if test "$curl_ok" = "yes"; then
> > > +-    AC_MSG_RESULT(yes)
> > > +-    AC_DEFINE(HAVE_CURL, 1, [Define if you have libcurl.])
> > > +-    ifelse([$1], , :, [$1])     
> > > +-else
> > > +-    AC_MSG_RESULT(no)
> > > +-    CURL_LIBS=""
> > > +-    CURL_CFLAGS=""
> > > +-    ifelse([$2], , :, [$2])
> > > +-fi
> > > ++AC_MSG_RESULT(yes)
> > > ++AC_DEFINE(HAVE_CURL, 1, [Define if you have libcurl.])
> > > ++ifelse([$1], , :, [$1])     
> > 
> > So here you're completely removing the curl check and assume that it is
> > always present?
> > 
> > 
> > > +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> > > +ICECAST_DEPENDENCIES += libcurl
> > > +ICECAST_CONF_OPT += --with-curl-config=$(STAGING_DIR)/usr/bin/curl-config
> > > +else
> > > +ICECAST_CONF_OPT += --without-curl
> > > +endif
> > 
> > and here curl is still optional?
> > 
> 
> Doh, silly uh?
> 

Or maybe not so silly.

As far as I can see, this curl m4 file will be used when --with-curl is
present (or more accurately when --without-curl is absent).
When --without-curl is absent, then BR should guarantee that curl is
correctly installed, and the patch merely removes the package configure
double-check.

Or at least that's what my tests say.

Does this sound sane?
-- 
Ezequiel Garc?a, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
