From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 00:34:39 +0200
Subject: [Buildroot] [git commit] Add (Freescale) elftosb host package
Message-ID: <20120720223539.0717996C35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc160a941ee2de5aa9bd4624dd56fd6b38bb29c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Elftosb is a Freescale toolset to build binary image files (like U-Boot.sb)
to be used with CPUs imx23, imx28, stp37xx

thomas.petazzoni at free-electrons.com:
 * Add -m 0755 when installing binaries
 * the _CLEAN_CMDS is not supposed to uninstall things from the
   HOST_DIR.
 * Use 'host-generic-package' instead of 'GENTARGETS,host'

Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elftosb/elftosb.mk                         |   25 ++++++++++++++++++++
 .../elftosb/elftosb10.12.01-fixes_includes.patch   |   19 +++++++++++++++
 2 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
new file mode 100644
index 0000000..b2e50f7
--- /dev/null
+++ b/package/elftosb/elftosb.mk
@@ -0,0 +1,25 @@
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
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/elftosb $(HOST_DIR)/usr/bin/elftosb
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/keygen $(HOST_DIR)/usr/bin/keygen
+	$(INSTALL) -D -m 0755 $(@D)/bld/linux/sbtool $(HOST_DIR)/usr/bin/sbtool
+endef
+
+define HOST_ELFTOSB_CLEAN_CMDS
+	rm -rf $(@D)/bld/linux
+endef
+
+$(eval $(host-generic-package))
+
diff --git a/package/elftosb/elftosb10.12.01-fixes_includes.patch b/package/elftosb/elftosb10.12.01-fixes_includes.patch
new file mode 100644
index 0000000..eaf8eba
--- /dev/null
+++ b/package/elftosb/elftosb10.12.01-fixes_includes.patch
@@ -0,0 +1,19 @@
+This patch uses system include files instead of a hard coded system path to fixe
+potential compilation failure on systems that do not populate system header
+files in /usr/include/..
+
+Signed-off-by: Eric Jarrige <eric.jarrige@armadeus.org>
+---
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
