From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 17:53:35 +0200
Subject: [Buildroot] [git commit] uClibc: ldso/libdl: Also include dl-tls.h
	for for !SHARED.
Message-ID: <20141012155504.ADCDEB2898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0b4c45780e4ffe23101a407e7c4cde22e27815a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply an upstream patch:

  http://git.uclibc.org/uClibc/commit/ldso/libdl/libdl.c?id=b57e9640db53166c88cdac66b79a046e46b8d728

On MIPS, several relocations that were original only resolved by the
dynamic linker were reused as static relocations.  Consequently the
macros TLS_DTPREL_VALUE and TLS_TPREL_VALUE defined in
libpthread/nptl/sysdeps/mips/dl-tls.h need to be available even for
!SHARED.

Relevant: http://www.linux-mips.org/wiki/NPTL#History

Fixes:

  http://autobuild.buildroot.net/results/85e/85e66962da9a6b80e1d1b721031b6ef0da45e3d5/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ibdl-Also-include-dl-tls.h-for-for-SHARED.patch |   58 ++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.33.2/uclibc-0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch b/package/uclibc/0.9.33.2/uclibc-0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
new file mode 100644
index 0000000..30ac71a
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0062-ldso-libdl-Also-include-dl-tls.h-for-for-SHARED.patch
@@ -0,0 +1,58 @@
+uClibc: ldso/libdl: Also include dl-tls.h for for !SHARED.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From b57e9640db53166c88cdac66b79a046e46b8d728 Mon Sep 17 00:00:00 2001
+From: Gregory Fong <gregory.0xf0@gmail.com>
+Date: Mon, 3 Jun 2013 13:32:55 -0700
+Subject: [PATCH] ldso/libdl: Also include dl-tls.h for for !SHARED.
+
+On MIPS, several relocations that were original only resolved by the
+dynamic linker were reused as static relocations.  Consequently the
+macros TLS_DTPREL_VALUE and TLS_TPREL_VALUE defined in
+libpthread/nptl/sysdeps/mips/dl-tls.h need to be available even for
+!SHARED.
+
+Relevant: http://www.linux-mips.org/wiki/NPTL#History
+
+Original patch by Vincent Wen <wenvincent@gmail.com>:
+http://lists.uclibc.org/pipermail/uclibc/2013-April/047707.html
+
+When build statically linked applications for MIPS platform,
+sometimes the linker fails with following errors:
+undefined reference to TLS_DTPREL_VALUE
+undefined reference to TLS_TPREL_VALUE
+The include of dl-tls.h is only in code guarded by SHARED,
+Removing the SHARED compilation option to cover static link too.
+
+Signed-off-by: Vincent Wen <wenvincent90@gmail.com>
+
+Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ ldso/libdl/libdl.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/ldso/libdl/libdl.c b/ldso/libdl/libdl.c
+index 3a78696..ed4e735 100644
+--- a/ldso/libdl/libdl.c
++++ b/ldso/libdl/libdl.c
+@@ -42,6 +42,7 @@
+ 
+ #if defined(USE_TLS) && USE_TLS
+ #include <ldsodefs.h>
++#include <dl-tls.h>
+ extern void _dl_add_to_slotinfo(struct link_map  *l);
+ #endif
+ 
+@@ -51,7 +52,6 @@ __UCLIBC_MUTEX_STATIC(_dl_mutex, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP);
+ 
+ #ifdef SHARED
+ # if defined(USE_TLS) && USE_TLS
+-# include <dl-tls.h>
+ extern struct link_map *_dl_update_slotinfo(unsigned long int req_modid);
+ # endif
+ 
+-- 
+1.7.1
+
