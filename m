From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 03:11:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/m4
Message-ID: <20070707101119.0A989A682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 03:11:17 -0700 (Sat, 07 Jul 2007)
New Revision: 19016

Log:
- account for setups without wchar support.


Modified:
   trunk/buildroot/package/m4/m4.mk


Changeset:
Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2007-07-07 09:31:09 UTC (rev 19015)
+++ trunk/buildroot/package/m4/m4.mk	2007-07-07 10:11:17 UTC (rev 19016)
@@ -15,6 +15,10 @@
 ifeq ($(UCLIBC_HAS_REGEX),y)
 gl_cv_func_re_compile_pattern_working=gl_cv_func_re_compile_pattern_working=yes
 endif
+ifneq ($(UCLIBC_HAS_WCHAR),y)
+gt_cv_c_wchar_t=gt_cv_c_wchar_t=no
+gl_cv_absolute_wchar_h=gl_cv_absolute_wchar_h=__fpending.h
+endif
 
 $(DL_DIR)/$(M4_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(M4_SITE)/$(M4_SOURCE)
@@ -33,6 +37,8 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		gl_cv_func_gettimeofday_clobber=no \
 		$(gl_cv_func_re_compile_pattern_working) \
+		$(gt_cv_c_wchar_t) \
+		$(gl_cv_absolute_wchar_h) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
