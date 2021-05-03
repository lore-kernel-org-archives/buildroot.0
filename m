From: Christian Stewart <christian@paral.in>
Date: Sun,  2 May 2021 19:33:03 -0700
Subject: [Buildroot] [PATCH v1 1/3] package/libfuse3: allow building as a
 host package
Message-ID: <20210503023305.161122-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds 1 patch to fix an install error when building as a host package.

Patch was submitted upstream:
https://github.com/libfuse/libfuse/pull/598

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...er-fix-sysconf-dir-for-init.d-script.patch | 51 +++++++++++++++++++
 package/libfuse3/libfuse3.mk                  |  7 +++
 2 files changed, 58 insertions(+)
 create mode 100644 package/libfuse3/0001-install_helper-fix-sysconf-dir-for-init.d-script.patch

diff --git a/package/libfuse3/0001-install_helper-fix-sysconf-dir-for-init.d-script.patch b/package/libfuse3/0001-install_helper-fix-sysconf-dir-for-init.d-script.patch
new file mode 100644
index 0000000000..4599c55e78
--- /dev/null
+++ b/package/libfuse3/0001-install_helper-fix-sysconf-dir-for-init.d-script.patch
@@ -0,0 +1,51 @@
+From cac00c154be5c8941d40b972bdcc0eb8bf209b93 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sun, 2 May 2021 19:04:50 -0700
+Subject: [PATCH] install_helper: fix sysconf dir for init.d script
+
+Fixes the following build error in Buildroot as a host package:
+
+Running custom install script 'install_helper.sh /host/etc /host/bin /host/lib/udev/rules.d false
++ sysconfdir=/host/etc
++ bindir=/host/bin
++ udevrulesdir=/host/lib/udev/rules.d
++ useroot=false
++ '[' -z '' ']'
++ DESTDIR=
++ install -D -m 644 /build/host-libfuse3-3.10.3/util/fuse.conf /host/etc/fuse.conf
++ false
++ install -D -m 644 /build/host-libfuse3-3.10.3/util/udev.rules /host/lib/udev/rules.d/99-fuse3.rules
++ install -D -m 755 /build/host-libfuse3-3.10.3/util/init_script /etc/init.d/fuse3
+install: cannot create regular file '/etc/init.d/fuse3': Permission denied
+FAILED: install script 'install_helper.sh /host/etc /host/bin /host/lib/udev/rules.d false' exit code 1, stopped
+FAILED: meson-install
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ util/install_helper.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util/install_helper.sh b/util/install_helper.sh
+index cb649a7..f4a6163 100755
+--- a/util/install_helper.sh
++++ b/util/install_helper.sh
+@@ -40,14 +40,14 @@ install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
+         "${DESTDIR}${udevrulesdir}/99-fuse3.rules"
+ 
+ install -D -m 755 "${MESON_SOURCE_ROOT}/util/init_script" \
+-        "${DESTDIR}/etc/init.d/fuse3"
++        "${DESTDIR}${sysconfdir}/init.d/fuse3"
+ 
+ 
+ if test -x /usr/sbin/update-rc.d && test -z "${DESTDIR}"; then
+     /usr/sbin/update-rc.d fuse3 start 34 S . start 41 0 6 . || /bin/true
+ else
+     echo "== FURTHER ACTION REQUIRED =="
+-    echo "Make sure that your init system will start the ${DESTDIR}/etc/init.d/fuse3 init script"
++    echo "Make sure that your init system will start the ${DESTDIR}${sysconfdir}/init.d/fuse3 init script"
+ fi
+ 
+ 
+-- 
+2.31.1
+
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f805eda506..d4522fd063 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -10,11 +10,17 @@ LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
 LIBFUSE3_INSTALL_STAGING = YES
 LIBFUSE3_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 LIBFUSE3_CONF_OPTS = \
 	-Dexamples=false \
 	-Dudevrulesdir=/lib/udev/rules.d \
 	-Duseroot=false
 
+HOST_LIBFUSE3_CONF_OPTS = \
+	-Dexamples=false \
+	-Dudevrulesdir=$(HOST_DIR)/lib/udev/rules.d \
+	-Duseroot=false
+
 define LIBFUSE3_DEVICES
 	/dev/fuse  c  666  0  0  10  229  0  0  -
 endef
@@ -28,3 +34,4 @@ define LIBFUSE3_LINUX_CONFIG_FIXUPS
 endef
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.31.1
