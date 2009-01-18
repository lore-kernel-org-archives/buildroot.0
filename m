From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 14:22:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: lsof m4
Message-ID: <20090118142231.05B8377108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-18 14:22:30 +0000 (Sun, 18 Jan 2009)
New Revision: 24902

Log:
lsof, m4: use variables from BR instead of uclibc

UCLIB_HAS_.* is not defined in Buildroot space, so the conditions always
evaluate to the same result. Use appropriate Buildroot variables.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/lsof/lsof.mk
   trunk/buildroot/package/m4/m4.mk


Changeset:
Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2009-01-18 14:20:18 UTC (rev 24901)
+++ trunk/buildroot/package/lsof/lsof.mk	2009-01-18 14:22:30 UTC (rev 24902)
@@ -38,11 +38,11 @@
 	touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
-ifeq ($(UCLIBC_HAS_WCHAR),)
+ifeq ($(BR2_USE_WCHAR),)
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
 	$(SED) 's,^#define[[:space:]]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
 endif
-ifeq ($(UCLIBC_HAS_LOCALE),)
+ifeq ($(BR2_ENABLE_LOCALE),)
 	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
 endif
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2009-01-18 14:20:18 UTC (rev 24901)
+++ trunk/buildroot/package/m4/m4.mk	2009-01-18 14:22:30 UTC (rev 24902)
@@ -15,7 +15,7 @@
 ifeq ($(UCLIBC_HAS_REGEX),y)
 gl_cv_func_re_compile_pattern_working=gl_cv_func_re_compile_pattern_working=yes
 endif
-ifneq ($(UCLIBC_HAS_WCHAR),y)
+ifneq ($(BR2_USE_WCHAR),y)
 gt_cv_c_wchar_t=gt_cv_c_wchar_t=no
 gl_cv_absolute_wchar_h=gl_cv_absolute_wchar_h=__fpending.h
 endif
