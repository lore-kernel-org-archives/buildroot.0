From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 19 Apr 2017 09:56:02 +0200
Subject: [Buildroot] [PATCH v3 2/2] libpwquality: New package
In-Reply-To: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
References: <20170419075602.22245-1-stefan.sorensen@spectralink.com>
Message-ID: <20170419075602.22245-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changes since v2

Changes since v1:
 * Update DEVELOPERS file
 * Use SPDX license codes
 * Use new github site
 * Remove unneeded autoreconf
 * Fix building when python is enabled

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ith-disable-nls-on-platforms-without-libi.patch | 47 ++++++++++++++++++++++
 ...leak-in-settings-when-using-bad-word-list.patch | 26 ++++++++++++
 package/libpwquality/Config.in                     | 19 +++++++++
 package/libpwquality/libpwquality.hash             |  2 +
 package/libpwquality/libpwquality.mk               | 32 +++++++++++++++
 7 files changed, 128 insertions(+)
 create mode 100644 package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
 create mode 100644 package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
 create mode 100644 package/libpwquality/Config.in
 create mode 100644 package/libpwquality/libpwquality.hash
 create mode 100644 package/libpwquality/libpwquality.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4139a19..977ebfe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1484,6 +1484,7 @@ F:	package/yasm/
 
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
 F:	package/cracklib/
+F:	package/libpwquality/
 F:	package/libscrypt/
 
 N:	Stephan Hoffmann <sho@relinux.de>
diff --git a/package/Config.in b/package/Config.in
index cf0d78d..3955a04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1386,6 +1386,7 @@ menu "Other"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
+	source "package/libpwquality/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
new file mode 100644
index 0000000..3bae15c
--- /dev/null
+++ b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
@@ -0,0 +1,47 @@
+From fd1694c9d85666a39fe39e76518581b1ccd5a6c5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Thu, 2 Feb 2017 11:16:49 +0100
+Subject: [PATCH] Fix build with --disable-nls on platforms without libintl
+ included in libc.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+
+---
+
+Status: accepted upstream, not yet released.
+
+diff --git a/src/pwmake.c b/src/pwmake.c
+index 5b8cfb8..81f7cd3 100644
+--- a/src/pwmake.c
++++ b/src/pwmake.c
+@@ -33,9 +33,11 @@ main(int argc, char *argv[])
+         int bits;
+         void *auxerror;
+ 
++#ifdef ENABLE_NLS
+         setlocale(LC_ALL, "");
+         bindtextdomain("libpwquality", "/usr/share/locale");
+         textdomain("libpwquality");
++#endif
+ 
+         if (argc != 2) {
+                 usage(basename(argv[0]));
+diff --git a/src/pwscore.c b/src/pwscore.c
+index 219a175..24c13f2 100644
+--- a/src/pwscore.c
++++ b/src/pwscore.c
+@@ -34,9 +34,11 @@ main(int argc, char *argv[])
+         size_t len;
+         char *user = NULL;
+ 
++#ifdef ENABLE_NLS
+         setlocale(LC_ALL, "");
+         bindtextdomain("libpwquality", "/usr/share/locale");
+         textdomain("libpwquality");
++#endif
+ 
+         if (argc > 2) {
+                 usage(basename(argv[0]));
+-- 
+2.9.3
+
diff --git a/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
new file mode 100644
index 0000000..1b4f242
--- /dev/null
+++ b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
@@ -0,0 +1,26 @@
+From b1f2f1f71894fa0af92041fb4d5b6146101d63e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Thu, 2 Feb 2017 11:17:26 +0100
+Subject: [PATCH] Fix memory leak in settings when using bad word list.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+
+---
+
+Status: accepted upstream, not yet released.
+
+diff --git a/src/settings.c b/src/settings.c
+index 5c38b30..4b026b1 100644
+--- a/src/settings.c
++++ b/src/settings.c
+@@ -46,6 +46,7 @@ pwquality_free_settings(pwquality_settings_t *pwq)
+ {
+         if (pwq) {
+                 free(pwq->dict_path);
++                free(pwq->bad_words);
+                 free(pwq);
+         }
+ }
+-- 
+2.9.3
+
diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
new file mode 100644
index 0000000..4e85525
--- /dev/null
+++ b/package/libpwquality/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBPWQUALITY
+	bool "libpwquality"
+	help
+	  This is a library for password quality checks and generation
+	  of random passwords that pass the checks.  This library uses
+	  the cracklib and cracklib dictionaries to perform some of
+	  the checks.
+
+	  https://github.com/libpwquality/libpwquality
+
+if BR2_PACKAGE_LIBPWQUALITY
+
+config BR2_PACKAGE_LIBPWQUALITY_TOOLS
+	bool "install tools"
+	help
+	  Install libpwquality command line tools generating/checking
+	  passwords.
+
+endif
diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
new file mode 100644
index 0000000..0e3f9e3
--- /dev/null
+++ b/package/libpwquality/libpwquality.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	74d2ea90e103323c1f2d6a6cc9617cdae6877573eddb31aaf31a40f354cc2d2a	libpwquality-1.3.0.tar.bz2
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
new file mode 100644
index 0000000..4236ebd
--- /dev/null
+++ b/package/libpwquality/libpwquality.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libpwquality
+#
+################################################################################
+
+LIBPWQUALITY_VERSION = 1.3.0
+LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
+LIBPWQUALITY_SITE = $(call github,libpwquality,libpwquality,$(LIBPWQUALITY_VERSION))
+LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
+LIBPWQUALITY_INSTALL_STAGING = YES
+LIBPWQUALITY_DEPENDENCIES = cracklib
+LIBPWQUALITY_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LIBPWQUALITY_CONF_OPTS += --enable-python-bindings
+LIBPWQUALITY_DEPENDENCIES += python
+LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+else
+LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPWQUALITY_TOOLS),)
+define LIBPWQUALITY_REMOVE_TOOLS
+	rm -f $(TARGET_DIR)/usr/bin/pwmake
+	rm -f $(TARGET_DIR)/usr/bin/pwscore
+endef
+
+LIBPWQUALITY_POST_INSTALL_TARGET_HOOKS += LIBPWQUALITY_REMOVE_TOOLS
+endif
+
+$(eval $(autotools-package))
-- 
2.9.3
