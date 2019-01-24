From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 21:54:27 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/systemd: fix
 build with older kernels
Message-ID: <20190124214757.0F0468E699@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1dfcff3f94a4731ae7fa6bb6380ef0e860b07ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
 - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d62425599e09b503d98febbf73b63731dbf4bf76)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pability-fix-build-without-PR_CAP_AMBIENT.patch | 61 ++++++++++++++++++++++
 ...mpfile-util.c-fix-build-without-O_TMPFILE.patch | 34 ++++++++++++
 ...0006-missing_if_link.h-add-IFLA_BOND_MODE.patch | 49 +++++++++++++++++
 .../0007-missing_syscall.h-include-errno.h.patch   | 28 ++++++++++
 ...file-util.c-fix-build-without-F_OFD_SETLK.patch | 34 ++++++++++++
 5 files changed, 206 insertions(+)

diff --git a/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch b/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
new file mode 100644
index 0000000000..7b240d1b1a
--- /dev/null
+++ b/package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
@@ -0,0 +1,61 @@
+From 822809d0afd0f984750a61b2391059411afa4333 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Jan 2019 16:07:00 +0100
+Subject: [PATCH] capability: fix build without PR_CAP_AMBIENT
+
+systemd fails to build on kernel without PR_CAP_AMBIENT (< 4.3) since
+https://github.com/systemd/systemd/commit/2a03bb3e65327c73008f1db485ffc75c432dc6b2
+
+To fix this error, include missing_prctl.h in all files using
+PR_CAP_AMBIENT
+
+Fixes:
+ - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/11400]
+---
+ src/basic/capability-util.c | 1 +
+ src/test/test-capability.c  | 1 +
+ src/test/test-execute.c     | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/basic/capability-util.c b/src/basic/capability-util.c
+index a3f3ca9f5..b944ee6ea 100644
+--- a/src/basic/capability-util.c
++++ b/src/basic/capability-util.c
+@@ -13,6 +13,7 @@
+ #include "fileio.h"
+ #include "log.h"
+ #include "macro.h"
++#include "missing_prctl.h"
+ #include "parse-util.h"
+ #include "user-util.h"
+ #include "util.h"
+diff --git a/src/test/test-capability.c b/src/test/test-capability.c
+index dae85f2f9..3db05878a 100644
+--- a/src/test/test-capability.c
++++ b/src/test/test-capability.c
+@@ -13,6 +13,7 @@
+ #include "fd-util.h"
+ #include "fileio.h"
+ #include "macro.h"
++#include "missing_prctl.h"
+ #include "parse-util.h"
+ #include "tests.h"
+ #include "util.h"
+diff --git a/src/test/test-execute.c b/src/test/test-execute.c
+index 2115061ad..cea68b8cf 100644
+--- a/src/test/test-execute.c
++++ b/src/test/test-execute.c
+@@ -13,6 +13,7 @@
+ #include "fs-util.h"
+ #include "macro.h"
+ #include "manager.h"
++#include "missing_prctl.h"
+ #include "mkdir.h"
+ #include "path-util.h"
+ #include "rm-rf.h"
+-- 
+2.14.1
+
diff --git a/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch b/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
new file mode 100644
index 0000000000..300fc544fd
--- /dev/null
+++ b/package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
@@ -0,0 +1,34 @@
+From b1ca50178b97b3b827b0420ec7bdf9cb1d6fec56 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Jan 2019 16:36:06 +0100
+Subject: [PATCH] basic/tmpfile-util.c: fix build without O_TMPFILE
+
+systemd fails to build on kernel without O_TMPFILE (< 3.11) since
+https://github.com/systemd/systemd/commit/dea72eda9cdbfeedd24cbe8c734ad0639bf96cde
+
+To fix this error, include missing_fcntl.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/11400]
+---
+ src/basic/tmpfile-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/tmpfile-util.c b/src/basic/tmpfile-util.c
+index 669eb2666..bc92d6a6d 100644
+--- a/src/basic/tmpfile-util.c
++++ b/src/basic/tmpfile-util.c
+@@ -8,6 +8,7 @@
+ #include "hexdecoct.h"
+ #include "macro.h"
+ #include "memfd-util.h"
++#include "missing_fcntl.h"
+ #include "missing_syscall.h"
+ #include "path-util.h"
+ #include "process-util.h"
+-- 
+2.14.1
+
diff --git a/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch b/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
new file mode 100644
index 0000000000..ace29be6a5
--- /dev/null
+++ b/package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
@@ -0,0 +1,49 @@
+From 9ab48a9b3bfadca4fbe055ddb4f6fc677ee4ae85 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Jan 2019 17:08:48 +0100
+Subject: [PATCH] missing_if_link.h: add IFLA_BOND_MODE
+
+systemd fails to build on kernel without IFLA_BOND_MODE (< 3.13) since
+https://github.com/systemd/systemd/commit/9714c020fc4cda1823c2a77e3fd08aefa7d78b25
+
+So put back IFLA_BOND_MODE definition
+
+Fixes:
+ - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/11400]
+---
+ meson.build                 | 1 +
+ src/basic/missing_if_link.h | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 623c1ad6b..011e44980 100644
+--- a/meson.build
++++ b/meson.build
+@@ -476,6 +476,7 @@ foreach decl : [['ETHTOOL_LINK_MODE_10baseT_Half_BIT',      'linux/ethtool.h'],
+                 ['IFLA_TARGET_NETNSID',                     'linux/if_link.h'],
+                 ['IFLA_NEW_IFINDEX',                        'linux/if_link.h'],
+                 ['IFLA_MAX_MTU',                            'linux/if_link.h'],
++                ['IFLA_BOND_MODE',                          'linux/if_link.h'],
+                 ['IFLA_BOND_ACTIVE_SLAVE',                  'linux/if_link.h'],
+                 ['IFLA_BOND_AD_INFO',                       'linux/if_link.h'],
+                 ['IFLA_BOND_AD_ACTOR_SYSTEM',               'linux/if_link.h'],
+diff --git a/src/basic/missing_if_link.h b/src/basic/missing_if_link.h
+index 07675426b..761797f56 100644
+--- a/src/basic/missing_if_link.h
++++ b/src/basic/missing_if_link.h
+@@ -110,6 +110,9 @@ enum ipvlan_mode {
+ #define IFLA_MAX                51
+ #endif
+ 
++#if !HAVE_IFLA_BOND_MODE /* linux at 90af231106c0b8d223c27d35464af95cb3d9cacf (3.13) */
++#define IFLA_BOND_MODE              1
++#endif
+ #if !HAVE_IFLA_BOND_ACTIVE_SLAVE /* linux at ec76aa49855f6d6fea5e01de179fb57dd47c619d (3.13) */
+ #define IFLA_BOND_ACTIVE_SLAVE      2
+ #endif
+-- 
+2.14.1
+
diff --git a/package/systemd/0007-missing_syscall.h-include-errno.h.patch b/package/systemd/0007-missing_syscall.h-include-errno.h.patch
new file mode 100644
index 0000000000..eb5d9eacb7
--- /dev/null
+++ b/package/systemd/0007-missing_syscall.h-include-errno.h.patch
@@ -0,0 +1,28 @@
+From 985d15d636b4d2c7086dbd305369c02756cdbe19 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Jan 2019 17:24:21 +0100
+Subject: [PATCH] missing_syscall.h: include errno.h
+
+This include is needed for errno and ENOSYS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/11400]
+---
+ src/basic/missing_syscall.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index d5d4b26ac..d1aa32218 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -3,6 +3,7 @@
+ 
+ /* Missing glibc definitions to access certain kernel APIs */
+ 
++#include <errno.h>
+ #include <fcntl.h>
+ #include <sys/syscall.h>
+ #include <sys/types.h>
+-- 
+2.14.1
+
diff --git a/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch b/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch
new file mode 100644
index 0000000000..1a1542c706
--- /dev/null
+++ b/package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch
@@ -0,0 +1,34 @@
+From badb5dafa9efc89384d9d2bea5648f7b017204d7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 11 Jan 2019 17:30:32 +0100
+Subject: [PATCH] lockfile-util.c: fix build without F_OFD_SETLK
+
+systemd fails to build on kernel without F_OFD_SETLK since
+https://github.com/systemd/systemd/commit/9714c020fc4cda1823c2a77e3fd08aefa7d78b25
+
+So put include missing_fcntl.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/11400]
+---
+ src/shared/lockfile-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/lockfile-util.c b/src/shared/lockfile-util.c
+index 4bae23b24..260c2088d 100644
+--- a/src/shared/lockfile-util.c
++++ b/src/shared/lockfile-util.c
+@@ -12,6 +12,7 @@
+ #include "fs-util.h"
+ #include "lockfile-util.h"
+ #include "macro.h"
++#include "missing_fcntl.h"
+ #include "path-util.h"
+ 
+ int make_lock_file(const char *p, int operation, LockFile *ret) {
+-- 
+2.14.1
+
