From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:57:32 +0100
Subject: [Buildroot] [git commit] libostree: add patch to fix compilation
 error
Message-ID: <20171228215737.7EE9E811C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2493638ff74911d187396ed9ce6137d8357c90cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following compilation error:
src/libostree/ostree-repo-pull.c:1493:1: error: no previous prototype
for '_ostree_repo_verify_bindings' [-Werror=missing-prototypes]

The patch is submitted upstreams (8d3d14503b3105f93db635022e881e02688f2db4)
and should be removed in the next version bump.

Fixes:
http://autobuild.buildroot.net/results/3fc91565cb2d0fabe566c109257a616bd57cb08c

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...llways-include-ostree-repo-pull-private.h.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch b/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch
new file mode 100644
index 0000000..3bd36d0
--- /dev/null
+++ b/package/libostree/0001-lib-pull-allways-include-ostree-repo-pull-private.h.patch
@@ -0,0 +1,37 @@
+From af58eb62038202eb1082a66af1be7d405c8a2de1 Mon Sep 17 00:00:00 2001
+From: Marcus Folkesson <marcus.folkesson@gmail.com>
+Date: Thu, 21 Dec 2017 10:20:48 +0100
+Subject: [PATCH] lib/pull: always include ostree-repo-pull-private.h
+
+Always include ostree-repo-pull-private.h to get rid of the following
+build error when HAVE_LIBCURL_OR_LIBSOUP is not defined:
+
+src/libostree/ostree-repo-pull.c:1493:1: error: no previous prototype
+for '_ostree_repo_verify_bindings' [-Werror=missing-prototypes]
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+---
+ src/libostree/ostree-repo-pull.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libostree/ostree-repo-pull.c b/src/libostree/ostree-repo-pull.c
+index 2e6e308c..b2a00ea2 100644
+--- a/src/libostree/ostree-repo-pull.c
++++ b/src/libostree/ostree-repo-pull.c
+@@ -27,12 +27,12 @@
+ #include "libglnx.h"
+ #include "ostree.h"
+ #include "otutil.h"
++#include "ostree-repo-pull-private.h"
+ 
+ #ifdef HAVE_LIBCURL_OR_LIBSOUP
+ 
+ #include "ostree-core-private.h"
+ #include "ostree-repo-private.h"
+-#include "ostree-repo-pull-private.h"
+ #include "ostree-repo-static-delta-private.h"
+ #include "ostree-metalink.h"
+ #include "ostree-fetcher-util.h"
+-- 
+2.15.1
+
