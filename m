From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:09 +0200
Subject: [Buildroot] [PATCH 02/24] sepolgen: drop unused host package
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-3-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sepolgen/sepolgen.hash |  2 --
 package/sepolgen/sepolgen.mk   | 30 ------------------------------
 2 files changed, 32 deletions(-)
 delete mode 100644 package/sepolgen/sepolgen.hash
 delete mode 100644 package/sepolgen/sepolgen.mk

diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
deleted file mode 100644
index a377c66aef42..000000000000
--- a/package/sepolgen/sepolgen.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645  sepolgen-1.1.9.tar.gz
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
deleted file mode 100644
index 7c958662c4d1..000000000000
--- a/package/sepolgen/sepolgen.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-################################################################################
-#
-# sepolgen
-#
-################################################################################
-
-SEPOLGEN_VERSION = 1.1.9
-SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
-SEPOLGEN_LICENSE = GPLv2
-SEPOLGEN_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_SEPOLGEN_DEPENDENCIES = host-python3
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-else
-HOST_SEPOLGEN_DEPENDENCIES = host-python
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-endif
-
-define HOST_SEPOLGEN_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
-endef
-
-define HOST_SEPOLGEN_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
-endef
-
-$(eval $(host-generic-package))
-- 
2.1.0
