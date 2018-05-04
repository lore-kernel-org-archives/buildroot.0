From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  4 May 2018 13:46:01 +0200
Subject: [Buildroot] [PATCH v7 1/3] package/libclc: new package
In-Reply-To: <20180504114603.10135-1-valentin.korenblit@smile.fr>
References: <20180504114603.10135-1-valentin.korenblit@smile.fr>
Message-ID: <20180504114603.10135-2-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides libclc, an open source implementation of the
library requirements of the OpenCL C programming language, as
specified by the OpenCL 1.1 Specification. It is intended to be used
with Mesa Clover.

It needs to be compiled with host-clang, as it generates LLVM IR bitcode
files containing device builtin functions for each target.

Currently, libclc supports AMDGCN, R600 and NVPTX targets.

As OpenCL kernels can be built dynamically on the target using libclang and
libLLVM, it is necessary to have clc headers on the target. Buildroot removes
/usr/include in its target-finalize step, so clc headers are installed to
/usr/share/clc.

Given that clc headers are being installed to a non-standard location, it is
necessary to specify this path in Mesa's configure.ac. Otherwise, pkg-config
will output the absolute path to these headers located in STAGING_DIR, which
will cause a runtime error when calling clBuildProgram.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS                                      |  1 +
 package/Config.in                               |  1 +
 package/libclc/Config.in                        | 10 ++++++
 package/libclc/libclc.hash                      |  3 ++
 package/libclc/libclc.mk                        | 42 +++++++++++++++++++++++++
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 26 +++++++++++++++
 6 files changed, 83 insertions(+)
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk
 create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 24d134cb70..3f5775ff48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1930,6 +1930,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentin.korenblit@smile.fr>
 F:	package/clang/
+F:	package/libclc/
 F:	package/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index fe36d31867..dc0ee8a965 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -285,6 +285,7 @@ comment "Graphic libraries"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libclc/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
new file mode 100644
index 0000000000..4bba6a9175
--- /dev/null
+++ b/package/libclc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCLC
+	bool "libclc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	help
+	  libclc is an open source, BSD licensed implementation of
+	  the library requirements of the OpenCL C programming language,
+	  as specified by the OpenCL 1.1 Specification.
+
+	  http://libclc.llvm.org/
diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
new file mode 100644
index 0000000000..c5bf5a668c
--- /dev/null
+++ b/package/libclc/libclc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 e2f1f294f93695f2d1f87ccb9760231b435702dd0c27abeb38baa97186674d9e  libclc-00236279a293b3737dee08c14f25923a889d2795.tar.gz
+sha256 c66aa55d8478b45f1018500af9f433dd271444ad304d683dd49ff2a42f30dad1  LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
new file mode 100644
index 0000000000..b87f191eb5
--- /dev/null
+++ b/package/libclc/libclc.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libclc
+#
+################################################################################
+
+# There are only two releases: release_35 and release_38, but the last
+# commit is from 2 years ago. Master has some recent activity.
+LIBCLC_VERSION = 00236279a293b3737dee08c14f25923a889d2795
+LIBCLC_SITE = https://git.llvm.org/git/libclc
+LIBCLC_SITE_METHOD = git
+LIBCLC_LICENSE = NCSA
+LIBCLC_LICENSE_FILES = LICENSE.TXT
+
+LIBCLC_DEPENDENCIES = host-clang host-llvm
+LIBCLC_INSTALL_STAGING = YES
+
+# C++ compiler is used to build a small tool (prepare-builtins) for the host.
+# It must be built with the C++ compiler from the host
+LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
+	--prefix="/usr" \
+	--includedir="/usr/share" \
+	--pkgconfigdir="/usr/lib/pkgconfig" \
+	--with-cxx-compiler=$(HOSTCXX)
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
diff --git a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
new file mode 100644
index 0000000000..b3f9940c85
--- /dev/null
+++ b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
@@ -0,0 +1,26 @@
+From b1fdc84dff0f4c232eb58dded1dd6e3408ea5630 Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentin.korenblit@smile.fr>
+Date: Fri, 4 May 2018 10:24:58 +0200
+Subject: [PATCH] set LIBCLC_INCLUDEDIR
+
+Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a6a521794e..9e1dfef06f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2327,7 +2327,7 @@ if test "x$enable_opencl" = xyes; then
+                     PKG_CONFIG_PATH environment variable.
+                     By default libclc.pc is installed to /usr/local/share/pkgconfig/])
+     else
+-        LIBCLC_INCLUDEDIR=`$PKG_CONFIG --variable=includedir libclc`
++        LIBCLC_INCLUDEDIR="/usr/share"
+         LIBCLC_LIBEXECDIR=`$PKG_CONFIG --variable=libexecdir libclc`
+         AC_SUBST([LIBCLC_INCLUDEDIR])
+         AC_SUBST([LIBCLC_LIBEXECDIR])
+-- 
+2.14.3
+
-- 
2.14.3
