From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Mar 2018 17:56:57 +0200
Subject: [Buildroot] [PATCH] qemu: fix build with glibc 2.27
Message-ID: <2ea89efb89501dbb6f311d3644efb8d6543f1ba7.1521561417.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc version 2.27 added a wrapper for the memfd_create system call. The
wrapper prototype collides with a static declaration of memfd_create.
Add upstream patch to correctly detect the glibc provided memfd_create
definition.

Fixes:
http://autobuild.buildroot.net/results/b82/b825c0cd397424b1fc7fa87c580e1757dc25c588/
http://autobuild.buildroot.net/results/9aa/9aa3853d23c0dc72bf3632b4d66ae39f597f5250/
http://autobuild.buildroot.net/results/b13/b13039ba602b9d500b939d259816a39ba24e1ba2/

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/qemu/0002-memfd-fix-configure-test.patch | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/qemu/0002-memfd-fix-configure-test.patch

diff --git a/package/qemu/0002-memfd-fix-configure-test.patch b/package/qemu/0002-memfd-fix-configure-test.patch
new file mode 100644
index 000000000000..3e06c0e93274
--- /dev/null
+++ b/package/qemu/0002-memfd-fix-configure-test.patch
@@ -0,0 +1,58 @@
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
+Cc: Marc-Andr? Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 75e5b70e6b5
+
+ configure    | 2 +-
+ util/memfd.c | 4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 9c8aa5a98bd4..99ccc1725ace 100755
+--- a/configure
++++ b/configure
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
+--- a/util/memfd.c
++++ b/util/memfd.c
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
-- 
2.16.2
