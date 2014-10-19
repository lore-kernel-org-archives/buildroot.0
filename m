From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:24:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/findutils: Fix compile error
Message-ID: <1413735882-8865-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error occured with an allyespackageconfig setup:

/home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -std=gnu99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -g2   -o find ftsfind.o ./libfindtools.a ../lib/libfind.a ../gnulib/lib/libgnulib.a -lintl  -lm -lm
../gnulib/lib/libgnulib.a(getdate.o): In function `get_date':
getdate.c:(.text+0x15cd): undefined reference to `rpl_mktime'
getdate.c:(.text+0x168e): undefined reference to `rpl_mktime'
getdate.c:(.text+0x1707): undefined reference to `rpl_mktime'
getdate.c:(.text+0x1812): undefined reference to `rpl_mktime'
collect2: error: ld returned 1 exit status
make[3]: *** [find] Error 1
make[3]: Leaving directory `/home/fli4l/br5/output/build/findutils-4.4.2/find'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/findutils/findutils.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index d9b6050..3caedf8 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,6 +9,7 @@ FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPLv3+
 FINDUTILS_LICENSE_FILES = COPYING
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
+			ac_cv_func_working_mktime=yes \
 			gl_cv_func_wcwidth_works=yes
 
 $(eval $(autotools-package))
-- 
1.7.10.4
