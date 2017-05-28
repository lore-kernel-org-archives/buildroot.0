From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 May 2017 22:37:21 +0200
Subject: [Buildroot] [PATCH] package/expect: don't tells the linker to
	search for libraries in /usr/lib
Message-ID: <20170528203721.21138-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even by using --disable-rpath option, the TCL_CC_SEARCH_FLAGS and
EXP_CC_SEARCH_FLAGS wich contains respectively "-Wl,-rpath,/usr/lib"
and "-Wl,-rpath,/usr/lib/expect5.45.3" are added to the command line:

[...]/x86_64-linux-gcc \
    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
    -Os  -pipe -O2 -fomit-frame-pointer -Wall -fPIC -D_LARGEFILE_SOURCE \
    -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
    -Wl,--export-dynamic  \
    -o expect exp_main_exp.o \
    -L[...]/output/build/expect-2014-05-02 -lexpect5.45.3 \
    -L[...]/output/build/tcl-8.6.6/unix -ltcl8.6 \
    -ldl   \
    -Wl,-rpath,/usr/lib \
    -Wl,-rpath,/usr/lib/expect5.45.3

Remove them to avoid using host libz.so with cross-compiling.

Fixes:
http://autobuild.buildroot.net/results/714/71457ed23bb149ed2253b01be90711e422faa6aa

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...n-t-tells-the-linker-to-search-for-librar.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/expect/0003-Makefile-don-t-tells-the-linker-to-search-for-librar.patch

diff --git a/package/expect/0003-Makefile-don-t-tells-the-linker-to-search-for-librar.patch b/package/expect/0003-Makefile-don-t-tells-the-linker-to-search-for-librar.patch
new file mode 100644
index 0000000..df01045
--- /dev/null
+++ b/package/expect/0003-Makefile-don-t-tells-the-linker-to-search-for-librar.patch
@@ -0,0 +1,50 @@
+From 6c4f09ee7d8d757cea276cc1e988d00401ab543b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 May 2017 22:26:32 +0200
+Subject: [PATCH] Makefile: don't tells the linker to search for libraries in
+ /usr/lib
+
+Even by using --disable-rpath option, the TCL_CC_SEARCH_FLAGS and
+EXP_CC_SEARCH_FLAGS wich contains respectively "-Wl,-rpath,/usr/lib"
+and "-Wl,-rpath,/usr/lib/expect5.45.3" are added to the command line:
+
+[...]/x86_64-linux-gcc \
+		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
+		-Os  -pipe -O2 -fomit-frame-pointer -Wall -fPIC -D_LARGEFILE_SOURCE \
+		-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
+		-Wl,--export-dynamic  \
+		-o expect exp_main_exp.o \
+		-L[...]/output/build/expect-2014-05-02 -lexpect5.45.3 \
+		-L[...]/output/build/tcl-8.6.6/unix -ltcl8.6 \
+		-ldl   \
+		-Wl,-rpath,/usr/lib \
+		-Wl,-rpath,/usr/lib/expect5.45.3
+
+Remove them to avoid using host libz.so with cross-compiling.
+
+Fixes:
+http://autobuild.buildroot.net/results/714/71457ed23bb149ed2253b01be90711e422faa6aa
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Makefile.in | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 05d3e2b..d4edd10 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -394,9 +394,7 @@ expect:	exp_main_exp.o $(PKG_LIB_FILE)
+ 		-o expect exp_main_exp.o \
+ 		@EXP_BUILD_LIB_SPEC@ \
+ 		@TCL_BUILD_LIB_SPEC@ \
+-		@TCL_DL_LIBS@ @PKG_LIBS@ @MATH_LIBS@ \
+-		@TCL_CC_SEARCH_FLAGS@ \
+-		@EXP_CC_SEARCH_FLAGS@
++		@TCL_DL_LIBS@ @PKG_LIBS@ @MATH_LIBS@
+ 	$(SETUID) expect
+ 
+ expectk:
+-- 
+2.9.4
+
-- 
2.9.4
