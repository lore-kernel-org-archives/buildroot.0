From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Jan 2015 19:16:05 +0100
Subject: [Buildroot] [PATCH v2 3/4] dtc: add host build
In-Reply-To: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421000166-24963-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix host build command (use native compiler instead of
    cross compiler)
---
 package/Config.in.host     |  1 +
 package/dtc/Config.in.host |  9 +++++++++
 package/dtc/dtc.mk         | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/dtc/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 94981ad..6a63e57 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/genext2fs/Config.in.host"
diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
new file mode 100644
index 0000000..cbabf0a
--- /dev/null
+++ b/package/dtc/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_DTC
+	bool "host dtc"
+	help
+	  The Device Tree Compiler, dtc, takes as input a device-tree in
+	  a given format and outputs a device-tree in another format.
+
+	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
+
+	  https://git.kernel.org/cgit/utils/dtc/dtc.git
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index c96f881..f1c5baa 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -48,4 +48,18 @@ define DTC_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
+# host build
+HOST_DTC_DEPENDENCIES = host-bison host-flex
+
+define HOST_DTC_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS)    \
+	CFLAGS="$(HOST_CFLAGS)"   \
+	$(MAKE) -C $(@D) PREFIX=/usr
+endef
+
+define HOST_DTC_INSTALL_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/usr install-bin
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.1.2
