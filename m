From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Oct 2017 18:42:27 +0200
Subject: [Buildroot] [git commit] linux-tools/perf: fix build for MIPS by
	using the right emulation on LD
Message-ID: <20171023163650.AC5D78106E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f574a8eba67a38d1e0e681ace57b44acff36310f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing just the endianness flag to LD is not enough. We need to pass
the right emulation flag which will set everything for us, not only the
endianness.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 16f3a58..69492ba 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
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
