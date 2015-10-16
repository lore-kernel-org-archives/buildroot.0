From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Oct 2015 20:43:31 +0200
Subject: [Buildroot] [PATCH v2] libv4l: fix missing libintl linking
Message-ID: <1445021011-31994-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing libintl linking to utils/dvb and utils/keytable (patch
Makefile.am and do autoreconf with host-gettext dependency).

Patch submitted upstream (see [2]).

Add proper gettext dependency for v4l-utils option.

Fixes [1]:
 dvb-format-convert.o: In function `parse_opt':
 dvb-format-convert.c:(.text+0x46): undefined reference to `libintl_gettext'

[1] http://autobuild.buildroot.net/results/40a/40a12c0d1746dcc51e4f221eefbbf31bd427cac8
[2] http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructure/95883

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - patch Makefile.am (instead of Makefile.in) and autoreconf
    (suggested by Thomas Petazzoni)
---
 ...-dvb-keytable-fix-missing-libintl-linking.patch | 54 ++++++++++++++++++++++
 package/libv4l/Config.in                           |  1 +
 package/libv4l/libv4l.mk                           |  7 +++
 3 files changed, 62 insertions(+)
 create mode 100644 package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch

diff --git a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
new file mode 100644
index 0000000..5fb93ff
--- /dev/null
+++ b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
@@ -0,0 +1,54 @@
+From 9eec274c2a92beb2bb1a3a1eeffef1988c7dd016 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 16 Oct 2015 20:32:45 +0200
+Subject: [PATCH] dvb/keytable: fix missing libintl linking
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ utils/dvb/Makefile.am      | 8 ++++----
+ utils/keytable/Makefile.am | 1 +
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/utils/dvb/Makefile.am b/utils/dvb/Makefile.am
+index 6aae408..a96a1a2 100644
+--- a/utils/dvb/Makefile.am
++++ b/utils/dvb/Makefile.am
+@@ -2,19 +2,19 @@ bin_PROGRAMS = dvb-fe-tool dvbv5-zap dvbv5-scan dvb-format-convert
+ man_MANS = dvb-fe-tool.1 dvbv5-zap.1 dvbv5-scan.1 dvb-format-convert.1
+ 
+ dvb_fe_tool_SOURCES = dvb-fe-tool.c
+-dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
+ dvb_fe_tool_LDFLAGS = $(ARGP_LIBS) -lm
+ 
+ dvbv5_zap_SOURCES = dvbv5-zap.c
+-dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
+ dvbv5_zap_LDFLAGS = $(ARGP_LIBS) -lm
+ 
+ dvbv5_scan_SOURCES = dvbv5-scan.c
+-dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
+ dvbv5_scan_LDFLAGS = $(ARGP_LIBS) -lm
+ 
+ dvb_format_convert_SOURCES = dvb-format-convert.c
+-dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la
++dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
+ dvb_format_convert_LDFLAGS = $(ARGP_LIBS) -lm
+ 
+ EXTRA_DIST = README
+diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
+index 925c8ea..8444ac2 100644
+--- a/utils/keytable/Makefile.am
++++ b/utils/keytable/Makefile.am
+@@ -5,6 +5,7 @@ keytablesystem_DATA = $(srcdir)/rc_keymaps/*
+ udevrules_DATA = 70-infrared.rules
+ 
+ ir_keytable_SOURCES = keytable.c parse.h
++ir_keytable_LDADD = @LIBINTL@
+ ir_keytable_LDFLAGS = $(ARGP_LIBS)
+ 
+ EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_keytables.pl ir-keytable.1 rc_maps.cfg
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
index d1b2933..9442467 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -11,6 +11,10 @@ LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
+# patch touches Makefile.am (and needs host-gettext for autoreconf)
+LIBV4L_AUTORECONF= YES
+LIBV4L_DEPENDENCIES = host-gettext
+
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
@@ -43,6 +47,9 @@ ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
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
