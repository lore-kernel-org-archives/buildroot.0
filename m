From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 21:59:44 +0200
Subject: [Buildroot] [git commit] package/sofia-sip: fix static build with
 openssl
Message-ID: <20200913201714.7C1A38816B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=090dc1d6cb6e37195f52d63f54a4f585d5f95ac7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --with-openssl=pkg-config otherwise sofia-sip will fail to retrieve
openssl dependencies resulting in the following build failure:

/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_type_ws.o): in function `tport_ws_deinit_primary':
tport_type_ws.c:(.text+0x2c): undefined reference to `SSL_CTX_free'
/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_type_ws.o): in function `tport_ws_init_primary_secure':

pkg-config option has been added to freeswitch sofia-sip since 2007 and
https://github.com/freeswitch/sofia-sip/commit/044ac9d8fa7e840cf3e38c3fa7f8cacd0d21b3ea

Fixes:
 - http://autobuild.buildroot.org/results/8a0c9dbad74a3b358f90c7a3b56b638c4bdb8045

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sofia-sip/sofia-sip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 54b48a7048..0ce0340d87 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -20,7 +20,7 @@ SOFIA_SIP_CONF_OPTS += --without-glib
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SOFIA_SIP_CONF_OPTS += --with-openssl
+SOFIA_SIP_CONF_OPTS += --with-openssl=pkg-config
 SOFIA_SIP_DEPENDENCIES += openssl
 else
 SOFIA_SIP_CONF_OPTS += --without-openssl
