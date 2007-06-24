From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 24 Jun 2007 04:30:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070624113006.5A946A65FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-24 04:30:05 -0700 (Sun, 24 Jun 2007)
New Revision: 18904

Log:
- disable sysroot support for anything but the current, stable release series


Modified:
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-06-23 23:14:02 UTC (rev 18903)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-06-24 11:30:05 UTC (rev 18904)
@@ -52,7 +52,7 @@
 		bool "gcc 4.0.3"
 
 	config BR2_GCC_VERSION_4_0_4
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.0.4"
 
 	config BR2_GCC_VERSION_4_1_0
@@ -84,7 +84,7 @@
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20070601"
+	default "20070622"
 	depends BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
@@ -113,7 +113,7 @@
 config BR2_TOOLCHAIN_SYSROOT
 #	bool "Enable toolchain with --sysroot support"
 	bool
-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6
+	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 &&!BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !BR2_GCC_VERSION_4_1_2
 	default y
 	help
 	  Enables --sysroot=dir for binutils and gcc.
@@ -122,6 +122,9 @@
 	  /usr/include and libraries in /usr/lib, it will instead search
 	  dir/usr/include and dir/usr/lib.
 
+	  This does not work with gcc < 4.2.0 (4.1.2 gets
+	  ORIGINAL_AS_FOR_TARGET wrong)
+
 config BR2_GCC_USE_SJLJ_EXCEPTIONS
 	bool "Enable setjmp/longjmp exceptions?"
 	default n

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-06-23 23:14:02 UTC (rev 18903)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-06-24 11:30:05 UTC (rev 18904)
@@ -19,8 +19,8 @@
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
-# only for gcc-3.x
-ifeq ($(findstring y,$(BR2_GCC_VERSION_3_3_5)$(BR2_GCC_VERSION_3_3_6)$(BR2_GCC_VERSION_3_4_2)$(BR2_GCC_VERSION_3_4_3)$(BR2_GCC_VERSION_3_4_4)$(BR2_GCC_VERSION_3_4_5)$(BR2_GCC_VERSION_3_4_6)),y)
+# without sysroot support. Sysroot toolchain is gcc-uclibc-4.x.mk
+ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
 ifeq ($(GCC_SNAP_DATE),)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-23 23:14:02 UTC (rev 18903)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-24 11:30:05 UTC (rev 18904)
@@ -17,8 +17,9 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-# gcc-4.x only
-ifeq ($(findstring y,$(BR2_GCC_VERSION_3_3_5)$(BR2_GCC_VERSION_3_3_6)$(BR2_GCC_VERSION_3_4_2)$(BR2_GCC_VERSION_3_4_3)$(BR2_GCC_VERSION_3_4_4)$(BR2_GCC_VERSION_3_4_5)$(BR2_GCC_VERSION_3_4_6)),)
+# sysroot support works with gcc >= 4.2.0 only
+ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
+
 ifeq ($(GCC_SNAP_DATE),)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)
 GCC_SITE:=http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)
