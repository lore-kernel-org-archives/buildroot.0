From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 23:19:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/memtester: bump to version 4.5.0
Message-ID: <20200920211924.1660523-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patches (already in version)

http://pyropus.ca/software/memtester/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memtester/0001-makefile-fix.patch     | 23 -------
 .../0002-fix-build-with-gcc-10.patch          | 65 -------------------
 package/memtester/memtester.hash              |  2 +-
 package/memtester/memtester.mk                |  2 +-
 4 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 package/memtester/0001-makefile-fix.patch
 delete mode 100644 package/memtester/0002-fix-build-with-gcc-10.patch

diff --git a/package/memtester/0001-makefile-fix.patch b/package/memtester/0001-makefile-fix.patch
deleted file mode 100644
index 6f1481beca..0000000000
--- a/package/memtester/0001-makefile-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The a/{b,c} construct doesn't work within make, so let's split the
-creation of the installation directories in two commands.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: memtester-4.2.1/Makefile
-===================================================================
---- memtester-4.2.1.orig/Makefile
-+++ memtester-4.2.1/Makefile
-@@ -25,8 +25,9 @@
- all: memtester
- 
- install: all
--	mkdir -m 755 -p $(INSTALLPATH)/{bin,man/man8}
-+	mkdir -m 755 -p $(INSTALLPATH)/bin
- 	install -m 755 memtester $(INSTALLPATH)/bin/
-+	mkdir -m 755 -p $(INSTALLPATH)/man/man8
- 	gzip -c memtester.8 >memtester.8.gz ; install -m 644 memtester.8.gz $(INSTALLPATH)/man/man8/
- 
- auto-ccld.sh: \
diff --git a/package/memtester/0002-fix-build-with-gcc-10.patch b/package/memtester/0002-fix-build-with-gcc-10.patch
deleted file mode 100644
index 8c9b3945bb..0000000000
--- a/package/memtester/0002-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From acd226cd4073b77abce8783e19c5ef3bbf8074ef Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 11 Sep 2020 21:39:03 +0200
-Subject: [PATCH] fix build with gcc 10
-
-Move mword8 and mword16 from types.h to tests.c to avoid the following
-build failure with gcc 10 (which defaults to -fno-common):
-
-/srv/storage/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: tests.o: in function `.LANCHOR1':
-tests.c:(.bss+0x4): multiple definition of `mword16'; memtester.o:memtester.c:(.bss+0xc): first defined here
-/srv/storage/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: tests.o: in function `.LANCHOR1':
-tests.c:(.bss+0x0): multiple definition of `mword8'; memtester.o:memtester.c:(.bss+0x10): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/e1c276603475a952847fd53724e56101cdccbbcb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to charlesc at pyropus.ca]
----
- tests.c | 10 ++++++++++
- types.h | 10 ----------
- 2 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/tests.c b/tests.c
-index be1b350..d3d25c7 100644
---- a/tests.c
-+++ b/tests.c
-@@ -22,6 +22,16 @@
- #include "sizes.h"
- #include "memtester.h"
- 
-+union {
-+    unsigned char bytes[UL_LEN/8];
-+    ul val;
-+} mword8;
-+
-+union {
-+    unsigned short u16s[UL_LEN/16];
-+    ul val;
-+} mword16;
-+
- char progress[] = "-\\|/";
- #define PROGRESSLEN 4
- #define PROGRESSOFTEN 2500
-diff --git a/types.h b/types.h
-index ad7ce73..dca7fc0 100644
---- a/types.h
-+++ b/types.h
-@@ -24,13 +24,3 @@ struct test {
-     char *name;
-     int (*fp)();
- };
--
--union {
--    unsigned char bytes[UL_LEN/8];
--    ul val;
--} mword8;
--
--union {
--    unsigned short u16s[UL_LEN/16];
--    ul val;
--} mword16;
--- 
-2.28.0
-
diff --git a/package/memtester/memtester.hash b/package/memtester/memtester.hash
index da8c1c02c9..7d7820e746 100644
--- a/package/memtester/memtester.hash
+++ b/package/memtester/memtester.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88  memtester-4.3.0.tar.gz
+sha256  8ed52b0d06d4aeb61954994146e2a5b2d20448a8f3ce3ee995120e6dbde2ae37  memtester-4.5.0.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 0e64d8cde2..1a319462a5 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTESTER_VERSION = 4.3.0
+MEMTESTER_VERSION = 4.5.0
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
-- 
2.28.0
