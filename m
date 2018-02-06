From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  6 Feb 2018 09:21:14 +0100
Subject: [Buildroot] [PATCH] package/efl: add in-tree eina library path
Message-ID: <20180206082114.3434-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that in-tree libeina.so is used when running elua.

Reported upstream:
https://phab.enlightenment.org/T6670

Fixes:
http://autobuild.buildroot.net/?reason=host-efl-1.20.6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
There is an issue while rebuilding host-efl, elua is stuck at 100% cpu
for some reason...
---
 ...eina-in-environment-variable-library-path.patch | 46 ++++++++++++++++++++++
 package/efl/efl.mk                                 |  4 ++
 2 files changed, 50 insertions(+)
 create mode 100644 package/efl/0001-elua-add-eina-in-environment-variable-library-path.patch

diff --git a/package/efl/0001-elua-add-eina-in-environment-variable-library-path.patch b/package/efl/0001-elua-add-eina-in-environment-variable-library-path.patch
new file mode 100644
index 0000000000..678a4a9a45
--- /dev/null
+++ b/package/efl/0001-elua-add-eina-in-environment-variable-library-path.patch
@@ -0,0 +1,46 @@
+From 62941e4d921a00a855a37516e6b8eabcb67f67e8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 5 Feb 2018 15:07:15 +0100
+Subject: [PATCH] elua: add eina in environment variable library path
+
+In-tree libeina.so library path is missing while running elua.
+
+ELUA     lib/ecore_con/efl_net_socket.eo.lua
+ERR<8533>:elua lib/elua/elua.c:714 _elua_errmsg() ../src/bin/elua/elua: ...t/build/host-efl-1.20.6/src/bindings/luajit/eina/log.lua:53: libeina.so: cannot open shared object file: No such file or directory
+stack traceback:
+	[C]: in function 'error'
+	...put/build/host-efl-1.20.6/src/scripts/elua/core/util.lua:162: in function 'lib_load'
+	...t/build/host-efl-1.20.6/src/bindings/luajit/eina/log.lua:53: in function <...t/build/host-efl-1.20.6/src/bindings/luajit/eina/log.lua:52>
+	[C]: in function 'init_module'
+	...t/build/host-efl-1.20.6/src/bindings/luajit/eina/log.lua:63: in function 'loader'
+	...t/build/host-efl-1.20.6/src/scripts/elua/core/module.lua:94: in function 'require'
+	...ild/host-efl-1.20.6/src/scripts/elua/modules/lualian.lua:5: in function 'loader'
+	...t/build/host-efl-1.20.6/src/scripts/elua/core/module.lua:94: in function 'require'
+	.../build/host-efl-1.20.6/src/scripts/elua/apps/lualian.lua:4: in main chunk
+	[C]: at 0x56278e3a6840
+
+http://autobuild.buildroot.net/results/2bb/2bbe89694c206d764d51a5dd9c75bc4aa844e98d/build-end.log
+
+ at ref T6670
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Daniel Kolesa <d.kolesa@samsung.com>
+---
+ src/Makefile_Elua_Helper.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile_Elua_Helper.am b/src/Makefile_Elua_Helper.am
+index a204e259fa..fa8782af4b 100644
+--- a/src/Makefile_Elua_Helper.am
++++ b/src/Makefile_Elua_Helper.am
+@@ -3,6 +3,7 @@ ELUA_GEN = @elua_bin@ lualian
+ _ELUA_GEN_DEP = @elua_bin@
+ else
+ ELUA_GEN = ELUA_EOLIAN_LIBRARY_PATH=$(top_builddir)/src/lib/eolian/.libs \
++	ELUA_EINA_LIBRARY_PATH=$(top_builddir)/src/lib/eina/.libs \
+ 	$(top_builddir)/src/bin/elua/elua${EXEEXT} \
+ 	-I$(ELUA_BINDINGS_DIR) -C$(ELUA_CORE_DIR) -M$(ELUA_MODULES_DIR) \
+ 	-A$(ELUA_APPS_DIR) lualian
+-- 
+2.14.3
+
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 5a82479ff5..ff0cc8c38b 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -19,6 +19,10 @@ EFL_LICENSE_FILES = \
 
 EFL_INSTALL_STAGING = YES
 
+# 0001-elua-add-eina-in-environment-variable-library-path.patch
+EFL_AUTORECONF = YES
+EFL_GETTEXTIZE = YES
+
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 	jpeg luajit lz4 zlib
 
-- 
2.14.3
