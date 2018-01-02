From: Norbert Lange <nolange79@gmail.com>
Date: Tue,  2 Jan 2018 18:39:25 +0100
Subject: [Buildroot] [PATCH v4 1/1] tcfagent: new package
Message-ID: <20180102173925.3945-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add tcfpackage which contains a service "tcf-agent"

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
Changes v3 -> v4:
  - handling of architectures isolated in Config.in
  - use new upstream version 1.6.0
  - refreshed patches
  - whitespace fixes

Changes v2 -> v3:
  - fix: init file still started the tool daemonized
  - use same email for all signatures

Changes v1 -> v2:
  - added myself to DEVELOPERS
  - fixes to the init service, now uses common sheme to
    generate PID files
  - fixed systemd unit
  - renamed target executable directly in CMakeList
  - allow cmake build without existing C++ compiler
  - add patches to make sources compile with musl
  - allow compilation with other architectures than x86_64
  - some more small details suggested by Thomas Petazzoni
---
 DEVELOPERS                                         |   3 +
 package/Config.in                                  |   1 +
 ...gent-add-install-target-to-the-CMakeLists.patch |  48 ++++++++++
 ...-remove-explicit-uses-of-__ptrace_request.patch | 103 +++++++++++++++++++++
 ...de-canonicalize_file_name-for-all-c-libs-.patch |  46 +++++++++
 package/tcfagent/Config.in                         |  36 +++++++
 package/tcfagent/S55tcfagent                       |  40 ++++++++
 package/tcfagent/tcfagent.hash                     |   5 +
 package/tcfagent/tcfagent.mk                       |  39 ++++++++
 package/tcfagent/tcfagent.service                  |   9 ++
 10 files changed, 330 insertions(+)
 create mode 100644 package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
 create mode 100644 package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
 create mode 100644 package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
 create mode 100644 package/tcfagent/Config.in
 create mode 100755 package/tcfagent/S55tcfagent
 create mode 100644 package/tcfagent/tcfagent.hash
 create mode 100644 package/tcfagent/tcfagent.mk
 create mode 100644 package/tcfagent/tcfagent.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e14b5609f..20dedcfe0f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1285,6 +1285,9 @@ N:	No? Rubinstein <noe.rubinstein@gmail.com>
 F:	package/tpm-tools/
 F:	package/trousers/
 
+N:	Norbert Lange <nolange79@gmail.com>
+F:	package/tcfagent/
+
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
 
