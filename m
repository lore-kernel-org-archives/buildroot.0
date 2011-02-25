From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 12:00:37 +0100
Subject: [Buildroot] [git commit master 1/1] sylpheed: bump version,
	fix build
Message-ID: <20110225110122.6DB638F75A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7bb735992e92a0e27e686c371bc1f0910e94b93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old sylpheed version no longer built with our libgtk2 version, so
move to the latest stable release. At the same time add optional openssl
support.

The sylpheed build system adds -I$includedir to the CFLAGS, so ensure
it points at our staging rather than the host headers.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed-2.4.8-makefile.patch |   23 -----------------------
 package/sylpheed/sylpheed.mk                   |   20 +++++++++++++-------
 2 files changed, 13 insertions(+), 30 deletions(-)
 delete mode 100644 package/sylpheed/sylpheed-2.4.8-makefile.patch

diff --git a/package/sylpheed/sylpheed-2.4.8-makefile.patch b/package/sylpheed/sylpheed-2.4.8-makefile.patch
deleted file mode 100644
index 0710207..0000000
--- a/package/sylpheed/sylpheed-2.4.8-makefile.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- a/libsylph/Makefile.in	2007-12-20 23:48:26.000000000 -0500
-+++ b/libsylph/Makefile.in	2008-02-14 16:34:17.000000000 -0500
-@@ -143,7 +143,7 @@ manualdir = @manualdir@
- AM_CPPFLAGS =  	-DG_LOG_DOMAIN=\"LibSylph\" 	-DSYSCONFDIR=\""$(sysconfdir)"\"
- 
- 
--INCLUDES = $(GLIB_CFLAGS) -I$(top_srcdir) -I$(includedir)
-+INCLUDES = $(GLIB_CFLAGS) -I$(top_srcdir) 
- 
- #lib_LTLIBRARIES = libsylph.la
- noinst_LTLIBRARIES = libsylph.la
-
---- a/src/Makefile.in	2007-12-20 23:48:26.000000000 -0500
-+++ b/src/Makefile.in	2008-02-14 16:47:46.000000000 -0500
-@@ -153,7 +153,7 @@ BUILT_SOURCES =  	quote_fmt_lex.c 	quote
- EXTRA_DIST =  	quote_fmt_parse.h 	sylpheed-marshal.list 	version.h.in 	sylpheed.rc.in
- 
- 
--INCLUDES =  	-DG_LOG_DOMAIN=\"Sylpheed\" 	$(GTK_CFLAGS) 	$(GDK_PIXBUF_CFLAGS) 	$(GPGME_CFLAGS) 	-I$(includedir) 	-I$(top_srcdir)/libsylph
-+INCLUDES =  	-DG_LOG_DOMAIN=\"Sylpheed\" 	$(GTK_CFLAGS) 	$(GDK_PIXBUF_CFLAGS) 	$(GPGME_CFLAGS) 	-I$(top_srcdir)/libsylph
- 
- @HAVE_WINDRES_TRUE at SYLPHEED_RES = sylpheed.res
- @HAVE_WINDRES_FALSE at SYLPHEED_RES = 
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index f1e4fa4..dbd2408 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -3,16 +3,22 @@
 # sylpheed
 #
 #############################################################
-SYLPHEED_VERSION = 2.4.8
+SYLPHEED_VERSION_MAJOR = 3.1
+SYLPHEED_VERSION_MINOR = 0
+SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
-SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v2.4
-SYLPHEED_AUTORECONF = NO
-SYLPHEED_INSTALL_STAGING = NO
-SYLPHEED_INSTALL_TARGET = YES
+SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
-SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
+SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix="" \
+                    --includedir=$(STAGING_DIR)/usr/include
 
 SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
 
-$(eval $(call AUTOTARGETS,package,sylpheed))
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYLPHEED_DEPENDENCIES += openssl
+SYLPHEED_CONF_OPT += --enable-ssl
+else
+SYLPHEED_CONF_OPT += --disable-ssl
+endif
 
+$(eval $(call AUTOTARGETS,package,sylpheed))
-- 
1.7.3.4
