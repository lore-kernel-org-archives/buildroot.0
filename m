From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Sep 2010 23:09:39 +0200
Subject: [Buildroot] [git commit master 1/1] sed: get rid of host-sed variant
Message-ID: <20100930211204.81ECE8B637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d0c3d1cf4365a80ba2ec35eef0c3ed7ac907f320
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And all the infrastructure surrounding it. A broken sed implementation
is quite rare nowadays, as seen by the fact that the current host-sed
support has been broken for a while, so just get rid of it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                 |    2 +-
 linux/linux.mk                           |    2 +-
 package/Makefile.in                      |    1 +
 package/sed/configure.patch              |   29 -----------
 package/sed/sed.mk                       |   78 ------------------------------
 package/sed/sedcheck.sh                  |   11 ----
 toolchain/dependencies/check-host-sed.sh |   35 -------------
 toolchain/dependencies/dependencies.mk   |    6 +--
 toolchain/dependencies/dependencies.sh   |   33 +++++-------
 toolchain/uClibc/uclibc.mk               |    2 +-
 10 files changed, 19 insertions(+), 180 deletions(-)
 delete mode 100644 package/sed/configure.patch
 delete mode 100755 package/sed/sedcheck.sh
 delete mode 100755 toolchain/dependencies/check-host-sed.sh

diff --git a/Makefile b/Makefile
index 9c2e6af..d941b66 100644
--- a/Makefile
+++ b/Makefile
@@ -589,7 +589,7 @@ endif
 flush:
 	rm -f $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
 
-configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
+configured: dirs kernel-headers uclibc-config busybox-config linux26-config
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 55dc2bf..7f7bb05 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -138,7 +138,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 
 linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig: host-sed dirs $(LINUX26_DIR)/.stamp_configured
+linux26-menuconfig linux26-xconfig linux26-gconfig: dirs $(LINUX26_DIR)/.stamp_configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
 
 # Support for rebuilding the kernel after the initramfs file list has
diff --git a/package/Makefile.in b/package/Makefile.in
index bb2aafa..f0dda27 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -161,6 +161,7 @@ endif
 INSTALL:=$(shell which install || type -p install)
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
+SED:=$(shell which sed || type -p sed) -i -e
 
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
diff --git a/package/sed/configure.patch b/package/sed/configure.patch
deleted file mode 100644
index 3e90c39..0000000
--- a/package/sed/configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-diff -Nru sed-4.1.5.orig/configure sed-4.1.5/configure
---- sed-4.1.5.orig/configure	2006-02-03 11:24:40.000000000 +0200
-+++ sed-4.1.5/configure	2007-02-23 14:03:55.000000000 +0200
-@@ -10147,8 +10147,6 @@
-     LINGUAS="${LINGUAS-%UNSET%}"
- 
- 
--  install_sh="$install_sh"
--
- _ACEOF
- 
- 
-@@ -11265,14 +11263,10 @@
-       esac
-     done ;;
-     gettext-fix )
--  sed -e '/^mkinstalldirs *=/a\' \
--      -e "install_sh=$install_sh" \
--      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
-+  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
-       intl/Makefile > intl/Makefile.tmp
-   mv intl/Makefile.tmp intl/Makefile
--  sed -e '/^mkinstalldirs *=/a\' \
--      -e "install_sh=$install_sh" \
--      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
-+  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
-       po/Makefile > po/Makefile.tmp
-   mv po/Makefile.tmp po/Makefile ;;
-   esac
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index c393dd9..d6f53be 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -7,18 +7,12 @@ SED_VERSION:=4.2.1
 SED_SOURCE:=sed-$(SED_VERSION).tar.gz
 SED_SITE:=$(BR2_GNU_MIRROR)/sed
 SED_CAT:=$(ZCAT)
-SED_DIR1:=$(TOOLCHAIN_DIR)/sed-$(SED_VERSION)
 SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)
 SED_BINARY:=sed/sed
 SED_TARGET_BINARY:=bin/sed
 ifeq ($(BR2_LARGEFILE),y)
 SED_CPPFLAGS=-D_FILE_OFFSET_BITS=64
 endif
