From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 15:04:30 +0200
Subject: [Buildroot] [git commit] package/dmalloc: needs -fPIC
Message-ID: <20210501124233.05A6E8677A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19ec872f169a851b48ba04d22432b7c0939847d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch and pass -fPIC to configure to fix the following build
failure on ARC:

ERROR: architecture for "/usr/lib/libdmalloc.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocth.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocthcxx.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocxx.so" is "ARCompact", should be "ARCv2"

This build failure is due to the following configure error:

checking shared library link args... ./configure: line 4467: 10229 Segmentation fault      ( ${LD-ld} -shared --whole-archive -soname conftest.so -o conftest.so.t conftest.a ) 2>&5
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t

This configure error is due to missing -fPIC:

configure:4392: checking shared library link args
configure:4398: /home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
configure:4404: $? = 0
configure:4408: test -z
			 || test ! -s conftest.err
configure:4411: $? = 0
configure:4414: test -s conftest.o
configure:4417: $? = 0
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld: conftest.a(conftest.o): relocation R_ARC_32_ME against `__stack_chk_guard' can not be used when making a shared object; recompile with -fPIC
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld: BFD (GNU Binutils) 2.33.50.20191002 assertion fail elf32-arc.c:1805
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld: unrecognized option '-all'
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld: use the --help option for usage information
configure:4475: result: /home/buildroot/autobuild/run/instance-0/output-1/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t

Fixes:
 - http://autobuild.buildroot.org/results/65677d889c27649e1f3ca1f3b6c70df7c89779f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dmalloc/0001-add-fpic.patch                | 58 ----------------------
 .../dmalloc/{0002-mips.patch => 0001-mips.patch}   |  0
 ...l-build.patch => 0002-fix-parallel-build.patch} |  0
 ...0004-fix-shlibs.patch => 0003-fix-shlibs.patch} |  0
 ...0005-fix-strdup.patch => 0004-fix-strdup.patch} |  0
 ...06-fix-strndup.patch => 0005-fix-strndup.patch} |  0
 package/dmalloc/dmalloc.mk                         |  4 ++
 7 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/package/dmalloc/0001-add-fpic.patch b/package/dmalloc/0001-add-fpic.patch
deleted file mode 100644
index 230a9e15f1..0000000000
--- a/package/dmalloc/0001-add-fpic.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Without -fPIC, dmalloc does not build with:
-
-/home/test/mips-4.4/bin/mips-linux-gnu-ld --sysroot=/home/test/outputs/test-35/staging -shared --whole-archive -soname libdmallocxx.so -o libdmallocxx.so.t libdmallocxx.a
-/home/test/mips-4.4/bin/mips-linux-gnu-ld: libdmalloc.a(arg_check.o): relocation R_MIPS_HI16 against `_dmalloc_flags' can not be used when making a shared object; recompile with -fPIC
-libdmalloc.a(arg_check.o): could not read symbols: Bad value
-
-This patch, taken from
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/dmalloc/files/dmalloc-5.2.4-fpic.patch?hideattic=0&view=markup,
-fixes the problem by passing the -fPIC flag. It isn't passed through
-the ./configure environment in order to not clutter the configuration
-cache with incorrect values.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.in |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -318,17 +318,17 @@
- # special _th versions of objects with the LOCK_THREADS variable defined to 1
- chunk_th.o : $(srcdir)/chunk.c
- 	rm -f $@
--	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
- 		-c $(srcdir)/chunk.c -o ./$@
- 
- error_th.o : $(srcdir)/error.c
- 	rm -f $@
--	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
- 		-c $(srcdir)/error.c -o ./$@
- 
- malloc_th.o : $(srcdir)/malloc.c
- 	rm -f $@
--	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -DLOCK_THREADS=1 \
- 		-c $(srcdir)/malloc.c -o ./$@
- 
- tests : $(TEST) $(TEST_FC)
-@@ -360,7 +360,7 @@
- 
- .c.o :
- 	rm -f $@
--	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
-+	$(CC) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $< -o ./$@
- 
- #
- # .cc.o auto-target doesn't work on some systems. 
-@@ -368,7 +368,7 @@
- #
- dmallocc.o : $(srcdir)/dmallocc.cc
- 	rm -f $@
--	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
-+	$(CXX) $(CFLAGS) -fPIC $(CPPFLAGS) $(DEFS) $(INCS) -c $(srcdir)/dmallocc.cc \
- 		-o ./$@
- 
- #
diff --git a/package/dmalloc/0002-mips.patch b/package/dmalloc/0001-mips.patch
similarity index 100%
rename from package/dmalloc/0002-mips.patch
rename to package/dmalloc/0001-mips.patch
diff --git a/package/dmalloc/0003-fix-parallel-build.patch b/package/dmalloc/0002-fix-parallel-build.patch
similarity index 100%
rename from package/dmalloc/0003-fix-parallel-build.patch
rename to package/dmalloc/0002-fix-parallel-build.patch
diff --git a/package/dmalloc/0004-fix-shlibs.patch b/package/dmalloc/0003-fix-shlibs.patch
similarity index 100%
rename from package/dmalloc/0004-fix-shlibs.patch
rename to package/dmalloc/0003-fix-shlibs.patch
diff --git a/package/dmalloc/0005-fix-strdup.patch b/package/dmalloc/0004-fix-strdup.patch
similarity index 100%
rename from package/dmalloc/0005-fix-strdup.patch
rename to package/dmalloc/0004-fix-strdup.patch
diff --git a/package/dmalloc/0006-fix-strndup.patch b/package/dmalloc/0005-fix-strndup.patch
similarity index 100%
rename from package/dmalloc/0006-fix-strndup.patch
rename to package/dmalloc/0005-fix-strndup.patch
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 38b2c02027..638fe0fcda 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -16,6 +16,10 @@ DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPTS = --enable-shlib
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
+ifeq ($(BR2_STATIC_LIBS),)
+DMALLOC_CFLAGS += -fPIC
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 DMALLOC_CONF_OPTS += --enable-cxx
 else
