From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 15 May 2014 19:17:55 +0200
Subject: [Buildroot] [PATCH] luajit: fix a runtime error
Message-ID: <1400174275-13838-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch fixes :
    luajit: error while loading shared libraries: libluajit-5.1.so.2: cannot open shared object file: No such file or directory

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit-06-install-so.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/luajit/luajit-06-install-so.patch

diff --git a/package/luajit/luajit-06-install-so.patch b/package/luajit/luajit-06-install-so.patch
new file mode 100644
index 0000000..738ec07
--- /dev/null
+++ b/package/luajit/luajit-06-install-so.patch
@@ -0,0 +1,22 @@
+fix the following runtime error :
+    luajit: error while loading shared libraries: libluajit-5.1.so.2: cannot open shared object file: No such file or directory
+
+by creating two symbolic links:
+    libluajit-5.1.so -> libluajit-5.1.so.2.0.3
+    libluajit-5.1.so.2 -> libluajit-5.1.so.2.0.3
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -56,7 +56,7 @@
+ INSTALL_STATIC= $(INSTALL_LIB)/$(INSTALL_ANAME)
+ INSTALL_DYN= $(INSTALL_LIB)/$(INSTALL_SONAME)
+ INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
+-INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT)
++INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT).$(MAJVER)
+ INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
+ INSTALL_TSYM= $(INSTALL_BIN)/$(INSTALL_TSYMNAME)
+ INSTALL_PC= $(INSTALL_PKGCONFIG)/$(INSTALL_PCNAME)
-- 
1.9.1
