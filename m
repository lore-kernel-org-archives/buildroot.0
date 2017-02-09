From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Feb 2017 18:48:29 +0100
Subject: [Buildroot] [PATCH v1] ddrescue: new package
Message-ID: <20170209174829.23326-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/ddrescue/Config.in     |  8 ++++++++
 package/ddrescue/ddrescue.hash |  2 ++
 package/ddrescue/ddrescue.mk   | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/ddrescue/Config.in
 create mode 100644 package/ddrescue/ddrescue.hash
 create mode 100644 package/ddrescue/ddrescue.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b8ccb4615..94f680454 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1186,6 +1186,7 @@ F:	board/raspberrypi/
 F:	configs/raspberrypi3_defconfig
 F:	package/assimp/
 F:	package/bcm2835/
+F:	package/ddrescue/
 F:	package/dejavu/
 F:	package/dillo/
 F:	package/edid-decode/
diff --git a/package/Config.in b/package/Config.in
index 114a5ad5f..deff0fe2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1756,6 +1756,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
+	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
diff --git a/package/ddrescue/Config.in b/package/ddrescue/Config.in
new file mode 100644
index 000000000..7ec87ced7
--- /dev/null
+++ b/package/ddrescue/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DDRESCUE
+	bool "ddrescue"
+	help
+	  GNU ddrescue is a data recovery tool. It copies data from one file
+	  or block device (hard disc, cdrom, etc) to another, trying to
+	  rescue the good parts first in case of read errors.
+
+	  http://www.gnu.org/software/ddrescue/ddrescue.html
diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
new file mode 100644
index 000000000..bffa6153f
--- /dev/null
+++ b/package/ddrescue/ddrescue.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnu.org/archive/html/info-gnu/2017-02/msg00003.html
+sha1 df981672a612639ad0934e3fa6546a41d2feb99e ddrescue-1.22.tar.lz
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
new file mode 100644
index 000000000..23f03436e
--- /dev/null
+++ b/package/ddrescue/ddrescue.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# ddrescue
+#
+################################################################################
+
+DDRESCUE_VERSION = 1.22
+DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
+DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
+DDRESCUE_LICENSE = GPLv2+
+DDRESCUE_LICENSE_FILES = COPYING
+DDRESCUE_DEPENDENCIES = host-lzip
+
+define DDRESCUE_EXTRACT_CMDS
+	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(DDRESCUE_SOURCE) | \
+		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+endef
+
+$(eval $(autotools-package))
-- 
2.11.0
