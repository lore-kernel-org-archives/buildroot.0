From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:10:27 +0200
Subject: [Buildroot] [git commit] package/openal: bump version to 1.18.0
Message-ID: <20170722131124.1E7E98040F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d854950188fc8d4fb5c188bbd9d0082ad872656c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches 0001 to 0004 were upstream backports, so they have been
dropped. Patch 0005 has been upstreamed as commit
https://github.com/kcat/openal-soft/commit/af5fb3d6e73ac5e7f015011974c7a7443ae6744b. Therefore,
all 5 patches are dropped.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Build-NEON-code-with-mfpu-neon.patch      | 29 ----------
 ...heck-for-run-time-NEON-support-by-reading.patch | 67 ----------------------
 ...003-Properly-check-if-proc-cpuinfo-opened.patch | 24 --------
 ...k-if-mfpu-neon-is-available-for-compiling.patch | 47 ---------------
 .../openal/0005-Fix-detection-of-C11-atomics.patch | 53 -----------------
 package/openal/openal.hash                         |  2 +-
 package/openal/openal.mk                           |  2 +-
 7 files changed, 2 insertions(+), 222 deletions(-)

diff --git a/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch b/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
deleted file mode 100644
index 090fdfc..0000000
--- a/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 27916ce3db023454a0295ee63ea196fbc246674c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 6 Sep 2016 22:19:14 +0200
-Subject: [PATCH] Build NEON code with -mfpu=neon
-
-The ARM-specific NEON code needs to be built with -mfpu=neon to avoid
-build failures when a difference FPU is used by default by the
-compiler.
-
-Fixes issue #54.
-
-[Upstream commit: https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d8f15153..d92bbb7d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -767,6 +767,7 @@ IF(HAVE_ARM_NEON_H)
-         SET(HAVE_NEON 1)
-         SET(ALC_OBJS  ${ALC_OBJS} Alc/mixer_neon.c)
-         SET(CPU_EXTS "${CPU_EXTS}, Neon")
-+        SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES COMPILE_FLAGS -mfpu=neon)
-     ENDIF()
- ENDIF()
- IF(ALSOFT_REQUIRE_NEON AND NOT HAVE_NEON)
diff --git a/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch b/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
deleted file mode 100644
index 0f61a27..0000000
--- a/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a52cfc804813aef8e4b304e20cf843fa6907af6c Mon Sep 17 00:00:00 2001
-From: Chris Robinson <chris.kcat@gmail.com>
-Date: Wed, 7 Sep 2016 09:57:40 -0700
-Subject: [PATCH] Check for run-time NEON support by reading /proc/cpuinfo
-
-Less than ideal since documentations warn it may not list 'neon' even if it's
-really supported. However, the "proper" APIs to check for NEON extensions don't
-seem to exist in my toolchain.
-
-[Upstream commit: https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907afc6]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Alc/helpers.c | 34 ++++++++++++++++++++++++++++++++--
- 1 file changed, 32 insertions(+), 2 deletions(-)
-
-diff --git a/Alc/helpers.c b/Alc/helpers.c
-index 9b6c7894..4ffda46c 100644
---- a/Alc/helpers.c
-+++ b/Alc/helpers.c
-@@ -32,6 +32,7 @@
- #include <time.h>
- #include <errno.h>
- #include <stdarg.h>
-+#include <ctype.h>
- #ifdef HAVE_MALLOC_H
- #include <malloc.h>
- #endif
-@@ -232,8 +233,37 @@ void FillCPUCaps(ALuint capfilter)
- #endif
- #endif
- #ifdef HAVE_NEON
--    /* Assume Neon support if compiled with it */
--    caps |= CPU_CAP_NEON;
-+    FILE *file = fopen("/proc/cpuinfo", "rt");
-+    if(file)
-+        ERR("Failed to open /proc/cpuinfo, cannot check for NEON support\n");
-+    else
-+    {
-+        char buf[256];
-+        while(fgets(buf, sizeof(buf), file) != NULL)
-+        {
-+            char *str;
-+
-+            if(strncmp(buf, "Features\t:", 10) != 0)
-+                continue;
-+
-+            TRACE("Got features string:%s\n", buf+10);
-+
-+            str = buf;
-+            while((str=strstr(str, "neon")) != NULL)
-+            {
-+                if(isspace(*(str-1)) && (str[4] == 0 || isspace(str[4])))
-+                {
-+                    caps |= CPU_CAP_NEON;
-+                    break;
-+                }
-+                str++;
-+            }
-+            break;
-+        }
-+
-+        fclose(file);
-+        file = NULL;
-+    }
- #endif
- 
-     TRACE("Extensions:%s%s%s%s%s%s\n",
diff --git a/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch b/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
deleted file mode 100644
index 60a93c0..0000000
--- a/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1 Mon Sep 17 00:00:00 2001
-From: Chris Robinson <chris.kcat@gmail.com>
-Date: Thu, 8 Sep 2016 02:02:09 -0700
-Subject: [PATCH] Properly check if /proc/cpuinfo opened
-
-[Upstream commit: https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Alc/helpers.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Alc/helpers.c b/Alc/helpers.c
-index 4ffda46c..26ed535a 100644
---- a/Alc/helpers.c
-+++ b/Alc/helpers.c
-@@ -234,7 +234,7 @@ void FillCPUCaps(ALuint capfilter)
- #endif
- #ifdef HAVE_NEON
-     FILE *file = fopen("/proc/cpuinfo", "rt");
--    if(file)
-+    if(!file)
-         ERR("Failed to open /proc/cpuinfo, cannot check for NEON support\n");
-     else
-     {
diff --git a/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch b/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
deleted file mode 100644
index 893a6d3..0000000
--- a/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 46b3e1d08ca10e809eb2e20b6371812958b97e1f Mon Sep 17 00:00:00 2001
-From: Chris Robinson <chris.kcat@gmail.com>
-Date: Mon, 12 Sep 2016 11:31:59 -0700
-Subject: [PATCH] Check if -mfpu=neon is available for compiling the NEON mixer
-
-[Upstream commit: https://github.com/kcat/openal-soft/commit/46b3e1d08ca10e809eb2e20b6371812958b97e1f]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d92bbb7d..0d3bb5cd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -364,6 +364,7 @@ SET(SSE_SWITCH "")
- SET(SSE2_SWITCH "")
- SET(SSE3_SWITCH "")
- SET(SSE4_1_SWITCH "")
-+SET(FPU_NEON_SWITCH "")
- IF(NOT MSVC)
-     CHECK_C_COMPILER_FLAG(-msse HAVE_MSSE_SWITCH)
-     IF(HAVE_MSSE_SWITCH)
-@@ -381,6 +382,10 @@ IF(NOT MSVC)
-     IF(HAVE_MSSE4_1_SWITCH)
-         SET(SSE4_1_SWITCH "-msse4.1")
-     ENDIF()
-+    CHECK_C_COMPILER_FLAG(-mfpu=neon HAVE_MFPU_NEON_SWITCH)
-+    IF(HAVE_MFPU_NEON_SWITCH)
-+        SET(FPU_NEON_SWITCH "-mfpu=neon")
-+    ENDIF()
- ENDIF()
- 
- CHECK_C_SOURCE_COMPILES("int foo(const char *str, ...) __attribute__((format(printf, 1, 2)));
-@@ -766,8 +771,11 @@ IF(HAVE_ARM_NEON_H)
-     IF(ALSOFT_CPUEXT_NEON)
-         SET(HAVE_NEON 1)
-         SET(ALC_OBJS  ${ALC_OBJS} Alc/mixer_neon.c)
-+        IF(FPU_NEON_SWITCH)
-+            SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES
-+                                        COMPILE_FLAGS "${FPU_NEON_SWITCH}")
-+        ENDIF()
-         SET(CPU_EXTS "${CPU_EXTS}, Neon")
--        SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES COMPILE_FLAGS -mfpu=neon)
-     ENDIF()
- ENDIF()
- IF(ALSOFT_REQUIRE_NEON AND NOT HAVE_NEON)
diff --git a/package/openal/0005-Fix-detection-of-C11-atomics.patch b/package/openal/0005-Fix-detection-of-C11-atomics.patch
deleted file mode 100644
index c6b9840..0000000
--- a/package/openal/0005-Fix-detection-of-C11-atomics.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 10fee6d71a1f7d6e6319005196562b4a30b4e8ff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Feb 2016 14:58:52 +0100
-Subject: [PATCH] Fix detection of C11 atomics
-
-Currently, the CMakeLists.txt logic to detect the availability of C11
-atomics is based on building a small program that uses the
-atomic_load().
-
-However, atomic_load() does not need to use any function from
-libatomic (part of the gcc runtime). So even if libatomic is missing,
-this test concludes that C11 atomic support is available. For example
-on SPARC, the example program builds fine without linking to
-libatomic, but calling other functions of the atomic_*() APIs fail
-without linking to libatomic.
-
-So, this patch adjusts the CMakeLists.txt test to use a function that
-is known to require the libatomic run-time library (on architectures
-where it is needed). This way, openal will only use the __atomic_*()
-built-ins when they are actually functional.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5784d35..a53f996 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -209,14 +209,17 @@ CHECK_C_SOURCE_COMPILES(
- HAVE_C11_ALIGNAS)
- 
- # Check if we have C11 _Atomic
-+set(OLD_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES})
-+set(CMAKE_REQUIRED_LIBRARIES ${EXTRA_LIBS})
- CHECK_C_SOURCE_COMPILES(
- "#include <stdatomic.h>
-- const int _Atomic foo = ATOMIC_VAR_INIT(~0);
-+ int _Atomic foo = ATOMIC_VAR_INIT(~0);
-  int main()
-  {
--     return atomic_load(&foo);
-+     return atomic_fetch_add(&foo, 2);
-  }"
- HAVE_C11_ATOMIC)
-+set(CMAKE_REQUIRED_LIBRARIES ${OLD_REQUIRED_LIBRARIES})
- 
- # Add definitions, compiler switches, etc.
- INCLUDE_DIRECTORIES("${OpenAL_SOURCE_DIR}/include" "${OpenAL_BINARY_DIR}")
--- 
-2.6.4
-
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 260f1b7..cb2586a 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-soft-1.17.2.tar.bz2
+sha256	4433b1391c61a7ca36d82c946c8f0ffe410569d6437e4ce72b3547aaf966ecde	openal-soft-1.18.0.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 55bf544..207526a 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.17.2
+OPENAL_VERSION = 1.18.0
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
