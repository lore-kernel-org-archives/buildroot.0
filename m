From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Mon, 12 Mar 2012 14:55:07 +0100
Subject: [Buildroot] [PATCH] Add (Freescale) elftosb host package
Message-ID: <1331560507-12444-1-git-send-email-eric.jarrige@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Elftosb is a Freescale toolset to build binary image files (like U-Boot.sb)
to be used with CPUs imx23, imx28, stp37xx

Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
---
 package/elftosb/elftosb.mk                         |   28 ++++++++++++++++++++
 .../elftosb/elftosb10.12.01-fixes_includes.patch   |   13 +++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/elftosb/elftosb.mk
 create mode 100644 package/elftosb/elftosb10.12.01-fixes_includes.patch

diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
new file mode 100644
index 0000000..75b95a5
--- /dev/null
+++ b/package/elftosb/elftosb.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# elftosb
+#
+#############################################################
+ELFTOSB_VERSION = 10.12.01
+ELFTOSB_SOURCE = elftosb-$(ELFTOSB_VERSION).tar.gz
+ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
+
+define HOST_ELFTOSB_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_ELFTOSB_INSTALL_CMDS
+	$(INSTALL) -D $(@D)/bld/linux/elftosb $(HOST_DIR)/usr/bin/elftosb
+	$(INSTALL) -D $(@D)/bld/linux/keygen $(HOST_DIR)/usr/bin/keygen
+	$(INSTALL) -D $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
+endef
+
+define HOST_ELFTOSB_CLEAN_CMDS
+	rm -rf $(@D)/bld/linux
+	rm -f $(HOST_DIR)/usr/bin/elftosb
+	rm -f $(HOST_DIR)/usr/bin/keygen
+	rm -f $(HOST_DIR)/usr/bin/sbtool
+endef
+
+$(eval $(call GENTARGETS,host))
+
diff --git a/package/elftosb/elftosb10.12.01-fixes_includes.patch b/package/elftosb/elftosb10.12.01-fixes_includes.patch
new file mode 100644
index 0000000..5e31233
--- /dev/null
+++ b/package/elftosb/elftosb10.12.01-fixes_includes.patch
@@ -0,0 +1,13 @@
+Index: host-elftosb-10.12.01/common/stdafx.h
+===================================================================
+--- host-elftosb-10.12.01.orig/common/stdafx.h	2012-01-30 12:43:35.000000000 +0100
++++ host-elftosb-10.12.01/common/stdafx.h	2012-01-30 12:43:54.000000000 +0100
+@@ -27,7 +27,7 @@
+ // For Linux systems only, types.h only defines the signed
+ // integer types.  This is not professional code.
+ // Update: They are defined in the header files in the more recent version of redhat enterprise gcc.
+-#include "/usr/include/sys/types.h"
++#include <sys/types.h>
+ #include <stdint.h>
+ //typedef unsigned long uint32_t;
+ //typedef unsigned short uint16_t;
-- 
1.7.2.5
