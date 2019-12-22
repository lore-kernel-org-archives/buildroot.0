From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:30:16 +0100
Subject: [Buildroot] [git commit] package/mfoc: new package
Message-ID: <20191222102155.8C8308D50A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=623e0fea6cebc9fffae4cbb7440d0a80f08bd531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
[yann.morin.1998 at free.fr: fix leading spaces in Config.in]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/mfoc/Config.in |  7 +++++++
 package/mfoc/mfoc.hash |  3 +++
 package/mfoc/mfoc.mk   | 22 ++++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2b37e55ac..d2089e2672 100644
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
index 247d96831e..2bfec09702 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2286,6 +2286,7 @@ menu "System tools"
 	source "package/lxc/Config.in"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
+	source "package/mfoc/Config.in"
 	source "package/monit/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/netifrc/Config.in"
diff --git a/package/mfoc/Config.in b/package/mfoc/Config.in
new file mode 100644
index 0000000000..1267cf04e5
--- /dev/null
+++ b/package/mfoc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MFOC
+	bool "mfoc"
+	select BR2_PACKAGE_LIBNFC
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
