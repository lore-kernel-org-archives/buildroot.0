From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 15 Mar 2019 14:30:31 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/libfuse3: new package
In-Reply-To: <20190315133033.5275-1-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
Message-ID: <20190315133033.5275-3-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/Config.in                      |  1 +
 package/libfuse3/Config.in             | 12 ++++++++
 package/libfuse3/disable_fileops.patch | 23 +++++++++++++++
 package/libfuse3/libfuse3.hash         |  8 ++++++
 package/libfuse3/libfuse3.mk           | 40 ++++++++++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 package/libfuse3/Config.in
 create mode 100644 package/libfuse3/disable_fileops.patch
 create mode 100644 package/libfuse3/libfuse3.hash
 create mode 100644 package/libfuse3/libfuse3.mk

diff --git a/package/Config.in b/package/Config.in
index 3231aada31..bcd1c6297f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1231,6 +1231,7 @@ menu "Filesystem"
 	source "package/libconfig/Config.in"
 	source "package/libconfuse/Config.in"
 	source "package/libfuse/Config.in"
+	source "package/libfuse3/Config.in"
 	source "package/liblockfile/Config.in"
 	source "package/libnfs/Config.in"
 	source "package/libsysfs/Config.in"
diff --git a/package/libfuse3/Config.in b/package/libfuse3/Config.in
new file mode 100644
index 0000000000..d349fcd67f
--- /dev/null
+++ b/package/libfuse3/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBFUSE3
+	bool "libfuse3"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  FUSE 3 (Filesystem in UserSpacE)
+
+	  https://github.com/libfuse/libfuse
+
+comment "libfuse3 needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfuse3/disable_fileops.patch b/package/libfuse3/disable_fileops.patch
new file mode 100644
index 0000000000..bd3a8e2be3
--- /dev/null
+++ b/package/libfuse3/disable_fileops.patch
@@ -0,0 +1,23 @@
+diff -burN fuse-3.4.1.org/util/install_helper.sh fuse-3.4.1/util/install_helper.sh
+--- fuse-3.4.1.org/util/install_helper.sh	2019-02-12 14:33:18.549507335 +0100
++++ fuse-3.4.1/util/install_helper.sh	2019-02-12 14:35:20.726772913 +0100
+@@ -22,8 +22,8 @@
+     DESTDIR="${DESTDIR%/}"
+ fi
+
+-chown root:root "${DESTDIR}${bindir}/fusermount3"
+-chmod u+s "${DESTDIR}${bindir}/fusermount3"
++chown root:root "${DESTDIR}${bindir}/fusermount3" || :
++chmod u+s "${DESTDIR}${bindir}/fusermount3" || :
+
+ install -D -m 644 "${MESON_SOURCE_ROOT}/util/fuse.conf" \
+ 	"${DESTDIR}${sysconfdir}/fuse.conf"
+@@ -31,7 +31,7 @@
+
+ if test ! -e "${DESTDIR}/dev/fuse"; then
+     mkdir -p "${DESTDIR}/dev"
+-    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229
++    mknod "${DESTDIR}/dev/fuse" -m 0666 c 10 229 || :
+ fi
+
+ install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
new file mode 100644
index 0000000000..e9b9f8384c
--- /dev/null
+++ b/package/libfuse3/libfuse3.hash
@@ -0,0 +1,8 @@
+# Locally calculated after checking pgp signature
+sha256  224dd4a598e23e114395a9717bc79638ab2b1e42c82ae8210aed9365aff325a3  fuse-3.4.2.tar.xz
+
+
+# Hash for license files:
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL2.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL2.txt
+sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
new file mode 100644
index 0000000000..ff8d251a96
--- /dev/null
+++ b/package/libfuse3/libfuse3.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libfuse
+#
+################################################################################
+
+LIBFUSE3_VERSION = 3.4.2
+LIBFUSE3_SOURCE = fuse-$(LIBFUSE3_VERSION).tar.xz
+LIBFUSE3_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE3_VERSION)
+LIBFUSE3_LICENSE = LGPL-2.1 (library), GPL-2.0 (rest)
+LIBFUSE3_LICENSE_FILES = GPL2.txt LGPL2.txt LICENSE
+LIBFUSE3_INSTALL_STAGING = YES
+LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBFUSE3_CONF_OPTS = \
+	-Dexamples=false \
+	-Dutils=true \
+	-Dudevrulesdir=/lib/udev/rules.d
+
+define LIBFUSE3_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/fusermount3 $(TARGET_DIR)/usr/bin/
+	$(if $(filter y,$(BR2_STATIC_LIBS)),,cp -dpf $(STAGING_DIR)/usr/lib/libfuse3.so* $(TARGET_DIR)/usr/lib/)
+	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
+	$(INSTALL) -m 0644 $(STAGING_DIR)/lib/udev/rules.d/*-fuse3.rules $(TARGET_DIR)/lib/udev/rules.d
+endef
+
+define LIBFUSE3_INSTALL_TARGET_POST
+	ln -sf fusermount3 $(TARGET_DIR)/usr/bin/fusermount
+endef
+
+LIBFUSE3_POST_INSTALL_TARGET_HOOKS += LIBFUSE3_INSTALL_TARGET_POST
+
+define LIBFUSE3_DEVICES
+	/dev/fuse  c  666  0  0  10  229  0  0  -
+endef
+
+define LIBFUSE3_PERMISSIONS
+	/usr/bin/fusermount3 f 4755 0 0 - - - - -
+endef
+
+$(eval $(meson-package))
-- 
2.20.1
