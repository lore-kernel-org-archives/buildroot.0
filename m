From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jun 2020 14:53:55 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/checkpolicy: fix
 -fno-common build failure
Message-ID: <20200607130806.4E1658294E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bd62d7ba015fe0507e5249d2fc0d3b03abd525
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Added upstream patch for removal of unused te_assertions which was
found when using GCC10 as a host complier (-fno-common is now default)

Fixes:
http://autobuild.buildroot.net/results/63f2d1897a8f581ec107374bf2cbb68d3add4109/

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 50de52ae693b4d22e1275d98382de7b66baa0d78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-checkpolicy-remove-unused-te_assertions.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch b/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
new file mode 100644
index 0000000000..0c4ffcbf87
--- /dev/null
+++ b/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
@@ -0,0 +1,45 @@
+From 4d330d0d3155211f119b3082f728ae42dcc01e96 Mon Sep 17 00:00:00 2001
+From: Ondrej Mosnacek <omosnace@redhat.com>
+Date: Thu, 23 Jan 2020 13:57:15 +0100
+Subject: [PATCH] checkpolicy: remove unused te_assertions
+
+This variable is declared in a header file, but never defined or used.
+The te_assert structure definition is only used in this declaration, so
+remove both.
+
+Upstream: https://github.com/SELinuxProject/selinux/commit/4d330d0d3155211f119b3082f728ae42dcc01e96#diff-daf264ea505347df0d59a3a97a07742e
+
+Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ checkpolicy.h | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/checkpolicy.h b/checkpolicy.h
+index 3868f1fa..f127687e 100644
+--- a/checkpolicy.h
++++ b/checkpolicy.h
+@@ -1,20 +1,6 @@
+ #ifndef _CHECKPOLICY_H_
+ #define _CHECKPOLICY_H_
+ 
+-#include <sepol/policydb/ebitmap.h>
+-
+-typedef struct te_assert {
+-	ebitmap_t stypes;
+-	ebitmap_t ttypes;
+-	ebitmap_t tclasses;
+-	int self;
+-	sepol_access_vector_t *avp;
+-	unsigned long line;
+-	struct te_assert *next;
+-} te_assert_t;
+-
+-te_assert_t *te_assertions;
+-
+ extern unsigned int policyvers;
+ 
+ #endif
+-- 
+2.17.1
+
