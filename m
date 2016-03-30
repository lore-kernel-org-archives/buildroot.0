From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 18:24:08 +0200
Subject: [Buildroot] [git commit] aer-inject: new package
Message-ID: <20160330162501.8007C816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=198a7f1bbcd2449516471a7deed72e2e8a7335f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aer-inject allows to inject PCIE AER errors on the software level into
a running Linux kernel. This is intended for validation of the PCIE
driver error recovery handler and PCIE AER core handler.

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
[Thomas:
 - tweak commit log
 - rewrap Config.in help text
 - remove useless AER_INJECT_MAKE_OPTS variable, use
   TARGET_CONFIGURE_OPTS directly
 - add missing newline at end of .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/aer-inject/Config.in     | 12 ++++++++++++
 package/aer-inject/aer-inject.mk | 23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+)

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
index 0000000..7c737d4
--- /dev/null
+++ b/package/aer-inject/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_AER_INJECT
+	bool "aer-inject"
+	help
+	  aer-inject allows to inject PCIE AER errors on the software
+	  level into a running Linux kernel. This is intended for
+	  validation of the PCIE driver error recovery handler and
+	  PCIE AER core handler.
+
+	  Requires a new Linux kernel with PCIE AER error injection
+	  patches.
+
+	  https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
new file mode 100644
index 0000000..69189b1
--- /dev/null
+++ b/package/aer-inject/aer-inject.mk
@@ -0,0 +1,23 @@
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
+
+define AER_INJECT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define AER_INJECT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr/bin install
+endef
+
+$(eval $(generic-package))
