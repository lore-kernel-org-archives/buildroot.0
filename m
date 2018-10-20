From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sat, 20 Oct 2018 16:34:49 +0200
Subject: [Buildroot] [PATCH v8 2/4] package/libclc: new package
In-Reply-To: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <1540046091-13736-3-git-send-email-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides libclc, an open source implementation of the
library requirements of the OpenCL C programming language, as
specified by the OpenCL 1.1 Specification. It is intended to be used
with Clover (Mesa3D's OpenCL implementation for AMD GPUs.

It needs to be compiled with host-clang, as it generates LLVM IR bitcode
files containing device builtin functions for each target.

Currently, libclc supports AMDGCN, R600 and NVPTX targets.

As OpenCL kernels can be built dynamically on the target using libclang and
libLLVM, it is necessary to have clc headers installed on the target. Buildroot
removes /usr/include in its target-finalize step, so clc headers are installed to
/usr/share/clc.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libclc/Config.in   | 10 ++++++++++
 package/libclc/libclc.hash |  3 +++
 package/libclc/libclc.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 341bf7d..ffcbc76 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2116,6 +2116,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
+F:	package/libclc
 F:	package/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index fd86e37..8d53c72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1618,6 +1618,7 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
+	source "package/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcroco/Config.in"
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
new file mode 100644
index 0000000..4bba6a9
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
index 0000000..6c06648
--- /dev/null
+++ b/package/libclc/libclc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 8d7b42fba6db4a124c74f0ac475c1bc515761cbf3d559820b4cbe5b33e94f26c libclc-dabae5a2afb78cba0320a86e3f5f0b5dc83e077c.tar.gz
+sha256 45187a46f0637e4e92decb51d8dc3c9e4957b349d0283dfbd6647e8000d9ac7f LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
new file mode 100644
index 0000000..608f026
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
+LIBCLC_VERSION = dabae5a2afb78cba0320a86e3f5f0b5dc83e077c
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
+	--prefix=/usr \
+	--includedir=/usr/share \
+	--pkgconfigdir=/usr/lib/pkgconfig \
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
-- 
2.7.4