-#HOST_SED_DIR:=$(STAGING_DIR)
-HOST_SED_DIR:=$(TOOLCHAIN_DIR)
-SED:=$(HOST_SED_DIR)/bin/sed -i -e
-HOST_SED_BINARY:=$(shell package/sed/sedcheck.sh)
-HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
 
 $(DL_DIR)/$(SED_SOURCE):
 	mkdir -p $(DL_DIR)
@@ -26,78 +20,6 @@ $(DL_DIR)/$(SED_SOURCE):
 
 sed-source: $(DL_DIR)/$(SED_SOURCE)
 
-
-#############################################################
-#
-# build sed for use on the host system
-#
-#############################################################
-$(SED_DIR1)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
-	mkdir -p $(TOOLCHAIN_DIR)
-	mkdir -p $(HOST_SED_DIR)/bin
-	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
-	$(CONFIG_UPDATE) $(SED_DIR1)/config
-	touch $@
-
-$(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
-	(cd $(SED_DIR1); rm -rf config.cache; \
-		./configure $(QUIET) \
-		--prefix=/usr \
-	)
-	touch $@
-
-$(SED_DIR1)/$(SED_BINARY): $(SED_DIR1)/.configured
-	$(MAKE) -C $(SED_DIR1)
-
-# This stuff is needed to work around GNU make deficiencies
-build-sed-host-binary: $(SED_DIR1)/$(SED_BINARY)
-	@if [ -L $(HOST_SED_DIR)/$(SED_TARGET_BINARY) ]; then \
-		rm -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY); \
-	fi
-	@if [ ! -f $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
-	      -o $(HOST_SED_DIR)/$(SED_TARGET_BINARY) \
-	      -ot $(SED_DIR1)/$(SED_BINARY) ]; then \
-		set -x; \
-		mkdir -p $(HOST_SED_DIR)/bin; \
-		$(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) install; \
-		mv $(HOST_SED_DIR)/usr/bin/sed $(HOST_SED_DIR)/bin/; \
-		rm -rf $(HOST_SED_DIR)/share/locale; \
-		rm -rf $(HOST_SED_DIR)/usr/share/doc; \
-	fi
-
-$(HOST_SED_DIR)/$(SED_TARGET_BINARY):
-	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ]; then \
-		mkdir -p "$(HOST_SED_DIR)/bin"; \
-		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
-		ln -sf "$(HOST_SED_IF_ANY)" \
-			"$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
-	fi
-
-.PHONY: sed host-sed use-sed-host-binary
-
-use-sed-host-binary: $(HOST_SED_DIR)/$(SED_TARGET_BINARY)
-
-host-sed: $(HOST_SED_BINARY)
-
-ifeq ($(HOST_SED_BINARY),build-sed-host-binary)
-host-sed-clean:
-	$(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) uninstall
-	-$(MAKE) -C $(SED_DIR1) clean
-
-host-sed-dirclean:
-	rm -rf $(SED_DIR1)
-
-else
-host-sed-clean host-sed-dirclean:
-
-endif
-
-#############################################################
-#
-# build sed for use on the target system
-#
-#############################################################
 $(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(SED_DIR2)/build-aux
diff --git a/package/sed/sedcheck.sh b/package/sed/sedcheck.sh
deleted file mode 100755
index 3fe44e8..0000000
--- a/package/sed/sedcheck.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-
-# Make sure the host sed supports '-i' (in-place).
-# If it doesn't, we'll build and use our own.
-SED=$(toolchain/dependencies/check-host-sed.sh)
-
-if [ -z "$SED" ] ; then
-	echo build-sed-host-binary
-else
-	echo use-sed-host-binary
-fi
diff --git a/toolchain/dependencies/check-host-sed.sh b/toolchain/dependencies/check-host-sed.sh
deleted file mode 100755
index ed9a1d4..0000000
--- a/toolchain/dependencies/check-host-sed.sh
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-
-SEDLIST="/usr/bin/sed /bin/sed sed gnused gsed"
-
-for SED in $SEDLIST
-do
-	if ! test -x $SED ; then
-		SED=$(which $SED 2> /dev/null)
-		if ! test -x "$SED" > /dev/null ; then
-			SED=""
-			continue
-		fi
-	fi
-
-	tmp=$(mktemp)
-	echo "HELLO" > $tmp
-	$SED -i -e "s/HELLO/GOODBYE/" $tmp >/dev/null 2>&1
-	RESULT=$(cat $tmp)
-
-	if test $? != 0 ; then
-		SED=""
-	elif test -e ".sedtest-e" ; then
-		rm -f ".sedtest-e"
-		SED=""
-	elif [ "x$RESULT" = "x" ] || [ "$RESULT" != "GOODBYE" ] > /dev/null ;
-	then
-		SED=""
-	fi
-
-	rm -f $tmp
-	if [ ! -z "$SED" ] ; then
-		break
-	fi
-done
-echo $SED
diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index b334811..89ffd88 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -9,13 +9,9 @@ DEPENDENCIES_HOST_PREREQ:=
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=sstrip_host
 endif
-ifneq ($(findstring y,$(BR2_KERNEL_HEADERS_LZMA)),)
-DEPENDENCIES_HOST_PREREQ+=host-lzma
-endif
 
-dependencies: host-sed $(DEPENDENCIES_HOST_PREREQ)
+dependencies: $(DEPENDENCIES_HOST_PREREQ)
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
-		HOST_SED_DIR="$(HOST_SED_DIR)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index b47e9d8..ee21b37 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -55,14 +55,9 @@ if ! which which > /dev/null ; then
 	exit 1;
 fi;
 
-# Check sed
-SED=$(toolchain/dependencies/check-host-sed.sh)
-
-if [ -z "$SED" ] ; then
-	XSED=$HOST_SED_DIR/bin/sed
-	/bin/echo -e "\nSed doesn't work, using buildroot version instead\n"
-else
-	XSED=$SED
+if ! which sed > /dev/null ; then
+	/bin/echo -e "\nYou must install 'sed' on your build machine\n"
+	exit 1
 fi
 
 # Check make
@@ -71,13 +66,13 @@ if [ -z "$MAKE" ] ; then
 	/bin/echo -e "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
-MAKE_VERSION=$($MAKE --version 2>&1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
+MAKE_VERSION=$($MAKE --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$MAKE_VERSION" ] ; then
 	/bin/echo -e "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
-MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
-MAKE_MINOR=$(echo $MAKE_VERSION | $XSED -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
+MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
+MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
 	/bin/echo -e "\nYou have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required\n"
 	exit 1;
@@ -93,14 +88,14 @@ if [ -z "$COMPILER" ] ; then
 	exit 1;
 fi;
 
-COMPILER_VERSION=$($COMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
-	$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
+COMPILER_VERSION=$($COMPILER -v 2>&1 | sed -n '/^gcc version/p' |
+	sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
 	/bin/echo -e "\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
-COMPILER_MAJOR=$(echo $COMPILER_VERSION | $XSED -e "s/\..*//g")
-COMPILER_MINOR=$(echo $COMPILER_VERSION | $XSED -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
+COMPILER_MAJOR=$(echo $COMPILER_VERSION | sed -e "s/\..*//g")
+COMPILER_MINOR=$(echo $COMPILER_VERSION | sed -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
 if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
 	echo "\nYou have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required\n"
 	exit 1;
@@ -116,14 +111,14 @@ if [ -z "$CXXCOMPILER" ] ; then
 	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
-		$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
+	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | sed -n '/^gcc version/p' |
+		sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
 		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
 	fi
 
-	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/\..*//g")
-	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
+	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
+	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
 		/bin/echo -e "\nYou have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required\n"
 		exit 1
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 4fb9393..1ed40cc 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -425,7 +425,7 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate) $(LIBFLO
 		all
 	touch -c $@
 
-uclibc-menuconfig: host-sed dirs $(UCLIBC_DIR)/.config
+uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-- 
1.7.1
