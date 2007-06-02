From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Jun 2007 02:05:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070602090541.53E274809E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-02 02:05:40 -0700 (Sat, 02 Jun 2007)
New Revision: 18725

Log:
- move setting up the extensions to correct place (like i said but tom didn't do..)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-02 08:49:45 UTC (rev 18724)
+++ trunk/buildroot/Makefile	2007-06-02 09:05:40 UTC (rev 18725)
@@ -45,43 +45,28 @@
 cc-option = $(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
+
 #############################################################
 #
-# The list of stuff to build for the target toolchain
-# along with the packages to build for the target.
+# Setup the proper filename extensions for the target
 #
 ##############################################################
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
-else
-TARGETS:=uclibc
-endif
-include toolchain/Makefile.in
-include package/Makefile.in
-
-#############################################################
-#
-# You should probably leave this stuff alone unless you know
-# what you are doing.
-#
-#############################################################
-
-ifneq (,$(findstring linux,$(BR2_GNU_BUILD_SUFFIX)))
+ifneq ($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
 EXEEXT:=
 LIBEXT:=.a
 SHREXT:=.so
 endif
-ifneq (,$(findstring apple,$(BR2_GNU_BUILD_SUFFIX)))
+ifneq ($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
 EXEEXT:=
 LIBEXT:=.a
 SHREXT:=.dylib
 endif
-ifneq (,$(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)))
+ifneq ($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
 EXEEXT:=.exe
 LIBEXT:=.lib
 SHREXT:=.dll
 endif
-ifneq (,$(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)))
+ifneq ($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
 EXEEXT:=.exe
 LIBEXT:=.lib
 SHREXT:=.dll
@@ -93,6 +78,29 @@
 LIBTGTEXT=$(SHREXT)
 endif
 
+
+
+#############################################################
+#
+# The list of stuff to build for the target toolchain
+# along with the packages to build for the target.
+#
+##############################################################
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
+else
+TARGETS:=uclibc
+endif
+include toolchain/Makefile.in
+include package/Makefile.in
+
+#############################################################
+#
+# You should probably leave this stuff alone unless you know
+# what you are doing.
+#
+#############################################################
+
 all:   world
 
 # In this section, we need .config
