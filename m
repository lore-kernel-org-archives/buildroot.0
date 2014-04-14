From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:52:17 +0200
Subject: [Buildroot] [git commit] flite: new package
Message-ID: <20140414215248.2561C9C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9791ae2a49051f24c3be585b1c875b4aa9885982
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rewrap Config.in help text, and use proper format for wchar
comment according to the Buildroot manual.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/flite/Config.in                            |   16 ++++++++
 .../flite-0001-now-honor-DESTDIR-env.-var.patch    |   30 ++++++++++++++
 package/flite/flite.mk                             |   41 ++++++++++++++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4a7fed6..8e6e590 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -9,6 +9,7 @@ source "package/bellagio/Config.in"
 source "package/faad2/Config.in"
 source "package/ffmpeg/Config.in"
 source "package/flac/Config.in"
+source "package/flite/Config.in"
 source "package/gstreamer/Config.in"
 source "package/gstreamer1/Config.in"
 source "package/jack2/Config.in"
diff --git a/package/flite/Config.in b/package/flite/Config.in
new file mode 100644
index 0000000..2bbd256
--- /dev/null
+++ b/package/flite/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_FLITE
+	bool "flite"
+	depends on BR2_USE_WCHAR
+	help
+	  Flite: a small, fast run time synthesis engine.
+
+	  Flite (festival-lite) is a small, fast run-time synthesis
+	  engine developed at CMU and primarily designed for small
+	  embedded machines and/or large servers. Flite is designed as
+	  an alternative synthesis engine to Festival for voices built
+	  using the FestVox suite of voice building tools.
+
+	  http://www.speech.cs.cmu.edu/flite
+
+comment "flite needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/flite/flite-0001-now-honor-DESTDIR-env.-var.patch b/package/flite/flite-0001-now-honor-DESTDIR-env.-var.patch
new file mode 100644
index 0000000..5972f34
--- /dev/null
+++ b/package/flite/flite-0001-now-honor-DESTDIR-env.-var.patch
@@ -0,0 +1,30 @@
+From 658f3243238efe951f6242fa384e990d77078afc Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 27 Dec 2013 17:42:39 +0100
+Subject: [PATCH] now honor DESTDIR env. var.
+
+Flite used a handwritten a Makefile which doesn't honor DESTDIR environment
+variable, though it uses autoconf.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ config/config.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/config/config.in b/config/config.in
+index 914d2bf..43f1a56 100644
+--- a/config/config.in
++++ b/config/config.in
+@@ -49,6 +49,6 @@ include $(TOP)/config/$(langvox).lv
+ prefix        = @prefix@
+ exec_prefix   = @exec_prefix@
+ EXEEXT	      = @EXEEXT@
+-INSTALLBINDIR = @bindir@
+-INSTALLLIBDIR = @libdir@
+-INSTALLINCDIR = @includedir@/flite
++INSTALLBINDIR = $(DESTDIR)@bindir@
++INSTALLLIBDIR = $(DESTDIR)@libdir@
++INSTALLINCDIR = $(DESTDIR)@includedir@/flite
+--
+1.8.5.2
+
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
new file mode 100644
index 0000000..7511b87
--- /dev/null
+++ b/package/flite/flite.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# flite
+#
+################################################################################
+
+FLITE_VERSION = 1.4
+FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
+FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
+FLITE_LICENSE = BSD-4c
+FLITE_LICENSE_FILES = COPYING
+
+FLITE_INSTALL_STAGING = YES
+
+# Sadly, Flite does not support parallel build, especially when building its
+# shared libraries.
+FLITE_MAKE = $(MAKE1)
+
+# $ tar tf flite-1.4-release.tar.bz2
+# ...
+# flite-1.4-release//install-sh
+# flite-1.4-release//mkinstalldirs
+# flite-1.4-release//Exports.def
+# flite-1.4-release//flite.sln
+# flite-1.4-release//fliteDll.vcproj
+# flite-1.4-release/config/Makefile
+# flite-1.4-release/config/common_make_rules
+# flite-1.4-release/config/project.mak
+# flite-1.4-release/config/config.in
+# flite-1.4-release/config/system.mak.in
+#
+# So, the strip-component trick does not work at all.
+# Let's redefine the extract command.
+define FLITE_EXTRACT_CMDS
+	$(INFLATE$(suffix $(FLITE_SOURCE))) $(DL_DIR)/$(FLITE_SOURCE) | \
+		$(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	rsync -ar $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE))/* $(FLITE_DIR)/
+	$(RM) -rf $(BUILD_DIR)/$(subst .tar.bz2,,$(FLITE_SOURCE))
+endef
+
+$(eval $(autotools-package))
