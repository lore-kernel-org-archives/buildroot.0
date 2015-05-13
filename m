From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:34 -0500
Subject: [Buildroot] [PATCH v5 21/24] bash: added option to disable locale
	support
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-22-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

---
 package/bash/Config.in | 10 ++++++++++
 package/bash/bash.mk   |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/bash/Config.in b/package/bash/Config.in
index 2f823dc..171d2ad 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -8,3 +8,13 @@ config BR2_PACKAGE_BASH
 	  The standard GNU Bourne again shell.
 
 	  http://tiswww.case.edu/php/chet/bash/bashtop.html
+
+if BR2_PACKAGE_BASH
+
+config BR2_PACKAGE_BASH_NO_LOCALE
+	bool "disable locale support"
+	help
+	  Disable locale support for cases where toolchain has it
+	  but target isn't setup to use it.
+
+endif
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9865e19..67a423e 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -21,6 +21,15 @@ BASH_CONF_ENV += \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
+
+ifeq ($(BR2_PACKAGE_BASH_NO_LOCALE),y)
+BASH_CONF_ENV += \
+	ac_cv_header_locale_h=no \
+	ac_cv_func_locale_charset=no \
+	ac_cv_func_setlocale=no \
+	ac_cv_func_localeconv=no
+endif
+
 # Parallel build sometimes fails because some of the generator tools
 # are built twice (i.e. while executing).
 BASH_MAKE = $(MAKE1)
-- 
1.9.1
