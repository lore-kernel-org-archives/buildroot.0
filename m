From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:46:27 +0200
Subject: [Buildroot] [git commit] axfsutils: add new package
Message-ID: <20151014214750.EBDCA81663@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=653cc68e9fde29baec5017f41c5bfc4f2e210fa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tools for building AXFS Filesystem.

The Advanced XIP File System is a Linux kernel filesystem driver that
enables files to be executed directly from flash or ROM memory rather
than being copied into RAM. It has the ability to store individual
*pages* in a file uncompressed/XIP or compressed/Demand Paged.

Source:
	https://github.com/jaredeh/axfs

[Thomas:
 - add hash file.
 - use $(INSTALL) -D -m 0755 instead of cp for installing mkfs.axfs.]

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/axfsutils/axfsutils.hash |    2 ++
 package/axfsutils/axfsutils.mk   |   24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
new file mode 100644
index 0000000..4a3b3fb
--- /dev/null
+++ b/package/axfsutils/axfsutils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9c041393131bdfebefa89cfaba7788b514b56ffc51bda8f130fd49b39fe89dc0 axfsutils-f26ae785e33df76f658b71ef2cfbc7f511ff875d.tar.gz
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
new file mode 100644
index 0000000..3e6ea52
--- /dev/null
+++ b/package/axfsutils/axfsutils.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# axfsutils
+#
+################################################################################
+
+AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
+AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
+AXFSUTILS_LICENSE = GPLv2
+AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
+AXFSUTILS_DEPENDENCIES = host-zlib
+
+# The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
+# prerequisite. The 'legacy' one works just as well without that requirement.
+define HOST_AXFSUTILS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy
+endef
+
+define HOST_AXFSUTILS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mkfs.axfs-legacy/mkfs.axfs \
+		$(HOST_DIR)/usr/bin/mkfs.axfs
+endef
+
+$(eval $(host-generic-package))
