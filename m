From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jun 2011 17:08:55 +0200
Subject: [Buildroot] [git commit] yajl: fix link issue on uClibc
Message-ID: <20110622151138.BD98C88DB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=489692fcde8477ac7b949d32a424bded815b360c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to link with -lm for isnan() / isinf().

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/yajl/yajl-2.0.2-math-link.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/yajl/yajl-2.0.2-math-link.patch

diff --git a/package/yajl/yajl-2.0.2-math-link.patch b/package/yajl/yajl-2.0.2-math-link.patch
new file mode 100644
index 0000000..355a248
--- /dev/null
+++ b/package/yajl/yajl-2.0.2-math-link.patch
@@ -0,0 +1,24 @@
+[PATCH] fix json_reformat linking on uClibc
+
+json_reformat calls yajl_gen_* functions, which internally use isnan() /
+isinf(). On Glibc, these are provided by libc, but on uClibc you need to
+link with -lm (like the spec says), so ensure we do so.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ reformatter/CMakeLists.txt |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: yajl-2.0.2/reformatter/CMakeLists.txt
+===================================================================
+--- yajl-2.0.2.orig/reformatter/CMakeLists.txt
++++ yajl-2.0.2/reformatter/CMakeLists.txt
+@@ -26,7 +26,7 @@
+ 
+ ADD_EXECUTABLE(json_reformat ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(json_reformat yajl_s)
++TARGET_LINK_LIBRARIES(json_reformat yajl_s m)
+ 
+ # copy the binary into the output directory
+ GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
-- 
1.7.3.4
