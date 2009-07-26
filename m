From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2009 00:15:55 +0200
Subject: [Buildroot] [git commit] bmon: new package
Message-ID: <20090726221821.4B9D476218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba4fbdc948452e95f0ea65d96b329d9473c00b4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #389.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    1 +
 package/Config.in               |    1 +
 package/bmon/Config.in          |    5 +++++
 package/bmon/bmon-gcc4.patch    |   36 ++++++++++++++++++++++++++++++++++++
 package/bmon/bmon-nolibnl.patch |   24 ++++++++++++++++++++++++
 package/bmon/bmon-nostrip.patch |   12 ++++++++++++
 package/bmon/bmon.mk            |   18 ++++++++++++++++++
 7 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/bmon/Config.in
 create mode 100644 package/bmon/bmon-gcc4.patch
 create mode 100644 package/bmon/bmon-nolibnl.patch
 create mode 100644 package/bmon/bmon-nostrip.patch
 create mode 100644 package/bmon/bmon.mk

diff --git a/CHANGES b/CHANGES
index 17072ee..2e1ccd1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,6 +18,7 @@
 	#383: gst-plugins-good: Allow soup plugin to be configured
 	#385: neon: Fix pkgconfig dependency
 	#387: Tremor not installed to toolchain
+	#389: New package bmon
 	#391: gstreamer: Bump version to 0.10.23
 	#393: gst-plugins-base: Bump version to 0.10.23
 	#395: gst-plugins-bad: New package
diff --git a/package/Config.in b/package/Config.in
index d86eb6f..2957c37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/boa/Config.in"
 endif
 source "package/bind/Config.in"
+source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
new file mode 100644
index 0000000..f42d19a
--- /dev/null
+++ b/package/bmon/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_BMON
+	bool "bmon"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Linux bandwidth monitor
diff --git a/package/bmon/bmon-gcc4.patch b/package/bmon/bmon-gcc4.patch
new file mode 100644
index 0000000..23c12b5
--- /dev/null
+++ b/package/bmon/bmon-gcc4.patch
@@ -0,0 +1,36 @@
+diff -ru bmon-2.1.0~/src/out_audio.c bmon-2.1.0/src/out_audio.c
+--- bmon-2.1.0~/src/out_audio.c	2008-07-26 20:06:24.000000000 +0200
++++ bmon-2.1.0/src/out_audio.c	2008-07-26 20:09:42.000000000 +0200
+@@ -141,7 +141,7 @@
+ 	.om_draw = audio_draw,
+ 	.om_set_opts = audio_set_opts,
+ 	.om_probe = audio_probe,
+-	.om_shutdown audio_shutdown,
++	.om_shutdown = audio_shutdown
+ };
+ 
+ static void __init audio_init(void)
+diff -ru bmon-2.1.0~/src/out_db.c bmon-2.1.0/src/out_db.c
+--- bmon-2.1.0~/src/out_db.c	2008-07-26 20:06:24.000000000 +0200
++++ bmon-2.1.0/src/out_db.c	2008-07-26 20:07:44.000000000 +0200
+@@ -679,7 +679,7 @@
+ 	.om_draw = db_draw,
+ 	.om_set_opts = db_set_opts,
+ 	.om_probe = db_probe,
+-	.om_shutdown db_shutdown,
++	.om_shutdown = db_shutdown,
+ };
+ 
+ static void __init db_init(void)
+diff -ru bmon-2.1.0~/src/out_xml_event.c bmon-2.1.0/src/out_xml_event.c
+--- bmon-2.1.0~/src/out_xml_event.c	2008-07-26 20:06:24.000000000 +0200
++++ bmon-2.1.0/src/out_xml_event.c	2008-07-26 20:09:42.000000000 +0200
+@@ -127,7 +127,7 @@
+ 	.om_draw = xml_event_draw,
+ 	.om_set_opts = xml_event_set_opts,
+ 	.om_probe = xml_event_probe,
+-	.om_shutdown xml_event_shutdown,
++	.om_shutdown = xml_event_shutdown
+ };
+ 
+ static void __init xml_event_init(void)
diff --git a/package/bmon/bmon-nolibnl.patch b/package/bmon/bmon-nolibnl.patch
new file mode 100644
index 0000000..4925cd4
--- /dev/null
+++ b/package/bmon/bmon-nolibnl.patch
@@ -0,0 +1,24 @@
+diff -Nura bmon/configure bmon.libnl/configure
+--- bmon/configure	2005-04-05 12:01:33.000000000 -0300
++++ bmon.libnl/configure	2009-06-10 16:10:52.000000000 -0300
+@@ -7327,13 +7327,13 @@
+ echo "${ECHO_T}$ac_cv_lib_nl_nl_connect" >&6
+ if test $ac_cv_lib_nl_nl_connect = yes; then
+ 
+-
+-cat >>confdefs.h <<_ACEOF
+-#define HAVE_NL "1"
+-_ACEOF
+-
+-	LIBNL="-lnl"
+-	NL="Yes"
++	case ${target_os} in
++	    *linux*)
++		echo
++		echo "*** Warning: Building bmon on Linux w/o libnl ***"
++		echo
++	    ;;
++	esac
+ 
+ else
+ 
diff --git a/package/bmon/bmon-nostrip.patch b/package/bmon/bmon-nostrip.patch
new file mode 100644
index 0000000..d457e84
--- /dev/null
+++ b/package/bmon/bmon-nostrip.patch
@@ -0,0 +1,12 @@
+diff -Nura bmon/GNUmakefile bmon.nostrip/GNUmakefile
+--- bmon/GNUmakefile	2005-04-05 12:01:33.000000000 -0300
++++ bmon.nostrip/GNUmakefile	2009-06-10 16:12:04.000000000 -0300
+@@ -50,7 +50,7 @@
+ install:
+ 	./install-sh -d -m 0755 $(DESTDIR)$(prefix)/bin
+ 	./install-sh -d -m 0755 $(DESTDIR)$(mandir)/man1
+-	./install-sh -c -s -m 0755 src/bmon $(DESTDIR)$(prefix)/bin
++	./install-sh -c -m 0755 src/bmon $(DESTDIR)$(prefix)/bin
+ 	./install-sh -c    -m 0644 man/bmon.1 $(DESTDIR)$(mandir)/man1
+ 
+ show: Makefile.opts
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
new file mode 100644
index 0000000..0b60ad4
--- /dev/null
+++ b/package/bmon/bmon.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# bmon
+#
+#############################################################
+
+BMON_VERSION = 2.1.0
+BMON_SOURCE = bmon-$(BMON_VERSION).tar.gz
+BMON_SITE = http://distfiles.gentoo.org/distfiles
+BMON_DEPENDENCIES = ncurses uclibc
+BMON_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package,bmon))
+
+$(BMON_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/bmon
+	rm -f $(BMON_TARGET_INSTALL_TARGET) $(BMON_HOOK_POST_INSTALL)
-- 
1.6.3.3
