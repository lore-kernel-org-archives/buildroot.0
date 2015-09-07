From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon,  7 Sep 2015 10:37:42 -0300
Subject: [Buildroot] [PATCH] check: new package
Message-ID: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in        |  1 +
 package/check/Config.in  |  6 ++++++
 package/check/check.hash |  3 +++
 package/check/check.mk   | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/check/Config.in
 create mode 100644 package/check/check.hash
 create mode 100644 package/check/check.mk

diff --git a/package/Config.in b/package/Config.in
index 5a4e9c3..bd5897d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -110,6 +110,7 @@ menu "Development tools"
 	source "package/binutils/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
+	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
diff --git a/package/check/Config.in b/package/check/Config.in
new file mode 100644
index 0000000..04682e1
--- /dev/null
+++ b/package/check/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CHECK
+	bool "check"
+	help
+	  Check is a unit testing framework for C.
+
+	  http://check.sourceforge.net/
diff --git a/package/check/check.hash b/package/check/check.hash
new file mode 100644
index 0000000..0c3a924
--- /dev/null
+++ b/package/check/check.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/check/files/check/0.10.0/
+md5	53c5e5c77d090e103a17f3ed7fd7d8b8	check-0.10.0.tar.gz
+sha1	35d3a53446aea7b21a770faedb358d0fc7cba76d	check-0.10.0.tar.gz
diff --git a/package/check/check.mk b/package/check/check.mk
new file mode 100644
index 0000000..9b88321
--- /dev/null
+++ b/package/check/check.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# check
+#
+################################################################################
+
+CHECK_VERSION = 0.10.0
+CHECK_SITE = http://downloads.sourceforge.net/project/check/check/$(CHECK_VERSION)
+CHECK_INSTALL_STAGING = YES
+CHECK_DEPENDENCIES = host-pkgconf
+CHECK_LICENSE = LGPLv2.1+
+CHECK_LICENSE_FILES = COPYING.LESSER
+
+# Having checkmk in the target makes no sense
+define CHECK_REMOVE_CHECKMK
+	rm -f $(TARGET_DIR)/usr/bin/checkmk
+endef
+CHECK_POST_INSTALL_TARGET_HOOKS += CHECK_REMOVE_CHECKMK
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.4.6
