From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:19:53 +0200
Subject: [Buildroot] [git commit] package/luv: install libluv.pc.in
Message-ID: <20190915201546.33E3A8E5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e5ab464b7efe77a8744ab61298fd2f9e4fc427c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Archive 1.30.1-0 doesn't contain libluv.pc.in which will break the build

Fixes:
 - http://autobuild.buildroot.org/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733

This issue has been fixed upstream in
https://github.com/luvit/luv/commit/946784fba047bcd275554b5040949e3d70994b30,
which should be in the next release.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/libluv.pc.in | 12 ++++++++++++
 package/luv/luv.mk       |  6 ++++++
 2 files changed, 18 insertions(+)

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
