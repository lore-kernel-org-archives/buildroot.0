From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 26 Sep 2020 22:00:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/crash: new package
Message-ID: <20200926200021.28930-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 .../0001-Support-cross-compilation.patch      | 134 ++++++++++++++++++
 package/crash/Config.in                       |  27 ++++
 package/crash/crash.hash                      |   3 +
 package/crash/crash.mk                        |  50 +++++++
 6 files changed, 216 insertions(+)
 create mode 100644 package/crash/0001-Support-cross-compilation.patch
 create mode 100644 package/crash/Config.in
 create mode 100644 package/crash/crash.hash
 create mode 100644 package/crash/crash.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9352d891d3..5d0f93d0d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -144,6 +144,7 @@ F:	package/libuecc/
 F:	package/putty/
 
 N:	Alexander Egorenkov <egorenar-dev@posteo.net>
+F:	package/crash/
 F:	package/makedumpfile/
 F:	package/multipath-tools/
 
diff --git a/package/Config.in b/package/Config.in
index 51583d07d6..9ded2a2b4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/crash/Config.in"
 	source "package/dacapo/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
diff --git a/package/crash/0001-Support-cross-compilation.patch b/package/crash/0001-Support-cross-compilation.patch
new file mode 100644
index 0000000000..7e1bd3f861
--- /dev/null
+++ b/package/crash/0001-Support-cross-compilation.patch
@@ -0,0 +1,134 @@
+From 44cb56ad5bbd78203fb6f346299ccfe45f2568fe Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar-dev@posteo.net>
+Date: Sat, 26 Sep 2020 14:29:49 +0200
+Subject: [PATCH 1/1] Support cross-compilation
+
+- Introduce CONF_CC variable to compile configure.c
+- Introduce CONF_HOST_ARCH to configure.c to enable overriding target
+  at compile time
+
+Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
+---
+ Makefile    |  4 ++-
+ configure.c | 76 ++++++++++++++++++++++++++++-------------------------
+ 2 files changed, 43 insertions(+), 37 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7455410..402be6e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,6 +17,8 @@
+ # GNU General Public License for more details.
+ #
+ 
++CONF_CC = ${CC}
++
+ PROGRAM=crash
+ 
+ #
+@@ -288,7 +290,7 @@ force:
+ 
+ make_configure: force
+ 	@rm -f configure
+-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
++	@${CONF_CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
+ 
+ clean: make_configure
+ 	@./configure ${CONF_TARGET_FLAG} -q -b
+diff --git a/configure.c b/configure.c
+index 7f6d19e..d736c56 100644
+--- a/configure.c
++++ b/configure.c
+@@ -120,6 +120,45 @@ void add_extra_lib(char *);
+ #define MIPS    11
+ #define SPARC64 12
+ 
++#ifndef CONF_HOST_ARCH
++#ifdef __alpha__
++#define CONF_HOST_ARCH ALPHA
++#endif
++#ifdef __i386__
++#define CONF_HOST_ARCH X86
++#endif
++#ifdef __powerpc__
++#define CONF_HOST_ARCH PPC
++#endif
++#ifdef __ia64__
++#define CONF_HOST_ARCH IA64
++#endif
++#ifdef __s390__
++#define CONF_HOST_ARCH S390
++#endif
++#ifdef __s390x__
++#define CONF_HOST_ARCH S390X
++#endif
++#ifdef __powerpc64__
++#define CONF_HOST_ARCH PPC64
++#endif
++#ifdef __x86_64__
++#define CONF_HOST_ARCH X86_64
++#endif
++#ifdef __arm__
++#define CONF_HOST_ARCH ARM
++#endif
++#ifdef __aarch64__
++#define CONF_HOST_ARCH ARM64
++#endif
++#ifdef __mips__
++#define CONF_HOST_ARCH MIPS
++#endif
++#ifdef __sparc_v9__
++#define CONF_HOST_ARCH SPARC64
++#endif
++#endif // #ifndef CONF_HOST_ARCH
++
+ #define TARGET_X86    "TARGET=X86"
+ #define TARGET_ALPHA  "TARGET=ALPHA"
+ #define TARGET_PPC    "TARGET=PPC"
+@@ -349,42 +388,7 @@ get_current_configuration(struct supported_gdb_version *sp)
+ 	static char buf[512];
+ 	char *p;
+ 
+-#ifdef __alpha__
+-        target_data.target = ALPHA;
+-#endif
+-#ifdef __i386__
+-        target_data.target = X86;
+-#endif
+-#ifdef __powerpc__
+-        target_data.target = PPC;
+-#endif
+-#ifdef __ia64__
+-        target_data.target = IA64;
+-#endif
+-#ifdef __s390__
+-        target_data.target = S390;
+-#endif
+-#ifdef __s390x__
+-        target_data.target = S390X;
+-#endif
+-#ifdef __powerpc64__
+-        target_data.target = PPC64;
+-#endif
+-#ifdef __x86_64__
+-        target_data.target = X86_64;
+-#endif
+-#ifdef __arm__
+-        target_data.target = ARM;
+-#endif
+-#ifdef __aarch64__
+-        target_data.target = ARM64;
+-#endif
+-#ifdef __mips__
+-        target_data.target = MIPS;
+-#endif
+-#ifdef __sparc_v9__
+-	target_data.target = SPARC64;
+-#endif
++	target_data.target = CONF_HOST_ARCH;
+ 
+ 	set_initial_target(sp);
+ 
+-- 
+2.28.0
+
diff --git a/package/crash/Config.in b/package/crash/Config.in
new file mode 100644
index 0000000000..7372123937
--- /dev/null
+++ b/package/crash/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_CRASH_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_sparc64
+
+comment "crash needs a glibc toolchain w/ wchar, dynamic library"
+	depends on BR2_PACKAGE_CRASH_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_CRASH
+	bool "crash"
+	depends on BR2_PACKAGE_CRASH_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LESS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
+	help
+	  Analyze Linux crash dump data or a live system
+
+	  https://github.com/crash-utility/crash
diff --git a/package/crash/crash.hash b/package/crash/crash.hash
new file mode 100644
index 0000000000..1a34cf4421
--- /dev/null
+++ b/package/crash/crash.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  996d3367764c77e23921c164725e4d0221acc7a15a92a3f825053ea37f2452dc  crash-7.2.8.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
diff --git a/package/crash/crash.mk b/package/crash/crash.mk
new file mode 100644
index 0000000000..d045417a5e
--- /dev/null
+++ b/package/crash/crash.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# crash
+#
+################################################################################
+
+CRASH_VERSION = 7.2.8
+CRASH_SITE = $(call github,crash-utility,crash,$(CRASH_VERSION))
+CRASH_DEPENDENCIES = host-bison less ncurses zlib
+CRASH_LICENSE = GPL-3.0
+CRASH_LICENSE_FILES = COPYING3
+
+CRASH_GDB_CONF_FLAGS = \
+	--host=$(GNU_TARGET_NAME)
+
+ifeq ($(BR2_i386),y)
+CRASH_TARGET = X86
+else ifeq ($(BR2_x86_64),y)
+CRASH_TARGET = X86_64
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+CRASH_TARGET = ARM
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+CRASH_TARGET = ARM64
+else ifeq ($(BR2_powerpc),y)
+CRASH_TARGET = PPC
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+CRASH_TARGET = PPC64
+else ifeq ($(BR2_s390x),y)
+CRASH_TARGET = S390X
+else ifeq ($(BR2_sparc64),y)
+CRASH_TARGET = SPARC64
+endif
+
+CRASH_MAKE_OPTS = \
+	CONF_CC="$(HOSTCC_NOCCACHE)" \
+	CONF_FLAGS="-DCONF_HOST_ARCH=$(CRASH_TARGET)" \
+	GDB_CONF_FLAGS="$(CRASH_GDB_CONF_FLAGS)" \
+	"gdb_cv_prfpregset_t_broken=no"
+
+define CRASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(CRASH_MAKE_OPTS)
+endef
+
+define CRASH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.28.0
