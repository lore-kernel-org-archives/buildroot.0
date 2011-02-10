From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Feb 2011 22:47:19 +0100
Subject: [Buildroot] [git commit master 1/1] lame: new package
Message-ID: <20110210214824.EE5F98F483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b92f5b7307aea2512077bf8588ac6e105dc79f3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                 |    1 +
 package/multimedia/lame/Config.in            |    6 +++++
 package/multimedia/lame/lame-no-static.patch |   28 +++++++++++++++++++++++++
 package/multimedia/lame/lame.mk              |   29 ++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/lame/Config.in
 create mode 100644 package/multimedia/lame/lame-no-static.patch
 create mode 100644 package/multimedia/lame/lame.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index b60849e..12d6e30 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -13,6 +13,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
+source "package/multimedia/lame/Config.in"
 source "package/multimedia/libao/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libcue/Config.in"
diff --git a/package/multimedia/lame/Config.in b/package/multimedia/lame/Config.in
new file mode 100644
index 0000000..2b144a0
--- /dev/null
+++ b/package/multimedia/lame/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LAME
+	bool "lame"
+	help
+	  LAME is a high quality MPEG Audio Layer III (MP3) encoder.
+
+	  http://lame.sourceforge.net/
diff --git a/package/multimedia/lame/lame-no-static.patch b/package/multimedia/lame/lame-no-static.patch
new file mode 100644
index 0000000..f507f7f
--- /dev/null
+++ b/package/multimedia/lame/lame-no-static.patch
@@ -0,0 +1,28 @@
+We don't want statically compiled binaries by force so nuke that.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lame-3.98.4/frontend/Makefile.am lame-3.98.4.nostatic/frontend/Makefile.am
+--- lame-3.98.4/frontend/Makefile.am	2006-09-30 06:17:05.000000000 -0300
++++ lame-3.98.4.nostatic/frontend/Makefile.am	2011-02-10 13:46:05.512559590 -0300
+@@ -52,7 +52,7 @@
+ endif
+ 
+ CFLAGS = @CFLAGS@ @GTK_CFLAGS@ @FRONTEND_CFLAGS@ @SNDFILE_CFLAGS@
+-LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@ -static
++LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@
+ 
+ INCLUDES = -I$(top_srcdir)/libmp3lame -I$(top_srcdir)/include -I$(top_builddir)
+ 
+diff -Nura lame-3.98.4/frontend/Makefile.in lame-3.98.4.nostatic/frontend/Makefile.in
+--- lame-3.98.4/frontend/Makefile.in	2008-06-25 09:17:51.000000000 -0300
++++ lame-3.98.4.nostatic/frontend/Makefile.in	2011-02-10 13:45:54.752559590 -0300
+@@ -152,7 +152,7 @@
+ 	$(top_builddir)/libmp3lame/libmp3lame.la \
+ 	@FRONTEND_LDADD@
+ 
+-LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@ -static
++LDFLAGS = @LDFLAGS@ @FRONTEND_LDFLAGS@ @SNDFILE_LIBS@
+ LIBOBJS = @LIBOBJS@
+ LIBS = @LIBS@
+ LIBTOOL = @LIBTOOL@
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
new file mode 100644
index 0000000..841cbff
--- /dev/null
+++ b/package/multimedia/lame/lame.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# lame
+#
+#############################################################
+
+LAME_VERSION = 3.98.4
+LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lame
+LAME_DEPENDENCIES = host-pkg-config
+LAME_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LAME_DEPENDENCIES += libsndfile
+LAME_CONF_OPT += --with-fileio=sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+LAME_DEPENDENCIES += ncurses
+endif
+
+ifeq ($(BR2_ENDIAN),"BIG")
+define LAME_BIGENDIAN_ARCH
+	echo "#define WORDS_BIGENDIAN 1" >>$(@D)/config.h
+endef
+endif
+
+LAME_POST_CONFIGURE_HOOKS += LAME_BIGENDIAN_ARCH
+
+$(eval $(call AUTOTARGETS,package/multimedia,lame))
-- 
1.7.3.4
