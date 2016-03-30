From: tiago.brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Wed, 30 Mar 2016 10:01:52 -0300
Subject: [Buildroot] [PATCH 1/1] aer-inject: new package
Message-ID: <1459342912-10816-1-git-send-email-tiago.brusamarello@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aer-inject allows to inject PCIE AER errors on the software level into
a running Linux kernel. This is intended for validation of the PCIE
driver error recovery handler and PCIE AER core handler.

Change-Id: Id3e701a9eb692627db42320ea7c37afbf4f712b8
Signed-off-by: tiago.brusamarello <tiago.brusamarello@datacom.ind.br>
---
 package/Config.in                |  1 +
 package/aer-inject/Config.in     | 10 ++++++++++
 package/aer-inject/aer-inject.mk | 24 ++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/aer-inject/Config.in
 create mode 100644 package/aer-inject/aer-inject.mk

diff --git a/package/Config.in b/package/Config.in
index 8208da8..bd76669 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -340,6 +340,7 @@ menu "Firmware"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
+	source "package/aer-inject/Config.in"
 	source "package/am335x-pru-package/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
diff --git a/package/aer-inject/Config.in b/package/aer-inject/Config.in
new file mode 100644
index 0000000..8856ff1
--- /dev/null
+++ b/package/aer-inject/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_AER_INJECT
+	bool "aer-inject"
+	help
+	  aer-inject allows to inject PCIE AER errors on the software level into
+	  a running Linux kernel. This is intended for validation of the PCIE
+	  driver error recovery handler and PCIE AER core handler.
+
+	  Requires a new Linux kernel with PCIE AER error injection patches.
+
+	  https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
new file mode 100644
index 0000000..6b2c844
--- /dev/null
+++ b/package/aer-inject/aer-inject.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# aer-inject
+#
+################################################################################
+
+AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
+AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
+AER_INJECT_SITE_METHOD = git
+AER_INJECT_LICENSE = GPLv2
+AER_INJECT_LICENSE_FILES = README
+AER_INJECT_DEPENDENCIES = host-flex host-bison
+AER_INJECT_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+define AER_INJECT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(AER_INJECT_MAKE_OPTS)
+endef
+
+define AER_INJECT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(AER_INJECT_MAKE_OPTS) \
+	DESTDIR=$(TARGET_DIR) PREFIX=/usr/bin install
+endef
+
+$(eval $(generic-package))
\ No newline at end of file
-- 
1.9.1
