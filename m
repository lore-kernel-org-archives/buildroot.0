From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  7 Nov 2020 01:28:34 +0100
Subject: [Buildroot] [PATCH v4 2/4] package/bcc: new package
In-Reply-To: <20201107002836.3101760-1-romain.naour@gmail.com>
References: <20201107002836.3101760-1-romain.naour@gmail.com>
Message-ID: <20201107002836.3101760-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

bcc is a front-end tool for eBPF :
https://github.com/iovisor/bcc/blob/master/README.md.
eBPF is the most powerful Linux tracer, and bcc
allows to write eBPF scripts in C and PYTHON3.

bcc can help to troubleshoot issues quickly on
embedded systems (as long as Linux kernel
version >= 4.1).

bcc can also make it easy to create observabilty tools,
SDN configuration, ddos mitigation, intrusion detection
and secure containers. More information is available at:
https://ebpf.io/

BCC can be tested on the target :
$ mount -t debugfs none /sys/kernel/debug
$ cd /usr/share/bcc/tools
$ ./execsnoop

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Qais Yousef <qais.yousef@arm.com>
---
v4
- Bump to version 0.17.0.
- Remove kernel dependency (Qais)
- Remove optional kernel option handling (Quais)
- Update ebpf url (Quais)
- Fix tools path in the commit log (Quais)
- Add full tar dependency (used to extract the kernel sources from IKHEADERS module) (Quais)
- Make luajit optional dependeny (Quais)
- Remove python module install hook (Quais)
- Keep BCC_LINUX_CONFIG_FIXUPS but only for kernel built by Buildroot.

