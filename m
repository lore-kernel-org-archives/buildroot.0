From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Sep 2015 11:53:47 +0200
Subject: [Buildroot] [PATCH] package/stress-ng: new package
Message-ID: <1441792427-15297-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                |  1 +
 package/stress-ng/Config.in      | 25 +++++++++++++++++++++++++
 package/stress-ng/stress-ng.hash |  2 ++
 package/stress-ng/stress-ng.mk   | 22 ++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/stress-ng/Config.in
 create mode 100644 package/stress-ng/stress-ng.hash
 create mode 100644 package/stress-ng/stress-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 9bd4190..b53e089 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -97,6 +97,7 @@ endif
 	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
+	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tinymembench/Config.in"
diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
new file mode 100644
index 0000000..cdf9984
--- /dev/null
+++ b/package/stress-ng/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_STRESS_NG
+	bool "stress-ng"
+	depends on BR2_USE_MMU # fork()
+	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
+	# disabled on uClibc: stress-aio.c needs aio.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# perf.c needs PERF_COUNT_HW_STALLED_CYCLES_FRONTEND
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_microblaze # keyutils
+	depends on !BR2_STATIC_LIBS # keyutils
+	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
+	select BR2_PACKAGE_ATTR # stress-xattr.c needs xattr.h
+	help
+	  stress-ng will stress test a computer system in various
+	  selectable ways. It was designed to exercise various physical
+	  subsystems of a computer as well as the various operating
+	  system kernel interfaces.
+
+	  http://kernel.ubuntu.com/~cking/stress-ng/
+
+comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.0"
+	depends on !BR2_microblaze
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+		|| !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
new file mode 100644
index 0000000..4979303
--- /dev/null
+++ b/package/stress-ng/stress-ng.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9d17dffafdf8dd71eb5c191973b65d4eb2964ecc31f1d01ad188fd03a0c49f6c	stress-ng-0.04.16.tar.gz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
new file mode 100644
index 0000000..e4e4fec
--- /dev/null
+++ b/package/stress-ng/stress-ng.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# stress-ng
+#
+################################################################################
+
+STRESS_NG_VERSION = 0.04.16
+STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng/
+STRESS_NG_LICENSE = GPLv2
+STRESS_NG_LICENSE_FILES = COPYING
+
+STRESS_NG_DEPENDENCIES = attr keyutils
+
+define STRESS_NG_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define STRESS_NG_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.3
