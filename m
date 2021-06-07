From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 07 Jun 2021 15:18:19 -0000
Subject: [Buildroot] [git commit] package/libbpf: new package
Message-ID: <20210607144656.37721814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7b8508e4fe9c96bf679cc5423cc1500b6523e83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A mirror of bpf-next linux tree bpf-next/tools/lib/bpf
directory plus its supporting header files. The version
of the package reflects the version of ABI.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Qais Yousef <qais.yousef@arm.com>
Reviewed-by: Qais Yousef <qais.yousef@arm.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: add hash file]
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libbpf/Config.in   | 20 ++++++++++++++++++++
 package/libbpf/libbpf.hash |  5 +++++
 package/libbpf/libbpf.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 93687081c4..988612a944 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2314,6 +2314,7 @@ F:	package/glibc/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
+F:	package/libbpf/
 F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
diff --git a/package/Config.in b/package/Config.in
index 761d687e03..8e017654d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -109,6 +109,7 @@ menu "Debugging, profiling and benchmark"
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
diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
new file mode 100644
index 0000000000..1afda50c9c
--- /dev/null
+++ b/package/libbpf/libbpf.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  0f97295987c745eb07c48f8db992f7df307b5cd45c9a20eb352ee6d08cf7bd36  libbpf-0.2.tar.gz
+sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LPGL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
new file mode 100644
index 0000000000..a1aeb7d894
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
+# bpf/bpf.h installed by libbpf uses bpf_iter_link_info that was added since
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
