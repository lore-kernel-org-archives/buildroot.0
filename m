From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Wed,  2 Jan 2019 15:56:29 -0500
Subject: [Buildroot] [PATCH v3 2/3] leveldb: generate pic for static
 libraries
In-Reply-To: <20190102205630.18725-1-gael.portay@collabora.com>
References: <20190102205630.18725-1-gael.portay@collabora.com>
Message-ID: <20190102205630.18725-3-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project's static libraries are not compiled with the -fPIC compiler
flag that prevents any libraries to link against those libraries.

This commit adds a patch that sets the -fPIC compiler flag to the list of
CFLAGS/CXXFLAGS.

The project now generates position independant code for all of its
outputs (i.e. not limited anymore to its shared libraries).

Fixes:

	/home/gportay/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-amd-linux-gnu/6.2.0/../../../../x86_64-amd-linux-gnu/bin/ld: /home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a(memenv.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
	/home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a: error adding symbols: Bad value
	collect2: error: ld returned 1 exit status

Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
---
 ...n-independant-code-for-static-librar.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/leveldb/0001-Generate-position-independant-code-for-static-librar.patch

diff --git a/package/leveldb/0001-Generate-position-independant-code-for-static-librar.patch b/package/leveldb/0001-Generate-position-independant-code-for-static-librar.patch
new file mode 100644
index 0000000000..dce06ec725
--- /dev/null
+++ b/package/leveldb/0001-Generate-position-independant-code-for-static-librar.patch
@@ -0,0 +1,52 @@
+From 6ed1b57ef6bcee0d497c181730710b2b0fafbfb3 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Fri, 31 Aug 2018 12:23:46 -0400
+Subject: [PATCH] Generate position independant code for static library
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Currently, only shared libraries are using the PIC flag.
+
+Generalize this flag for static libraries in order to let them linkable
+by dynamic libraries.
+
+Fixes:
+
+	/home/gportay/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-amd-linux-gnu/6.2.0/../../../../x86_64-amd-linux-gnu/bin/ld: /home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a(memenv.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
+	/home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a: error adding symbols: Bad value
+	collect2: error: ld returned 1 exit status
+
+Upstream-Status: Inappropriate [upstream has migrated to cmake]
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ build_detect_platform | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/build_detect_platform b/build_detect_platform
+index d2a20ce..4839444 100755
+--- a/build_detect_platform
++++ b/build_detect_platform
+@@ -55,8 +55,8 @@ fi
+ 
+ COMMON_FLAGS=
+ CROSS_COMPILE=
+-PLATFORM_CCFLAGS=
+-PLATFORM_CXXFLAGS=
++PLATFORM_CCFLAGS="-fPIC"
++PLATFORM_CXXFLAGS="-fPIC"
+ PLATFORM_LDFLAGS=
+ PLATFORM_LIBS=
+ PLATFORM_SHARED_EXT="so"
+@@ -197,7 +197,7 @@ else
+ EOF
+     if [ "$?" = 0 ]; then
+         COMMON_FLAGS="$COMMON_FLAGS -DLEVELDB_PLATFORM_POSIX -DLEVELDB_ATOMIC_PRESENT"
+-        PLATFORM_CXXFLAGS="-std=c++0x"
++        PLATFORM_CXXFLAGS="$PLATFORM_CXXFLAGS -std=c++0x"
+     else
+         COMMON_FLAGS="$COMMON_FLAGS -DLEVELDB_PLATFORM_POSIX"
+     fi
+-- 
+2.18.0
+
-- 
2.20.1
