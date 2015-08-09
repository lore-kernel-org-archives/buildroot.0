From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:21:39 +0200
Subject: [Buildroot] [git commit] package/cdrkit: fix musl build
Message-ID: <20150809092147.9EDB88198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e86fc46a99ab8def024e5e1c22c01c4acf67d992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Define __THROW if not already defined by the C library.

Fixes:
http://autobuild.buildroot.net/results/d27/d2781e70b04a207e2e9397d888032294c7285034/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ne-__THROW-to-avoid-build-issue-with-musl.patch |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch b/package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch
new file mode 100644
index 0000000..2e0f6d5
--- /dev/null
+++ b/package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch
@@ -0,0 +1,47 @@
+From 9454ef47db30caa4359766c8730d9d92f65c64f7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 8 Aug 2015 22:58:57 +0200
+Subject: [PATCH] define __THROW to avoid build issue with musl
+
+Fixes:
+http://autobuild.buildroot.net/results/d27/d2781e70b04a207e2e9397d888032294c7285034/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ genisoimage/sha256.h | 4 ++++
+ genisoimage/sha512.h | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/genisoimage/sha256.h b/genisoimage/sha256.h
+index e7f4cb9..bcae7ef 100644
+--- a/genisoimage/sha256.h
++++ b/genisoimage/sha256.h
+@@ -29,6 +29,10 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ 
++/* define __THROW to avoid build issue when it's not available from the libc */
++#ifndef __THROW
++# define __THROW
++#endif
+ 
+ /* Structure to save state of computation between the single steps.  */
+ struct sha256_ctx
+diff --git a/genisoimage/sha512.h b/genisoimage/sha512.h
+index 7298355..8cee8b0 100644
+--- a/genisoimage/sha512.h
++++ b/genisoimage/sha512.h
+@@ -29,6 +29,10 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ 
++/* define __THROW to avoid build issue when it's not available from the libc */
++#ifndef __THROW
++# define __THROW
++#endif
+ 
+ /* Structure to save state of computation between the single steps.  */
+ struct sha512_ctx
+-- 
+2.4.3
+
