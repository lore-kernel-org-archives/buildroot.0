From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 16:18:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/omniorb: add optional support for
	openssl
In-Reply-To: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456067932-12447-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When openssl was compiled before, omniorb will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libomnisslTP4.so.2.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libomniORB4.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libomnithread.so.4]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/omniorb/omniorb.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 1bbde3b..d278adc 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -30,6 +30,13 @@ HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 OMNIORB_CONF_OPTS += --disable-longdouble
 HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OMNIORB_CONF_OPTS += --with-openssl
+OMNIORB_DEPENDENCIES += openssl
+else
+OMNIORB_CONF_OPTS += --without-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 OMNIORB_DEPENDENCIES += zlib
 endif
-- 
2.7.0
