From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  2 Mar 2018 11:09:24 +0100
Subject: [Buildroot] [PATCH 1/1] tcf-agent: upgrade to 1.7.0
Message-ID: <20180302100924.10823-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-   Patches have been adopted upstream
-   microblaze and powerpc should build now
-   changed build from CMake to using plain Makefile as
    CMake build doesnt seem particularly well maintained
-   openssl is automatically used if available

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...gent-add-install-target-to-the-CMakeLists.patch |  48 ----------
 ...ream-TCF-Agent-stop-stack-crawl-when-SP-0.patch |  56 +++++++++++
 ...-fix-build-with-static-libcrypto-on-Linux.patch |  28 ++++++
 ...-remove-explicit-uses-of-__ptrace_request.patch | 103 ---------------------
 ...de-canonicalize_file_name-for-all-c-libs-.patch |  46 ---------
 package/tcf-agent/Config.in                        |   5 +-
 package/tcf-agent/tcf-agent.hash                   |   2 +-
 package/tcf-agent/tcf-agent.mk                     |  42 +++++++--
 8 files changed, 121 insertions(+), 209 deletions(-)
 delete mode 100644 package/tcf-agent/0001-agent-add-install-target-to-the-CMakeLists.patch
 create mode 100644 package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch
 create mode 100644 package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch
 delete mode 100644 package/tcf-agent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
 delete mode 100644 package/tcf-agent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch

