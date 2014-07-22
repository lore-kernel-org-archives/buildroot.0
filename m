From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 22 Jul 2014 18:27:58 +0400
Subject: [Buildroot] [PATCH] uclibc: build tests after uClibc libs are
	installed to staging location
Message-ID: <1406039278-19117-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libuClibc is not installed to staging on attempt to build tests following
errors happen:
============
  TEST_LINK termios/ termios
.../host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o: In function `__start':
.../build/uclibc/libc/sysdeps/linux/arc/crt1.S:53: undefined reference to `__uClibc_main'
termios.o: In function `main':
.../build/uclibc/test/termios/termios.c:13: undefined reference to `printf'
.../build/uclibc/test/termios/termios.c:14: undefined reference to `printf'
.../build/uclibc/test/termios/termios.c:16: undefined reference to `stdout'
.../build/uclibc/test/termios/termios.c:16: undefined reference to `fileno'
.../build/uclibc/test/termios/termios.c:16: undefined reference to `ioctl'
.../build/uclibc/test/termios/termios.c:19: undefined reference to `perror'
.../build/uclibc/test/termios/termios.c:21: undefined reference to `printf'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `memcpy'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `malloc'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `abort'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `calloc'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `dl_iterate_phdr'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `realloc'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `memset'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `strlen'
.../host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/lib/libgcc_s.so.1: undefined reference to `free'
collect2: error: ld returned 1 exit status
make[3]: *** [termios] Error 1
============

And the simplest solution is to build tests right before installation in
UCLIBC_INSTALL_TARGET_CMDS which follows UCLIBC_INSTALL_STAGING_CMDS so
all required libs are in place.

Interesting note - if one enables uClibc tests after initial full buildroot
build mentioned errors don't happen. This is because uClibc libc libs are
already installed to staging. That's why I didn't noticed this problem before.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b7c5051..d5be938 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -506,7 +506,6 @@ define UCLIBC_BUILD_CMDS
 	$(MAKE) -C $(@D)/utils \
 		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" hostutils
-	$(UCLIBC_BUILD_TEST_SUITE)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
@@ -536,6 +535,7 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
+	$(UCLIBC_BUILD_TEST_SUITE)
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
-- 
1.9.3
