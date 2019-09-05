From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  5 Sep 2019 19:07:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/luv: install libluv.pc.in
Message-ID: <20190905170731.3520-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Archive 1.30.1-0 doesn't contain libluv.pc.in which will break the build

Fixes:
 - http://autobuild.buildroot.org/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luv/libluv.pc.in | 12 ++++++++++++
 package/luv/luv.mk       |  6 ++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/luv/libluv.pc.in

diff --git a/package/luv/libluv.pc.in b/package/luv/libluv.pc.in
new file mode 100644
index 0000000000..d1544f6504
--- /dev/null
+++ b/package/luv/libluv.pc.in
@@ -0,0 +1,12 @@
+prefix=@prefix@
+exec_prefix=${prefix}
+libdir=@libdir@
+includedir=@includedir@
+
+Name: libluv
+Version: @LUV_VERSION@
+Description: Bare and full libuv bindings for Lua/LuaJIT.
+URL: https://github.com/luvit/luv
+
+Libs: -L${libdir} -lluv @LIBS@
+Cflags: -I${includedir}
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 31288ffca3..c6a8eab158 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -11,6 +11,12 @@ LUV_LICENSE_FILES = LICENSE.txt
 LUV_DEPENDENCIES = libuv
 LUV_INSTALL_STAGING = YES
 
+# Archive 1.30.1-0 doesn't contain libluv.pc.in so install it in this hook
+define LUV_INSTALL_PC_IN
+	cp package/luv/libluv.pc.in $(@D)/
+endef
+LUV_POST_EXTRACT_HOOKS += LUV_INSTALL_PC_IN
+
 LUV_CONF_OPTS += \
 	-DBUILD_MODULE=OFF \
 	-DWITH_SHARED_LIBUV=ON \
-- 
2.23.0.rc1
