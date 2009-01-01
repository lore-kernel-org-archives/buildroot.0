From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  1 Jan 2009 21:20:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/busybox
	package/lzma ta etc...
Message-ID: <20090101212036.E1DB776C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-01 21:20:35 +0000 (Thu, 01 Jan 2009)
New Revision: 24641

Log:
buildroot: set SHELL instead of messing around with CONFIG_SHELL

Simply set SHELL to bash instead of adding CONFIG_SHELL to all shell
invocations. CONFIG_SHELL is still set, as it is used by kconfig.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/target/initramfs/initramfs.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/Makefile	2009-01-01 21:20:35 UTC (rev 24641)
@@ -79,12 +79,16 @@
   Q=@
 endif
 
-CONFIG_SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+# we want bash as shell
+SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	else if [ -x /bin/bash ]; then echo /bin/bash; \
 	else echo sh; fi; fi)
 
-export CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
+# kconfig uses CONFIG_SHELL
+CONFIG_SHELL:=$(SHELL)
 
+export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
+
 ifndef HOSTAR
 HOSTAR:=ar
 endif
@@ -113,17 +117,17 @@
 ifndef HOSTNM
 HOSTNM:=nm
 endif
-HOSTAR:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAR)" || type -p $(HOSTAR) || echo ar)
-HOSTAS:=$(shell $(CONFIG_SHELL) -c "which $(HOSTAS)" || type -p $(HOSTAS) || echo as)
-HOSTCC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCC)" || type -p $(HOSTCC) || echo gcc)
-HOSTCXX:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCXX)" || type -p $(HOSTCXX) || echo g++)
-HOSTFC:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
-HOSTCPP:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCPP)" || type -p $(HOSTCPP) || echo cpp)
-HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
-HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
-HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
-HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
-HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)
+HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
+HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
+HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
+HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOST_GLIB_BIN:=`dirname $(shell which glib-genmarshal || echo /usr/bin/glib-genmarshal)`
+HOST_GLIB:=$(shell dirname $(HOST_GLIB_BIN) || echo /usr)
 
 
 ifndef CFLAGS_FOR_BUILD

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-01 21:20:35 UTC (rev 24641)
@@ -127,7 +127,7 @@
 #	ACLOCAL="$(ACLOCAL)"
 
 # Automatically detect tar --strip-path/components option
-TAR_STRIP_COMPONENTS := $(shell $(CONFIG_SHELL) -c '$(TAR) --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi')
+TAR_STRIP_COMPONENTS := $(shell $(TAR) --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi)
 
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/package/Makefile.in	2009-01-01 21:20:35 UTC (rev 24641)
@@ -4,7 +4,7 @@
 ifndef HOSTMAKE
 HOSTMAKE=$(MAKE)
 endif
-HOSTMAKE :=$(shell $(CONFIG_SHELL) -c "which $(HOSTMAKE)" || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
@@ -178,8 +178,8 @@
 STRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL=/usr/bin/install
-FLEX:=$(shell $(CONFIG_SHELL) -c 'which flex || type -p flex')
-BISON:=$(shell $(CONFIG_SHELL) -c 'which bison || type -p bison')
+FLEX:=$(shell which flex || type -p flex)
+BISON:=$(shell which bison || type -p bison)
 
 HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/sparc.*/sparc/' \

Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/package/busybox/initramfs.mk	2009-01-01 21:20:35 UTC (rev 24641)
@@ -112,7 +112,7 @@
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	(echo "chown -R 0:0 $(PROJECT_BUILD_DIR)/initramfs"; \
 	 echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(PROJECT_BUILD_DIR)/initramfs"; \
-	 echo "$(CONFIG_SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
+	 echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
 	) > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	chmod +x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- \

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/package/lzma/lzma.mk	2009-01-01 21:20:35 UTC (rev 24641)
@@ -13,8 +13,8 @@
 
 # lzma binary for use on the host
 LZMA=$(TOOL_BUILD_DIR)/bin/lzma
-HOST_LZMA_BINARY=$(shell $(CONFIG_SHELL) package/lzma/lzmacheck.sh)
-HOST_LZMA_IF_ANY=$(shell $(CONFIG_SHELL) toolchain/dependencies/check-host-lzma.sh)
+HOST_LZMA_BINARY=$(shell package/lzma/lzmacheck.sh)
+HOST_LZMA_IF_ANY=$(shell toolchain/dependencies/check-host-lzma.sh)
 
 
 $(DL_DIR)/$(LZMA_SOURCE):

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2009-01-01 19:41:52 UTC (rev 24640)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2009-01-01 21:20:35 UTC (rev 24641)
@@ -34,7 +34,7 @@
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot so gen_initramfs_list.sh believes the previous fakery
-	echo "$(CONFIG_SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
+	echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
