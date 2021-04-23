From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:11:15 +0200
Subject: [Buildroot] [git commit] package/uftrace: new package
Message-ID: <20210423204449.A9846812FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c97972d9f90b69cfc36f9ffe9e22c13daf9307
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uftrace tool is to trace and analyze execution of a program
written in C/C++.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...ds-replace-ADDR_NO_RANDOMIZE-by-its-value.patch | 33 +++++++++++++
 ...ount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch | 31 +++++++++++++
 package/uftrace/Config.in                          | 22 +++++++++
 package/uftrace/uftrace.hash                       |  3 ++
 package/uftrace/uftrace.mk                         | 54 ++++++++++++++++++++++
 7 files changed, 145 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95b52d76be..573d8d84de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,6 +240,7 @@ F:	package/python*
 F:	package/snmpclitools/
 F:	package/spdlog/
 F:	package/uftp/
+F:	package/uftrace/
 F:	package/uvw/
 F:	package/zeromq/
 
diff --git a/package/Config.in b/package/Config.in
index b9d277428d..6181aaac2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -144,6 +144,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
+	source "package/uftrace/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
diff --git a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
new file mode 100644
index 0000000000..6913012c3b
--- /dev/null
+++ b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
@@ -0,0 +1,33 @@
+From dc0a75b1679debbc3712b262e5127e90961f92db Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 23 Apr 2021 22:57:56 +0200
+Subject: [PATCH] cmds/records: replace ADDR_NO_RANDOMIZE by its value
+
+uClibc-ng lacks the definition of ADDR_NO_RANDOMIZE, causing a build
+failure. A patch was submitted to upstream uClibc-ng to address this
+issue, but in the mean time, use an hardcoded value.
+
+Using a #ifdef ... #endif test doesn't work as this value is defined
+through an enum in glibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmds/record.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmds/record.c b/cmds/record.c
+index e750f053..fc4eaed4 100644
+--- a/cmds/record.c
++++ b/cmds/record.c
+@@ -2110,7 +2110,7 @@ int do_child_exec(int ready, struct opts *opts,
+ 
+ 	if (opts->no_randomize_addr) {
+ 		/* disable ASLR (Address Space Layout Randomization) */
+-		if (personality(ADDR_NO_RANDOMIZE) < 0)
++		if (personality(0x0040000 /* ADDR_NO_RANDOMIZE */) < 0)
+ 			pr_dbg("disabling ASLR failed\n");
+ 	}
+ 
+-- 
+2.30.2
+
diff --git a/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch b/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
new file mode 100644
index 0000000000..03fba88693
--- /dev/null
+++ b/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
@@ -0,0 +1,31 @@
+From 4e543097e62eb052650433d1d4c9c5996d30f242 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 23 Apr 2021 23:06:01 +0200
+Subject: [PATCH] arch/arm/mcount-support.c: define EF_ARM_VFP_FLOAT when not
+ available
+
+uClibc-ng <elf.h> doesn't define EF_ARM_VFP_FLOAT, so let's define it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ arch/arm/mcount-support.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/mcount-support.c b/arch/arm/mcount-support.c
+index 8d23460b..51331740 100644
+--- a/arch/arm/mcount-support.c
++++ b/arch/arm/mcount-support.c
+@@ -3,6 +3,10 @@
+ #include <link.h>
+ #include <elf.h>
+ 
++#ifndef EF_ARM_VFP_FLOAT
++# define EF_ARM_VFP_FLOAT 0x400
++#endif
++
+ #ifndef EF_ARM_ABI_FLOAT_HARD
+ # define EF_ARM_ABI_FLOAT_HARD  EF_ARM_VFP_FLOAT
+ #endif
+-- 
+2.30.2
+
diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
new file mode 100644
index 0000000000..7aa74c9aa9
--- /dev/null
+++ b/package/uftrace/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV6 || BR2_ARM_CPU_ARMV7A
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UFTRACE
+	bool "uftrace"
+	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	select BR2_PACKAGE_ARGP_STANDALONE if \
+	       BR2_TOOLCHAIN_USES_UCLIBC || \
+	       BR2_TOOLCHAIN_USES_MUSL
+	help
+	  The uftrace tool is to trace and analyze execution of a
+	  program written in C/C++. It was heavily inspired by the
+	  ftrace framework of the Linux kernel (especially function
+	  graph tracer) and supports userspace programs.
+	  It supports various kind of commands and filters to help
+	  analysis of the program execution and performance.
+
+	  https://github.com/namhyung/uftrace
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
new file mode 100644
index 0000000000..fb1e116be6
--- /dev/null
+++ b/package/uftrace/uftrace.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	418d30c959d3b6d0dcafd55e588a5d414a9984b30f2522a5af004a268824a5a2  uftrace-0.9.4.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
new file mode 100644
index 0000000000..f42bbbddaa
--- /dev/null
+++ b/package/uftrace/uftrace.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# uftrace
+#
+################################################################################
+
+UFTRACE_VERSION = 0.9.4
+UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
+UFTRACE_LICENSE = GPL-2.0
+UFTRACE_LICENSE_FILES = COPYING
+UFTRACE_CONFIGURE_OPTS = \
+	--without-libdw \
+	--without-libpython \
+	--without-libluajit \
+	--without-libncurses \
+	--without-capstone
+
+# Only --without-<foo> options are supported.
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+UFTRACE_DEPENDENCIES += elfutils
+else
+UFTRACE_CONFIGURE_OPTS += --without-libelf
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+UFTRACE_CONFIGURE_OPTS += --without-libstdc++
+endif
+
+UFTRACE_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+UFTRACE_DEPENDENCIES += argp-standalone
+UFTRACE_LDFLAGS += -largp
+endif
+
+define UFTRACE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(UFTRACE_LDFLAGS)" \
+		./configure \
+		--arch=$(BR2_ARCH) \
+		--prefix=/usr \
+		$(UFTRACE_CONFIGURE_OPTS) \
+		-o $(@D)/.config)
+endef
+
+define UFTRACE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define UFTRACE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
