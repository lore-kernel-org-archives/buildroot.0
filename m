From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 May 2014 00:00:26 +0200
Subject: [Buildroot] [PATCH 1/1 v4] qdecoder : new package
In-Reply-To: <1398544738-19352-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Sat, 26 Apr 2014 22:38:58 +0200")
References: <1398544738-19352-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87oazdi4qt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 > qDecoder is a powerful CGI library.
 > Features:
 >    Supports parsing a request encoded by GET/POST method
 >    Supports parsing multipart/form-data encoding.(in-memory and direct disk)
 >    Supports COOKIE handling.
 >    Supports Session management.
 >    Supports FastCGI

 > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > ---
 > v2:	Changed License to BSD-2

You seem to have forgotten this change.

 > v3:	Removed QDECODER_CONF_OPT and created makefile.in patch
 > v4:	Renamed the patch to qdecoder-0001-install-header-and-lib-in-staging-directory.patch


 >  package/Config.in                                  |  1 +
 >  package/qdecoder/Config.in                         |  7 ++++++
 >  ...stall-header-and-lib-in-staging-directory.patch | 28 ++++++++++++++++++++++
 >  package/qdecoder/qdecoder.mk                       | 14 +++++++++++
 >  4 files changed, 50 insertions(+)
 >  create mode 100644 package/qdecoder/Config.in
 >  create mode 100644 package/qdecoder/qdecoder-0001-install-header-and-lib-in-staging-directory.patch
 >  create mode 100644 package/qdecoder/qdecoder.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index abfc3cc..998f990 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -765,6 +765,7 @@ source "package/nss-mdns/Config.in"
 >  source "package/omniorb/Config.in"
 >  source "package/openpgm/Config.in"
 >  source "package/ortp/Config.in"
 > +source "package/qdecoder/Config.in"
 >  source "package/rtmpdump/Config.in"
 >  source "package/slirp/Config.in"
 >  source "package/snmppp/Config.in"
 > diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in
 > new file mode 100644
 > index 0000000..2bd2a2f
 > --- /dev/null
 > +++ b/package/qdecoder/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_QDECODER
 > +	bool "qdecoder"
 > +	help
 > +	  qDecoder is a simple and powerful CGI library
 > +	  for the C/C++ programming language.
 > +
 > +	  http://www.qdecoder.org/wiki/qdecoder

As mentioned by others, it probably makes more sense to use
https://wolkykim.github.io/qdecoder/.

I also see from earlier discussions that it should depend on
!BR2_PREFER_STATIC_LIB. What happened to that?

 > diff --git a/package/qdecoder/qdecoder-0001-install-header-and-lib-in-staging-directory.patch b/package/qdecoder/qdecoder-0001-install-header-and-lib-in-staging-directory.patch
 > new file mode 100644
 > index 0000000..c044b6d
 > --- /dev/null
 > +++ b/package/qdecoder/qdecoder-0001-install-header-and-lib-in-staging-directory.patch
 > @@ -0,0 +1,28 @@
 > +From 75e16fd73af6b2f8c0149dacb9c7be7e7123b449 Mon Sep 17 00:00:00 2001
 > +From: Sagaert Johan <sagaert.johan@skynet.be>
 > +Date: Sat, 26 Apr 2014 19:05:55 +0200
 > +Subject: [PATCH 1/1] install header and lib in staging directory
 > +
 > +Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
 > +---
 > + src/Makefile.in | 4 ++--
 > + 1 file changed, 2 insertions(+), 2 deletions(-)
 > +
 > +diff --git a/src/Makefile.in b/src/Makefile.in
 > +index 2688038..b2bf836 100644
 > +--- a/src/Makefile.in
 > ++++ b/src/Makefile.in
 > +@@ -43,8 +43,8 @@ SLIBNAME	= lib${PRGNAME}.so
 > + SLIBREALNAME	= ${SLIBNAME}.${SLIBVERSION}
 > + 
 > + ## System library directory
 > +-LIBDIR		= @libdir@
 > +-HEADERDIR	= @includedir@
 > ++LIBDIR = $(STAGING_DIR)/usr/lib
 > ++HEADERDIR =$(STAGING_DIR)/usr/include

I believe Thomas requested you to change it to handle DESTDIR (and send
the patch upstream).


 > + 
 > + ## Which compiler & options for release
 > + CC		= @CC@
 > +-- 
 > +1.9.2
 > +
 > diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
 > new file mode 100644
 > index 0000000..30fbcb3
 > --- /dev/null
 > +++ b/package/qdecoder/qdecoder.mk
 > @@ -0,0 +1,14 @@
 > +################################################################################
 > +#
 > +# qdecoder
 > +#
 > +################################################################################
 > +
 > +QDECODER_VERSION = r12.0.5
 > +QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
 > +QDECODER_LICENSE = GPL

Should be BSD-2c.

Care to send an updated patch fixing these issues?

-- 
Bye, Peter Korsgaard
