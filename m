From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:48 -0700
Subject: [Buildroot] [PATCH 21/21] BugFix - m4 - Fixed Missing wint_t
	typedef When There Is No WChar Support
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-21-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/m4/m4-no-wchar/m4-no-wchar.patch |   20 ++++++++++++++++++++
 package/m4/m4.mk                         |    6 ++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/m4/m4-no-wchar/m4-no-wchar.patch

diff --git a/package/m4/m4-no-wchar/m4-no-wchar.patch b/package/m4/m4-no-wchar/m4-no-wchar.patch
new file mode 100644
index 0000000..751d228
--- /dev/null
+++ b/package/m4/m4-no-wchar/m4-no-wchar.patch
@@ -0,0 +1,20 @@
+--- m4-1.4.9/lib/printf-args.h	2010-09-09 23:14:49.000000000 -0700
++++ m4-1.4.9.no.wchar/lib/printf-args.h	2010-09-09 19:09:09.000000000 -0700
+@@ -29,6 +29,7 @@
+ /* Get wint_t.  */
+ #if HAVE_WINT_T
+ # include <wchar.h>
++typedef unsigned int wint_t;
+ #endif
+ 
+ /* Get va_list.  */
+--- m4-1.4.9/lib/wctype_.h	2010-09-09 23:14:49.000000000 -0700
++++ m4-1.4.9.no.wchar/lib/wctype_.h	2010-09-09 19:09:09.000000000 -0700
+@@ -39,6 +39,7 @@
+ # include <stdio.h>
+ # include <time.h>
+ # include <wchar.h>
++typedef unsigned int wint_t;
+ typedef wint_t __wctype_wint_t;
+ #else
+ typedef int __wctype_wint_t;
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index a0b56c4..7392e9d 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -6,6 +6,11 @@
 M4_VERSION = 1.4.9
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
+M4_DIR = $(BUILD_DIR)/m4-$(M4_VERSION)
+
+define M4_NO_WCHAR_SUPPORT
+	toolchain/patch-kernel.sh $(M4_DIR) package/m4/m4-no-wchar/ \*.patch
+endef
 
 ifeq ($(BR2_ENABLE_DEBUG),y) # no install-exec
 M4_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -15,6 +20,7 @@ M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
 M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
+M4_POST_CONFIGURE_HOOKS += M4_NO_WCHAR_SUPPORT
 endif
 
 HOST_M4_CONF_OPT = --disable-static
-- 
1.7.2.3