V3
- Bump to version 0.16.0.
- Add required python dependency.
- Remove unnecessary and duplicated
  kernel flags (#Testing section) in bcc.mk.

V2
- Add eBPF's required Kernel flags.
- Fix submodule source fetch problem.
- Add toolchain dependency.
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../bcc/0001-fix-aarch64-cross-compile.patch  | 65 +++++++++++++++++++
 package/bcc/Config.in                         | 42 ++++++++++++
 package/bcc/bcc.hash                          |  3 +
 package/bcc/bcc.mk                            | 46 +++++++++++++
 6 files changed, 158 insertions(+)
 create mode 100644 package/bcc/0001-fix-aarch64-cross-compile.patch
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7643722f3c..2b06c18fcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1388,6 +1388,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/bcc/
 F:	package/python-aiofiles/
 F:	package/python-crayons/
 F:	package/python-cycler/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..27d201cfd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ endmenu
 
 menu "Debugging, profiling and benchmark"
 	source "package/babeltrace2/Config.in"
+	source "package/bcc/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
diff --git a/package/bcc/0001-fix-aarch64-cross-compile.patch b/package/bcc/0001-fix-aarch64-cross-compile.patch
new file mode 100644
index 0000000000..6b4279754c
--- /dev/null
+++ b/package/bcc/0001-fix-aarch64-cross-compile.patch
@@ -0,0 +1,65 @@
+From 5a5b0f04484e00c88e7be902101367d6d591fb96 Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 2 May 2019 11:06:23 +0200
+Subject: [PATCH] cmake/luajit: Provide the target architecture to luaJIT while
+ cross-compiling
+
+Unlike CMAKE_SYSTEM_PROCESSOR which identifies aarch64
+as a valid architecture, luajit does not recognize it.
+luajit defines aarch64 as arm64.
+
+LuaJIT doesn't use usual arch naming, so we have to convert
+between CMake and Luajit for each architectures while
+cross-compiling.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+v2: Do the same for other architecture supported by LuaJIT.
+https://github.com/iovisor/bcc/pull/2480
+---
+ src/lua/CMakeLists.txt | 29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
+index 7541d48df..226e1b1d2 100644
+--- a/src/lua/CMakeLists.txt
++++ b/src/lua/CMakeLists.txt
+@@ -13,9 +13,36 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
+ 		DEPENDS ${SRC_LUA} ${CMAKE_CURRENT_SOURCE_DIR}/squishy
+ 	)
+ 
++	# LuaJIT doesn't use usual arch naming, so we have to convert
++	# between CMake and Luajit while cross-compiling.
++	if (CMAKE_CROSSCOMPILING)
++		SET (LUAJIT_TARGET_ARCH "-a")
++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L30
++		# https://github.com/LuaJIT/LuaJIT/blob/f0e865dd4861520258299d0f2a56491bd9d602e1/src/jit/bcsave.lua#L65
++		if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64_be")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm64be")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "arm")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86)$")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x86")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mips")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "mipsel")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "mipsel")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "ppc")
++		elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
++			SET (LUAJIT_TARGET_ARCH ${LUAJIT_TARGET_ARCH} "x64")
++		else()
++			MESSAGE(FATAL_ERROR "${CMAKE_SYSTEM_PROCESSOR} is not supported by LuaJIT")
++		endif()
++	endif()
++
+ 	ADD_CUSTOM_COMMAND(
+ 		OUTPUT bcc.o
+-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
++		COMMAND ${LUAJIT} -bg bcc.lua ${LUAJIT_TARGET_ARCH} bcc.o
+ 		DEPENDS bcc.lua
+ 	)
+ 
diff --git a/package/bcc/Config.in b/package/bcc/Config.in
new file mode 100644
index 0000000000..b75984a36e
--- /dev/null
+++ b/package/bcc/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_BCC
+	bool "bcc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
+	depends on BR2_INSTALL_LIBSTDCPP # clang
+	select BR2_PACKAGE_AUDIT # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # to select tar package
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_FLEX # needs FlexLexer.h
+	select BR2_PACKAGE_IPERF3 # runtime
+	select BR2_PACKAGE_LLVM_BPF
+	select BR2_PACKAGE_NETPERF # runtime
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_TAR # Decompress kernel headers required by BCC
+	help
+	  BPF Compiler Collection (BCC)
+
+	  BCC is a toolkit for creating efficient kernel tracing and
+	  manipulation programs, and includes several useful tools and
+	  examples. It makes use of extended BPF (Berkeley Packet
+	  Filters), formally known as eBPF, a new feature that was
+	  first added to Linux 3.15. Much of what BCC uses requires
+	  Linux 4.1 and above.
+
+	  Note: Before using bcc, you need either need to :
+	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
+	  to target folder /lib/module/<kernel_ver>/build.
+	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
+	  and use generated headers under /sys/kernel/kheaders.tar.xz
+	  to populate /lib/module/<kernel_ver>/build.
+
+	  That's because the clang frontend build eBPF code at runtime.
+
+	  https://github.com/iovisor/bcc
+	  http://www.ebpf.io
+
+comment "bcc needs a glibc toolchain, C++, gcc >= 4.8, host gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
new file mode 100644
index 0000000000..a9ca0a36cd
--- /dev/null
+++ b/package/bcc/bcc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  7a3ef28a493dcd7ee0797ebca8f13b30ffca08efc93ff73ff8fa9ba0234d7947  bcc-v0.17.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
new file mode 100644
index 0000000000..d448563a1e
--- /dev/null
+++ b/package/bcc/bcc.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# bcc
+#
+################################################################################
+
+BCC_VERSION = v0.17.0
+BCC_SITE = https://github.com/iovisor/bcc.git
+BCC_SITE_METHOD = git
+BCC_GIT_SUBMODULES = YES
+BCC_LICENSE = Apache-2.0
+BCC_LICENSE_FILES = LICENSE.txt
+# libbcc.so and libbcc_bpf.so
+BCC_INSTALL_STAGING = YES
+BCC_DEPENDENCIES = host-bison host-flex clang elfutils flex llvm python3 tar
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+BCC_DEPENDENCIES += luajit
+endif
+
+# ENABLE_LLVM_SHARED=ON to use llvm.so.
+# Force REVISION otherwise bcc will use git describe to generate a version number.
+BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
+	-DREVISION=$(BCC_VERSION) \
+	-DENABLE_CLANG_JIT=ON \
+	-DENABLE_MAN=OFF
+
+define BCC_LINUX_CONFIG_FIXUPS
+	# Enable kernel support for eBPF
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
+	# [for Linux kernel versions 4.1 through 4.6]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
+	# [for Linux kernel versions 4.7 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
+	# [for Linux kernel versions 5.2 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
+	# bcc needs debugfs at runtime
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
+endef
+
+$(eval $(cmake-package))
-- 
2.25.4
