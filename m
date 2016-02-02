From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2016 01:02:18 +0100
Subject: [Buildroot] [git commit] unrar: new package
Message-ID: <20160202000441.EF43E80365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dd53276b09b857581b03e65857339cdc0e6e771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also pass TARGET_LDFLAGS]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |  1 +
 package/unrar/Config.in  | 13 +++++++++++++
 package/unrar/unrar.hash |  2 ++
 package/unrar/unrar.mk   | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..a10d926 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -56,6 +56,7 @@ endif
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
 	source "package/lzop/Config.in"
+	source "package/unrar/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/unzip/Config.in"
 endif
diff --git a/package/unrar/Config.in b/package/unrar/Config.in
new file mode 100644
index 0000000..29696c3
--- /dev/null
+++ b/package/unrar/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_UNRAR
+	bool "unrar"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	help
+	  RAR file uncompressor.
+
+	  http://www.rarlab.com/rar_add.htm
+
+comment "unrar needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
new file mode 100644
index 0000000..4490d70
--- /dev/null
+++ b/package/unrar/unrar.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	ff593728aed0ac865908b8ea52cff449a4c298f095db2f3d27438ffbc3e35d5b	unrarsrc-5.3.9.tar.gz
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
new file mode 100644
index 0000000..89dff9b
--- /dev/null
+++ b/package/unrar/unrar.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# unrar
+#
+################################################################################
+
+UNRAR_VERSION = 5.3.9
+UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
+UNRAR_SITE = http://www.rarlab.com/rar
+UNRAR_LICENSE = unrar
+UNRAR_LICENSE_FILES = license.txt
+
+define UNRAR_BUILD_CMDS
+	$(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -pthread" \
+		LDFLAGS="$(TARGET_LDFLAGS) -pthread" -C $(@D)
+endef
+
+define UNRAR_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
