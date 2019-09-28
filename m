From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:11:48 +0200
Subject: [Buildroot] [git commit] package/apr: fix compile for toolchains
 without thread support
Message-ID: <20190928211114.032D4826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=500adb477e5bf6f9845cb696b7394f88e9e9acfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not trust apr_hints.m4 for setting '-D_REENTRANT', set it only for
toolchains with thread support.

Fixes misleading configure error ([1]):

  checking whether int64_t and int use fmt %d... no
  checking whether int64_t and long use fmt %ld... no
  checking whether int64_t and long long use fmt %lld... no
  configure: error: could not determine the string function for int64_t

which results from warning (promoted to error by '-Werror=cpp'), from
config.log:

  configure:24288: checking whether int64_t and long long use fmt %lld
  configure:24320: .../host/bin/arm-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
  In file included from .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/sys/types.h:26:0,
                 from conftest.c:147:
  .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
   #   warning requested reentrant code, but thread support was disabled
       ^~~~~~~
  cc1: all warnings being treated as errors
  configure:24320: $? = 1
  configure: failed program was:

[1] http://autobuild.buildroot.net/results/4da73982f160305ac2d5d2b4f615fa98eec5a7a3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apr/apr.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 72008d8998..466222586c 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -14,9 +14,18 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
+# avoid apr_hints.m4 by setting apr_preload_done=yes and set
+# the needed CFLAGS on our own (avoids '-D_REENTRANT' in case
+# not supported by toolchain and subsequent configure failure)
+APR_CFLAGS = $(TARGET_CFLAGS) -DLINUX -D_GNU_SOURCE
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+APR_CFLAGS += -D_REENTRANT
+endif
+
 APR_CONF_ENV = \
 	CC_FOR_BUILD="$(HOSTCC)" \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
+	CFLAGS="$(APR_CFLAGS)" \
 	ac_cv_file__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
@@ -31,7 +40,8 @@ APR_CONF_ENV = \
 	apr_cv_epoll_create1=yes \
 	apr_cv_dup3=yes \
 	apr_cv_sock_cloexec=yes \
-	apr_cv_accept4=yes
+	apr_cv_accept4=yes \
+	apr_preload_done=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
 # Doesn't even try to guess when cross compiling
