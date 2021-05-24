From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 May 2021 14:29:01 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/xmrig: new package
Message-ID: <20210524122901.1060817-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: sorted Config.in depends (Yann)
    added comment why XMRIG_INSTALL_TARGET_CMDS is needed (Yann)

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/xmrig/Config.in  | 22 +++++++++++++++++++++
 package/xmrig/xmrig.hash |  3 +++
 package/xmrig/xmrig.mk   | 41 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 package/xmrig/Config.in
 create mode 100644 package/xmrig/xmrig.hash
 create mode 100644 package/xmrig/xmrig.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a90ad1c354..ffe99a219d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -456,6 +456,7 @@ F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
+F:	package/xmrig/
 F:	package/ytree/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
diff --git a/package/Config.in b/package/Config.in
index 4af6057c4d..828c013fe7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2059,6 +2059,7 @@ menu "Miscellaneous"
 	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
+	source "package/xmrig/Config.in"
 	source "package/xutil_util-macros/Config.in"
 endmenu
 
diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
new file mode 100644
index 0000000000..7024241017
--- /dev/null
+++ b/package/xmrig/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XMRIG
+	bool "xmrig"
+	# archs officially supported by upstream
+	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_USE_MMU # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	# xmrig needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_STATIC_LIBS # libuv
+	select BR2_PACKAGE_LIBUV
+	help
+	  RandomX, CryptoNight, AstroBWT and Argon2 CPU/GPU miner.
+
+	  https://xmrig.com
+
+comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library"
+	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS
diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
new file mode 100644
index 0000000000..c80bdd6621
--- /dev/null
+++ b/package/xmrig/xmrig.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7570030c4b3e257bda190a100dc59f78b74c823af7561222a99b296f5e7b1ac2  xmrig-6.12.1.tar.gz
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
new file mode 100644
index 0000000000..98ea1fc07a
--- /dev/null
+++ b/package/xmrig/xmrig.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# xmrig
+#
+################################################################################
+
+XMRIG_VERSION = 6.12.1
+XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
+XMRIG_LICENSE = GPL-3.0+
+XMRIG_LICENSE_FILES = LICENSE
+XMRIG_DEPENDENCIES = libuv
+XMRIG_CONF_OPTS = -DWITH_CUDA=OFF
+
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENCL),y)
+XMRIG_CONF_OPTS += -DWITH_OPENCL=ON
+XMRIG_DEPENDENCIES += libopencl
+else
+XMRIG_CONF_OPTS += -DWITH_OPENCL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_HWLOC),y)
+XMRIG_CONF_OPTS += -DWITH_HWLOC=ON
+XMRIG_DEPENDENCIES += hwloc
+else
+XMRIG_CONF_OPTS += -DWITH_HWLOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+XMRIG_CONF_OPTS += -DWITH_TLS=ON
+XMRIG_DEPENDENCIES += openssl
+else
+XMRIG_CONF_OPTS += -DWITH_TLS=OFF
+endif
+
+# Fixes '*** No rule to make target 'install/fast'.  Stop.'
+define XMRIG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/xmrig$(if $(BR2_PACKAGE_OPENSSL),,-notls) \
+		$(TARGET_DIR)/usr/bin/xmrig$(if $(BR2_PACKAGE_OPENSSL),,-notls)
+endef
+
+$(eval $(cmake-package))
-- 
2.29.2
