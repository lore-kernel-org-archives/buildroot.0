From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:23:20 +0200
Subject: [Buildroot] [git commit] package/stella: drop unneeded patches
Message-ID: <20200421060905.5475F8F689@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa3ec046b6626bac8cfdc29e412fb6058c2f95b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are not needed since bump to version 6.1.1 thanks to
https://github.com/stella-emu/stella/commit/72932aa09e022ef38a9b58721d89a02a66c29aa4
https://github.com/stella-emu/stella/commit/74450028fcf28f521951631570093494f17c4d95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Add-cross-compilation-support.patch       | 29 ------------
 package/stella/0002-undef-PAGE_SIZE.patch          | 53 ----------------------
 2 files changed, 82 deletions(-)

diff --git a/package/stella/0001-Add-cross-compilation-support.patch b/package/stella/0001-Add-cross-compilation-support.patch
deleted file mode 100644
index 1aefd86cf4..0000000000
--- a/package/stella/0001-Add-cross-compilation-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ef1cffc526d3cf9562d50efbf8addc2aa4c06b52 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Sun, 30 Jul 2017 18:23:23 -0300
-Subject: [PATCH 1/2] Add cross-compilation support
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- configure | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index c2f304729651..b05321aac3da 100755
---- a/configure
-+++ b/configure
-@@ -499,8 +499,9 @@ if test -n "$_host"; then
- 			_host_os=win32
- 			;;
- 		*)
--			echo "Cross-compiling to unknown target, please add your target to configure."
--			exit 1
-+			echo "Cross-compiling to $_host target"
-+			DEFINES="$DEFINES -DUNIX"
-+			_host_os=unix
- 			;;
- 	esac
- 
--- 
-1.9.1
-
diff --git a/package/stella/0002-undef-PAGE_SIZE.patch b/package/stella/0002-undef-PAGE_SIZE.patch
deleted file mode 100644
index f5c60fa3b3..0000000000
--- a/package/stella/0002-undef-PAGE_SIZE.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d14065257b24a9e4a722d1fa1125f26f6599006d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Mar 2019 20:47:27 +0100
-Subject: [PATCH] undef PAGE_SIZE
-
-PAGE_SIZE is sometimes already defined by the toolchain so undef it:
-
-/home/naourr/work/instance-3/output/host/bin/x86_64-linux-g++ -MMD -MF "src/debugger/.deps/CpuDebug.d" -MQ "src/debugger/CpuDebug.o" -MP -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -x c++ -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=c++14 -fomit-frame-pointer -D_GLIBCXX_USE_CXX11_ABI=1 -DUNIX -DBSPF_UNIX -DWINDOWED_SUPPORT -DSOUND_SUPPORT -DDEBUGGER_SUPPORT -DJOYSTICK_SUPPORT -DCHEATCODE_SUPPORT  -Isrc/emucore -Isrc/common -Isrc/common/tv_filters -Isrc/gui -Isrc/emucore/tia -Isrc/emucore/tia/frame-manager -I/home/naourr/work/instance-3/output/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/SDL2 -D_REENTRANT -Isrc/unix -Isrc/debugger -Isrc/debugger/gui -Isrc/yacc -Isrc/cheat -c src/debugger/CpuDebug.cxx -o src/debugger/CpuDebug.o
-In file included from /home/naourr/work/instance-3/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/limits.h:8:0,
-                 from /home/naourr/work/instance-3/output/host/opt/ext-toolchain/x86_64-buildroot-linux-musl/include/c++/7.4.0/climits:42,
-                 from src/common/bspf.hxx:28,
-                 from src/debugger/CartDebug.cxx:18:
-src/emucore/System.hxx:64:29: error: expected unqualified-id before numeric constant
-     static constexpr uInt16 PAGE_SIZE = (1 << PAGE_SHIFT);
-
-Fixes:
- - http://autobuild.buildroot.org/results/22a9b009749af2a0862750a1fb2b2dc7167cd589
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/emucore/MT24LC256.hxx | 2 ++
- src/emucore/System.hxx    | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/emucore/MT24LC256.hxx b/src/emucore/MT24LC256.hxx
-index fc5d6a49..bb7468b4 100644
---- a/src/emucore/MT24LC256.hxx
-+++ b/src/emucore/MT24LC256.hxx
-@@ -23,6 +23,8 @@ class System;
- #include "Control.hxx"
- #include "bspf.hxx"
- 
-+#undef PAGE_SIZE
-+
- /**
-   Emulates a Microchip Technology Inc. 24LC256, a 32KB Serial Electrically
-   Erasable PROM accessed using the I2C protocol.  Thanks to J. Payson
-diff --git a/src/emucore/System.hxx b/src/emucore/System.hxx
-index e31202df..85a54f28 100644
---- a/src/emucore/System.hxx
-+++ b/src/emucore/System.hxx
-@@ -30,6 +30,8 @@ class NullDevice;
- #include "Random.hxx"
- #include "Serializable.hxx"
- 
-+#undef PAGE_SIZE
-+
- /**
-   This class represents a system consisting of a 6502 microprocessor
-   and a set of devices.  The devices are mapped into an addressing
--- 
-2.20.1
-
