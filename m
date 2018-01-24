From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:49 -0600
Subject: [Buildroot] [PATCH v4 10/13] ustr: correct linker flag sequence
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-10-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will correct the sequence of -pie and -shared options.
When used together, -pie should be provided to the linker before
-shared.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes
v3 -> v4
 - New
---
 ...str-patch-to-correct-linker-flag-sequence.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/ustr/0001-ustr-patch-to-correct-linker-flag-sequence.patch

diff --git a/package/ustr/0001-ustr-patch-to-correct-linker-flag-sequence.patch b/package/ustr/0001-ustr-patch-to-correct-linker-flag-sequence.patch
new file mode 100644
index 0000000..16751d4
--- /dev/null
+++ b/package/ustr/0001-ustr-patch-to-correct-linker-flag-sequence.patch
@@ -0,0 +1,51 @@
+From 037242704adde8dfdcaa705a8fbc383e36516639 Mon Sep 17 00:00:00 2001
+From: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+Date: Wed, 27 Sep 2017 08:52:08 -0500
+Subject: [PATCH 1/1] ustr: patch to correct linker flag sequence
+
+Description
+This patch will correct the sequence of -pie and -shared options.
+ When used together, -pie should be provided to the linker before
+ -shared. If -pie is provided after -shared, the linker throws
+ below error.
+-------------------------------------------------------------------------
+/host/powerpc-buildroot-linux-gnu/sysroot/usr/lib/Scrt1.o:(.data+0x4):
+ undefined reference to `main'
+/host/lib/gcc/powerpc-buildroot-linux-gnu/6.4.0/../../../../
+powerpc-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.28.1
+assertion fail elf32-ppc.c:8923
+collect2: error: ld returned 1 exit status
+make[2]: *** [libustr-debug-1.0.so.1.0.4] Error 1
+make[2]: *** Waiting for unfinished jobs....
+collect2: error: ld returned 1 exit status
+make[2]: *** [libustr-1.0.so.1.0.4] Error 1
+make[1]: *** [/build/ustr-1.0.4/.stamp_built] Error 2
+make: *** [_all] Error 2
+--------------------------------------------------------------------------
+
+Signed-off-by: Yogesh Prasad <yogesh.prasad@rockwellcollins.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 78357bb..489376d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -507,11 +507,11 @@ ustr-import: ustr-import.in config.status
+ # Use LDFLAGS for LDFLAGS="-m32"
+ $(OPT_LIB_SHARED): $(LIB_SHARED_OPT)
+ 		$(if $(HIDE), @echo Linking SO OPT lib: $@)
+-		$(HIDE)$(CC) -shared $^ -Wl,-soname -Wl,$(OPT_LIB_SHARED_NAME) -Wl,-version-script -Wl,libustr.ver $(LDFLAGS) -o $@
++		$(HIDE)$(CC) $(LDFLAGS) -shared $^ -Wl,-soname -Wl,$(OPT_LIB_SHARED_NAME) -Wl,-version-script -Wl,libustr.ver -o $@
+ 
+ $(DBG_LIB_SHARED): $(LIB_SHARED_DBG)
+ 		$(if $(HIDE), @echo Linking SO DBG lib: $@)
+-		$(HIDE)$(CC) -shared $^ -Wl,-soname -Wl,$(DBG_LIB_SHARED_NAME) -Wl,-version-script -Wl,libustr.ver $(LDFLAGS) -o $@
++		$(HIDE)$(CC) $(LDFLAGS) -shared $^ -Wl,-soname -Wl,$(DBG_LIB_SHARED_NAME) -Wl,-version-script -Wl,libustr.ver -o $@
+ 
+ libustr.a: $(LIB_STATIC_OPT)
+ 		$(if $(HIDE), @echo Linking A OPT lib: $@)
+-- 
+1.9.1
+
-- 
1.9.1
