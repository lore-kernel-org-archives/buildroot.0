From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 22 Feb 2016 10:22:45 +0000
Subject: [Buildroot] [PATCH v2] perf: append endianness argument to ld when
	building for MIPS
Message-ID: <1456136565-6167-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to pass an argument to ld for setting the endianness when
building it for MIPS architecture, otherwise the default one will always
be used (which is big endian) and the compilation for little endian will
always fail showing an error like this one:

LD    foo.o
mips-linux-gnu-ld: foo.o: compiled for a little endian system and target
is big endian

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Simplify the logic of the ifeq block.

 linux/linux-tool-perf.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 07c3514..1070a1c 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -27,6 +27,19 @@ PERF_MAKE_FLAGS = \
 	WERROR=0 \
 	ASCIIDOC=
 
+# We need to pass an argument to ld for setting the endianness when
+# building it for MIPS architecture, otherwise the default one will
+# always be used (which is big endian) and the compilation for little
+# endian will always fail showing an error like this one:
+#  LD    foo.o
+# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
+# target is big endian
+ifeq ($(BR2_mips)$(BR2_mips64),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EB"
+else ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EL"
+endif
+
 # The call to backtrace() function fails for ARC, because for some
 # reason the unwinder from libgcc returns early. Thus the usage of
 # backtrace() should be disabled in perf explicitly: at build time
-- 
2.4.10
