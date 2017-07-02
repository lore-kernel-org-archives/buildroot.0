From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] openal: don't download patches from Github
Message-ID: <20170702220304.7E81F81EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50368ac2ab63dff420a99ef2182803466a2b741f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Build-NEON-code-with-mfpu-neon.patch      | 29 ++++++++++
 ...heck-for-run-time-NEON-support-by-reading.patch | 67 ++++++++++++++++++++++
 ...003-Properly-check-if-proc-cpuinfo-opened.patch | 24 ++++++++
 ...k-if-mfpu-neon-is-available-for-compiling.patch | 47 +++++++++++++++
 ...tch => 0005-Fix-detection-of-C11-atomics.patch} |  0
 package/openal/openal.hash                         |  4 --
 package/openal/openal.mk                           |  5 --
 7 files changed, 167 insertions(+), 9 deletions(-)

diff --git a/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch b/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
new file mode 100644
index 0000000..090fdfc
--- /dev/null
+++ b/package/openal/0001-Build-NEON-code-with-mfpu-neon.patch
@@ -0,0 +1,29 @@
+From 27916ce3db023454a0295ee63ea196fbc246674c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 6 Sep 2016 22:19:14 +0200
+Subject: [PATCH] Build NEON code with -mfpu=neon
+
+The ARM-specific NEON code needs to be built with -mfpu=neon to avoid
+build failures when a difference FPU is used by default by the
+compiler.
+
+Fixes issue #54.
+
+[Upstream commit: https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d8f15153..d92bbb7d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -767,6 +767,7 @@ IF(HAVE_ARM_NEON_H)
+         SET(HAVE_NEON 1)
+         SET(ALC_OBJS  ${ALC_OBJS} Alc/mixer_neon.c)
+         SET(CPU_EXTS "${CPU_EXTS}, Neon")
++        SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES COMPILE_FLAGS -mfpu=neon)
+     ENDIF()
+ ENDIF()
+ IF(ALSOFT_REQUIRE_NEON AND NOT HAVE_NEON)
diff --git a/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch b/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
new file mode 100644
index 0000000..0f61a27
--- /dev/null
+++ b/package/openal/0002-Check-for-run-time-NEON-support-by-reading.patch
@@ -0,0 +1,67 @@
+From a52cfc804813aef8e4b304e20cf843fa6907af6c Mon Sep 17 00:00:00 2001
+From: Chris Robinson <chris.kcat@gmail.com>
+Date: Wed, 7 Sep 2016 09:57:40 -0700
+Subject: [PATCH] Check for run-time NEON support by reading /proc/cpuinfo
+
+Less than ideal since documentations warn it may not list 'neon' even if it's
+really supported. However, the "proper" APIs to check for NEON extensions don't
+seem to exist in my toolchain.
+
+[Upstream commit: https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907afc6]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Alc/helpers.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/Alc/helpers.c b/Alc/helpers.c
+index 9b6c7894..4ffda46c 100644
+--- a/Alc/helpers.c
++++ b/Alc/helpers.c
+@@ -32,6 +32,7 @@
+ #include <time.h>
+ #include <errno.h>
+ #include <stdarg.h>
++#include <ctype.h>
+ #ifdef HAVE_MALLOC_H
+ #include <malloc.h>
+ #endif
+@@ -232,8 +233,37 @@ void FillCPUCaps(ALuint capfilter)
+ #endif
+ #endif
+ #ifdef HAVE_NEON
+-    /* Assume Neon support if compiled with it */
+-    caps |= CPU_CAP_NEON;
++    FILE *file = fopen("/proc/cpuinfo", "rt");
++    if(file)
++        ERR("Failed to open /proc/cpuinfo, cannot check for NEON support\n");
++    else
++    {
++        char buf[256];
++        while(fgets(buf, sizeof(buf), file) != NULL)
++        {
++            char *str;
++
++            if(strncmp(buf, "Features\t:", 10) != 0)
++                continue;
++
++            TRACE("Got features string:%s\n", buf+10);
++
++            str = buf;
++            while((str=strstr(str, "neon")) != NULL)
++            {
++                if(isspace(*(str-1)) && (str[4] == 0 || isspace(str[4])))
++                {
++                    caps |= CPU_CAP_NEON;
++                    break;
++                }
++                str++;
++            }
++            break;
++        }
++
++        fclose(file);
++        file = NULL;
++    }
+ #endif
+ 
+     TRACE("Extensions:%s%s%s%s%s%s\n",
diff --git a/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch b/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
new file mode 100644
index 0000000..60a93c0
--- /dev/null
+++ b/package/openal/0003-Properly-check-if-proc-cpuinfo-opened.patch
@@ -0,0 +1,24 @@
+From c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1 Mon Sep 17 00:00:00 2001
+From: Chris Robinson <chris.kcat@gmail.com>
+Date: Thu, 8 Sep 2016 02:02:09 -0700
+Subject: [PATCH] Properly check if /proc/cpuinfo opened
+
+[Upstream commit: https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Alc/helpers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Alc/helpers.c b/Alc/helpers.c
+index 4ffda46c..26ed535a 100644
+--- a/Alc/helpers.c
++++ b/Alc/helpers.c
+@@ -234,7 +234,7 @@ void FillCPUCaps(ALuint capfilter)
+ #endif
+ #ifdef HAVE_NEON
+     FILE *file = fopen("/proc/cpuinfo", "rt");
+-    if(file)
++    if(!file)
+         ERR("Failed to open /proc/cpuinfo, cannot check for NEON support\n");
+     else
+     {
diff --git a/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch b/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
new file mode 100644
index 0000000..893a6d3
--- /dev/null
+++ b/package/openal/0004-Check-if-mfpu-neon-is-available-for-compiling.patch
@@ -0,0 +1,47 @@
+From 46b3e1d08ca10e809eb2e20b6371812958b97e1f Mon Sep 17 00:00:00 2001
+From: Chris Robinson <chris.kcat@gmail.com>
+Date: Mon, 12 Sep 2016 11:31:59 -0700
+Subject: [PATCH] Check if -mfpu=neon is available for compiling the NEON mixer
+
+[Upstream commit: https://github.com/kcat/openal-soft/commit/46b3e1d08ca10e809eb2e20b6371812958b97e1f]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d92bbb7d..0d3bb5cd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -364,6 +364,7 @@ SET(SSE_SWITCH "")
+ SET(SSE2_SWITCH "")
+ SET(SSE3_SWITCH "")
+ SET(SSE4_1_SWITCH "")
++SET(FPU_NEON_SWITCH "")
+ IF(NOT MSVC)
+     CHECK_C_COMPILER_FLAG(-msse HAVE_MSSE_SWITCH)
+     IF(HAVE_MSSE_SWITCH)
+@@ -381,6 +382,10 @@ IF(NOT MSVC)
+     IF(HAVE_MSSE4_1_SWITCH)
+         SET(SSE4_1_SWITCH "-msse4.1")
+     ENDIF()
++    CHECK_C_COMPILER_FLAG(-mfpu=neon HAVE_MFPU_NEON_SWITCH)
++    IF(HAVE_MFPU_NEON_SWITCH)
++        SET(FPU_NEON_SWITCH "-mfpu=neon")
++    ENDIF()
+ ENDIF()
+ 
+ CHECK_C_SOURCE_COMPILES("int foo(const char *str, ...) __attribute__((format(printf, 1, 2)));
+@@ -766,8 +771,11 @@ IF(HAVE_ARM_NEON_H)
+     IF(ALSOFT_CPUEXT_NEON)
+         SET(HAVE_NEON 1)
+         SET(ALC_OBJS  ${ALC_OBJS} Alc/mixer_neon.c)
++        IF(FPU_NEON_SWITCH)
++            SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES
++                                        COMPILE_FLAGS "${FPU_NEON_SWITCH}")
++        ENDIF()
+         SET(CPU_EXTS "${CPU_EXTS}, Neon")
+-        SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES COMPILE_FLAGS -mfpu=neon)
+     ENDIF()
+ ENDIF()
+ IF(ALSOFT_REQUIRE_NEON AND NOT HAVE_NEON)
diff --git a/package/openal/0001-Fix-detection-of-C11-atomics.patch b/package/openal/0005-Fix-detection-of-C11-atomics.patch
similarity index 100%
rename from package/openal/0001-Fix-detection-of-C11-atomics.patch
rename to package/openal/0005-Fix-detection-of-C11-atomics.patch
diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 45f1421..260f1b7 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,6 +1,2 @@
 # Locally calculated
 sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-soft-1.17.2.tar.bz2
-sha256	9c9040269376aba77b1277bbae0f055aee535e14ad4a3ab4e66e39830504e83f	27916ce3db023454a0295ee63ea196fbc246674c.patch
-sha256	4621f6b79d4bbac5ce423f227c92ad1e4f833d7e1f2ff1cc3b5f03721f75b933	a52cfc804813aef8e4b304e20cf843fa6907af6c.patch
-sha256	f442da31b4001a5133f2762a5bc1e780b11d5e2d9f21b257f54695ee6d87d997	c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch
-sha256	3691c1a327b87d5fb487841459fd00d3baaa79808ecb5e3b33b349363663640f	46b3e1d08ca10e809eb2e20b6371812958b97e1f.patch
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 72ebee2..55bf544 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -7,11 +7,6 @@
 OPENAL_VERSION = 1.17.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
-OPENAL_PATCH = \
-	https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c.patch \
-	https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907af6c.patch \
-	https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch \
-	https://github.com/kcat/openal-soft/commit/46b3e1d08ca10e809eb2e20b6371812958b97e1f.patch
 OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
