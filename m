From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:29:25 +0100
Subject: [Buildroot] [git commit] package/fakeroot: remove
Message-ID: <20161103223211.484C47FD45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=325cff36f74b07545389b81cee0a2acef55b487c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We've now entirely switched to using pseudo istead of fakeroot, so it is
time to remove the fakeroot package now.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fakeroot/0001-hide-dlsym-error.patch | 34 ----------------------------
 package/fakeroot/fakeroot.hash               |  4 ----
 package/fakeroot/fakeroot.mk                 | 20 ----------------
 3 files changed, 58 deletions(-)

diff --git a/package/fakeroot/0001-hide-dlsym-error.patch b/package/fakeroot/0001-hide-dlsym-error.patch
deleted file mode 100644
index 2c61fab..0000000
--- a/package/fakeroot/0001-hide-dlsym-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Description: Hide error from dlsym()
- dlsym(), starting in glibc 2.24 actually reports errors. In our case,
- we try to get ACL functions which are not in the glibc. This causes
- failures in test suites, so hide those messages for non-debugging
- purposes for now. It also makes the build logs annoying to read.
-Author: Julian Andres Klode <juliank@ubuntu.com>
-Origin: vendor
-Bug-Debian: https://bugs.debian.org/830912
-Forwarded: no
-Last-Update: 2016-08-12
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-
---- a/libfakeroot.c
-+++ b/libfakeroot.c
-@@ -256,10 +256,16 @@ void load_library_symbols(void){
-  /* clear dlerror() just in case dlsym() legitimately returns NULL */
-     msg = dlerror();
-     *(next_wrap[i].doit)=dlsym(get_libc(), next_wrap[i].name);
-+
-     if ( (msg = dlerror()) != NULL){
--      fprintf (stderr, "dlsym(%s): %s\n", next_wrap[i].name, msg);
--/*    abort ();*/
-+#ifdef LIBFAKEROOT_DEBUGGING
-+      if (fakeroot_debug) {
-+        fprintf (stderr, "dlsym(%s): %s\n", next_wrap[i].name, msg);
-+/*      abort ();*/
-+      }
-+#endif
-     }
-+
-   }
- }
-
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
deleted file mode 100644
index f0d436e..0000000
--- a/package/fakeroot/fakeroot.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://snapshot.debian.org/package/fakeroot/1.20.2-1/
-sha1	367040df07043edb630942b21939e493f3fad888	fakeroot_1.20.2.orig.tar.bz2
-# Calculated based on the hash above
-sha256	7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c	fakeroot_1.20.2.orig.tar.bz2
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
deleted file mode 100644
index 168cd13..0000000
--- a/package/fakeroot/fakeroot.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# fakeroot
-#
-################################################################################
-
-FAKEROOT_VERSION = 1.20.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
-# Force capabilities detection off
-# For now these are process capabilities (faked) rather than file
-# so they're of no real use
-HOST_FAKEROOT_CONF_ENV = \
-	ac_cv_header_sys_capability_h=no \
-	ac_cv_func_capset=no
-
-FAKEROOT_LICENSE = GPLv3+
-FAKEROOT_LICENSE_FILES = COPYING
-
-$(eval $(host-autotools-package))
