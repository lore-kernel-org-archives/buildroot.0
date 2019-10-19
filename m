From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:40:48 +0200
Subject: [Buildroot] [git commit] package/lld: new host package
Message-ID: <20191019224119.183C582BCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=593a60f7f0fa1489175700c7b2eda0666347faba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lld can be used by external packages or by setting BR2_TARGET_LDFLAGS
(though a dependency is missing to make the latter really work). Future
patches will improve the integration in the build.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                 |  1 +
 package/Config.in.host     |  1 +
 package/lld/Config.in.host | 15 +++++++++++++++
 package/lld/lld.hash       |  3 +++
 package/lld/lld.mk         | 23 +++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 941462a077..87edcac9ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1274,6 +1274,7 @@ F:	package/at-spi2-core/
 F:	package/clang/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/lld/
 F:	package/llvm/
 F:	package/python-cython/
 F:	package/python-raven/
diff --git a/package/Config.in.host b/package/Config.in.host
index 93822304e9..9eeb5c91a9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -35,6 +35,7 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/lld/Config.in.host
new file mode 100644
index 0000000000..86ba3ff6ff
--- /dev/null
+++ b/package/lld/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_LLD
+	bool "host lld"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
+	help
+	  LLD is a linker from the LLVM project that is a drop-in
+	  replacement for system linkers, and runs much faster than
+	  them. It also provides features that are useful for
+	  toolchain developers.
+
+	  https://lld.llvm.org/
+
+comment "lld needs a toolchain w/ host gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
diff --git a/package/lld/lld.hash b/package/lld/lld.hash
new file mode 100644
index 0000000000..dfbb290cf4
--- /dev/null
+++ b/package/lld/lld.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 9caec8ec922e32ffa130f0fb08e4c5a242d7e68ce757631e425e9eba2e1a6e37  lld-8.0.0.src.tar.xz
+sha256 f0502d2d0e19748c534ee95ea486c092273303dbef76404c8b17dc8bf6ca441b  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
new file mode 100644
index 0000000000..a6933e2961
--- /dev/null
+++ b/package/lld/lld.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lld
+#
+################################################################################
+
+LLD_VERSION = 8.0.0
+LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
+LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
+LLD_LICENSE = NCSA
+LLD_LICENSE_FILES = LICENSE.TXT
+LLD_SUPPORTS_IN_SOURCE_BUILD = NO
+HOST_LLD_DEPENDENCIES = host-llvm
+
+# GCC looks for tools in a different path from LLD's default installation path
+define HOST_LLD_CREATE_SYMLINKS
+	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
+	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
+endef
+
+HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
+
+$(eval $(host-cmake-package))
