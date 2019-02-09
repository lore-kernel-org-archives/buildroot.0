From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Feb 2019 17:18:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: fix static build
Message-ID: <20190209161812.30610-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A static build fails at configure

checking for SSL_SESSION_get_master_key... no

This activates code incompatible with libopenssl in tortls_internal.h
which leads to a build error:

In file included from src/lib/tls/tortls_openssl.c:61:0:
./src/lib/tls/tortls_internal.h:48:8: error: conflicting types for
 'SSL_SESSION_get_master_key'
 size_t SSL_SESSION_get_master_key(struct ssl_session_st *s,

The configure check fails because libz is not used for linking:
http://autobuild.buildroot.net/results/ad2/ad213cc1c2fb1849e8b46223be6d159fa3dcddc8//tor-0.3.5.7/config.log

/data/buildroot/buildroot-test/instance-0/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
c_zlib.c:(.text+0x40): undefined reference to `inflate'

This patch add -lz when needed and fixes

http://autobuild.buildroot.net/results/ad2/ad213cc1c2fb1849e8b46223be6d159fa3dcddc8/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 99568fe1b2..98ab246171 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -24,6 +24,7 @@ TOR_CONF_OPTS += \
 	--enable-static-openssl \
 	--enable-static-tor \
 	--enable-static-zlib
+TOR_LIBS += -lz
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
@@ -48,8 +49,9 @@ endif
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-TOR_CONF_ENV += LIBS=-latomic
+TOR_LIBS += -latomic
 endif
+TOR_CONF_ENV += LIBS="$(TOR_LIBS)"
 
 define TOR_INSTALL_CONF
 	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
-- 
2.20.1
