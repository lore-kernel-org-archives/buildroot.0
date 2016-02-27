From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 18:59:34 +0100
Subject: [Buildroot] [git commit] perf: append endianness argument to ld
	when building for MIPS
Message-ID: <20160227180138.B4DEC807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f3a52f981274da2db17500a0908466d6aed83c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to pass an argument to ld for setting the endianness when
building it for MIPS architecture, otherwise the default one will always
be used (which is big endian) and the compilation for little endian will
always fail showing an error like this one:

LD    foo.o
mips-linux-gnu-ld: foo.o: compiled for a little endian system and target
is big endian

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
