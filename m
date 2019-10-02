From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Oct 2019 06:26:23 +0200
Subject: [Buildroot] [PATCH 1/4] package/gzip: fix static build on ARM
 Cortex-M
Message-ID: <20191002042626.26676-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see
http://lists.busybox.net/pipermail/buildroot/2019-June/253203.html

Fixes:
http://autobuild.buildroot.net/results/00f/00f8c2da84c069c960f6db3314a05e3230c1b658/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gzip/gzip.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 17b27b497c..885050cee8 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -21,5 +21,11 @@ HOST_GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 #  "using /bin/sh, even though it may have file descriptor bugs"
 GZIP_CONF_ENV += ac_cv_path_shell=/bin/sh
 
+# workaround for elf2flt bug
+# https://github.com/uclinux-dev/elf2flt/issues/11
+ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_STATIC_LIBS),yy)
+GZIP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
