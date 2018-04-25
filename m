From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 25 Apr 2018 08:45:18 +0200
Subject: [Buildroot] [PATCH 4/4] package/Makefile.in: Use gcc spec files for
 PIE build flags
In-Reply-To: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
Message-ID: <20180425064518.31797-4-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PIE build flags are only intended for building executables and can not be
used in relocateable links (-r), static builds and shared library build -
including the flags here causes build errors.

So instead of parsing the PIE flags directly on the command line to gcc,
include them in a gcc spec file where it is possible to only apply the flags
when other incompatible flags are not set.

This method and the spec files are from the Fedora build system.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Makefile.in         | 4 ++--
 toolchain/gcc-specs-pie-cc1 | 2 ++
 toolchain/gcc-specs-pie-ld  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/gcc-specs-pie-cc1
 create mode 100644 toolchain/gcc-specs-pie-ld

diff --git a/package/Makefile.in b/package/Makefile.in
index 4525b8e79f..141eb83946 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -154,8 +154,8 @@ endif
 ifeq ($(BR2_RELRO_PARTIAL),y)
 TARGET_LDFLAGS += -Wl,-z,relro
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE
-TARGET_LDFLAGS += -pie -Wl,-z,now -Wl,-z,relro
+TARGET_HARDENED += -specs=$(TOPDIR)/toolchain/gcc-specs-pie-cc1
+TARGET_LDFLAGS += -Wl,-z,relro -Wl,-z,now -specs=$(TOPDIR)/toolchain/gcc-specs-pie-ld
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
diff --git a/toolchain/gcc-specs-pie-cc1 b/toolchain/gcc-specs-pie-cc1
new file mode 100644
index 0000000000..fc54bcb510
--- /dev/null
+++ b/toolchain/gcc-specs-pie-cc1
@@ -0,0 +1,2 @@
+*cc1_options:
++ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
diff --git a/toolchain/gcc-specs-pie-ld b/toolchain/gcc-specs-pie-ld
new file mode 100644
index 0000000000..bd6b9071ff
--- /dev/null
+++ b/toolchain/gcc-specs-pie-ld
@@ -0,0 +1,2 @@
+*self_spec:
++ %{!static:%{!shared:%{!r:-pie}}}
-- 
2.14.3
