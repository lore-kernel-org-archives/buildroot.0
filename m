From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 15 Jul 2015 15:42:49 +0200
Subject: [Buildroot] [RFC] qpid-proton: python bindings: fix missing link to
	libm with uClibc
Message-ID: <1436967769-17954-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

This is a _very_ quick fix. I haven't investigated it very well, not to
mention testing. But I've got no time to improve it for a while, sorry, so here
is my best shot for anybody to improve.

Patch not submitted upstream, for the same reason.
---
 .../0002-bindings-python-link-libm.patch           | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/qpid-proton/0002-bindings-python-link-libm.patch

diff --git a/package/qpid-proton/0002-bindings-python-link-libm.patch b/package/qpid-proton/0002-bindings-python-link-libm.patch
new file mode 100644
index 0000000..a6e4ea5
--- /dev/null
+++ b/package/qpid-proton/0002-bindings-python-link-libm.patch
@@ -0,0 +1,31 @@
+From 11c86a31c9b77607e46984b0cdbbe2bc0088ca9d Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Wed, 15 Jul 2015 15:27:49 +0200
+Subject: [PATCH] bindings/python: link libm
+
+Fixes:
+
+  CMakeFiles/_cproton.dir/cprotonPYTHON_wrap.c.o: In function `SWIG_AsVal_float':
+  cprotonPYTHON_wrap.c:(.text+0xcb8): undefined reference to `__finite'
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ proton-c/bindings/python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/proton-c/bindings/python/CMakeLists.txt b/proton-c/bindings/python/CMakeLists.txt
+index 2886326..efb6ca4 100644
+--- a/proton-c/bindings/python/CMakeLists.txt
++++ b/proton-c/bindings/python/CMakeLists.txt
+@@ -33,7 +33,7 @@ list(APPEND SWIG_MODULE_cproton_EXTRA_DEPS
+ )
+ 
+ swig_add_module(cproton python cproton.i)
+-swig_link_libraries(cproton ${BINDING_DEPS} ${PYTHON_LIBRARIES})
++swig_link_libraries(cproton ${BINDING_DEPS} ${PYTHON_LIBRARIES} m)
+ set_target_properties(${SWIG_MODULE_cproton_REAL_NAME}
+     PROPERTIES
+     LINK_FLAGS "${CATCH_UNDEFINED}")
+-- 
+1.9.1
+
-- 
1.9.1
