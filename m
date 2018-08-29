From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 Aug 2018 18:53:12 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: do not use static version of
 openssl
Message-ID: <20180829165312.22948-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the dependency on mosquitto, domoticz depends on !BR2_STATIC_LIBS
so set USE_OPENSSL_STATIC to OFF (default value is ON)

This could fix this non reproducible failure:
 - http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366

Indeed, domoticz finds the static version of openssl:

-- Found OpenSSL:
/home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a (found version "1.0.2p")
-- OPENSSL_LIBRARIES:
/home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a;/home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a

But fails to link with the shared version:

/home/test/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/6.4.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
CMakeFiles/domoticz.dir/hardware/plugins/PluginTransports.cpp.o: undefined reference to symbol 'SSL_get_error'
/home/test/autobuild/run/instance-0/output/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.so.1.0.0: error adding symbols: DSO missing from command line

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 3d6cae4746..7f094d0976 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -19,8 +19,10 @@ DOMOTICZ_DEPENDENCIES = \
 	zlib
 
 # Due to the dependency on mosquitto, domoticz depends on
-# !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
-DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
+# !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
+DOMOTICZ_CONF_OPTS += \
+	-DUSE_STATIC_BOOST=OFF \
+	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
 # lua, sqlite and mqtt
-- 
2.14.1
