From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Dec 2020 16:12:03 +0100
Subject: [Buildroot] [PATCHv6 5/5] package/bcc: add optional luajit
 dependency
In-Reply-To: <20201220151203.2206747-1-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
Message-ID: <20201220151203.2206747-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The luajit dependency was explicitely disabled when bcc has
been added to Buildroot.
Even if the python binding is probably more used, enable
luajit binding if luajit package is enabled in the defconfig.

Fix the luajit command line used to build bcc.o, otherwise
bcc.o is build for the host.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Qais Yousef <qais.yousef@arm.com>
---
 .../bcc/0003-fix-aarch64-cross-compile.patch  | 65 +++++++++++++++++++
 package/bcc/bcc.mk                            | 10 ++-
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 package/bcc/0003-fix-aarch64-cross-compile.patch

diff --git a/package/bcc/0003-fix-aarch64-cross-compile.patch b/package/bcc/0003-fix-aarch64-cross-compile.patch
new file mode 100644
index 0000000000..6b4279754c
--- /dev/null
+++ b/package/bcc/0003-fix-aarch64-cross-compile.patch
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
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index bafa9e2096..8b6ba63f90 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -19,8 +19,14 @@ BCC_DEPENDENCIES = host-bison host-flex clang elfutils flex llvm python3 tar
 BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
 	-DREVISION=$(BCC_VERSION) \
 	-DENABLE_CLANG_JIT=ON \
-	-DENABLE_MAN=OFF \
-	-DENABLE_LUAJIT=OFF
+	-DENABLE_MAN=OFF
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+BCC_DEPENDENCIES += luajit
+BCC_CONF_OPTS += -DENABLE_LUAJIT=ON
+else
+BCC_CONF_OPTS += -DENABLE_LUAJIT=OFF
+endif
 
 define BCC_LINUX_CONFIG_FIXUPS
 	# Enable kernel support for eBPF
-- 
2.25.4
