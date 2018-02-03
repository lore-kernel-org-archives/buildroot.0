From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  3 Feb 2018 23:07:33 +0100
Subject: [Buildroot] [PATCH v1] quotatool: new package
Message-ID: <20180203220733.15255-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...x-missing-__P-definition-for-musl-compile.patch | 36 ++++++++++++++++++++++
 package/quotatool/Config.in                        |  7 +++++
 package/quotatool/quotatool.hash                   |  5 +++
 package/quotatool/quotatool.mk                     | 18 +++++++++++
 6 files changed, 68 insertions(+)
 create mode 100644 package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
 create mode 100644 package/quotatool/Config.in
 create mode 100644 package/quotatool/quotatool.hash
 create mode 100644 package/quotatool/quotatool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9048d45b16..40b9590ca1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1376,6 +1376,7 @@ F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/qt5/
+F:	package/quotatool/
 F:	package/racehound/
 F:	package/wiringpi/
 
diff --git a/package/Config.in b/package/Config.in
index 9a6b199f40..8aa1126934 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1971,6 +1971,7 @@ menu "System tools"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
 	source "package/quota/Config.in"
+	source "package/quotatool/Config.in"
 	source "package/rauc/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
diff --git a/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
new file mode 100644
index 0000000000..927e62ba8c
--- /dev/null
+++ b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
@@ -0,0 +1,36 @@
+From 0e096badc901f755f3bcefabdc57091725a5a0c5 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 1 Feb 2018 23:50:43 +0100
+Subject: [PATCH] fix missing __P definition for musl compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  In file included from src/quota.h:40:0,
+                   from src/parse.c:26:
+  src/linux/linux_quota.h:120:15: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?__P?
+   long quotactl __P((int, const char *, qid_t, caddr_t));
+                 ^~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/linux/linux_quota.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/linux/linux_quota.h b/src/linux/linux_quota.h
+index 11f9871..2b29a89 100644
+--- a/src/linux/linux_quota.h
++++ b/src/linux/linux_quota.h
+@@ -14,6 +14,7 @@
+ #ifndef LINUX_QUOTA_H
+ #define LINUX_QUOTA_H
+ 
++#include <sys/cdefs.h>
+ #include <sys/types.h>
+ #include "system.h"
+ 
+-- 
+2.16.1
+
diff --git a/package/quotatool/Config.in b/package/quotatool/Config.in
new file mode 100644
index 0000000000..4015cef6c8
--- /dev/null
+++ b/package/quotatool/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QUOTATOOL
+	bool "quotatool"
+	help
+	  Quotatool is a utility to manipulate filesystem quotas from
+	  the commandline.
+
+	  http://quotatool.ekenberg.se/
diff --git a/package/quotatool/quotatool.hash b/package/quotatool/quotatool.hash
new file mode 100644
index 0000000000..45b477830e
--- /dev/null
+++ b/package/quotatool/quotatool.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 e53adc480d54ae873d160dc0e88d78095f95d9131e528749fd982245513ea090 quotatool-1.6.2.tar.gz
+
+# Hash for license files:
+sha256 94686eeb98a40edc64106c6f8644068d8a08816a510a3cde75e50f1bf470564d COPYING
diff --git a/package/quotatool/quotatool.mk b/package/quotatool/quotatool.mk
new file mode 100644
index 0000000000..ddff036264
--- /dev/null
+++ b/package/quotatool/quotatool.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# quotatool
+#
+################################################################################
+
+QUOTATOOL_VERSION = 1.6.2
+QUOTATOOL_SITE = http://quotatool.ekenberg.se
+QUOTATOOL_LICENSE = GPL-2.0
+QUOTATOOL_LICENSE_FILES = COPYING
+
+define QUOTATOOL_PRE_INSTALL_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/man/man8
+endef
+
+QUOTATOOL_PRE_INSTALL_TARGET_HOOKS += QUOTATOOL_PRE_INSTALL_FIXUP
+
+$(eval $(autotools-package))
-- 
2.16.1
