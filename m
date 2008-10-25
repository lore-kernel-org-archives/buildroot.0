From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 25 Oct 2008 04:01:17 +0200
Subject: [Buildroot] [PATCH] lsof,
	m4: use variables from BR instead of uClibc
Message-ID: <200810250401.18342.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

UCLIB_HAS_* is not defined in Buildroot space, so the conditions always
evaluate to the same result. Use appropriate Buildroot variables.
---

Note: This change is untested and m4 still uses UCLIBC_HAS_REGEX, where I
don't know how to handle it.

 package/lsof/lsof.mk |    4 ++--
 package/m4/m4.mk     |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 2e9f5fd..85acd87 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -38,11 +38,11 @@ $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
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
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 570f9ac..8c57bef 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -15,7 +15,7 @@ M4_TARGET_BINARY:=usr/bin/m4
 ifeq ($(UCLIBC_HAS_REGEX),y)
 gl_cv_func_re_compile_pattern_working=gl_cv_func_re_compile_pattern_working=yes
 endif
-ifneq ($(UCLIBC_HAS_WCHAR),y)
+ifneq ($(BR2_USE_WCHAR),y)
 gt_cv_c_wchar_t=gt_cv_c_wchar_t=no
 gl_cv_absolute_wchar_h=gl_cv_absolute_wchar_h=__fpending.h
 endif
-- 
1.5.6.4
