From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 13:08:38 +0200
Subject: [Buildroot] [PATCH] strongswan: fix build failure when host ==
	target architecture
Message-ID: <1377860918-15176-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/strongswan/strongswan.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.8.1.2
