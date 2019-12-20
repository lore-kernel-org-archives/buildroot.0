From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Fri, 20 Dec 2019 19:14:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/mfoc: new package
Message-ID: <20191220181456.24733-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/mfoc/Config.in |  7 +++++++
 package/mfoc/mfoc.hash |  3 +++
 package/mfoc/mfoc.mk   | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/mfoc/Config.in
 create mode 100644 package/mfoc/mfoc.hash
 create mode 100644 package/mfoc/mfoc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 770888fb23..445171813b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1428,6 +1428,7 @@ F:	package/ti-sgx-um/
 N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
+F:	package/mfoc
 F:	package/python-dnspython/
 F:	package/python-future/
 F:	package/python-huepy/
diff --git a/package/Config.in b/package/Config.in
index 4480259af5..f3727452d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2282,6 +2282,7 @@ menu "System tools"
 	source "package/lxc/Config.in"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
+	source "package/mfoc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/netifrc/Config.in"
diff --git a/package/mfoc/Config.in b/package/mfoc/Config.in
new file mode 100644
index 0000000000..4773e456e0
--- /dev/null
+++ b/package/mfoc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MFOC
+	bool "mfoc"
+    select BR2_PACKAGE_LIBNFC
+	help
+	  Mifare Classic Offline Cracker
+
+	  https://github.com/nfc-tools/mfoc
diff --git a/package/mfoc/mfoc.hash b/package/mfoc/mfoc.hash
new file mode 100644
index 0000000000..2358bfd3e0
--- /dev/null
+++ b/package/mfoc/mfoc.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  2dfd8ffa4a8b357807680d190a91c8cf3db54b4211a781edc1108af401dbaad7  mfoc-0.10.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mfoc/mfoc.mk b/package/mfoc/mfoc.mk
new file mode 100644
index 0000000000..15105a74ab
--- /dev/null
+++ b/package/mfoc/mfoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# mfoc
+#
+################################################################################
+
+MFOC_VERSION = 0.10.7
+MFOC_SITE = $(call github,nfc-tools,mfoc,mfoc-$(MFOC_VERSION))
+MFOC_LICENSE = GPL-2.0
+MFOC_LICENSE_FILES = COPYING
+MFOC_DEPENDENCIES = libnfc
+# Fetching from github, we need to generate the configure script
+MFOC_AUTORECONF = YES
+MFOC_INSTALL_STAGING = YES
+
+# Autoreconf requires an existing m4 directory
+define MFOC_MKDIR_M4
+	mkdir -p $(@D)/m4
+endef
+MFOC_PRE_CONFIGURE_HOOKS += MFOC_MKDIR_M4
+
+$(eval $(autotools-package))
-- 
2.24.0
