From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 11:13:17 +0100
Subject: [Buildroot] [git commit] uclibc: add patch to fix <stdlib.h>
Message-ID: <20161221101530.86D1D80ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cafa98b797d92e466f7fbccd6268efcda75f5bb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to <stdlib.h>, to fix a bug introduced in
uClibc-ng 1.0.20, and which was causing build failures for at least one
package in Buildroot: freeswitch.

Fixes:

  http://autobuild.buildroot.net/results/12c246b058224f68494b84355a29dc4efb85df6d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-definition-of-__attribute_alloc_size.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/uclibc/0007-sys-cdefs.h-add-definition-of-__attribute_alloc_size.patch b/package/uclibc/0007-sys-cdefs.h-add-definition-of-__attribute_alloc_size.patch
new file mode 100644
index 0000000..c9421ef
--- /dev/null
+++ b/package/uclibc/0007-sys-cdefs.h-add-definition-of-__attribute_alloc_size.patch
@@ -0,0 +1,42 @@
+From dfcc950af1af003ee9e6fc985b5d6b3eb7d408af Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 19 Dec 2016 22:56:30 +0100
+Subject: [PATCH] sys/cdefs.h: add definition of __attribute_alloc_size__
+
+Commit cee0b058fa0b4501b289a2da365182d60314d746 ("add aligned_alloc
+required for latest gcc libstdc++") added the prototype of
+aligned_alloc() to <stdlib.h>. This prototype contains
+'__attribute_alloc_size__ ((2))', but this is not defined anywhere in
+uClibc-ng.
+
+This commit addresses that by adding the relevant definition in
+<sys/cdefs.h>, borrowed from glibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/sys/cdefs.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/include/sys/cdefs.h b/include/sys/cdefs.h
+index f725ce9..6cd3811 100644
+--- a/include/sys/cdefs.h
++++ b/include/sys/cdefs.h
+@@ -222,6 +222,15 @@
+ # define __attribute_malloc__ /* Ignore */
+ #endif
+ 
++/* Tell the compiler which arguments to an allocation function
++   indicate the size of the allocation.  */
++#if __GNUC_PREREQ (4, 3)
++# define __attribute_alloc_size__(params) \
++  __attribute__ ((__alloc_size__ params))
++#else
++# define __attribute_alloc_size__(params) /* Ignore.  */
++#endif
++
+ /* At some point during the gcc 2.96 development the `pure' attribute
+    for functions was introduced.  We don't want to use it unconditionally
+    (although this would be possible) since it generates warnings.  */
+-- 
+2.7.4
+
