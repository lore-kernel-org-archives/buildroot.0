From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Aug 2012 05:09:50 +0200
Subject: [Buildroot] [git commit branch/next] mtdev2tuio: new package
Message-ID: <20120830031120.DE34E994F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dafa32b3bd75e9d155d075c796fa5b0ecbb9b11b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mtdev2tuio is a simple application for converting touch events
to the standart TUIO 1.1 protocol.

https://github.com/olivopaolo/mtdev2tuio

[thomas.petazzoni at free-electrons.com: use TARGET_CONFIGURE_OPTS, fix
indentation, add dependency on thread support in toolchain]

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/mtdev2tuio/Config.in     |   13 +++++++++++++
 package/mtdev2tuio/mtdev2tuio.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5b4788f..e129522 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -469,6 +469,7 @@ source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/lttng-libust/Config.in"
+source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
new file mode 100644
index 0000000..74453c4
--- /dev/null
+++ b/package/mtdev2tuio/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MTDEV2TUIO
+	bool "mtdev2tuio"
+	select BR2_PACKAGE_LIBLO
+	select BR2_PACKAGE_MTDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
+	help
+	  mtdev2tuio is a simple application for converting touch
+	  events captured from libmtdev to TUIO 1.1
+
+	  https://github.com/olivopaolo/mtdev2tuio
+
+comment "mtdev2tuio requires thread support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
new file mode 100644
index 0000000..a86c0bf
--- /dev/null
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# mtdev2tuio
+#
+#############################################################
+MTDEV2TUIO_VERSION = e1e7378d86
+MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
+MTDEV2TUIO_DEPENDENCIES = mtdev liblo
+MTDEV2TUIO_LICENSE = GPLv3+
+MTDEV2TUIO_LICENSE_FILES = COPYING
+
+# mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
+# here.
+define MTDEV2TUIO_BUILD_CMDS
+	$(MAKE) \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD="$(TARGET_CC)" \
+		-C $(@D)
+endef
+
+define MTDEV2TUIO_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin/mtdev2tuio
+endef
+
+define MTDEV2TUIO_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
