From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  9 Feb 2017 14:45:57 +0100
Subject: [Buildroot] [PATCH 3/4] libpwquality: New package
In-Reply-To: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
Message-ID: <20170209134558.3723-3-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Config.in                                  |  1 +
 ...ith-disable-nls-on-platforms-without-libi.patch | 42 ++++++++++++++++++++++
 ...leak-in-settings-when-using-bad-word-list.patch | 23 ++++++++++++
 package/libpwquality/Config.in                     | 18 ++++++++++
 package/libpwquality/libpwquality.hash             |  2 ++
 package/libpwquality/libpwquality.mk               | 24 +++++++++++++
 6 files changed, 110 insertions(+)
 create mode 100644 package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
 create mode 100644 package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
 create mode 100644 package/libpwquality/Config.in
 create mode 100644 package/libpwquality/libpwquality.hash
 create mode 100644 package/libpwquality/libpwquality.mk

diff --git a/package/Config.in b/package/Config.in
index a149936..3b31eab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1360,6 +1360,7 @@ menu "Other"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
+	source "package/libpwquality/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
new file mode 100644
index 0000000..2ce79b9
--- /dev/null
+++ b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
@@ -0,0 +1,42 @@
+Status: Upstream
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+
+# HG changeset patch
+# User Stefan S?rensen <stefan.sorensen@spectralink.com>
+# Date 1486030609 -3600
+#      Thu Feb 02 11:16:49 2017 +0100
+# Node ID 3a716ca2bbf90cde4d86ef3c4597884d6a416525
+# Parent  79ca3b91513faf3bd03464808d107b71ba5d6c3b
+Fix build with --disable-nls on platforms without libintl included in libc.
+
+diff -r 79ca3b91513f -r 3a716ca2bbf9 src/pwmake.c
+--- a/src/pwmake.c	Tue Nov 01 15:16:54 2016 +0100
++++ b/src/pwmake.c	Thu Feb 02 11:16:49 2017 +0100
+@@ -33,9 +33,11 @@
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
+diff -r 79ca3b91513f -r 3a716ca2bbf9 src/pwscore.c
+--- a/src/pwscore.c	Tue Nov 01 15:16:54 2016 +0100
++++ b/src/pwscore.c	Thu Feb 02 11:16:49 2017 +0100
+@@ -34,9 +34,11 @@
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
diff --git a/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
new file mode 100644
index 0000000..fe7b9e8
--- /dev/null
+++ b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
@@ -0,0 +1,23 @@
+Status: Upstream
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+
+# HG changeset patch
+# User Stefan S?rensen <stefan.sorensen@spectralink.com>
+# Date 1486030646 -3600
+#      Thu Feb 02 11:17:26 2017 +0100
+# Node ID 7d2ba499cbd538065931251042ce93b8e5f4edf2
+# Parent  3a716ca2bbf90cde4d86ef3c4597884d6a416525
+Fix memory leak in settings when using bad word list.
+
+diff -r 3a716ca2bbf9 -r 7d2ba499cbd5 src/settings.c
+--- a/src/settings.c	Thu Feb 02 11:16:49 2017 +0100
++++ b/src/settings.c	Thu Feb 02 11:17:26 2017 +0100
+@@ -46,6 +46,7 @@
+ {
+         if (pwq) {
+                 free(pwq->dict_path);
++                free(pwq->bad_words);
+                 free(pwq);
+         }
+ }
diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
new file mode 100644
index 0000000..da295f0
--- /dev/null
+++ b/package/libpwquality/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBPWQUALITY
+	bool "libpwquality"
+	help
+	  This is a library for password quality checks and generation
+	  of random passwords that pass the checks.  This library uses
+	  the cracklib and cracklib dictionaries to perform some of
+	  the checks.
+
+	  https://fedorahosted.org/libpwquality/
+
+if BR2_PACKAGE_LIBPWQUALITY
+
+config BR2_PACKAGE_LIBPWQUALITY_TOOLS
+	bool "install tools"
+	help
+	  Install libpwquality command line tools generating/checking passwords.
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
index 0000000..aa08aff
--- /dev/null
+++ b/package/libpwquality/libpwquality.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libpwquality
+#
+################################################################################
+
+LIBPWQUALITY_VERSION = 1.3.0
+LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
+LIBPWQUALITY_SITE = https://fedorahosted.org/releases/l/i/libpwquality
+LIBPWQUALITY_LICENSE = BSD or LGPLv2+
+LIBPWQUALITY_INSTALL_STAGING = YES
+LIBPWQUALITY_DEPENDENCIES = cracklib
+LIBPWQUALITY_AUTORECONF = YES
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
