From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 May 2013 10:41:16 +0200
Subject: [Buildroot] [git commit] numactl: new package
Message-ID: <20130602212057.DBEF79A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b05e74ff92b6728369e1540fc0a2bd60025f2146
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: updated to 2.0.8, restricted to supported architectures,
added licensing informations, updated to latest Buildroot package
infrastructure]

[Peter: Fix LICENSE_FILES typo, needs largefile support in toolchain]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/numactl/Config.in  |   16 ++++++++++++++++
 package/numactl/numactl.mk |   21 +++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 52a0735..8bf1652 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -859,6 +859,7 @@ source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
 source "package/ncdu/Config.in"
+source "package/numactl/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
new file mode 100644
index 0000000..21e76fb
--- /dev/null
+++ b/package/numactl/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NUMACTL
+	bool "numactl"
+	# numactl uses some system calls that are not available on all
+	# architectures.
+	depends on BR2_LARGEFILE
+	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
+	help
+	  numactl allows you to run your application on specific cpus
+	  and memory nodes. It does this by supplying a NUMA memory
+	  policy to the operating system before running your program.
+
+	  http://oss.sgi.com/projects/libnuma/
+
+comment "numactl requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
new file mode 100644
index 0000000..fe6f23f
--- /dev/null
+++ b/package/numactl/numactl.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# numactl
+#
+#############################################################
+
+NUMACTL_VERSION = 2.0.8
+NUMACTL_SOURCE = numactl-$(NUMACTL_VERSION).tar.gz
+NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
+NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
+NUMACTL_LICENSE_FILES = README
+
+define NUMACTL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NUMACTL_INSTALL_TARGET_CMDS
+	$(MAKE) prefix=$(TARGET_DIR) libdir=$(TARGET_DIR)/lib -C $(@D) install
+endef
+
+$(eval $(generic-package))
