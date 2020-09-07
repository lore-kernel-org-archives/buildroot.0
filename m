From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  7 Sep 2020 22:24:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: disable mpers support
Message-ID: <20200907202410.12228-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On aarch64 With the config option "--enable-mpers=check" the configure.ac
script searchs for a 32bit compiler. When a matching compiler is found
in the PATH some compatiblity checks are done. This can fail when the
available kernel headers on host and buildroot target does not match.

Since buildroot does not support 32bit binaries when building for 64bit
architecture (no -m32 option) we can disable this option unconditionally.

When disabling unconditionally also the configuration for toolchain using
MUSL can be removed.

Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/strace/strace.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 8403e09cbd..50e6d90a87 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -9,15 +9,7 @@ STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
-STRACE_CONF_OPTS = --enable-mpers=check
-
-# strace bundle some kernel headers to build libmpers, this mixes userspace
-# headers and kernel headers which break the build with musl.
-# The stddef.h from gcc is used instead of the one from musl.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-STRACE_CONF_OPTS += st_cv_m32_mpers=no \
-	st_cv_mx32_mpers=no
-endif
+STRACE_CONF_OPTS = --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
-- 
2.20.1
