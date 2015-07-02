From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  2 Jul 2015 23:26:32 +0200
Subject: [Buildroot] [PATCH v1] libv4l: fix uclibc-ng configure/compile
In-Reply-To: <1435872392-21648-1-git-send-email-ps.report@gmx.net>
References: <1435872392-21648-1-git-send-email-ps.report@gmx.net>
Message-ID: <1435872392-21648-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With raspberrypi_defconfig:

  libv4l2rds.c:256:2: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
    for (int i = 0; i < tuning->station_cnt; i++) {
    ^
  libv4l2rds.c:256:2: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

From build/libv4l-1.6.2/config.log:

configure:4709: checking for .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to accept ISO C99
configure:4858: .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:54:9: error: unknown type name 'wchar_t'
   const wchar_t *name;

The C99 detection problem seems more related to missing wchar_t type support than the compiler option?

Adding LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=c99' gives a lot of compile errors like:

libv4lconvert.c: In function 'dev_ioctl':
processing/../libv4lsyscall-priv.h:85:10: error: 'SYS_ioctl' undeclared (first use in this function)
  syscall(SYS_ioctl, (int)(fd), (unsigned long)(cmd), (void *)(arg))
          ^
libv4lconvert.c:43:9: note: in expansion of macro 'SYS_IOCTL'
  return SYS_IOCTL(fd, cmd, arg);
         ^
processing/../libv4lsyscall-priv.h:85:10: note: each undeclared identifier is reported only once for each function it appears in
  syscall(SYS_ioctl, (int)(fd), (unsigned long)(cmd), (void *)(arg))
          ^
libv4lconvert.c:43:9: note: in expansion of macro 'SYS_IOCTL'
  return SYS_IOCTL(fd, cmd, arg);
         ^

Adding LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' solves all configure/compile errors.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Would vote for not applying this patch, maybe theres a better solution...
---
 package/libv4l/libv4l.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b1c783d..edb2a36 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -11,6 +11,9 @@ LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
+# fix uclibc-ng configure/compile
+LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
 # v4l-utils components have different licences, see v4l-utils.spec for details
 LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
-- 
2.1.4
