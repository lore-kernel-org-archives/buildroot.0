From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 19:41:15 +0100
Subject: [Buildroot] [git commit] ddrescue: new package
Message-ID: <20170209185423.C7A1A81EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0602617d0e9306dd88cfeb4b3e971356fe237898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/ddrescue/Config.in     |  8 ++++++++
 package/ddrescue/ddrescue.hash |  2 ++
 package/ddrescue/ddrescue.mk   | 19 +++++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b8ccb46..94f6804 100644
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
index 114a5ad..deff0fe 100644
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
index 0000000..7ec87ce
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
index 0000000..bffa615
--- /dev/null
+++ b/package/ddrescue/ddrescue.hash
@@ -0,0 +1,2 @@
+# From http://lists.gnu.org/archive/html/info-gnu/2017-02/msg00003.html
+sha1 df981672a612639ad0934e3fa6546a41d2feb99e ddrescue-1.22.tar.lz
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
new file mode 100644
index 0000000..23f0343
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
