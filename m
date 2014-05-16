From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 16:10:20 +0200
Subject: [Buildroot] [git commit] luajit: fix a runtime error
Message-ID: <20140516141217.B09229CBB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23f7d8ece77bcb504d1b6f33a89ff0a8a32301a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this patch fixes :
    luajit: error while loading shared libraries: libluajit-5.1.so.2: cannot open shared object file: No such file or directory

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/luajit-06-install-so.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

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
