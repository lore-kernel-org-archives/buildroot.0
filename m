From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Jul 2018 09:31:10 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files for
 PIE build flags
In-Reply-To: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan S?rensen <stefan.sorensen@spectralink.com>

The PIE build flags are only intended for building executables and can not be
used in relocateable links (-r), static builds and shared library build -
including the flags here causes build errors.

So instead of parsing the PIE flags directly on the command line to gcc,
include them in a gcc spec file where it is possible to only apply the flags
when other incompatible flags are not set.

This method and the spec files are from the Fedora build system.

Originally submitted as
http://patchwork.ozlabs.org/patch/907093/

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Makefile.in         | 4 ++--
 toolchain/gcc-specs-pie-cc1 | 2 ++
 toolchain/gcc-specs-pie-ld  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/gcc-specs-pie-cc1
 create mode 100644 toolchain/gcc-specs-pie-ld

diff --git a/package/Makefile.in b/package/Makefile.in
index 14b3bbd243..00ddf48c10 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -158,8 +158,8 @@ ifeq ($(BR2_RELRO_PARTIAL),y)
 TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_HARDENED += $(TARGET_CFLAGS_RELRO_FULL) -specs=$(TOPDIR)/toolchain/gcc-specs-pie-cc1
+TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO_FULL) -specs=$(TOPDIR)/toolchain/gcc-specs-pie-ld
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
2.17.0
