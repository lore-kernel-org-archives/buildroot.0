From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Dec 2020 16:12:01 +0100
Subject: [Buildroot] [PATCHv6 3/5] package/libbpf: new package
In-Reply-To: <20201220151203.2206747-1-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
Message-ID: <20201220151203.2206747-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
directory plus its supporting header files. The version
of the package reflects the version of ABI.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Qais Yousef <qais.yousef@arm.com>
---
I'm not sure if updating the bpf.h provided by the toolchain linux-headers
is the right things to do.

v6: Update DEVELOPERS file
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libbpf/Config.in | 20 ++++++++++++++++++++
 package/libbpf/libbpf.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/libbpf/Config.in
 create mode 100644 package/libbpf/libbpf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 681c4e18db..00e12af974 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2249,6 +2249,7 @@ F:	package/glibc/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
+F:	package/libbpf/
 F:	package/libclc/
 F:	package/libgta/
 F:	package/libspatialindex/
diff --git a/package/Config.in b/package/Config.in
index c04392126c..4dc27694d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -107,6 +107,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
+	source "package/libbpf/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
new file mode 100644
index 0000000000..c5b24c5eb5
--- /dev/null
+++ b/package/libbpf/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBBPF
+	bool "libbpf"
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_ZLIB
+	help
+	  libbpf library.
+	  A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
+	  directory plus its supporting header files. The version
+	  of the package reflects the version of ABI.
+
+	  https://github.com/libbpf/libbpf
+
+comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
new file mode 100644
index 0000000000..33e303db16
--- /dev/null
+++ b/package/libbpf/libbpf.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# libbpf
+#
+################################################################################
+
+LIBBPF_VERSION = 0.2
+LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
+LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
+LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LPGL-2.1
+LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
+LIBBPF_INSTALL_STAGING = YES
+
+define LIBBPF_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+# bpf/bpf.h installed by libbpf use enm bpf_iter_link_info that was added since
+# kernel 5.9, so we need to update some uapi headers in STAGING_DIR if the
+# toolchain is build with linux-headers < 5.9.
+# Otherwise bpf/bpf.h is broken due to out of date linux/bpf.h installed by the
+# toolchain.
+# https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a5cbe05a6673b85bed2a63ffcfea6a96c6410cff
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9),)
+LIBBPF_UPDATE_UAPI_HEADERS = install_uapi_headers
+endif
+
+define LIBBPF_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install $(LIBBPF_UPDATE_UAPI_HEADERS) \
+		DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBBPF_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.25.4
