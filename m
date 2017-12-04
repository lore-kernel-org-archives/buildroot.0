From: Norbert Lange <nolange79@gmail.com>
Date: Mon,  4 Dec 2017 13:09:12 +0100
Subject: [Buildroot] [PATCH v3] tcfagent: new package
In-Reply-To: <20171204114306.28242-1-nolange79@gmail.com>
References: <20171204114306.28242-1-nolange79@gmail.com>
Message-ID: <20171204120912.9850-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Norbert Lange <norbert.lange@andritz.com>

Add tcfpackage which contains a service "tcf-agent"

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
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
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...gent-add-install-target-to-the-CMakeLists.patch | 48 ++++++++++++++++
 ...-remove-explicit-uses-of-__ptrace_request.patch | 66 ++++++++++++++++++++++
 ...de-canonicalize_file_name-for-all-c-libs-.patch | 46 +++++++++++++++
 package/tcfagent/Config.in                         | 25 ++++++++
 package/tcfagent/S55tcfagent                       | 40 +++++++++++++
 package/tcfagent/tcfagent.hash                     |  5 ++
 package/tcfagent/tcfagent.mk                       | 56 ++++++++++++++++++
 package/tcfagent/tcfagent.service                  |  9 +++
 10 files changed, 299 insertions(+)
 create mode 100644 package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
 create mode 100644 package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
 create mode 100644 package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
 create mode 100644 package/tcfagent/Config.in
 create mode 100755 package/tcfagent/S55tcfagent
 create mode 100644 package/tcfagent/tcfagent.hash
 create mode 100644 package/tcfagent/tcfagent.mk
 create mode 100644 package/tcfagent/tcfagent.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e52d7c904..756ba15427 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1237,6 +1237,9 @@ N:	No? Rubinstein <noe.rubinstein@gmail.com>
 F:	package/tpm-tools/
 F:	package/trousers/
 
+N:	Norbert Lange <nolange79@gmail.com>
+F:	package/tcfagent
+
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
 
