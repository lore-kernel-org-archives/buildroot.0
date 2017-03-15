From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Mar 2017 10:23:57 -0300
Subject: [Buildroot] [PATCH] libepoxy: reinstate mesa egl cflags patch
Message-ID: <20170315132357.2357-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is still required when building libepoxy against mesa egl without
x11 (GL).

Mesa needs a preprocessor define to avoid including X11 headers and
since this is not forwarded into epoxy.pc for other
libraries/applicatons that link against it it will fail.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-Forward-EGL-cflags-into-epoxy.pc.patch    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch

diff --git a/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch b/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch
new file mode 100644
index 0000000..286f875
--- /dev/null
+++ b/package/libepoxy/0001-Forward-EGL-cflags-into-epoxy.pc.patch
@@ -0,0 +1,32 @@
+From 99b8373dbe8fb3bac835ebad90f91cfd213e4acb Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 15 Mar 2017 10:02:54 -0300
+Subject: [PATCH] Forward EGL cflags into epoxy.pc
+
+When building mesa egl without x11 and gles2 the headers need a
+MESA_EGL_NO_X11_HEADERS define to avoid including X11 headers.
+Forward EGL CFLAGS into epoxy.pc to avoid build failures when linking
+against libepoxy on this scenario.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: pull request https://github.com/anholt/libepoxy/pull/113
+
+ epoxy.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/epoxy.pc.in b/epoxy.pc.in
+index 7828a77..8278b7d 100644
+--- a/epoxy.pc.in
++++ b/epoxy.pc.in
+@@ -10,6 +10,6 @@ epoxy_has_wgl=@epoxy_has_wgl@
+ Name: epoxy
+ Description: epoxy GL dispatch Library
+ Version: @PACKAGE_VERSION@
+-Cflags: -I${includedir}
++Cflags: -I${includedir} @EGL_CFLAGS@
+ Libs: -L${libdir} -lepoxy
+ Libs.private: @DLOPEN_LIBS@
+-- 
+2.10.2
+
-- 
2.10.2
