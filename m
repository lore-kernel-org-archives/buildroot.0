From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 20:17:35 +0200
Subject: [Buildroot] [git commit] dtc: add host build
Message-ID: <20151004181804.7D48B7F939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5774f07d43c8694b9640e67db771676af07c430b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having a host variant of dtc is needed for example for U-Boot, which
uses the Device Tree for a number of platforms.

In addition, now that we have a proper host-dtc package, it is no
longer needed for the linux package to install the host dtc compiler:
users interested in having the host dtc compiler can simply enable
this package.

A Config.in.host option is added to build host-dtc, because the
initial reason why the host DTC built by the kernel was installed in
$(HOST_DIR)/usr/bin (commit 707d44d0a28906ebda49584dd5f55985406f0bde
from Thomas DS) was:

    Having dtc as a host tool can be useful for users that have a
    custom boot scenario where the device tree is not embedded in the
    kernel.

[Thomas:
  - rework the commit log.]
[Peter: keep the (renamed) linux version]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host     |    1 +
 package/dtc/Config.in.host |    9 +++++++++
 package/dtc/dtc.mk         |   10 ++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..1f69687 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
+	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/faketime/Config.in.host"
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
index e094f7b..f3b6f3b 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -44,4 +44,14 @@ define DTC_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
+# host build
+define HOST_DTC_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr
+endef
+
+define HOST_DTC_INSTALL_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
