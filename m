From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:43:54 +0200
Subject: [Buildroot] [git commit] package/xmrig: new package
Message-ID: <20210607144657.7D59C80FB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f70990ccf6cb993fc31519337390e436d15493b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[me:
  - introduce XMRIG_SUFFIX
  - extend comment about installation commands
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/xmrig/Config.in  | 22 ++++++++++++++++++++++
 package/xmrig/xmrig.hash |  3 +++
 package/xmrig/xmrig.mk   | 43 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 988612a944..979813c1dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -455,6 +455,7 @@ F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
+F:	package/xmrig/
 F:	package/ytree/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
diff --git a/package/Config.in b/package/Config.in
index 8e017654d2..3c99ba8030 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2061,6 +2061,7 @@ menu "Miscellaneous"
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
index 0000000000..2202d875c5
--- /dev/null
+++ b/package/xmrig/xmrig.mk
@@ -0,0 +1,43 @@
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
+XMRIG_SUFFIX = -notls
+endif
+
+# Upstream provides no installation rule:
+#   *** No rule to make target 'install/fast'.  Stop.
+define XMRIG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/xmrig$(XMRIG_SUFFIX) \
+		$(TARGET_DIR)/usr/bin/xmrig$(XMRIG_SUFFIX)
+endef
+
+$(eval $(cmake-package))
