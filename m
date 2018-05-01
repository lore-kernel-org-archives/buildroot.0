From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  1 May 2018 10:35:01 -0500
Subject: [Buildroot] [PATCH v2] package/Makefile.in: Use gcc spec files for
 PIE build flags
Message-ID: <1525188901-25379-1-git-send-email-matthew.weber@rockwellcollins.com>
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

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

--
Changes
v1 -> v2
 - With drop of patch to remove cflags use of relro flags, needed
   to rework variable assignments for use of spec files (Matt W.)
---
 package/Makefile.in         | 4 ++--
 toolchain/gcc-specs-pie-cc1 | 2 ++
 toolchain/gcc-specs-pie-ld  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/gcc-specs-pie-cc1
 create mode 100644 toolchain/gcc-specs-pie-ld

diff --git a/package/Makefile.in b/package/Makefile.in
index 6d21e28..ee8953f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -161,8 +161,8 @@ ifeq ($(BR2_RELRO_PARTIAL),y)
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
index 0000000..fc54bcb
--- /dev/null
+++ b/toolchain/gcc-specs-pie-cc1
@@ -0,0 +1,2 @@
+*cc1_options:
++ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
diff --git a/toolchain/gcc-specs-pie-ld b/toolchain/gcc-specs-pie-ld
new file mode 100644
index 0000000..bd6b907
--- /dev/null
+++ b/toolchain/gcc-specs-pie-ld
@@ -0,0 +1,2 @@
+*self_spec:
++ %{!static:%{!shared:%{!r:-pie}}}
-- 
1.9.1
