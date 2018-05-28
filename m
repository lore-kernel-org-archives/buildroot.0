From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:06:54 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/xen: fix qemu-xen
 memfd build failure
Message-ID: <20180528142834.2CC50805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4ca0eb92a6cc41aaa0b09aed137018992ba5076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fix the QEMU memfd compile error:
tools/qemu-xen/util/memfd.c:40:12: error: static declaration of 'memfd_create' follows non-static declaration
 static int memfd_create(const char *name, unsigned int flags)
            ^~~~~~~~~~~~

that has been introduced since the Glibc 2.27 upgrade.

This just involves porting the upstream QEMU patch to the Xen QEMU tree.

This fixes:
http://autobuild.buildroot.net/results/ec7cda00e07b0c98a9a366244b67611e042e0d4b/

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d1060d2610cc07f9f2cac61f9ec2276afc102d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/0003-memfd-fix-configure-test.patch | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/xen/0003-memfd-fix-configure-test.patch b/package/xen/0003-memfd-fix-configure-test.patch
new file mode 100644
index 0000000000..95cb49bcf7
--- /dev/null
+++ b/package/xen/0003-memfd-fix-configure-test.patch
@@ -0,0 +1,62 @@
+From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 28 Nov 2017 11:51:27 +0100
+Subject: [PATCH] memfd: fix configure test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent glibc added memfd_create in sys/mman.h.  This conflicts with
+the definition in util/memfd.c:
+
+    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error: static declaration of memfd_create follows non-static declaration
+
+Fix the configure test, and remove the sys/memfd.h inclusion since the
+file actually does not exist---it is a typo in the memfd_create(2) man
+page.
+
+Cc: Marc-Andr?? Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[ Changes by AF:
+ - Port the patch to the qemu-xen tree
+]
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+---
+Upstream status: commit 75e5b70e6b5
+
+ configure    | 2 +-
+ util/memfd.c | 4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 9c8aa5a98bd4..99ccc1725ace 100755
+--- a/tools/qemu-xen/configure
++++ b/tools/qemu-xen/configure
+@@ -3923,7 +3923,7 @@ fi
+ # check if memfd is supported
+ memfd=no
+ cat > $TMPC << EOF
+-#include <sys/memfd.h>
++#include <sys/mman.h>
+ 
+ int main(void)
+ {
+diff --git a/util/memfd.c b/util/memfd.c
+index 4571d1aba866..412e94a405fc 100644
+--- a/tools/qemu-xen/util/memfd.c
++++ b/tools/qemu-xen/util/memfd.c
+@@ -31,9 +31,7 @@
+ 
+ #include "qemu/memfd.h"
+ 
+-#ifdef CONFIG_MEMFD
+-#include <sys/memfd.h>
+-#elif defined CONFIG_LINUX
++#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
+ #include <sys/syscall.h>
+ #include <asm/unistd.h>
+ 
+-- 
+2.16.2
+
