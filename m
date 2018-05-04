From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  4 May 2018 23:02:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/exim: remove libnsl linking with
 Glibc.
Message-ID: <20180504210246.29930-1-romain.naour@gmail.com>
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

Note: Fedora 28 has switched to the new libnsl library that bring
IPV6 support. [2]

[1] https://github.com/thkukuk/libnsl.git
[2] https://fedoraproject.org/wiki/Changes/NISIPv6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/exim/exim.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 37eab501a4..586bf3235c 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,13 +72,15 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
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
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
 endef
-endif
 
 # musl does not provide struct ip_options nor struct ip_opts (but it is
 # available with both glibc and uClibc)
-- 
2.14.3
