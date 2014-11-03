From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon,  3 Nov 2014 01:34:09 +0100
Subject: [Buildroot] [PATCH v2 2/4] bdwgc: new package
In-Reply-To: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
References: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1414974851-4819-3-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
conservative garbage collector can be used as a garbage collecting
replacement for C 'malloc' or C++ 'new'.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v1 -> v2
- Add external default dependency on libatomic_ops
- Fix several formatting issues
(All changes suggested by Yann Morin)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/Config.in       |  1 +
 package/bdwgc/Config.in | 11 +++++++++++
 package/bdwgc/bdwgc.mk  | 19 +++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk

diff --git a/package/Config.in b/package/Config.in
index 3b3c372..bb158b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ endmenu
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
+	source "package/bdwgc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
new file mode 100644
index 0000000..6f3878e
--- /dev/null
+++ b/package/bdwgc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BDWGC
+	bool "bdwgc"
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  The Boehm-Demers-Weiser conservative garbage collector can 
+	  be used as a garbage collecting replacement for C 'malloc'
+	  or C++ 'new'.
+
+	  http://www.hboehm.info/gc/
+
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
new file mode 100644
index 0000000..a687cc2
--- /dev/null
+++ b/package/bdwgc/bdwgc.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# bdwgc
+#
+################################################################################
+
+BDWGC_VERSION = 7.2f
+BDWGC_SOURCE  = gc-$(BDWGC_VERSION).tar.gz
+BDWGC_SITE    = http://www.hboehm.info/gc/gc_source
+BDWGC_INSTALL_STAGING = YES
+BDWGC_LICENSE = bdwgc license
+BDWGC_LICENSE_FILES = README
+BDWGC_LIBTOOL_PATCH = NO
+
+BDWGC_DEPENDENCIES = host-bdwgc libatomic_ops
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
1.9.1
