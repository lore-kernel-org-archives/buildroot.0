From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 20 May 2017 11:17:52 -0400
Subject: [Buildroot] [PATCH 1/1] flex: remove disable-flex-binary-and-doc
	patch.
Message-ID: <20170520151752.22320-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the flex makefile blindly links flex++ to flex in
host/usr/bin, but because of the patch
0001-flex-disable-flex-binary-and-documentation.patch, this binary no
longer exists, so it's a invalid simlink to begin with.

Furthermore, host-checkpolicy requires host/usr/bin/flex to be present,
and will fail with a "host/usr/bin/flex: Command not found" error.

The patch itself says:
"Since we prevent the flex binary to be built, we also need to prevent
the documentation to be built, otherwise it will fail"

Since the flex binary needs to be built, this patch is no longer necessary.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 ...lex-disable-flex-binary-and-documentation.patch | 35 ----------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 package/flex/0001-flex-disable-flex-binary-and-documentation.patch

diff --git a/package/flex/0001-flex-disable-flex-binary-and-documentation.patch b/package/flex/0001-flex-disable-flex-binary-and-documentation.patch
deleted file mode 100644
index d035ef4..0000000
--- a/package/flex/0001-flex-disable-flex-binary-and-documentation.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-flex: prevent flex binary to be built
-
-Since we prevent the flex binary to be built, we also need to prevent
-the documentation to be built, otherwise it will fail like this:
-
-Making all in doc
-make[2]: Entering directory '/br/output/build/flex-2.6.4/doc'
-make[2]: *** No rule to make target '../src/flex', needed by 'flex.1'.
-Stop.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/Makefile.in b/Makefile.in
---- a/Makefile.in	2017-05-06 15:49:09.000000000 +0100
-+++ b/Makefile.in	2017-05-10 14:35:20.152794902 +0100
-@@ -450,7 +450,6 @@ EXTRA_DIST = \
- 
- SUBDIRS = \
- 	src \
--	doc \
- 	examples \
- 	po \
- 	tests \
-diff -rup a/src/Makefile.in b/src/Makefile.in
---- a/src/Makefile.in	2017-05-06 15:49:09.000000000 +0100
-+++ b/src/Makefile.in	2017-05-10 14:35:01.918464036 +0100
-@@ -90,7 +90,7 @@ PRE_UNINSTALL = :
- POST_UNINSTALL = :
- build_triplet = @build@
- host_triplet = @host@
--bin_PROGRAMS = flex$(EXEEXT)
-+bin_PROGRAMS =
- @ENABLE_BOOTSTRAP_TRUE at noinst_PROGRAMS = stage1flex$(EXEEXT)
- @CROSS_TRUE at am__append_1 = \
- @CROSS_TRUE@		      ../lib/malloc.c \
-- 
2.9.3
