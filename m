From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 20:47:14 +0100
Subject: [Buildroot] [git commit] package/openvmtools: fix musl build with
 libfuse
Message-ID: <20200308193655.638D27FED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05e47e84f5f533e77b386200dc8ebc4d63722f16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4eba7c4585d318efdb9b965d58d879426588aa14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ls-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/openvmtools/0011-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch b/package/openvmtools/0011-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch
new file mode 100644
index 0000000000..e2984a38b7
--- /dev/null
+++ b/package/openvmtools/0011-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch
@@ -0,0 +1,41 @@
+From 0a5032669951ffd6735c294a6f309b0ec6667ea5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Mar 2020 18:49:00 +0100
+Subject: [PATCH] open-vm-tools/vmhgfs-fuse/fsutils.h: fix build on musl
+
+loff_t is not defined on musl so define it to avoid the following build
+failure:
+
+In file included from module.h:39,
+                 from bdhandler.c:31:
+fsutil.h:76:11: error: unknown type name 'loff_t'; did you mean 'off_t'?
+           loff_t offset);
+           ^~~~~~
+           off_t
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4eba7c4585d318efdb9b965d58d879426588aa14
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet (upstream is not reactive on third patch]
+---
+ vmhgfs-fuse/fsutil.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/vmhgfs-fuse/fsutil.h b/vmhgfs-fuse/fsutil.h
+index 34b6d489..a94f9fbb 100644
+--- a/vmhgfs-fuse/fsutil.h
++++ b/vmhgfs-fuse/fsutil.h
+@@ -32,7 +32,8 @@
+ #include "hgfsProto.h"
+ #include <fuse.h>
+ 
+-#if defined(__FreeBSD__) || defined(__SOLARIS__) || defined(__APPLE__)
++#if defined(__FreeBSD__) || defined(__SOLARIS__) || defined(__APPLE__) || \
++	!(defined(__GLIBC__) || defined(__UCLIBC__))
+ typedef long long loff_t;
+ #endif
+ 
+-- 
+2.25.0
+
