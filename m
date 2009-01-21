From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 21 Jan 2009 07:09:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/oprofile
Message-ID: <20090121070943.7C11A768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-21 07:09:41 +0000 (Wed, 21 Jan 2009)
New Revision: 24936

Log:
Remove reference to query_modules in oprofile, does not exist in linux-2.6. oprofile now builds for ARM

Added:
   trunk/buildroot/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch
   trunk/buildroot/package/oprofile/oprofile-0.9.4-002-no-query-modules.patch

Removed:
   trunk/buildroot/package/oprofile/oprofile-0.9.4-avr32-enable-lookup_dcookie.patch

Modified:
   trunk/buildroot/package/oprofile/oprofile.mk


Changeset:
Copied: trunk/buildroot/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch (from rev 24923, trunk/buildroot/package/oprofile/oprofile-0.9.4-avr32-enable-lookup_dcookie.patch)
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch	2009-01-21 07:09:41 UTC (rev 24936)
@@ -0,0 +1,24 @@
+Index: oprofile-0.9.4/daemon/opd_cookie.c
+===================================================================
+--- oprofile-0.9.4.orig/daemon/opd_cookie.c	2008-07-25 16:00:17.000000000 +0200
++++ oprofile-0.9.4/daemon/opd_cookie.c	2008-07-25 16:00:20.000000000 +0200
+@@ -78,6 +78,19 @@
+ 		       (unsigned long)(cookie & 0xffffffff),
+ 		       (unsigned long)(cookie >> 32), buf, size);
+ }
++#elif (defined(__avr32__))
++static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
++{
++	/* On avr32, the first 64bit arg (cookie) is expected to be in
++	 * r11(MSW)/r10(LSW) which normally hold arg 2 and arg 3. The second arg
++	 * (buf) is then expected to be in r12 which normally holds the first
++	 * arg. Third arg (size) is at the right position.
++	 */
++	return syscall(__NR_lookup_dcookie, buf,
++			(unsigned long)(cookie >> 32),
++			(unsigned long)(cookie & 0xffffffff),
++			size);
++}
+ #else
+ static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
+ {


Property changes on: trunk/buildroot/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch
___________________________________________________________________
Added: svn:mergeinfo
   + 

Added: trunk/buildroot/package/oprofile/oprofile-0.9.4-002-no-query-modules.patch
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-0.9.4-002-no-query-modules.patch	                        (rev 0)
+++ trunk/buildroot/package/oprofile/oprofile-0.9.4-002-no-query-modules.patch	2009-01-21 07:09:41 UTC (rev 24936)
@@ -0,0 +1,21 @@
+diff -urN oprofile-0.9.4-0rig//daemon/liblegacy/opd_kernel.c oprofile-0.9.4/daemon/liblegacy/opd_kernel.c
+--- oprofile-0.9.4-0rig//daemon/liblegacy/opd_kernel.c	2005-05-04 04:47:03.000000000 +0200
++++ oprofile-0.9.4/daemon/liblegacy/opd_kernel.c	2009-01-21 07:40:20.000000000 +0100
+@@ -270,6 +270,9 @@
+  */
+ static void opd_drop_module_sample(unsigned long eip)
+ {
++	verbprintf(vmodule, "query_module not available on linux-2.6: %s\n", strerror(EPERM));
++
++#if	0
+ 	char * module_names;
+ 	char * name;
+ 	size_t size = 1024;
+@@ -307,6 +310,7 @@
+ 
+ 	if (module_names)
+ 		free(module_names);
++#endif
+ }
+ 
+ 

Deleted: trunk/buildroot/package/oprofile/oprofile-0.9.4-avr32-enable-lookup_dcookie.patch
===================================================================
--- trunk/buildroot/package/oprofile/oprofile-0.9.4-avr32-enable-lookup_dcookie.patch	2009-01-21 02:53:20 UTC (rev 24935)
+++ trunk/buildroot/package/oprofile/oprofile-0.9.4-avr32-enable-lookup_dcookie.patch	2009-01-21 07:09:41 UTC (rev 24936)
@@ -1,24 +0,0 @@
-Index: oprofile-0.9.4/daemon/opd_cookie.c
-===================================================================
---- oprofile-0.9.4.orig/daemon/opd_cookie.c	2008-07-25 16:00:17.000000000 +0200
-+++ oprofile-0.9.4/daemon/opd_cookie.c	2008-07-25 16:00:20.000000000 +0200
-@@ -78,6 +78,19 @@
- 		       (unsigned long)(cookie & 0xffffffff),
- 		       (unsigned long)(cookie >> 32), buf, size);
- }
-+#elif (defined(__avr32__))
-+static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
-+{
-+	/* On avr32, the first 64bit arg (cookie) is expected to be in
-+	 * r11(MSW)/r10(LSW) which normally hold arg 2 and arg 3. The second arg
-+	 * (buf) is then expected to be in r12 which normally holds the first
-+	 * arg. Third arg (size) is at the right position.
-+	 */
-+	return syscall(__NR_lookup_dcookie, buf,
-+			(unsigned long)(cookie >> 32),
-+			(unsigned long)(cookie & 0xffffffff),
-+			size);
-+}
- #else
- static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
- {

Modified: trunk/buildroot/package/oprofile/oprofile.mk
===================================================================
--- trunk/buildroot/package/oprofile/oprofile.mk	2009-01-21 02:53:20 UTC (rev 24935)
+++ trunk/buildroot/package/oprofile/oprofile.mk	2009-01-21 07:09:41 UTC (rev 24936)
@@ -4,10 +4,11 @@
 #
 #############################################################
 OPROFILE_VERSION := 0.9.4
-OPROFILE_CONF_OPT := --localstatedir=/var \
-		     --with-extra-includes="$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd -I$(TOOL_BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)/include" \
-		     --with-extra-libs=$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
-		     --with-kernel-support
+OPROFILE_CONF_OPT :=	--localstatedir=/var \
+			--with-extra-includes="$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
+			-I$(TOOL_BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)/include" \
+			--with-extra-libs=$(BUILD_DIR)/binutils-$(BR2_BINUTILS_VERSION)-target/bfd \
+			--with-kernel-support
 
 OPROFILE_BINARIES := utils/ophelp
 OPROFILE_BINARIES += pp/opannotate pp/oparchive pp/opgprof pp/opreport opjitconv/opjitconv
@@ -43,3 +44,4 @@
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
 	-$(MAKE) -C $(OPROFILE_DIR) clean
 	touch $@
+
