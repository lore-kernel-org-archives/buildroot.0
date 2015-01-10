From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 10 Jan 2015 10:10:48 +0200
Subject: [Buildroot] [PATCH] newt: avoid poisoned paths
Message-ID: <20150110081048.GA18077@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/cb908f73b14e1510bea890167b3927afbf708d6f/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
newt-fix-makefile.patch renamed to 0001-newt-fix-makefile.patch

 package/newt/0001-newt-fix-makefile.patch | 35 +++++++++++++++++++++++++++++++
 package/newt/0002-slang-include-dir.patch | 15 +++++++++++++
 package/newt/newt-fix-makefile.patch      | 35 -------------------------------
 3 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 package/newt/0001-newt-fix-makefile.patch
 create mode 100644 package/newt/0002-slang-include-dir.patch
 delete mode 100644 package/newt/newt-fix-makefile.patch

diff --git a/package/newt/0001-newt-fix-makefile.patch b/package/newt/0001-newt-fix-makefile.patch
new file mode 100644
index 0000000..84152fb
--- /dev/null
+++ b/package/newt/0001-newt-fix-makefile.patch
@@ -0,0 +1,35 @@
+Fix Makefile.in
+
+* Use $(CC) instead of $(CPP) to generate .depend file because
+  '$(CPP) -M' call does not support multiple input files.
+  This avoid the following error:
+
+make[1]: Entering directory `/opt/br/output/build/newt-0.51.0'
+/opt/br/output/host/usr/bin/arm-none-linux-gnueabi-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -M newt.c button.c form.c checkbox.c entry.c label.c listbox.c scrollbar.c textbox.c scale.c grid.c windows.c buttonbar.c checkboxtree.c > .depend
+arm-none-linux-gnueabi-cpp: too many input files
+make[1]: *** [depend] Error 1
+make[1]: Leaving directory 
+`/opt/br/output/build/newt-0.51.0'
+make: *** 
+[/opt/br/output/build/newt-0.51.0/.stamp_built] Error 2
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -121,7 +121,7 @@
+ 		$(SHAREDDIR)/*.o *.$(SOEXT)*
+ 
+ depend:
+-	$(CPP) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
++	$(CC) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
+ 
+ $(SHAREDDIR):
+ 	mkdir -p $(SHAREDDIR)
diff --git a/package/newt/0002-slang-include-dir.patch b/package/newt/0002-slang-include-dir.patch
new file mode 100644
index 0000000..a88ee70
--- /dev/null
+++ b/package/newt/0002-slang-include-dir.patch
@@ -0,0 +1,15 @@
+slang.h is in sysroot/usr/include, no need to use -I
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -5,7 +5,7 @@
+ CPP = @CPP@
+ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+-CPPFLAGS = -D_GNU_SOURCE -I/usr/include/slang @CPPFLAGS@ 
++CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
+ GNU_LD = @GNU_LD@
+ 
+ VERSION = @VERSION@
diff --git a/package/newt/newt-fix-makefile.patch b/package/newt/newt-fix-makefile.patch
deleted file mode 100644
index 84152fb..0000000
--- a/package/newt/newt-fix-makefile.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Fix Makefile.in
-
-* Use $(CC) instead of $(CPP) to generate .depend file because
-  '$(CPP) -M' call does not support multiple input files.
-  This avoid the following error:
-
-make[1]: Entering directory `/opt/br/output/build/newt-0.51.0'
-/opt/br/output/host/usr/bin/arm-none-linux-gnueabi-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -M newt.c button.c form.c checkbox.c entry.c label.c listbox.c scrollbar.c textbox.c scale.c grid.c windows.c buttonbar.c checkboxtree.c > .depend
-arm-none-linux-gnueabi-cpp: too many input files
-make[1]: *** [depend] Error 1
-make[1]: Leaving directory 
-`/opt/br/output/build/newt-0.51.0'
-make: *** 
-[/opt/br/output/build/newt-0.51.0/.stamp_built] Error 2
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -121,7 +121,7 @@
- 		$(SHAREDDIR)/*.o *.$(SOEXT)*
- 
- depend:
--	$(CPP) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
-+	$(CC) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
- 
- $(SHAREDDIR):
- 	mkdir -p $(SHAREDDIR)
-- 
2.0.3