diff --git a/package/tcf-agent/0001-agent-add-install-target-to-the-CMakeLists.patch b/package/tcf-agent/0001-agent-add-install-target-to-the-CMakeLists.patch
deleted file mode 100644
index fd2d61f3da..0000000000
--- a/package/tcf-agent/0001-agent-add-install-target-to-the-CMakeLists.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 96c43b223c90746cb2f680d6d5e198afc690dd4d Mon Sep 17 00:00:00 2001
-From: Norbert Lange <nolange79@gmail.com>
-Date: Mon, 4 Dec 2017 10:56:45 +0100
-Subject: [PATCH] agent: add install target to the CMakeLists
-
-It is common for CMake packages to make sure that 'make install'
-works properly, and that's what most users expect.
-
-More specifically, build systems such as Buildroot also expect
-'make install' to do the right thing for CMake-based packages
-
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
----
- agent/CMakeLists.txt | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
-index aef15b96..605862b2 100644
---- a/agent/CMakeLists.txt
-+++ b/agent/CMakeLists.txt
-@@ -1,6 +1,8 @@
- # -*- cmake -*-
- 
- cmake_minimum_required(VERSION 2.8)
-+project(tcfagent C)
-+include(GNUInstallDirs)
- 
- set(CMAKE_COLOR_MAKEFILE OFF)
- 
-@@ -43,3 +45,15 @@ message(STATUS "machine:" ${TCF_MACHINE})
- 
- add_executable(agent tcf/main/main.c)
- target_link_libraries(agent ${TCF_LIB_NAME})
-+
-+# executable and library cant have the same target name,
-+# but we can rename the output
-+set_target_properties(agent
-+        PROPERTIES OUTPUT_NAME tcf-agent)
-+
-+# add target to install all outputs
-+install(TARGETS agent ${TCF_LIB_NAME}
-+  RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR}
-+  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+)
--- 
-2.15.1
-
diff --git a/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch b/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch
new file mode 100644
index 0000000000..075d743338
--- /dev/null
+++ b/package/tcf-agent/0001-upstream-TCF-Agent-stop-stack-crawl-when-SP-0.patch
@@ -0,0 +1,56 @@
+From 45d57103fe4c344b95d39bf8615b5f6bad138027 Mon Sep 17 00:00:00 2001
+From: Eugene Tarassov <eugenet@xilinx.com>
+Date: Sat, 24 Feb 2018 16:32:09 -0800
+Subject: [PATCH] TCF Agent: stop stack crawl when SP = 0
+
+---
+ agent/machine/a64/tcf/stack-crawl-a64.c               | 7 ++++---
+ agent/machine/arm/tcf/stack-crawl-arm.c               | 1 +
+ agent/machine/microblaze/tcf/stack-crawl-microblaze.c | 1 +
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/agent/machine/a64/tcf/stack-crawl-a64.c b/agent/machine/a64/tcf/stack-crawl-a64.c
+index e21a51ab..567828ae 100644
+--- a/agent/machine/a64/tcf/stack-crawl-a64.c
++++ b/agent/machine/a64/tcf/stack-crawl-a64.c
+@@ -1124,9 +1124,10 @@ int crawl_stack_frame_a64(StackFrame * frame, StackFrame * down) {
+     for (i = 0; i < MEM_CACHE_SIZE; i++) mem_cache[i].size = 0;
+ 
+     for (def = defs; def->name; def++) {
+-        if (def->dwarf_id == 31) {
+-            if (read_reg_value(frame, def, &reg_data[def->dwarf_id].v) < 0) continue;
+-            reg_data[def->dwarf_id].o = REG_VAL_OTHER;
++        if (def->dwarf_id == REG_ID_SP) {
++            if (read_reg_value(frame, def, &reg_data[REG_ID_SP].v) < 0) continue;
++            if (reg_data[REG_ID_SP].v == 0) return 0;
++            reg_data[REG_ID_SP].o = REG_VAL_OTHER;
+         }
+         else if (def->dwarf_id >= 0 && def->dwarf_id <= 31) {
+             reg_data[def->dwarf_id].v = (uint32_t)(def - defs);
+diff --git a/agent/machine/arm/tcf/stack-crawl-arm.c b/agent/machine/arm/tcf/stack-crawl-arm.c
+index e29e2462..31e88ecc 100644
+--- a/agent/machine/arm/tcf/stack-crawl-arm.c
++++ b/agent/machine/arm/tcf/stack-crawl-arm.c
+@@ -2452,6 +2452,7 @@ static int trace_frame(StackFrame * frame, StackFrame * down) {
+         }
+         else if (def->dwarf_id == 13 || def->dwarf_id == 15) {
+             if (read_reg_value(frame, def, &v) < 0) return -1;
++            if (def->dwarf_id == 13 && v == 0) return 0;
+             reg_data[def->dwarf_id].v = (uint32_t)v;
+             reg_data[def->dwarf_id].o = REG_VAL_OTHER;
+         }
+diff --git a/agent/machine/microblaze/tcf/stack-crawl-microblaze.c b/agent/machine/microblaze/tcf/stack-crawl-microblaze.c
+index 3d8f7988..d01b74a0 100644
+--- a/agent/machine/microblaze/tcf/stack-crawl-microblaze.c
++++ b/agent/machine/microblaze/tcf/stack-crawl-microblaze.c
+@@ -971,6 +971,7 @@ int crawl_stack_frame_microblaze(StackFrame * frame, StackFrame * down) {
+         reg_data[def->dwarf_id].v = (uint32_t)v;
+         reg_data[def->dwarf_id].o = REG_VAL_OTHER;
+         if (def->dwarf_id == REG_PC_INDEX) pc = (uint32_t)v;
++        if (def->dwarf_id == REG_SP_INDEX && v == 0) return 0;
+     }
+ 
+     if (trace_instructions() < 0) return -1;
+-- 
+2.16.1
+
diff --git a/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch b/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch
new file mode 100644
index 0000000000..a6ebe45d4b
--- /dev/null
+++ b/package/tcf-agent/0002-TCF-Agent-fix-build-with-static-libcrypto-on-Linux.patch
@@ -0,0 +1,28 @@
+From 0007972acc45c7f397589f1d90cd65ade0519e59 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <norbert.lange@andritz.com>
+Date: Wed, 28 Feb 2018 10:53:04 +0100
+Subject: [PATCH] TCF Agent: fix build with static libcrypto on Linux
+
+libcrypto depends on libz, so this library needs to be linked as well
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ agent/Makefile.inc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/Makefile.inc b/agent/Makefile.inc
+index f9f191b2..7c8cfa53 100644
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
+@@ -81,7 +81,7 @@ endif
+ 
+ ifeq ($(OPSYS),GNU/Linux)
+   ifeq ($(NO_SSL),)
+-    LIBS = -lpthread -lssl -lcrypto -lrt
++    LIBS = -lpthread -lssl -lcrypto -lz -lrt
+   else
+     LIBS = -lpthread -lrt
+     OPTS += -DENABLE_SSL=0
+-- 
+2.16.1
+
diff --git a/package/tcf-agent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch b/package/tcf-agent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
deleted file mode 100644
index 5c820394a3..0000000000
--- a/package/tcf-agent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 3e662598e1d9ad682e470988764c3af5b1a78cb7 Mon Sep 17 00:00:00 2001
-From: Norbert Lange <nolange79@gmail.com>
-Date: Fri, 1 Dec 2017 13:15:50 +0100
-Subject: [PATCH] linux: remove explicit uses of __ptrace_request
-
-This type is not to be used directly, and with musl it wont build
-
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
----
- agent/machine/arm/tcf/cpudefs-mdep.c       |  4 ++--
- agent/machine/arm/tcf/regset-mdep.h        |  4 ++--
- agent/system/GNU/Linux/tcf/context-linux.c | 18 +++++++++---------
- 3 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/agent/machine/arm/tcf/cpudefs-mdep.c b/agent/machine/arm/tcf/cpudefs-mdep.c
-index 27ab0129..0bc8b146 100644
---- a/agent/machine/arm/tcf/cpudefs-mdep.c
-+++ b/agent/machine/arm/tcf/cpudefs-mdep.c
-@@ -89,10 +89,10 @@ static RegisterDefinition * lr_def = NULL;
- static RegisterDefinition * cpsr_def = NULL;
- 
- #if !defined(PTRACE_GETHBPREGS)
--#define PTRACE_GETHBPREGS (enum __ptrace_request)29
-+#define PTRACE_GETHBPREGS 29
- #endif
- #if !defined(PTRACE_SETHBPREGS)
--#define PTRACE_SETHBPREGS (enum __ptrace_request)30
-+#define PTRACE_SETHBPREGS 30
- #endif
- 
- #define ARM_DEBUG_ARCH_V6       1
-diff --git a/agent/machine/arm/tcf/regset-mdep.h b/agent/machine/arm/tcf/regset-mdep.h
-index e5516042..893ba64f 100644
---- a/agent/machine/arm/tcf/regset-mdep.h
-+++ b/agent/machine/arm/tcf/regset-mdep.h
-@@ -28,11 +28,11 @@
- #endif
- 
- #ifndef PTRACE_GETREGSET
--#define PTRACE_GETREGSET (enum __ptrace_request)0x4204
-+#define PTRACE_GETREGSET 0x4204
- #endif
- 
- #ifndef PTRACE_SETREGSET
--#define PTRACE_SETREGSET (enum __ptrace_request)0x4205
-+#define PTRACE_SETREGSET 0x4205
- #endif
- 
- struct regset_gp {
-diff --git a/agent/system/GNU/Linux/tcf/context-linux.c b/agent/system/GNU/Linux/tcf/context-linux.c
-index d4eb5e6b..4c86021e 100644
---- a/agent/system/GNU/Linux/tcf/context-linux.c
-+++ b/agent/system/GNU/Linux/tcf/context-linux.c
-@@ -60,10 +60,10 @@
- #endif
- 
- #if !defined(PTRACE_SETOPTIONS)
--#define PTRACE_SETOPTIONS       (enum __ptrace_request)0x4200
--#define PTRACE_GETEVENTMSG      (enum __ptrace_request)0x4201
--#define PTRACE_GETSIGINFO       (enum __ptrace_request)0x4202
--#define PTRACE_SETSIGINFO       (enum __ptrace_request)0x4203
-+#define PTRACE_SETOPTIONS       0x4200
-+#define PTRACE_GETEVENTMSG      0x4201
-+#define PTRACE_GETSIGINFO       0x4202
-+#define PTRACE_SETSIGINFO       0x4203
- 
- #define PTRACE_O_TRACESYSGOOD   0x00000001
- #define PTRACE_O_TRACEFORK      0x00000002
-@@ -85,8 +85,8 @@
- 
- #if defined(__arm__) || defined(__aarch64__)
- #if !defined(PTRACE_GETVFPREGS)
--#define PTRACE_GETVFPREGS       (enum __ptrace_request)27
--#define PTRACE_SETVFPREGS       (enum __ptrace_request)28
-+#define PTRACE_GETVFPREGS       27
-+#define PTRACE_SETVFPREGS       28
- #endif
- #endif
- 
-@@ -483,7 +483,7 @@ static const char * get_ptrace_cmd_name(int cmd) {
- static int do_single_step(Context * ctx) {
-     uint32_t is_cont = 0;
-     ContextExtensionLinux * ext = EXT(ctx);
--    enum __ptrace_request cmd = PTRACE_SINGLESTEP;
-+    int cmd = PTRACE_SINGLESTEP;
- 
-     assert(!ext->pending_step);
- 
-@@ -540,9 +540,9 @@ int context_continue(Context * ctx) {
-     int signal = 0;
-     ContextExtensionLinux * ext = EXT(ctx);
- #if USE_PTRACE_SYSCALL
--    enum __ptrace_request cmd = PTRACE_SYSCALL;
-+    int cmd = PTRACE_SYSCALL;
- #else
--    enum __ptrace_request cmd = PTRACE_CONT;
-+    int cmd = PTRACE_CONT;
- #endif
- 
-     assert(is_dispatch_thread());
--- 
-2.15.1
-
diff --git a/package/tcf-agent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch b/package/tcf-agent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
deleted file mode 100644
index 8532307d90..0000000000
--- a/package/tcf-agent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1323aa4459004b9817f0cfbf4b59c31480d527cf Mon Sep 17 00:00:00 2001
-From: Norbert Lange <nolange79@gmail.com>
-Date: Fri, 1 Dec 2017 13:34:08 +0100
-Subject: [PATCH] linux: provide canonicalize_file_name for all c libs except
- glibc
-
-musl was not covered so far, and this library does not define a
-macro for detection.
-unless glibc is detected, a canonicalize_file_name implementation
-will be provided.
-
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
----
- agent/tcf/framework/mdep.c | 2 +-
- agent/tcf/framework/mdep.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/agent/tcf/framework/mdep.c b/agent/tcf/framework/mdep.c
-index 8aee811f..d38036be 100644
---- a/agent/tcf/framework/mdep.c
-+++ b/agent/tcf/framework/mdep.c
-@@ -1097,7 +1097,7 @@ char * canonicalize_file_name(const char * path) {
-     return strdup(res);
- }
- 
--#elif defined(__UCLIBC__)
-+#elif defined(__UCLIBC__) || !defined(__GLIBC_)
- 
- char * canonicalize_file_name(const char * path) {
-     return realpath(path, NULL);
-diff --git a/agent/tcf/framework/mdep.h b/agent/tcf/framework/mdep.h
-index f90f03f2..3e331383 100644
---- a/agent/tcf/framework/mdep.h
-+++ b/agent/tcf/framework/mdep.h
-@@ -292,7 +292,7 @@ extern int loc_clock_gettime(int, struct timespec *);
- 
- #define O_BINARY 0
- 
--#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)
-+#if (defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)) | !defined (__GLIBC__)
- #  define O_LARGEFILE 0
- extern char ** environ;
- extern char * canonicalize_file_name(const char * path);
--- 
-2.15.1
-
diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 9cd283107a..50e58642b0 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -28,9 +28,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
 	default "powerpc"    if BR2_powerpc || BR2_powerpcle
-#	those architectures fail to build currently
-#	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
-#	default "microblaze" if BR2_microblaze || BR2_microblazeel
+	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
+	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
 	bool
diff --git a/package/tcf-agent/tcf-agent.hash b/package/tcf-agent/tcf-agent.hash
index d46d5206a3..3ff4d9a546 100644
--- a/package/tcf-agent/tcf-agent.hash
+++ b/package/tcf-agent/tcf-agent.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  94e9277a52929791417d59b515235bf28ca29ffb05c9e89ad331ebc3256fb5df  org.eclipse.tcf.agent-1.6.0.tar.gz
+sha256  2f8c7be8a0bf7c86c72fd5680bc19a9e8f98792d40c94a0fee30ceb6428b8f33  org.eclipse.tcf.agent-1.7.0.tar.gz
 
 # Hash for license files:
 sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index 7b615d3120..7952c94bff 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCF_AGENT_VERSION = 1.6.0
+TCF_AGENT_VERSION = 1.7.0
 # the tar.xz link was broken the time this file got authored
 TCF_AGENT_SOURCE = org.eclipse.tcf.agent-$(TCF_AGENT_VERSION).tar.gz
 TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
@@ -12,14 +12,40 @@ TCF_AGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
 TCF_AGENT_LICENSE = BSD-3-Clause
 TCF_AGENT_LICENSE_FILES = agent/edl-v10.html
 
-TCF_AGENT_DEPENDENCIES = util-linux
+TCF_AGENT_DEPENDENCIES =
 TCF_AGENT_SUBDIR = agent
 
-# there is not much purpose for the shared lib,
-# if wont be used (unmodifed) outside the tcf-agent application
-TCF_AGENT_CONF_OPTS = \
-	-DBUILD_SHARED_LIBS=OFF \
-	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
+# There still persists an issue with crosscompiling,
+# the file agent/Makefile.inc will use the build system arch
+# OPTS += -DENABLE_arch_$(shell uname -m)
+
+# use CONF=Debug, cause otherwise the Makefile will append -O3 and override
+# buildroots option.
+TCF_AGENT_EXTRA_OPTS = \
+	OPSYS='GNU/Linux' MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH)) CONF=Debug \
+	OPTS="-D_GNU_SOURCE=1"
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+TCF_AGENT_DEPENDENCIES += util-linux
+else
+TCF_AGENT_EXTRA_OPTS += NO_UUID=1
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# needs to link libz
+TCF_AGENT_DEPENDENCIES += openssl
+else
+TCF_AGENT_EXTRA_OPTS += NO_SSL=1
+endif
+
+# install everything in a subdirectory as there is no way to just pick what we need
+define TCF_AGENT_BUILD_CMDS
+	$(TCF_AGENT_EXTRA_OPTS) INSTALLROOT=$(@D)/inst $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/$(TCF_AGENT_SUBDIR) install
+endef
+
+define TCF_AGENT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/inst/usr/sbin/tcf-agent $(TARGET_DIR)/usr/sbin/tcf-agent
+endef
 
 define TCF_AGENT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/tcf-agent/tcf-agent.service \
@@ -34,4 +60,4 @@ define TCF_AGENT_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S55tcf-agent
 endef
 
-$(eval $(cmake-package))
+$(eval $(generic-package))
-- 
2.16.1
