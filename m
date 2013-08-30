From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Aug 2013 14:10:50 +0200
Subject: [Buildroot] [git commit] strongswan: fix build failure when host ==
	target architecture
Message-ID: <20130830121222.A1B9B9AD8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb53a09fd51da80ef3f35cbbaf11a8068bbaf38f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The strongswan configure.in uses the AC_LIB_PREFIX macro, which adds
--with-lib-prefix and --without-lib-prefix options, and which, by
default assumes that adding ${prefix}/lib to LDFLAGS and
${prefix}/include to CPPFLAGS is a good idea. Obviously, when
cross-compiling, it is definitely not a good idea.

In the specific case of strongswan, the result is that when testing if
the backtrace() function was available, the small C program was being
built and linked with -L/usr/lib. So when the host architecture and
target architecture are identical, it may find the backtrace()
function in the host C library, without looking at the target C
library:

configure:16457: /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/usr/lib conftest.c  >&5
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: warning: libc.so.0, needed by /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/lib/../lib64/libgcc_s.so, may conflict with libc.so.6

Passing --without-lib-prefix prevents this default behavior from
happening, and no stupid value is added to CPPFLAGS or LDFLAGS.

Fixes:

  http://autobuild.buildroot.net/results/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strongswan/strongswan.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 3444f92..aa63d0d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -11,6 +11,7 @@ STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_CONF_OPT +=                                                             \
+      --without-lib-prefix                                                         \
       --enable-pkcs11=yes                                                          \
       --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
       --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
