From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:53:57 -0600
Subject: [Buildroot] [PATCH 05/30] sepolgen: new package
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in            |  4 ++++
 package/sepolgen/Config.in   | 15 +++++++++++++++
 package/sepolgen/sepolgen.mk | 25 +++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in b/package/Config.in
index a325cba..63373f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1181,6 +1181,10 @@ menu "Real-Time"
 	source "package/xenomai/Config.in"
 endmenu
 
+menu "Security"
+	source "package/sepolgen/Config.in"
+endmenu
+
 menu "Shell and utilities"
 comment "Shells"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
new file mode 100644
index 0000000..c499762
--- /dev/null
+++ b/package/sepolgen/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen"
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PY_PYC
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_USE_MMU # python
+	help
+	  sepolgen is a python module/library that forms the core
+	  of the modern audit2allow (a rewrite).
+
+	  http://selinuxproject.org/page/Main_Page
+
+comment "sepolgen needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
new file mode 100644
index 0000000..b330e20
--- /dev/null
+++ b/package/sepolgen/sepolgen.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sepolgen
+#
+################################################################################
+
+SEPOLGEN_VERSION = 1.1.9
+SEPOLGEN_SITE = http://userspace.selinuxproject.org/releases/20130423/
+SEPOLGEN_LICENSE = GPLv2
+SEPOLGEN_LICENSE_FILES = COPYING
+
+HOST_SEPOLGEN_DEPENDENCIES = host-python
+
+HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+define HOST_SEPOLGEN_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_SEPOLGEN_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
