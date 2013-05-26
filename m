From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:11 +0200
Subject: [Buildroot] [PATCH 01/20] numactl: new package
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Newton <will.newton@imgtec.com>

[Thomas: updated to 2.0.8, restricted to supported architectures,
added licensing informations, updated to latest Buildroot package
infrastructure]

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/numactl/Config.in  |   12 ++++++++++++
 package/numactl/numactl.mk |   21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/numactl/Config.in
 create mode 100644 package/numactl/numactl.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..6094c1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -852,6 +852,7 @@ source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
 source "package/ncdu/Config.in"
+source "package/numactl/Config.in"
 source "package/polkit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
diff --git a/package/numactl/Config.in b/package/numactl/Config.in
new file mode 100644
index 0000000..d39a733
--- /dev/null
+++ b/package/numactl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NUMACTL
+	bool "numactl"
+	# numactl uses some system calls that are not available on all
+	# architectures.
+	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
+	help
+	  numactl allows you to run your application on specific cpus
+	  and memory nodes. It does this by supplying a NUMA memory
+	  policy to the operating system before running your program.
+
+	  http://oss.sgi.com/projects/libnuma/
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
new file mode 100644
index 0000000..440847c
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
+NUMCTL_LICENSE_FILES = README
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
-- 
1.7.9.5
