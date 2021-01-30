From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 14:32:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/zeromq: disable libbsd on static
 build
Message-ID: <20210130133201.2334604-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static linking with libbsd fails because of multiple definition of the
strlcpy symbol. uClibc optionally provides these symbols.

So disable libbsd on zeromq when linking statically to avoid the
following build failure with bitcoin and zeromq:

  CXXLD    bitcoind
/tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib//libc.a(strlcpy.os): in function `__GI_strlcpy':
strlcpy.c:(.text+0x0): multiple definition of `strlcpy'; /tmp/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libbsd.a(strlcpy.o):strlcpy.c:(.text+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/ba87544d42ad5e77a27a7a504bc6336a06f6e291

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 182699403c..495f1aa5a3 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -68,7 +68,7 @@ else
 ZEROMQ_CONF_OPTS += --without-tls
 endif
 
-ifeq ($(BR2_PACKAGE_LIBBSD),y)
+ifeq ($(BR2_PACKAGE_LIBBSD):$(BR2_STATIC_LIBS),y:)
 ZEROMQ_DEPENDENCIES += host-pkgconf libbsd
 ZEROMQ_CONF_OPTS += --enable-libbsd
 else
-- 
2.29.2
