From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  5 Jan 2021 14:19:41 +0100
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.46
Message-ID: <20210105131942.917624-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ding-progs-tcapsh-static-to-sudotest.patch | 79 -------------------
 package/libcap/Config.in                      |  2 +-
 package/libcap/libcap.hash                    |  2 +-
 package/libcap/libcap.mk                      |  2 +-
 4 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch

diff --git a/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch b/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch
deleted file mode 100644
index 856b7b1bb..000000000
--- a/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 9b1c003748d4df78416d50fce139f0875224440b Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Tue, 10 Nov 2020 20:47:45 -0800
-Subject: [PATCH] Migrate building progs/tcapsh-static to sudotest
-
-This addresses:
-
-  https://bugzilla.kernel.org/show_bug.cgi?id=210135
-  https://bugs.busybox.net/show_bug.cgi?id=13296
-
-Some notes on expectations:
-
-When building DYNAMIC=yes folk want to avoid depending on a
-static libc.a file in their build tree. The best we can do is
-to move building static test tool objects to sudotest.
-
-  make DYNAMIC=yes clean all test
-
-will build the progs binaries and run the tests with all dynamic
-linking. It will, however, build the libcap.a etc libraries too
-even though they are not used for linking.
-
-  make DYNAMIC=no clean all test
-
-will build the progs binaries and run the tests with all static
-linking. It will, however, build the libcap.so etc libraries too
-even though they are not used for linking.
-
-  make SHARED=no clean all test
-
-will build and link progs and test binaries statically against
-libcap.a. No shared libraries (libcap.so etc) will be built.
-
-In all cases, whether linked against or not, libcap.a is built.
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-[Patch taken from upstream:
-https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=9b1c003748d4df78416d50fce139f0875224440b]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- tests/Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index fc39fee..1e7039d 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -17,13 +17,13 @@ install: all
- 
- ifeq ($(DYNAMIC),yes)
- LINKEXTRA=-Wl,-rpath,../libcap
--DEPS=../libcap/libcap.so ../progs/tcapsh-static
-+DEPS=../libcap/libcap.so
- ifeq ($(PTHREADS),yes)
- DEPS += ../libcap/libpsx.so
- endif
- else
- LDFLAGS += --static
--DEPS=../libcap/libcap.a ../progs/tcapsh-static
-+DEPS=../libcap/libcap.a
- ifeq ($(PTHREADS),yes)
- DEPS +=  ../libcap/libpsx.a
- endif
-@@ -71,10 +71,10 @@ libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
- 
- # privileged
--run_libcap_launch_test: libcap_launch_test noop
-+run_libcap_launch_test: libcap_launch_test noop ../progs/tcapsh-static
- 	sudo ./libcap_launch_test
- 
--run_libcap_psx_launch_test: libcap_psx_launch_test
-+run_libcap_psx_launch_test: libcap_psx_launch_test ../progs/tcapsh-static
- 	sudo ./libcap_psx_launch_test
- 
- libcap_launch_test: libcap_launch_test.c $(DEPS)
--- 
-2.20.1
-
diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 1fb2e7cae..e1971b7bb 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBCAP
 	  capabilities are a partitioning of the all powerful root
 	  privilege into a set of distinct privileges.
 
-	  http://sites.google.com/site/fullycapable/
+	  https://sites.google.com/site/fullycapable/
 
 if BR2_PACKAGE_LIBCAP
 
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 32986a41d..b9beece90 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  d66639f765c0e10557666b00f519caf0bd07a95f867dddaee131cd284fac3286  libcap-2.45.tar.xz
+sha256  4ed3d11413fa6c9667e49f819808fbb581cd8864b839f87d7c2a02c70f21d8b4  libcap-2.46.tar.xz
 
 # Hash for license file:
 sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 7bb8f5767..27a295cad 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.45
+LIBCAP_VERSION = 2.46
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.27.0
