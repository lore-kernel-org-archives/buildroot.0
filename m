From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu, 19 Jul 2018 13:02:03 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <1531998123-28360-4-git-send-email-stefan.sorensen@spectralink.com>
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

This method and the spec file are from the Fedora build system.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Makefile.in     | 4 ++--
 toolchain/gcc-specs-pie | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/gcc-specs-pie

diff --git a/package/Makefile.in b/package/Makefile.in
index 14b3bbd..433701c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -158,8 +158,8 @@ ifeq ($(BR2_RELRO_PARTIAL),y)
 TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
-TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_HARDENED += -specs=$(TOPDIR)/toolchain/gcc-specs-pie $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_LDFLAGS += -specs=$(TOPDIR)/toolchain/gcc-specs-pie $(TARGET_CFLAGS_RELRO_FULL)
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
diff --git a/toolchain/gcc-specs-pie b/toolchain/gcc-specs-pie
new file mode 100644
index 0000000..dc03736
--- /dev/null
+++ b/toolchain/gcc-specs-pie
@@ -0,0 +1,5 @@
+*cc1_options:
++ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
+
+*self_spec:
++ %{!static:%{!shared:%{!r:-pie}}}
-- 
1.8.3.1
