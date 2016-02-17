From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 Feb 2016 17:07:53 +0000
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
	argument to TARGET_LD for MIPS
Message-ID: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't use a wrapper for ld in Buildroot like we do for gcc, so when
using ld for linking (instead of gcc) the process can fail if the
appropriate arguments are not passed to it. For instance, this happens
when building perf (Linux -> Linux Kernel Tools -> perf) for MIPS little
endian, and this is how the error message looks like:

 LD    /br/output/build/perf-custom/fd/libapi-in.o
/br/output/host/usr/bin/mips-linux-gnu-ld:
/br/output/build/perf-custom/fd/array.o: compiled for a little endian
system and target is big endian

In this case the linker is called without passing any argument to
indicate the endianness, so the default one is used, which is big endian
and therefore the process fails because the object files were built for
little endian instead.

This patch doesn't fix the problem in perf. It just appends the right
endianness argument (-EL or -EB) to the TARGET_LD variable when building
for MIPS architecture.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Makefile.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dd595e2..8422b96 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -190,6 +190,19 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
+# Append the endianness argument to ld for MIPS architecture in order to
+# avoid problems like this one when using ld instead of gcc for linking:
+# mips-linux-gnu-ld: failed to merge target specific data of file foo.o
+# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
+# target is big endian
+ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+ifeq ($(BR2_ENDIAN),"BIG")
+TARGET_LD += -EB
+else
+TARGET_LD += -EL
+endif
+endif
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 STRIP_STRIP_UNNEEDED := --strip-unneeded
-- 
2.4.10
