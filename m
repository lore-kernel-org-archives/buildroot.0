From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:33:20 +0200
Subject: [Buildroot] [git commit branch/next] lz4: bump to version 1.8.2
Message-ID: <20180522213417.C36EB811F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0e35182a5fe9594de4d141fdb6784e9367a07da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patches.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-restrictive-conditions-for-clock_gettime.patch | 58 ---------------------
 ...002-lib-allow-to-disable-shared-libraries.patch | 59 ----------------------
 package/lz4/lz4.hash                               |  2 +-
 package/lz4/lz4.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 119 deletions(-)

diff --git a/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch b/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch
deleted file mode 100644
index 678f16abb7..0000000000
--- a/package/lz4/0001-use-more-restrictive-conditions-for-clock_gettime.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 7dba09af47dd3daa1562a6332a643a1a59dba4a8 Mon Sep 17 00:00:00 2001
-From: Yann Collet <cyan@fb.com>
-Date: Tue, 16 Jan 2018 10:21:37 -0800
-Subject: [PATCH] use more restrictive conditions for clock_gettime()
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 7dba09af47dd3
-
- programs/util.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/programs/util.h b/programs/util.h
-index fc7f63e8140e..a3576d7e3a57 100644
---- a/programs/util.h
-+++ b/programs/util.h
-@@ -141,6 +141,7 @@ extern "C" {
- *  Time functions
- ******************************************/
- #if defined(_WIN32)   /* Windows */
-+
-     typedef LARGE_INTEGER UTIL_time_t;
-     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { UTIL_time_t x; QueryPerformanceCounter(&x); return x; }
-     UTIL_STATIC U64 UTIL_getSpanTimeMicro(UTIL_time_t clockStart, UTIL_time_t clockEnd)
-@@ -165,7 +166,9 @@ extern "C" {
-         }
-         return 1000000000ULL*(clockEnd.QuadPart - clockStart.QuadPart)/ticksPerSecond.QuadPart;
-     }
-+
- #elif defined(__APPLE__) && defined(__MACH__)
-+
-     #include <mach/mach_time.h>
-     typedef U64 UTIL_time_t;
-     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { return mach_absolute_time(); }
-@@ -189,7 +192,9 @@ extern "C" {
-         }
-         return ((clockEnd - clockStart) * (U64)rate.numer) / ((U64)rate.denom);
-     }
--#elif (PLATFORM_POSIX_VERSION >= 200112L)
-+
-+#elif (PLATFORM_POSIX_VERSION >= 200112L) && (defined __UCLIBC__ || ((__GLIBC__ == 2 && __GLIBC_MINOR__ >= 17) || __GLIBC__ > 2))
-+
-     #include <time.h>
-     typedef struct timespec UTIL_time_t;
-     UTIL_STATIC UTIL_time_t UTIL_getTime(void)
-@@ -227,7 +232,9 @@ extern "C" {
-         nano += diff.tv_nsec;
-         return nano;
-     }
-+
- #else   /* relies on standard C (note : clock_t measurements can be wrong when using multi-threading) */
-+
-     typedef clock_t UTIL_time_t;
-     UTIL_STATIC UTIL_time_t UTIL_getTime(void) { return clock(); }
-     UTIL_STATIC U64 UTIL_getSpanTimeMicro(UTIL_time_t clockStart, UTIL_time_t clockEnd) { return 1000000ULL * (clockEnd - clockStart) / CLOCKS_PER_SEC; }
--- 
-2.17.0
-
diff --git a/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch b/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
deleted file mode 100644
index 4f89e85577..0000000000
--- a/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 95bde2a4ae4a92e984a5783ca1f09f44bf04fadb Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 19 Apr 2018 12:28:11 +0300
-Subject: [PATCH] lib: allow to disable shared libraries
-
-Just like BUILD_STATIC=no disables static libraries, BUILD_SHARED=no
-disabled shared libraries. This is useful to support toolchains that do
-not support shared libraries.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/lz4/lz4/pull/504
-
- lib/Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index dd33f50351a8..976d57cd75ed 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -42,6 +42,7 @@ LIBVER_MINOR := $(shell echo $(LIBVER_MINOR_SCRIPT))
- LIBVER_PATCH := $(shell echo $(LIBVER_PATCH_SCRIPT))
- LIBVER  := $(shell echo $(LIBVER_SCRIPT))
- 
-+BUILD_SHARED:=yes
- BUILD_STATIC:=yes
- 
- CPPFLAGS+= -DXXH_NAMESPACE=LZ4_
-@@ -92,6 +93,7 @@ ifeq ($(BUILD_STATIC),yes)  # can be disabled on command line
- endif
- 
- $(LIBLZ4): $(SRCFILES)
-+ifeq ($(BUILD_SHARED),yes)  # can be disabled on command line
- 	@echo compiling dynamic library $(LIBVER)
- ifneq (,$(filter Windows%,$(OS)))
- 	@$(CC) $(FLAGS) -DLZ4_DLL_EXPORT=1 -shared $^ -o dll\$@.dll
-@@ -102,6 +104,7 @@ else
- 	@ln -sf $@ liblz4.$(SHARED_EXT_MAJOR)
- 	@ln -sf $@ liblz4.$(SHARED_EXT)
- endif
-+endif
- 
- liblz4: $(LIBLZ4)
- 
-@@ -159,9 +162,11 @@ ifeq ($(BUILD_STATIC),yes)
- 	@$(INSTALL_DATA) liblz4.a $(DESTDIR)$(LIBDIR)/liblz4.a
- 	@$(INSTALL_DATA) lz4frame_static.h $(DESTDIR)$(INCLUDEDIR)/lz4frame_static.h
- endif
-+ifeq ($(BUILD_SHARED),yes)
- 	@$(INSTALL_PROGRAM) liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)
- 	@ln -sf liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)/liblz4.$(SHARED_EXT_MAJOR)
- 	@ln -sf liblz4.$(SHARED_EXT_VER) $(DESTDIR)$(LIBDIR)/liblz4.$(SHARED_EXT)
-+endif
- 	@echo Installing headers in $(INCLUDEDIR)
- 	@$(INSTALL_DATA) lz4.h $(DESTDIR)$(INCLUDEDIR)/lz4.h
- 	@$(INSTALL_DATA) lz4hc.h $(DESTDIR)$(INCLUDEDIR)/lz4hc.h
--- 
-2.17.0
-
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index bdc43d1e66..90bd217cdf 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256 12f3a9e776a923275b2dc78ae138b4967ad6280863b77ff733028ce89b8123f9  lz4-v1.8.1.2.tar.gz
+sha256 0963fbe9ee90acd1d15e9f09e826eaaf8ea0312e854803caf2db0a6dd40f4464  lz4-v1.8.2.tar.gz
 sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index c5540124e9..183df45649 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = v1.8.1.2
+LZ4_VERSION = v1.8.2
 LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
