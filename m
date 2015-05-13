From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:14 -0500
Subject: [Buildroot] [PATCH v5 01/24] sepolgen: new package
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-2-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes v4 -> v5:
  - Fixed package name to be BR2_PACKAGE_HOST_SEPOLGEN (Suggested by
    Thomas P.)
  - No menu entry needed as host dependency aren't reflected in
    Config.in files (Suggested by Thomas P.)

Changes v3 -> v4:
  - Fixed Kconfig files, moved libsepol instead of sepolgen by
    mistake.

Changes v2 -> v3:
  - Moved Config.in to be Config.in.host as this package is now
    only used as a host dependency for the policycoreutils.

Changes v1 -> v2:
  - Moved make install install to the end of the command
  - Removed python kconfig depend since package just used for
    host building
  - Updated site to github
  - Handle Python 2 vs. Python 3 for the host package.
---
 package/sepolgen/sepolgen.hash |  2 ++
 package/sepolgen/sepolgen.mk   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 package/sepolgen/sepolgen.hash
 create mode 100644 package/sepolgen/sepolgen.mk

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