diff --git a/package/Config.in b/package/Config.in
index e97d3e2e58..2926c27857 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -124,6 +124,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/tcfagent/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
diff --git a/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch b/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
new file mode 100644
index 0000000000..fd2d61f3da
--- /dev/null
+++ b/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
@@ -0,0 +1,48 @@
+From 96c43b223c90746cb2f680d6d5e198afc690dd4d Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Mon, 4 Dec 2017 10:56:45 +0100
+Subject: [PATCH] agent: add install target to the CMakeLists
+
+It is common for CMake packages to make sure that 'make install'
+works properly, and that's what most users expect.
+
+More specifically, build systems such as Buildroot also expect
+'make install' to do the right thing for CMake-based packages
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ agent/CMakeLists.txt | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
+index aef15b96..605862b2 100644
+--- a/agent/CMakeLists.txt
++++ b/agent/CMakeLists.txt
+@@ -1,6 +1,8 @@
+ # -*- cmake -*-
+ 
+ cmake_minimum_required(VERSION 2.8)
++project(tcfagent C)
++include(GNUInstallDirs)
+ 
+ set(CMAKE_COLOR_MAKEFILE OFF)
+ 
+@@ -43,3 +45,15 @@ message(STATUS "machine:" ${TCF_MACHINE})
+ 
+ add_executable(agent tcf/main/main.c)
+ target_link_libraries(agent ${TCF_LIB_NAME})
++
++# executable and library cant have the same target name,
++# but we can rename the output
++set_target_properties(agent
++        PROPERTIES OUTPUT_NAME tcf-agent)
++
++# add target to install all outputs
++install(TARGETS agent ${TCF_LIB_NAME}
++  RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR}
++  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++)
+-- 
+2.15.1
+
diff --git a/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
new file mode 100644
index 0000000000..5c820394a3
--- /dev/null
+++ b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
@@ -0,0 +1,103 @@
+From 3e662598e1d9ad682e470988764c3af5b1a78cb7 Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Fri, 1 Dec 2017 13:15:50 +0100
+Subject: [PATCH] linux: remove explicit uses of __ptrace_request
+
+This type is not to be used directly, and with musl it wont build
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ agent/machine/arm/tcf/cpudefs-mdep.c       |  4 ++--
+ agent/machine/arm/tcf/regset-mdep.h        |  4 ++--
+ agent/system/GNU/Linux/tcf/context-linux.c | 18 +++++++++---------
+ 3 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/agent/machine/arm/tcf/cpudefs-mdep.c b/agent/machine/arm/tcf/cpudefs-mdep.c
+index 27ab0129..0bc8b146 100644
+--- a/agent/machine/arm/tcf/cpudefs-mdep.c
++++ b/agent/machine/arm/tcf/cpudefs-mdep.c
+@@ -89,10 +89,10 @@ static RegisterDefinition * lr_def = NULL;
+ static RegisterDefinition * cpsr_def = NULL;
+ 
+ #if !defined(PTRACE_GETHBPREGS)
+-#define PTRACE_GETHBPREGS (enum __ptrace_request)29
++#define PTRACE_GETHBPREGS 29
+ #endif
+ #if !defined(PTRACE_SETHBPREGS)
+-#define PTRACE_SETHBPREGS (enum __ptrace_request)30
++#define PTRACE_SETHBPREGS 30
+ #endif
+ 
+ #define ARM_DEBUG_ARCH_V6       1
+diff --git a/agent/machine/arm/tcf/regset-mdep.h b/agent/machine/arm/tcf/regset-mdep.h
+index e5516042..893ba64f 100644
+--- a/agent/machine/arm/tcf/regset-mdep.h
++++ b/agent/machine/arm/tcf/regset-mdep.h
+@@ -28,11 +28,11 @@
+ #endif
+ 
+ #ifndef PTRACE_GETREGSET
+-#define PTRACE_GETREGSET (enum __ptrace_request)0x4204
++#define PTRACE_GETREGSET 0x4204
+ #endif
+ 
+ #ifndef PTRACE_SETREGSET
+-#define PTRACE_SETREGSET (enum __ptrace_request)0x4205
++#define PTRACE_SETREGSET 0x4205
+ #endif
+ 
+ struct regset_gp {
+diff --git a/agent/system/GNU/Linux/tcf/context-linux.c b/agent/system/GNU/Linux/tcf/context-linux.c
+index d4eb5e6b..4c86021e 100644
+--- a/agent/system/GNU/Linux/tcf/context-linux.c
++++ b/agent/system/GNU/Linux/tcf/context-linux.c
+@@ -60,10 +60,10 @@
+ #endif
+ 
+ #if !defined(PTRACE_SETOPTIONS)
+-#define PTRACE_SETOPTIONS       (enum __ptrace_request)0x4200
+-#define PTRACE_GETEVENTMSG      (enum __ptrace_request)0x4201
+-#define PTRACE_GETSIGINFO       (enum __ptrace_request)0x4202
+-#define PTRACE_SETSIGINFO       (enum __ptrace_request)0x4203
++#define PTRACE_SETOPTIONS       0x4200
++#define PTRACE_GETEVENTMSG      0x4201
++#define PTRACE_GETSIGINFO       0x4202
++#define PTRACE_SETSIGINFO       0x4203
+ 
+ #define PTRACE_O_TRACESYSGOOD   0x00000001
+ #define PTRACE_O_TRACEFORK      0x00000002
+@@ -85,8 +85,8 @@
+ 
+ #if defined(__arm__) || defined(__aarch64__)
+ #if !defined(PTRACE_GETVFPREGS)
+-#define PTRACE_GETVFPREGS       (enum __ptrace_request)27
+-#define PTRACE_SETVFPREGS       (enum __ptrace_request)28
++#define PTRACE_GETVFPREGS       27
++#define PTRACE_SETVFPREGS       28
+ #endif
+ #endif
+ 
+@@ -483,7 +483,7 @@ static const char * get_ptrace_cmd_name(int cmd) {
+ static int do_single_step(Context * ctx) {
+     uint32_t is_cont = 0;
+     ContextExtensionLinux * ext = EXT(ctx);
+-    enum __ptrace_request cmd = PTRACE_SINGLESTEP;
++    int cmd = PTRACE_SINGLESTEP;
+ 
+     assert(!ext->pending_step);
+ 
+@@ -540,9 +540,9 @@ int context_continue(Context * ctx) {
+     int signal = 0;
+     ContextExtensionLinux * ext = EXT(ctx);
+ #if USE_PTRACE_SYSCALL
+-    enum __ptrace_request cmd = PTRACE_SYSCALL;
++    int cmd = PTRACE_SYSCALL;
+ #else
+-    enum __ptrace_request cmd = PTRACE_CONT;
++    int cmd = PTRACE_CONT;
+ #endif
+ 
+     assert(is_dispatch_thread());
+-- 
+2.15.1
+
diff --git a/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
new file mode 100644
index 0000000000..8532307d90
--- /dev/null
+++ b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
@@ -0,0 +1,46 @@
+From 1323aa4459004b9817f0cfbf4b59c31480d527cf Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Fri, 1 Dec 2017 13:34:08 +0100
+Subject: [PATCH] linux: provide canonicalize_file_name for all c libs except
+ glibc
+
+musl was not covered so far, and this library does not define a
+macro for detection.
+unless glibc is detected, a canonicalize_file_name implementation
+will be provided.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ agent/tcf/framework/mdep.c | 2 +-
+ agent/tcf/framework/mdep.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/agent/tcf/framework/mdep.c b/agent/tcf/framework/mdep.c
+index 8aee811f..d38036be 100644
+--- a/agent/tcf/framework/mdep.c
++++ b/agent/tcf/framework/mdep.c
+@@ -1097,7 +1097,7 @@ char * canonicalize_file_name(const char * path) {
+     return strdup(res);
+ }
+ 
+-#elif defined(__UCLIBC__)
++#elif defined(__UCLIBC__) || !defined(__GLIBC_)
+ 
+ char * canonicalize_file_name(const char * path) {
+     return realpath(path, NULL);
+diff --git a/agent/tcf/framework/mdep.h b/agent/tcf/framework/mdep.h
+index f90f03f2..3e331383 100644
+--- a/agent/tcf/framework/mdep.h
++++ b/agent/tcf/framework/mdep.h
+@@ -292,7 +292,7 @@ extern int loc_clock_gettime(int, struct timespec *);
+ 
+ #define O_BINARY 0
+ 
+-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)
++#if (defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)) | !defined (__GLIBC__)
+ #  define O_LARGEFILE 0
+ extern char ** environ;
+ extern char * canonicalize_file_name(const char * path);
+-- 
+2.15.1
+
diff --git a/package/tcfagent/Config.in b/package/tcfagent/Config.in
new file mode 100644
index 0000000000..765d1add97
--- /dev/null
+++ b/package/tcfagent/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_TCFAGENT
+	bool "tcfagent"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Target Communication Framework Agent is an example application
+	  using the Target Communication Framework Library.
+
+	  Target Communication Framework is universal, extensible, simple,
+	  lightweight, vendor agnostic framework for tools and targets to
+	  communicate for purpose of debugging, profiling, code patching
+	  and other device software development needs.
+
+	  tcf-agent is a daemon, which provides TCF services that can be
+	  used by local and remote clients.
+
+config BR2_PACKAGE_TCFAGENT_ARCH
+	string
+	default "arm"        if BR2_arm || BR2_armeb
+	default "a64"        if BR2_aarch64 || BR2_aarch64_be
+	default "i686"       if BR2_i386 && BR2_ARCH="i686"
+	default "i386"       if BR2_i386
+	default "x86_64"     if BR2_x86_64
+	default "powerpc"    if BR2_powerpc || BR2_powerpcle
+	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
+	default "microblaze" if BR2_microblaze || BR2_microblazeel
+
+config BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_TCFAGENT_ARCH != ""
+
+comment "tcfagent needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
diff --git a/package/tcfagent/S55tcfagent b/package/tcfagent/S55tcfagent
new file mode 100755
index 0000000000..4418a543a5
--- /dev/null
+++ b/package/tcfagent/S55tcfagent
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+DAEMON_PATH=/usr/sbin/tcf-agent
+DAEMON_NAME=tcf-agent
+DAEMON_ARGS="-L- -l0"
+
+PIDFILE=/var/run/$DAEMON_NAME.pid
+[ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME
+
+start() {
+	printf "Starting $DAEMON_NAME: "
+	start-stop-daemon -S -o -q -p $PIDFILE -m -b \
+		-x $DAEMON_PATH -- $DAEMON_ARGS
+
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping $DAEMON_NAME: "
+	start-stop-daemon -K -o -q -p $PIDFILE \
+		-x $DAEMON_PATH
+
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+	start)
+	start
+	;;
+	stop)
+	stop
+	;;
+	restart|reload)
+	stop
+	start
+	;;
+	*)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/tcfagent/tcfagent.hash b/package/tcfagent/tcfagent.hash
new file mode 100644
index 0000000000..d46d5206a3
--- /dev/null
+++ b/package/tcfagent/tcfagent.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  94e9277a52929791417d59b515235bf28ca29ffb05c9e89ad331ebc3256fb5df  org.eclipse.tcf.agent-1.6.0.tar.gz
+
+# Hash for license files:
+sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcfagent/tcfagent.mk b/package/tcfagent/tcfagent.mk
new file mode 100644
index 0000000000..1253bb64f5
--- /dev/null
+++ b/package/tcfagent/tcfagent.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# TCFAGENT
+#
+################################################################################
+
+TCFAGENT_VERSION = 1.6.0
+# the tar.xz link was broken the time this file got authored
+TCFAGENT_SOURCE = org.eclipse.tcf.agent-$(TCFAGENT_VERSION).tar.gz
+TCFAGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
+# see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration
+TCFAGENT_LICENSE = BSD-3-Clause
+TCFAGENT_LICENSE_FILES = agent/edl-v10.html
+
+TCFAGENT_DEPENDENCIES = util-linux
+TCFAGENT_SUBDIR = agent
+
+# there is not much purpose for the shared lib,
+# if wont be used (unmodifed) outside the tcf-agent application
+TCFAGENT_CONF_OPTS = -DBUILD_SHARED_LIBS=Off
+
+TCFAGENT_ARCH = $(call qstrip,$(BR2_PACKAGE_TCFAGENT_ARCH))
+
+TCFAGENT_CONF_OPTS += -DTCF_MACHINE=$(TCFAGENT_ARCH)
+
+define TCFAGENT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/tcfagent/tcfagent.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tcfagent.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/tcfagent.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tcfagent.service
+endef
+
+define TCFAGENT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/tcfagent/S55tcfagent \
+		$(TARGET_DIR)/etc/init.d/S55tcfagent
+endef
+
+$(eval $(cmake-package))
diff --git a/package/tcfagent/tcfagent.service b/package/tcfagent/tcfagent.service
new file mode 100644
index 0000000000..8d2023b13d
--- /dev/null
+++ b/package/tcfagent/tcfagent.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Target Communication Framework Agent
+After=network.target
+
+[Service]
+ExecStart=/usr/sbin/tcf-agent -L- -l0
+
+[Install]
+WantedBy=multi-user.target
-- 
2.15.1
