From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Dec 2016 11:37:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add optional support for libcap
Message-ID: <20161204103722.29834-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- without libcap
$ host/usr/bin/x86_64-linux-readelf -a target/usr/bin/tor | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

- with libcap
$ host/usr/bin/x86_64-linux-readelf -a target/usr/bin/tor | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

The tor configure script has no option to en-/disable libcap support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 06d05c8..4f33522 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -26,6 +26,10 @@ TOR_CONF_OPTS += \
 	--enable-static-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+TOR_DEPENDENCIES += libcap
+endif
+
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
-- 
2.10.2
