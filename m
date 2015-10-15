From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 23:06:15 +0200
Subject: [Buildroot] [PATCH v1] libv4l: fix missing libintl linking
Message-ID: <1444943175-9000-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing libintl linking to utils/dvb and utils/keytable (patch
Makefile.in because patching Makefile.am and autoreconf did not work).

Add proper gettext dependency for v4l-utils option.

Fixes [1]:
 dvb-format-convert.o: In function `parse_opt':
 dvb-format-convert.c:(.text+0x46): undefined reference to `libintl_gettext'

[1] http://autobuild.buildroot.net/results/40a/40a12c0d1746dcc51e4f221eefbbf31bd427cac8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-dvb-keytable-fix-missing-libintl-linking.patch | 52 ++++++++++++++++++++++
 package/libv4l/Config.in                           |  1 +
 package/libv4l/libv4l.mk                           |  3 ++
 3 files changed, 56 insertions(+)
 create mode 100644 package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch

diff --git a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
new file mode 100644
index 0000000..99b021e
--- /dev/null
+++ b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
@@ -0,0 +1,52 @@
+From f815c05e93f4d92d5b62239ef25defee3347cb9d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 15 Oct 2015 22:55:35 +0200
+Subject: [PATCH] dvb/keytable: fix missing libintl linking
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/dvb/Makefile.in      | 8 ++++----
+ utils/keytable/Makefile.in | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/utils/dvb/Makefile.in b/utils/dvb/Makefile.in
+index a470045..3b664ad 100644
+--- a/utils/dvb/Makefile.in
++++ b/utils/dvb/Makefile.in
+@@ -449,16 +449,16 @@ top_srcdir = @top_srcdir@
+ udevrulesdir = @udevrulesdir@
+ man_MANS = dvb-fe-tool.1 dvbv5-zap.1 dvbv5-scan.1 dvb-format-convert.1
+ dvb_fe_tool_SOURCES = dvb-fe-tool.c
+-dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la  $(LIBINTL)
+ dvb_fe_tool_LDFLAGS = $(ARGP_LIBS) -lm
+ dvbv5_zap_SOURCES = dvbv5-zap.c
+-dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la $(LIBINTL)
+ dvbv5_zap_LDFLAGS = $(ARGP_LIBS) -lm
+ dvbv5_scan_SOURCES = dvbv5-scan.c
+-dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la $(LIBINTL)
+ dvbv5_scan_LDFLAGS = $(ARGP_LIBS) -lm
+ dvb_format_convert_SOURCES = dvb-format-convert.c
+-dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la $(LIBINTL)
+ dvb_format_convert_LDFLAGS = $(ARGP_LIBS) -lm
+ EXTRA_DIST = README
+ all: all-am
+diff --git a/utils/keytable/Makefile.in b/utils/keytable/Makefile.in
+index da84df9..9f49ecb 100644
+--- a/utils/keytable/Makefile.in
++++ b/utils/keytable/Makefile.in
+@@ -111,7 +111,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(man1dir)" \
+ PROGRAMS = $(bin_PROGRAMS)
+ am_ir_keytable_OBJECTS = keytable.$(OBJEXT)
+ ir_keytable_OBJECTS = $(am_ir_keytable_OBJECTS)
+-ir_keytable_LDADD = $(LDADD)
++ir_keytable_LDADD = $(LDADD) $(LIBINTL)
+ AM_V_lt = $(am__v_lt_ at AM_V@)
+ am__v_lt_ = $(am__v_lt_ at AM_DEFAULT_V@)
+ am__v_lt_0 = --silent
+-- 
+2.1.4
+
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 5a55b2b..16dc6bb 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -23,6 +23,7 @@ comment "libv4l JPEG support not enabled"
 
 config BR2_PACKAGE_LIBV4L_UTILS
 	bool "v4l-utils tools"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
 	  Enable this if you want to build the following tools:
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index d1b2933..e73f5f5 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -43,6 +43,9 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
 LIBV4L_CONF_OPTS += --enable-v4l-utils
 # clock_gettime is used, which is provided by librt for glibc < 2.17
 LIBV4L_LIBS += -lrt
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIBV4L_DEPENDENCIES += gettext
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
-- 
2.1.4