diff --git a/package/Config.in b/package/Config.in
index 433224c3a4..6bd0268c64 100644
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
index 0000000000..954c0d5fe3
--- /dev/null
+++ b/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
@@ -0,0 +1,48 @@
+From 4c5fb079bc06ef04d09955eebe0d93d5ebfd4cdf Mon Sep 17 00:00:00 2001
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
+ agent/CMakeLists.txt | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
+index aef15b96..d3294486 100644
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
+2.15.0
+
diff --git a/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
new file mode 100644
index 0000000000..16b748926f
--- /dev/null
+++ b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
@@ -0,0 +1,66 @@
+From 6407e3961dba749c8e3a0ea4ae8991154520364f Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Fri, 1 Dec 2017 13:15:50 +0100
+Subject: [PATCH 1/2] linux: remove explicit uses of __ptrace_request
+
+This type is not to be used directly, and with musl it wont build
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ agent/system/GNU/Linux/tcf/context-linux.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/agent/system/GNU/Linux/tcf/context-linux.c b/agent/system/GNU/Linux/tcf/context-linux.c
+index 786461fe..5b0d258c 100644
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
+2.15.0
+
diff --git a/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
new file mode 100644
index 0000000000..86dc2f37a1
--- /dev/null
+++ b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
@@ -0,0 +1,46 @@
+From 58cc4092495acdc0b4be8e23c3964d47989a59dd Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Fri, 1 Dec 2017 13:34:08 +0100
+Subject: [PATCH 2/2] linux: provide canonicalize_file_name for all c libs
+ except glibc
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
+index cf5771e5..530a8017 100644
+--- a/agent/tcf/framework/mdep.c
++++ b/agent/tcf/framework/mdep.c
+@@ -1086,7 +1086,7 @@ char * canonicalize_file_name(const char * path) {
+     return strdup(res);
+ }
+ 
+-#elif defined(__UCLIBC__)
++#elif defined(__UCLIBC__) || !defined(__GLIBC_)
+ 
+ char * canonicalize_file_name(const char * path) {
+     return realpath(path, NULL);
+diff --git a/agent/tcf/framework/mdep.h b/agent/tcf/framework/mdep.h
+index fec94d78..560d75ba 100644
+--- a/agent/tcf/framework/mdep.h
++++ b/agent/tcf/framework/mdep.h
+@@ -288,7 +288,7 @@ extern int loc_clock_gettime(int, struct timespec *);
+ 
+ #define O_BINARY 0
+ 
+-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)
++#if (defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || defined(__sun__)) | !defined (__GLIBC__)
+ #  define O_LARGEFILE 0
+ extern char ** environ;
+ extern char * canonicalize_file_name(const char * path);
+-- 
+2.15.0
+
diff --git a/package/tcfagent/Config.in b/package/tcfagent/Config.in
new file mode 100644
index 0000000000..81affce6c1
--- /dev/null
+++ b/package/tcfagent/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_TCFAGENT
+	bool "tcfagent"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be \
+			|| BR2_i386 || BR2_x86_64 \
+			|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
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
+comment "tcfagent needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be \
+		|| BR2_i386 || BR2_x86_64 \
+		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
diff --git a/package/tcfagent/S55tcfagent b/package/tcfagent/S55tcfagent
new file mode 100755
index 0000000000..2243b5a4c7
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
+      printf "Starting $DAEMON_NAME: "
+      start-stop-daemon -S -o -q -p $PIDFILE -m -b \
+      -x $DAEMON_PATH -- $DAEMON_ARGS
+
+      [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+  printf "Stopping $DAEMON_NAME: "
+  start-stop-daemon -K -o -q -p $PIDFILE \
+        -x $DAEMON_PATH
+
+  [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+    start)
+  start
+  ;;
+    stop)
+  stop
+  ;;
+    restart|reload)
+  stop
+  start
+  ;;
+  *)
+  echo "Usage: $0 {start|stop|restart}"
+  exit 1
+esac
diff --git a/package/tcfagent/tcfagent.hash b/package/tcfagent/tcfagent.hash
new file mode 100644
index 0000000000..4652194570
--- /dev/null
+++ b/package/tcfagent/tcfagent.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  4b6c757e2bed92a0a791d0687425d462c974abe4c79f80e27e362fdaa59107f5  org.eclipse.tcf.agent-1.5_oxygen.tar.gz
+
+# Hash for license files:
+sha256  f82d01b74a513bd3504d08136026a5ac2a7e6ff62ebcde391fa74aa222d11ce0  agent/edl-v10.html
diff --git a/package/tcfagent/tcfagent.mk b/package/tcfagent/tcfagent.mk
new file mode 100644
index 0000000000..e1f69797eb
--- /dev/null
+++ b/package/tcfagent/tcfagent.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# TCFAGENT
+#
+################################################################################
+
+TCFAGENT_VERSION = 1.5_oxygen
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
+# supported arch strings: a64 arm i386 i686 powerpc ppc64 x86_64
+_TCFAGENT_BRARCH = $(patsubst "%",%,$(BR2_ARCH))
+ifneq ($(filter arm armeb,$(_TCFAGENT_BRARCH)),)
+ 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=arm
+else ifneq ($(filter aarch64 aarch64_be,$(_TCFAGENT_BRARCH)),)
+ 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=a64
+else ifneq ($(filter i386 i486 i586,$(_TCFAGENT_BRARCH)),)
+	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=i386
+else ifneq ($(filter i686 x86_64 powerpc,$(_TCFAGENT_BRARCH)),)
+	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=$(_TCFAGENT_BRARCH)
+else ifneq ($(filter powerpc64 powerpc64le,$(_TCFAGENT_BRARCH)),)
+	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=ppc64
+# only supported in trunk as of 1.5_oxygen
+# else ifneq ($(filter microblaze microblazeel,$(_TCFAGENT_BRARCH)),)
+# 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=microblaze
+else
+$(warning "Unsupported architecture $(_TCFAGENT_BRARCH)")
+endif
+
+_TCFAGENT_BRARCH =
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
2.15.0
