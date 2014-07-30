From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 30 Jul 2014 16:32:21 +0400
Subject: [Buildroot] [PATCH] openssh: disable PIE when building for ARC
Message-ID: <1406723541-28499-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build failure reported here:
http://autobuild.buildroot.net/results/262/26218e028f3d2c77c5192b45154627f08384b688/

uClibc toolchain for ARC doesn't support PIE

Attempt to build anything with "-pie" option lead to linker failure:

arc-buildroot-linux-uclibc-gcc -pie test.c
ld: ../4.8-r3/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: warning: unresolvable relocation against symbol `__uClibc_main' from .text section
ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section
ld: ../4.8-r3/bin/../lib/gcc/arc-buildroot-linux-uclibc/4.8.0/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section

In its turn this behavior confuses configure script of openssh so some options
get set improperly. In particular "strnvis" gets determined as existing which
causes failure during compilation:

log.c:67:25: error: 'VIS_SAFE' undeclared (first use in this function)
 #define LOG_STDERR_VIS (VIS_SAFE|VIS_OCTAL)

With disabled PIE ("--without-pie") openssh gets built without issues.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
---
 package/openssh/openssh.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index e55f5eb..268498a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,6 +12,11 @@ OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
+# uClibc toolchain for ARC doesn't support PIE at the moment
+ifeq ($(BR2_arc),y)
+OPENSSH_CONF_OPT += --without-pie
+endif
+
 OPENSSH_DEPENDENCIES = zlib openssl
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-- 
1.9.3
