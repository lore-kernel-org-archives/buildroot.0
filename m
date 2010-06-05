From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 21:15:10 +0200
Subject: [Buildroot] [git commit master] Makefile: support gconfig
	(GTK-based configurator) similar to xconfig
Message-ID: <20100605191714.EC26D8F6C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b42aae78421127a37b7a5e9ae972276dc5c3779
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support the GTK variant of the graphical kconfig configurator as an
alternative to the Qt3-based one.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    4 +++-
 Makefile                        |   11 ++++++++++-
 docs/about.html                 |    4 ++--
 docs/buildroot.html             |   16 ++++++++++++----
 package/config/Makefile         |    2 +-
 package/config/Makefile.kconfig |    4 +++-
 6 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8649588..6fddc14 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,8 @@
 2010.08, Not released yet:
 
-	Fixes all over the tree.
+	Fixes all over the tree and new features.
+
+	New GTK-based configurator, usable using 'make gconfig'.
 
 	Updated/fixed packages: cdrkit, libidn, netperf
 
diff --git a/Makefile b/Makefile
index a75ca3e..68732fa 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
-noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
+noconfig_targets:=menuconfig gconfig xconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
@@ -484,6 +484,14 @@ xconfig: $(CONFIG)/qconf
 		test -f .config.cmd || rm -f .config; \
 	fi
 
+gconfig: $(CONFIG)/gconf
+	@mkdir -p $(CONFIG)/buildroot-config
+	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(CONFIG)/buildroot-config/autoconf.h \
+		$(CONFIG)/gconf $(CONFIG_CONFIG_IN); then \
+		test -f .config.cmd || rm -f .config; \
+	fi
+
 menuconfig: $(CONFIG)/mconf
 	@mkdir -p $(CONFIG)/buildroot-config
 	@if ! KCONFIG_AUTOCONFIG=$(CONFIG)/buildroot-config/auto.conf \
@@ -605,6 +613,7 @@ help:
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
 	@echo '  xconfig                - interactive Qt-based configurator'
+	@echo '  gconfig                - interactive GTK-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
diff --git a/docs/about.html b/docs/about.html
index b985c4f..06d7cb3 100644
--- a/docs/about.html
+++ b/docs/about.html
@@ -31,8 +31,8 @@ cross-compilation process.</p>
   also sufficiently flexible that it can also be used for only one or
   several of these steps.</li>
 
-  <li>Is <b>very easy</b> to set up, thanks to its menuconfig and
-  xconfig configuration interfaces, familiar to all embedded Linux
+  <li>Is <b>very easy</b> to set up, thanks to its menuconfig, gconfig
+  and xconfig configuration interfaces, familiar to all embedded Linux
   developers. Building a basic embedded Linux system with Buildroot
   typically takes 15-30 minutes.</li>
 
diff --git a/docs/buildroot.html b/docs/buildroot.html
index 3702b44..37d3876 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -161,15 +161,23 @@
  $ make xconfig
 </pre>
 
-    <p>to run the Qt3-based configurator.</p>
+or
 
-    <p>Both of these "make" commands will need to build a configuration
+<pre>
+ $ make gconfig
+</pre>
+
+    <p>to run the Qt3 or GTK-based configurators.</p>
+
+    <p>All of these "make" commands will need to build a configuration
     utility, so you may need to install "development" packages for
     relevent libraries used by the configuration utilities.
     On Debian-like systems, the
     <code>libncurses5-dev</code> package is required to use the
-    <i>menuconfig</i> interface, and the <code>libqt3-mt-dev</code> is
-    required to use the <i>xconfig</i> interface.</p>
+    <i>menuconfig</i> interface, <code>libqt3-mt-dev</code> is
+    required to use the <i>xconfig</i> interface, and
+    <code>libglib2.0-dev, libgtk2.0-dev and libglade2-dev</code> are
+    needed to used the <i>gconfig</i> interface.</p>
 
     <p>For each menu entry in the configuration tool, you can find associated help
     that describes the purpose of the entry. </p>
diff --git a/package/config/Makefile b/package/config/Makefile
index 66b54cd..a100850 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -23,7 +23,7 @@ $(host-csingle): %: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $@
 
 $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) -o $@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$@) -o $@
 
 $(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
 	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
diff --git a/package/config/Makefile.kconfig b/package/config/Makefile.kconfig
index 6d89e59..835d0f1 100644
--- a/package/config/Makefile.kconfig
+++ b/package/config/Makefile.kconfig
@@ -138,7 +138,9 @@ endif
 ifeq ($(MAKECMDGOALS),gconfig)
 	gconf-target := 1
 endif
-
+ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
+	gconf-target := 1
+endif
 
 ifeq ($(qconf-target),1)
 qconf-cxxobjs	:= qconf.o
-- 
1.6.3.3
