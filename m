From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:27:35 +0100
Subject: [Buildroot] [git commit] collectd: fix musl builds (ipc module)
Message-ID: <20151126212823.016E78163C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0240baa4b02826b438f5a0f90c8dd1294493b089
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

src/ipc.c uses shm_info.used_ids which musl only provides when
_GNU_SOURCE is defined.

The issue has been fixed upstream, but the fix is not in their
latest 5.5.0 release. Adding their patch as a temporary fix
to be removed on the next version bump.

https://github.com/collectd/collectd/issues/1147
https://github.com/collectd/collectd/commit/3e3848349b753d78a0b1d19648fb394866856bda

Fixes
http://autobuild.buildroot.net/results/e981c08f01d2916246a17b1dc112e8b3e8c628e2/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/0002-ipc-enable-gnu-source.patch |   28 +++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/collectd/0002-ipc-enable-gnu-source.patch b/package/collectd/0002-ipc-enable-gnu-source.patch
new file mode 100644
index 0000000..459fdbd
--- /dev/null
+++ b/package/collectd/0002-ipc-enable-gnu-source.patch
@@ -0,0 +1,28 @@
+https://github.com/collectd/collectd/commit/3e3848349b753d78a0b1d19648fb394866856bda
+
+    ipc: enable _GNU_SOURCE to fix build with musl libc
+
+    This fixes compile the compile error:
+
+    > ipc.c:154:49: error: 'struct shm_info' has no member named 'used_ids'
+    >    ipc_submit_g("shm", "segments", NULL, shm_info.used_ids);
+    >                                                   ^
+
+    Fixes #1147
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+diff --git a/src/ipc.c b/src/ipc.c
+index 3763f24..b403847 100644
+--- a/src/ipc.c
++++ b/src/ipc.c
+@@ -32,6 +32,9 @@
+ #include "configfile.h"
+ 
+ #if KERNEL_LINUX
++  /* _GNU_SOURCE is needed for struct shm_info.used_ids on musl libc */
++# define _GNU_SOURCE
++
+   /* X/OPEN tells us to use <sys/{types,ipc,sem}.h> for semctl() */
+   /* X/OPEN tells us to use <sys/{types,ipc,msg}.h> for msgctl() */
+   /* X/OPEN tells us to use <sys/{types,ipc,shm}.h> for shmctl() */
