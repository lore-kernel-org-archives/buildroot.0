From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Mon,  7 May 2012 22:59:43 +0200
Subject: [Buildroot] [PATCH 3/5] Added the libpth package.
In-Reply-To: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
References: <1336424385-8933-1-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <1336424385-8933-3-git-send-email-stijn.souffriau@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                                  |    1 +
 package/libpth/Config.in                           |   10 ++++++
 ...mmited-L-usr-lib-I-usr-include-from-paths.patch |   34 ++++++++++++++++++++
 package/libpth/libpth-0002-dependencyfix.patch     |   25 ++++++++++++++
 .../libpth-0003-fixed-install-depedency.patch      |   34 ++++++++++++++++++++
 package/libpth/libpth.mk                           |   15 +++++++++
 6 files changed, 119 insertions(+), 0 deletions(-)
 create mode 100644 package/libpth/Config.in
 create mode 100644 package/libpth/libpth-0001-ommited-L-usr-lib-I-usr-include-from-paths.patch
 create mode 100644 package/libpth/libpth-0002-dependencyfix.patch
 create mode 100644 package/libpth/libpth-0003-fixed-install-depedency.patch
 create mode 100644 package/libpth/libpth.mk

diff --git a/package/Config.in b/package/Config.in
index 235e087..5ed6196 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
 source "package/startup-notification/Config.in"
+source "package/libpth/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/libpth/Config.in b/package/libpth/Config.in
new file mode 100644
index 0000000..2842283
--- /dev/null
+++ b/package/libpth/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBPTH
+	bool "libpth"
+	select BR2_PACKAGE_PTH_ERROR
+	help
+	  Pth is a very portable POSIX/ANSI-C based library for Unix 
+	  platforms which provides non-preemptive priority-based scheduling
+	  for multiple threads of execution (aka ``multithreading'')
+	  inside event-driven applications.
+
+	  http://www.gnu.org/software/pth/
diff --git a/package/libpth/libpth-0001-ommited-L-usr-lib-I-usr-include-from-paths.patch b/package/libpth/libpth-0001-ommited-L-usr-lib-I-usr-include-from-paths.patch
new file mode 100644
index 0000000..846a454
--- /dev/null
+++ b/package/libpth/libpth-0001-ommited-L-usr-lib-I-usr-include-from-paths.patch
@@ -0,0 +1,34 @@
+From 92f49db9b1c74691ac82b1f52429ca9b6f98d6f4 Mon Sep 17 00:00:00 2001
+From: Stijn Souffriau <stijn.souffriau@essensium.com>
+Date: Thu, 29 Mar 2012 19:55:02 +0200
+Subject: [PATCH] ommited -L/usr/lib -I/usr/include from paths
+
+---
+ pth-config.in |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/pth-config.in b/pth-config.in
+index 24a93d7..802770d 100644
+--- a/pth-config.in
++++ b/pth-config.in
+@@ -109,11 +109,15 @@ do
+             output="$output $pth_acdir"
+             ;;
+         --cflags)
+-            output="$output -I$pth_includedir"
++	    if [[ $pth_includedir != "/usr/include" ]]; then
++		output="$output -I$pth_includedir"
++	    fi
+             output_extra="$output_extra $pth_cflags"
+             ;;
+         --ldflags)
+-            output="$output -L$pth_libdir"
++	    if [[ $pth_libdir != "/usr/lib" ]]; then
++            	output="$output -L$pth_libdir"
++	    fi
+             output_extra="$output_extra $pth_ldflags"
+             ;;
+         --libs)
+-- 
+1.7.0.4
+
diff --git a/package/libpth/libpth-0002-dependencyfix.patch b/package/libpth/libpth-0002-dependencyfix.patch
new file mode 100644
index 0000000..a1eefe1
--- /dev/null
+++ b/package/libpth/libpth-0002-dependencyfix.patch
@@ -0,0 +1,25 @@
+From 92f862503bb934252e9df1d19d7184b5ed57d7aa Mon Sep 17 00:00:00 2001
+From: Stijn Souffriau <stijn.souffriau@essensium.com>
+Date: Mon, 2 Apr 2012 16:00:53 +0200
+Subject: [PATCH] Added prerequisite to rule needed for parallel building
+
+---
+ Makefile.in |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 477ed81..750ec9f 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -162,6 +162,8 @@ all-normal: $(TARGET_ALL)
+ all-for-install: $(TARGET_ALL)
+ 	@touch .done-all >/dev/null 2>&1 || $(TRUE)
+ 
++$(HSRCS): pth_p.h
++
+ #   build the private shared header file
+ pth_p.h: $(S)pth_p.h.in
+ 	$(SHTOOL) scpp -o pth_p.h -t $(S)pth_p.h.in -Dcpp -Cintern -M '==#==' $(HSRCS)
+-- 
+1.7.0.4
+
diff --git a/package/libpth/libpth-0003-fixed-install-depedency.patch b/package/libpth/libpth-0003-fixed-install-depedency.patch
new file mode 100644
index 0000000..ff384f6
--- /dev/null
+++ b/package/libpth/libpth-0003-fixed-install-depedency.patch
@@ -0,0 +1,34 @@
+From f2079abd360d2f1c531927e8ff7aa034d51aac66 Mon Sep 17 00:00:00 2001
+From: Stijn Souffriau <stijn.souffriau@essensium.com>
+Date: Tue, 3 Apr 2012 13:49:38 +0200
+Subject: [PATCH] fixed install depedency
+
+---
+ Makefile.in |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 750ec9f..f5f3c9c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -229,7 +229,7 @@ install-dirs:
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man3
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(datadir)/aclocal
+-install-pth:
++install-pth: install-dirs
+ 	$(SHTOOL) install -c -m 755 pth-config $(DESTDIR)$(bindir)/pth-config
+ 	$(SHTOOL) install -c -m 644 $(S)pth-config.1 $(DESTDIR)$(mandir)/man1/pth-config.1
+ 	$(SHTOOL) install -c -m 644 $(S)pth.3 $(DESTDIR)$(mandir)/man3/pth.3
+@@ -237,7 +237,7 @@ install-pth:
+ 	$(SHTOOL) install -c -m 644 pth.h $(DESTDIR)$(includedir)/pth.h
+ 	@umask 022; $(LIBTOOL) --mode=install \
+ 	$(SHTOOL) install -c libpth.la $(DESTDIR)$(libdir)/libpth.la
+-install-pthread:
++install-pthread: install-dirs
+ 	$(SHTOOL) install -c -m 755 pthread-config $(DESTDIR)$(bindir)/pthread-config
+ 	$(SHTOOL) install -c -m 644 $(S)pthread-config.1 $(DESTDIR)$(mandir)/man1/pthread-config.1
+ 	$(SHTOOL) install -c -m 644 pthread.h $(DESTDIR)$(includedir)/pthread.h
+-- 
+1.7.0.4
+
diff --git a/package/libpth/libpth.mk b/package/libpth/libpth.mk
new file mode 100644
index 0000000..07c5c61
--- /dev/null
+++ b/package/libpth/libpth.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libpth
+#
+#############################################################
+
+LIBPTH_VERSION = 2.0.6
+LIBPTH_SOURCE = pth-$(LIBPTH_VERSION).tar.gz
+LIBPTH_SITE = ftp://ftp.gnu.org/gnu/pth/
+LIBPTH_INSTALL_STAGING = YES
+
+LIBPTH_CONF_OPT = \
+	--disable-optimization
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.0.4
