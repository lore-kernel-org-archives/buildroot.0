From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Feb 2016 17:23:42 +0000
Subject: [Buildroot] [PATCH] perf: append endianness argument to ld when
	building for MIPS
Message-ID: <1455816222-43031-1-git-send-email-Vincent.Riera@imgtec.com>
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
 linux/linux-tool-perf.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 07c3514..7ad6629 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -27,6 +27,21 @@ PERF_MAKE_FLAGS = \
 	WERROR=0 \
 	ASCIIDOC=
 
+# We need to pass an argument to ld for setting the endianness when
+# building it for MIPS architecture, otherwise the default one will
+# always be used (which is big endian) and the compilation for little
+# endian will always fail showing an error like this one:
+#  LD    foo.o
+# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
+# target is big endian
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+ifeq ($(BR2_ENDIAN),"BIG")
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EB"
+else
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -EL"
+endif
+endif
+
 # The call to backtrace() function fails for ARC, because for some
 # reason the unwinder from libgcc returns early. Thus the usage of
 # backtrace() should be disabled in perf explicitly: at build time
-- 
2.4.10
