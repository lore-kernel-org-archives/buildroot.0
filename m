From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Mar 2007 00:36:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20070309083622.C3A7248086@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-09 00:36:22 -0800 (Fri, 09 Mar 2007)
New Revision: 18047

Log:
Include a patch for GNU sed that allows building it on Mac OS X and
remove a spurious --prefix from sed.mk.  (Heikki Lindholm)


Added:
   trunk/buildroot/package/sed/configure.patch

Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Added: trunk/buildroot/package/sed/configure.patch
===================================================================
--- trunk/buildroot/package/sed/configure.patch	                        (rev 0)
+++ trunk/buildroot/package/sed/configure.patch	2007-03-09 08:36:22 UTC (rev 18047)
@@ -0,0 +1,29 @@
+diff -Nru sed-4.1.5.orig/configure sed-4.1.5/configure
+--- sed-4.1.5.orig/configure	2006-02-03 11:24:40.000000000 +0200
++++ sed-4.1.5/configure	2007-02-23 14:03:55.000000000 +0200
+@@ -10147,8 +10147,6 @@
+     LINGUAS="${LINGUAS-%UNSET%}"
+ 
+ 
+-  install_sh="$install_sh"
+-
+ _ACEOF
+ 
+ 
+@@ -11265,14 +11263,10 @@
+       esac
+     done ;;
+     gettext-fix )
+-  sed -e '/^mkinstalldirs *=/a\' \
+-      -e "install_sh=$install_sh" \
+-      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
++  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
+       intl/Makefile > intl/Makefile.tmp
+   mv intl/Makefile.tmp intl/Makefile
+-  sed -e '/^mkinstalldirs *=/a\' \
+-      -e "install_sh=$install_sh" \
+-      -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
++  sed -e 's/^mkinstalldirs *=.*/mkinstalldirs=$(MKINSTALLDIRS)/' \
+       po/Makefile > po/Makefile.tmp
+   mv po/Makefile.tmp po/Makefile ;;
+   esac

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-03-09 08:33:34 UTC (rev 18046)
+++ trunk/buildroot/package/sed/sed.mk	2007-03-09 08:36:22 UTC (rev 18047)
@@ -18,6 +18,7 @@
 HOST_SED_DIR:=$(TOOL_BUILD_DIR)
 SED:=$(HOST_SED_DIR)/bin/sed -i -e
 HOST_SED_TARGET=$(shell package/sed/sedcheck.sh)
+HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
 
 $(DL_DIR)/$(SED_SOURCE):
 	mkdir -p $(DL_DIR)
@@ -35,13 +36,13 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	mkdir -p $(HOST_SED_DIR)/bin;
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
 	touch $(SED_DIR1)/.unpacked
 
 $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
 	(cd $(SED_DIR1); rm -rf config.cache; \
 		./configure \
 		--prefix=$(HOST_SED_DIR) \
-		--prefix=/usr \
 	);
 	touch $(SED_DIR1)/.configured
 
@@ -62,17 +63,10 @@
 		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; fi
 
 use-sed-host-binary:
-	@if [ -x /usr/bin/sed ] ; then \
-		SED="/usr/bin/sed" ; \
-	else \
-		if [ -x /bin/sed ] ; then \
-			SED="/bin/sed" ; \
-		fi \
-	fi ; \
-	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
+	@if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
 		mkdir -p "$(HOST_SED_DIR)/bin"; \
 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
-		ln -sf "$$SED" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
+		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 	fi
 
 host-sed: $(HOST_SED_TARGET)
