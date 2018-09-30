From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 22:43:54 +0200
Subject: [Buildroot] [PATCH] xen: security bump to version 4.10.2
Message-ID: <20180930204354.5926-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0003-memfd-fix-configure-test.patch applied upstream.

The 4.10.2 version brings a large number of fixes:

https://xenproject.org/downloads/xen-archives/xen-project-410-series/xen-4102.html

Including a number of security fixes:

XSA-260: x86: mishandling of debug exceptions (CVE-2018-8897)
XSA-261: x86 vHPET interrupt injection errors (CVE-2018-10982)
XSA-262: qemu may drive Xen into unbounded loop (CVE-2018-10981)
XSA-263: Speculative Store Bypass (CVE-2018-3639)
XSA-264: preemption checks bypassed in x86 PV MM handling (CVE-2018-12891)
XSA-265: x86: #DB exception safety check can be triggered by a guest
         (CVE-2018-12893)
XSA-266: libxl fails to honour readonly flag on HVM emulated SCSI disks
         (CVE-2018-12892)
XSA-267: Speculative register leakage from lazy FPU context switching
         (CVE-2018-3665)
XSA-268: Use of v2 grant tables may cause crash on ARM (CVE-2018-15469)
XSA-269: x86: Incorrect MSR_DEBUGCTL handling lets guests enable BTS
         (CVE-2018-15468)
XSA-272: oxenstored does not apply quota-maxentity (CVE-2018-15470)
XSA-273: L1 Terminal Fault speculative side channel (CVE-2018-3620,
         CVE-2018-3646)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/0003-memfd-fix-configure-test.patch | 62 -------------------------
 package/xen/xen.hash                            |  2 +-
 package/xen/xen.mk                              |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/xen/0003-memfd-fix-configure-test.patch

diff --git a/package/xen/0003-memfd-fix-configure-test.patch b/package/xen/0003-memfd-fix-configure-test.patch
deleted file mode 100644
index 95cb49bcf7..0000000000
--- a/package/xen/0003-memfd-fix-configure-test.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Tue, 28 Nov 2017 11:51:27 +0100
-Subject: [PATCH] memfd: fix configure test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Recent glibc added memfd_create in sys/mman.h.  This conflicts with
-the definition in util/memfd.c:
-
-    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error: static declaration of memfd_create follows non-static declaration
-
-Fix the configure test, and remove the sys/memfd.h inclusion since the
-file actually does not exist---it is a typo in the memfd_create(2) man
-page.
-
-Cc: Marc-Andr? Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[ Changes by AF:
- - Port the patch to the qemu-xen tree
-]
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
----
-Upstream status: commit 75e5b70e6b5
-
- configure    | 2 +-
- util/memfd.c | 4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 9c8aa5a98bd4..99ccc1725ace 100755
---- a/tools/qemu-xen/configure
-+++ b/tools/qemu-xen/configure
-@@ -3923,7 +3923,7 @@ fi
- # check if memfd is supported
- memfd=no
- cat > $TMPC << EOF
--#include <sys/memfd.h>
-+#include <sys/mman.h>
- 
- int main(void)
- {
-diff --git a/util/memfd.c b/util/memfd.c
-index 4571d1aba866..412e94a405fc 100644
---- a/tools/qemu-xen/util/memfd.c
-+++ b/tools/qemu-xen/util/memfd.c
-@@ -31,9 +31,7 @@
- 
- #include "qemu/memfd.h"
- 
--#ifdef CONFIG_MEMFD
--#include <sys/memfd.h>
--#elif defined CONFIG_LINUX
-+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
- #include <sys/syscall.h>
- #include <asm/unistd.h>
- 
--- 
-2.16.2
-
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 5daebd4d65..1b3fc12f94 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 570d654f357d4085accdf752989c1cbc33e2075feac8fcc505d68bdb81b1a0cf xen-4.10.1.tar.gz
+sha256 d5a944a34e47e9d52b2837f616821eb4a9514c8fd0955dcc723111dba499acd4 xen-4.10.2.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index a1685d371d..fb34d64c3f 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.10.1
+XEN_VERSION = 4.10.2
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-- 
2.11.0
