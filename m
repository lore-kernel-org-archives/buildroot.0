From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Jun 2007 05:57:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070607125704.C1A4D4807F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-07 05:57:03 -0700 (Thu, 07 Jun 2007)
New Revision: 18769

Log:
- provide a "source-check" target that tries to download all packages with
  wget's spider-mode (i.e. just see if the server says the file is there without
  actually downloading the files.
  Convenient to check for unavailable source-packages.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-07 12:54:29 UTC (rev 18768)
+++ trunk/buildroot/Makefile	2007-06-07 12:57:03 UTC (rev 18769)
@@ -28,6 +28,7 @@
 
 noconfig_targets := menuconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags    \
+	source-check
 
 #	$(shell find . -name *_defconfig |sed 's/.*\///')
 
@@ -156,6 +157,13 @@
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
+.config.check: dependencies
+	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
+	touch $@
+
+_source-check: .config.check
+	$(MAKE) source
+
 #############################################################
 #
 # Cleanup and misc junk
@@ -214,9 +222,9 @@
 	@$(CONFIG)/conf -r $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(CONFIG)/conf
-	#@$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
+	cp $(CONFIG_DEFCONFIG) .config
+	@$(CONFIG)/conf -y $(CONFIG_CONFIG_IN)
 	#sed -i -e "s/^CONFIG_DEBUG.*/# CONFIG_DEBUG is not set/" .config
-	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
 
 allnoconfig: $(CONFIG)/conf
 	@$(CONFIG)/conf -n $(CONFIG_CONFIG_IN)
@@ -228,6 +236,10 @@
 	cp $(shell find . -name $@) .config
 	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
 
+# check if download URLs are outdated 
+source-check: allyesconfig
+	$(MAKE) _source-check
+
 #############################################################
 #
 # Cleanup and misc junk
