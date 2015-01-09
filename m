From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:02 -0600
Subject: [Buildroot] [PATCH v4 01/27] sepolgen: new package
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
[Matt W:
  Changes v3 -> v4
  - Fixed Kconfig files, moved libsepol instead of sepolgen by
    mistake.

  Changes v2 -> v3
  - Moved Config.in to be Config.in.host as this package is now
    only used as a host dependency for the policycoreutils.

  Changes v1 -> v2
  - Moved make install install to the end of the command
  - Removed python kconfig depend since package just used for
    host building
  - Updated site to github
  - Handle Python 2 vs. Python 3 for the host package.

 package/Config.in.host          |  1 +
 package/sepolgen/Config.in.host |  7 +++++++
 package/sepolgen/sepolgen.hash  |  2 ++
 package/sepolgen/sepolgen.mk    | 30 ++++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/sepolgen/Config.in.host
 create mode 100644 package/sepolgen/sepolgen.hash
 create mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 94981ad..c3cb07f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -21,6 +21,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/sam-ba/Config.in.host"
+	source "package/sepolgen/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/sepolgen/Config.in.host b/package/sepolgen/Config.in.host
new file mode 100644
index 0000000..60d30b6
--- /dev/null
+++ b/package/sepolgen/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SEPOLGEN
+	bool "host sepolgen"
+	help
+	  sepolgen is a python module/library that forms the core
+	  of the modern audit2allow (a rewrite).
+
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
new file mode 100644
index 0000000..a377c66
--- /dev/null
+++ b/package/sepolgen/sepolgen.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645  sepolgen-1.1.9.tar.gz
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
new file mode 100644
index 0000000..7c95866
--- /dev/null
+++ b/package/sepolgen/sepolgen.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# sepolgen
+#
+################################################################################
+
+SEPOLGEN_VERSION = 1.1.9
+SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+SEPOLGEN_LICENSE = GPLv2
+SEPOLGEN_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_SEPOLGEN_DEPENDENCIES = host-python3
+HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+else
+HOST_SEPOLGEN_DEPENDENCIES = host-python
+HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+endif
+
+define HOST_SEPOLGEN_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_SEPOLGEN_INSTALL_CMDS
+	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
