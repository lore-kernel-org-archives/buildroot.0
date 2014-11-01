From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:04:43 +0100
Subject: [Buildroot] [git commit] libgtk3: bump to 3.14.4
Message-ID: <20141101140727.58805B2841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1df74c1ec34927f5e9f44f56e9b8984307033bb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libgtk3 to version 3.14.4.

Also add a patch to fix compilation of a build tool: extract-strings.
The bug has already been reported [1], but no proper resolution has been
provided yet. This patch only covers the Buildroot issue.

[1] https://bugzilla.gnome.org/show_bug.cgi?id=731013

[Thomas: fix minor typo in the description of the newly added patch.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...libgtk3-0005-do-not-build-extract-strings.patch |   47 ++++++++++++++++++++
 package/libgtk3/libgtk3.mk                         |   13 ++++-
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch b/package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch
new file mode 100644
index 0000000..f1fbaaa
--- /dev/null
+++ b/package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch
@@ -0,0 +1,47 @@
+Do not build util/extract-strings
+
+Do not build util/extract-strings, as it will be built by host-libgtk3
+and installed in $(HOST_DIR)/usr/bin (thus avoiding the -lint linking
+issue with uClibc).
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+
+Index: gtk+-3.14.0/Makefile.am
+===================================================================
+--- gtk+-3.14.0.orig/Makefile.am	2014-09-22 05:17:44.000000000 +0200
++++ gtk+-3.14.0/Makefile.am	2014-09-25 16:08:32.000000000 +0200
+@@ -1,7 +1,7 @@
+ ## Makefile.am for GTK+
+ include $(top_srcdir)/Makefile.decl
+ 
+-SRC_SUBDIRS = util gdk gtk libgail-util modules demos tests testsuite examples
++SRC_SUBDIRS = gdk gtk libgail-util modules demos tests testsuite examples
+ SUBDIRS = po po-properties $(SRC_SUBDIRS) docs m4macros build
+ 
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+Index: gtk+-3.14.0/gtk/Makefile.am
+===================================================================
+--- gtk+-3.14.0.orig/gtk/Makefile.am	2014-09-22 05:09:39.000000000 +0200
++++ gtk+-3.14.0/gtk/Makefile.am	2014-09-25 16:09:10.000000000 +0200
+@@ -1330,7 +1330,7 @@
+ 
+ %.ui.h: %.ui
+ 	$(AM_V_GEN) mkdir -p $(dir $@) \
+-	&& $(top_builddir)/util/extract-strings$(EXEEXT) $< > $@
++	&& extract-strings$(EXEEXT) $< > $@
+ 
+ #
+ # rules to generate built sources
+Index: gtk+-3.14.0/gtk/inspector/Makefile.am
+===================================================================
+--- gtk+-3.14.0.orig/gtk/inspector/Makefile.am	2014-09-04 20:11:33.000000000 +0200
++++ gtk+-3.14.0/gtk/inspector/Makefile.am	2014-09-25 16:09:48.000000000 +0200
+@@ -114,7 +114,7 @@
+ template_headers = $(templates:.ui=.ui.h)
+ 
+ %.ui.h : %.ui 
+-	$(AM_V_GEN) $(top_builddir)/util/extract-strings$(EXEEXT) $< > $@
++	$(AM_V_GEN) extract-strings$(EXEEXT) $< > $@
+ 
+ EXTRA_DIST += 				\
+ 	inspector.gresource.xml 	\
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 73b3e17..540f08d 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK3_VERSION_MAJOR = 3.12
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
+LIBGTK3_VERSION_MAJOR = 3.14
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).4
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
@@ -135,7 +135,8 @@ LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_COMPILE_GLIB_SCHEMAS
 # for both native and target builds).
 #
 # But no native version of libintl is available (the functions are
-# provided by glibc). So gtk-update-icon-cache will not build.
+# provided by glibc). So gtk-update-icon-cache will not build, and
+# extract-strings neither.
 #
 # As a workaround, we build gtk-update-icon-cache on our own, set
 # --enable-gtk2-dependency=yes and force './configure' to use our version.
@@ -160,11 +161,17 @@ define HOST_LIBGTK3_BUILD_CMDS
 		$(@D)/gtk/updateiconcache.c \
 		$(HOST_LIBGTK3_CFLAGS) \
 		-o $(@D)/gtk/gtk-update-icon-cache
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/util/extract-strings.c \
+		$(HOST_LIBGTK3_CFLAGS) \
+		-o $(@D)/util/extract-strings
 endef
 
 define HOST_LIBGTK3_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/gtk/gtk-update-icon-cache \
 		$(HOST_DIR)/usr/bin/gtk-update-icon-cache
+	$(INSTALL) -D -m 0755 $(@D)/util/extract-strings \
+		$(HOST_DIR)/usr/bin/extract-strings
 endef
 
 $(eval $(autotools-package))
