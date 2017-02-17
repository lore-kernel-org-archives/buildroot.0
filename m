From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Feb 2017 10:59:05 +0000
Subject: [Buildroot] [PATCH] linux-tools/perf: fix build for MIPS by using
	the right emulation on LD
Message-ID: <20170217105905.32151-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Passing just the endianness flag to LD is not enough. We need to pass
the right emulation flag which will set everything for us, not only the
endianness.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-tools/linux-tool-perf.mk | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk b/package/linux-tools/linux-tool-perf.mk
index 16f3a58..69492ba 100644
--- a/package/linux-tools/linux-tool-perf.mk
+++ b/package/linux-tools/linux-tool-perf.mk
@@ -28,17 +28,25 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1
 
-# We need to pass an argument to ld for setting the endianness when
-# building it for MIPS architecture, otherwise the default one will
-# always be used (which is big endian) and the compilation for little
-# endian will always fail showing an error like this one:
-#  LD    foo.o
-# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
-# target is big endian
-ifeq ($(BR2_mips)$(BR2_mips64),y)
-PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EB"
-else ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
-PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EL"
+# We need to pass an argument to ld for setting the emulation when
+# building for MIPS architecture, otherwise the default one will always
+# be used and the compilation for most variants will fail.
+ifeq ($(BR2_mips),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmip"
+else ifeq ($(BR2_mipsel),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmip"
+else ifeq ($(BR2_mips64),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmipn32"
+else
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64btsmip"
+endif
+else ifeq ($(BR2_mips64el),y)
+ifeq ($(BR2_MIPS_NABI32),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmipn32"
+else
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64ltsmip"
+endif
 endif
 
 # The call to backtrace() function fails for ARC, because for some
-- 
2.10.2
