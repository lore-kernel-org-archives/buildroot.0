From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 17 May 2018 09:21:39 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/exim: remove libnsl linking and
 fix native tools build
Message-ID: <20180517072140.6432-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc now considers its built-in libnsl as being obsolete, and requires
passing --enable-obsolete-libnsl to have it built and installed. libnsl
is now provided as a separate project [1], but it isn't packaged yet in
Buildroot.

In preparation for dropping --enable-obsolete-libnsl from the glibc
package, this commit ensures that exim doesn't use libnsl. It was
already the case for uclibc and musl toolchains, so this commit simply
extends that to make sure libnsl is also not used with glibc toolchains.

Only Exim's nis.so and nisplus.so lookup modules require libnsl,
but they are not build by default. So we can safely remove -lnsl
from the Makefile-Linux. If someone want these modules, a new libnsl
package must be added first to provide nsl library.

This also fixes the following build error on recent distributions where
libnsl is not installed (e.g. Fedora 28 which has switched to the new
libnsl library that brings IPV6 support. [2]):

  /bin/sh ../scripts/Configure-os.c
  /usr/bin/gcc buildconfig.c
  /usr/bin/ld: cannot find -lnsl
  collect2: error: ld returned 1 exit status

This happens while exim builds a host tool named buildconfig. The build
is done in build-br/Makefile, which in turn is assembled by
concatenating together several makefiles, including OS/Makefile-Linux.
So the buildconfig tool will be built with the same $(LIBS) as the
target executables, including -lnsl. Removing -lnsl also fixes building
buildconfig since it does not need libnsl.

Fixes:
http://autobuild.buildroot.net/results/a362dfef9e5187931431000c54f03f841d17c847

[1] https://github.com/thkukuk/libnsl.git
[2] https://fedoraproject.org/wiki/Changes/NISIPv6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
v3: Also comment the buildconfig build issue on the host with Fedora 28 (Luca)
    Add a comment about this issue in exim.mk
---
 package/exim/exim.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 37eab501a4..f258ac2753 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,13 +72,17 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# only glibc provides libnsl, remove -lnsl for all other toolchains
+# Only Exim's nis.so and nisplus.so lookup modules require libnsl,
+# but they are not build by default.
+# libnsl has been deprecated from Glibc and no other libc provide it.
+# There is no libnsl package in Buildroot yet.
+# Remove -lnsl for all toolchains.
 # http://bugs.exim.org/show_bug.cgi?id=1564
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+# This also fixes a host build issue on recent distributions where
+# libnsl is not installed by default.
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
 endef
-endif
 
 # musl does not provide struct ip_options nor struct ip_opts (but it is
 # available with both glibc and uClibc)
-- 
2.14.3
