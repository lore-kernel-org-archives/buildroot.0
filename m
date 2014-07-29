From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:41:01 +0200
Subject: [Buildroot] [git commit] uclibc: build tests after uClibc libs are
	installed to staging location
Message-ID: <20140729214107.4E6339D321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51e3820ff1548a936e624c07465c45a280e41e45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0c04033..2620a33 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -480,7 +480,6 @@ define UCLIBC_BUILD_CMDS
 	$(MAKE) -C $(@D)/utils \
 		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" hostutils
-	$(UCLIBC_BUILD_TEST_SUITE)
 endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
@@ -510,6 +509,7 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
+	$(UCLIBC_BUILD_TEST_SUITE)
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
