From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:22 +0200
Subject: [Buildroot] [PATCH v5 5/7] package/libclc: new package
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-6-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides libclc, an open source implementation of the
library requirements of the OpenCL C programming language, as
specified by the OpenCL 1.1 Specification. It is intended to be used
with Mesa Clover.

It needs to be compiled with Clang, as it generates LLVM IR bitcode
files containing device builtin functions for each target.

Currently, libclc supports AMDGCN, R600 and NVPTX targets.

As OpenCL kernels are built dynamically on the target using libclang and
libLLVM, it is necessary to copy /usr/include/clc from STAGING_DIR to the
target manually, as Buildroot doesn't include this directory.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

This patch should not yet be applied, we must first find a place
where clc headers can be stored.

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libclc/Config.in   |  9 +++++++++
 package/libclc/libclc.hash |  3 +++
 package/libclc/libclc.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 72303992c2..ec8f73681a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1889,6 +1889,7 @@ F:	package/tstools/
 
 N:	Valentin Korenblit <valentin.korenblit@smile.fr>
 F:	package/clang/
+F:	package/libclc/
 F:	package/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index b358e39c3f..3cd979661f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -281,6 +281,7 @@ comment "Graphic libraries"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libclc/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
new file mode 100644
index 0000000000..797f090bfc
--- /dev/null
+++ b/package/libclc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBCLC
+	bool "libclc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
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
index 0000000000..35a69ea360
--- /dev/null
+++ b/package/libclc/libclc.mk
@@ -0,0 +1,41 @@
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
-- 
2.14.3
