From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:12:06 +0200
Subject: [Buildroot] [git commit branch/next] sepolgen: new package
Message-ID: <20150521211543.A9CEE81D8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d28882745daa79f43c6e0592818cc9d3b2df5ec5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sepolgen/sepolgen.hash |    2 ++
 package/sepolgen/sepolgen.mk   |   30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

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
