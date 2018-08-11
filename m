From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 20:55:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iperf3: fix openssl detection
Message-ID: <20180811185519.29273-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Searching for openssl uses the AC_ARG_WITH macro:

https://github.com/esnet/iperf/blob/master/config/ax_check_openssl.m4#L40

Pkgconf is only used when --with-openssl is not used at all as
configure parameter because it was placed in the "action-if-not-given"
part of the AC_ARG_WITH macro:
https://github.com/esnet/iperf/blob/master/config/ax_check_openssl.m4#L52

The current CONF_OPTS contain --with-openssl which causes OPENSSL_LIBS
not be filled by pkgconf but with default values "-lssl -lcrypto":
https://github.com/esnet/iperf/blob/master/config/ax_check_openssl.m4#L82

This breaks openssl detection for static builds because -lz is missing:
http://autobuild.buildroot.net/results/ba5/ba56d132c5994486066c304fa1f3872bb0f3ee32//iperf3-3.6/config.log

/home/buildroot/build/instance-0/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o):
 In function `zlib_stateful_expand_block':
  c_zlib.c:(.text+0x54): undefined reference to `inflate'

This patch removes --with-openssl and adds host-pkgconf as dependency
to let the configure script auto-detect openssl, this fixes

http://autobuild.buildroot.net/results/ba5/ba56d132c5994486066c304fa1f3872bb0f3ee32/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iperf3/iperf3.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 0080bd8c6c..e033af13e1 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -13,8 +13,7 @@ IPERF3_LICENSE_FILES = LICENSE
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-IPERF3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-IPERF3_DEPENDENCIES += openssl
+IPERF3_DEPENDENCIES += host-pkgconf openssl
 else
 IPERF3_CONF_OPTS += --without-openssl
 endif
-- 
2.18.0
