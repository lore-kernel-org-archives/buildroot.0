From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 11 Sep 2016 17:49:00 +0200
Subject: [Buildroot] [PATCH 1/2] openal: Use upstream patch to fix FPU
	related build failures
Message-ID: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 .../0002-Build-NEON-code-with-mfpu-neon.patch      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/openal/0002-Build-NEON-code-with-mfpu-neon.patch

diff --git a/package/openal/0002-Build-NEON-code-with-mfpu-neon.patch b/package/openal/0002-Build-NEON-code-with-mfpu-neon.patch
new file mode 100644
index 0000000..0801fba
--- /dev/null
+++ b/package/openal/0002-Build-NEON-code-with-mfpu-neon.patch
@@ -0,0 +1,26 @@
+upstream commit 27916ce3db023454a0295ee63ea196fbc246674c
+Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date:   Tue Sep 6 22:19:14 2016 +0200
+
+    Build NEON code with -mfpu=neon
+
+    The ARM-specific NEON code needs to be built with -mfpu=neon to avoid
+    build failures when a difference FPU is used by default by the
+    compiler.
+
+    Fixes issue #54.
+
+    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d8f1515..d92bbb7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -763,6 +763,7 @@ IF(HAVE_ARM_NEON_H)
+         SET(HAVE_NEON 1)
+         SET(ALC_OBJS  ${ALC_OBJS} Alc/mixer_neon.c)
+         SET(CPU_EXTS "${CPU_EXTS}, Neon")
++        SET_SOURCE_FILES_PROPERTIES(Alc/mixer_neon.c PROPERTIES COMPILE_FLAGS -mfpu=neon)
+     ENDIF()
+ ENDIF()
+ IF(ALSOFT_REQUIRE_NEON AND NOT HAVE_NEON)
-- 
2.7.4
