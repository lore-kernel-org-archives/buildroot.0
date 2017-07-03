From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:45 +0200
Subject: [Buildroot] [RFC 8/9] package/libclc: new package
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-9-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the latest commit in master branch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                                  |  1 +
 ...y-allow-to-define-llvm-bindir-for-cross-c.patch | 37 ++++++++++++++++++++
 package/libclc/Config.in                           | 10 ++++++
 package/libclc/libclc.mk                           | 40 ++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/libclc/0001-configure.py-allow-to-define-llvm-bindir-for-cross-c.patch
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.mk

diff --git a/package/Config.in b/package/Config.in
index c34325f..711c6f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -266,6 +266,7 @@ comment "Graphic libraries"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libclc/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libclc/0001-configure.py-allow-to-define-llvm-bindir-for-cross-c.patch b/package/libclc/0001-configure.py-allow-to-define-llvm-bindir-for-cross-c.patch
new file mode 100644
index 0000000..27f46cf
--- /dev/null
+++ b/package/libclc/0001-configure.py-allow-to-define-llvm-bindir-for-cross-c.patch
@@ -0,0 +1,37 @@
+From d46e38da621a64637970a071b9aa08dc17f0638b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 3 Jul 2017 10:37:11 +0200
+Subject: [PATCH] configure.py: allow to define llvm-bindir for cross-compiling
+
+TODO
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index f26f535..fe4cbc0 100755
+--- a/configure.py
++++ b/configure.py
+@@ -22,6 +22,8 @@ import metabuild
+ p = OptionParser()
+ p.add_option('--with-llvm-config', metavar='PATH',
+              help='use given llvm-config script')
++p.add_option('--llvm-bindir', metavar='PATH',
++             help='use given llvm-bindir')
+ p.add_option('--with-cxx-compiler', metavar='PATH',
+              help='use given C++ compiler')
+ p.add_option('--prefix', metavar='PATH',
+@@ -74,7 +76,7 @@ if llvm_int_version < 400:
+     sys.exit(1)
+ 
+ llvm_system_libs = llvm_config(['--system-libs'])
+-llvm_bindir = llvm_config(['--bindir'])
++llvm_bindir = options.llvm_bindir or llvm_config(['--bindir'])
+ llvm_core_libs = llvm_config(['--libs', 'core', 'bitreader', 'bitwriter']) + ' ' + \
+                  llvm_system_libs + ' ' + \
+                  llvm_config(['--ldflags'])
+-- 
+2.9.4
+
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
new file mode 100644
index 0000000..44d4d96
--- /dev/null
+++ b/package/libclc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCLC
+	bool "libclc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	help
+	  libclc is an open source, BSD/MIT dual licensed
+	  implementation of the library requirements of the OpenCL C
+	  programming language, as specified by the OpenCL 1.1
+	  Specification.
+
+	  http://libclc.llvm.org/
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
new file mode 100644
index 0000000..a176a59
--- /dev/null
+++ b/package/libclc/libclc.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libclc
+#
+################################################################################
+
+LIBCLC_VERSION = 1cb3fbf504e25d86d972e8b2af3e24571767046b
+LIBCLC_SITE = http://llvm.org/git/libclc.git
+LIBCLC_SITE_METHOD = git
+
+LIBCLC_DEPENDENCIES = host-clang host-llvm
+
+LIBCLC_INSTALL_STAGING = YES
+
+# C++ compiler is used to build a small tool (prepare-builtins) for the host.
+# It must be build with the C++ compiler from the host, simply use
+# HOSTCXX_NOCCACHE.
+LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
+	--prefix="/usr" \
+	--pkgconfigdir="/usr/lib/pkgconfig" \
+	--llvm-bindir=$(HOST_DIR)/usr/bin \
+	--with-cxx-compiler='$(HOSTCXX_NOCCACHE)'
+
+define LIBCLC_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
+endef
+
+define LIBCLC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LIBCLC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define LIBCLC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.9.4
