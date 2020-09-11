From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:31:32 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/strace: disable
 mpers support
Message-ID: <20200911212517.A791382233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42d1ad55010ee4abedd44a3b8bc15137714ce4c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bae614258259289671c4b6e46564bbb88c972b26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ec88690f24..5098663201 100644
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
