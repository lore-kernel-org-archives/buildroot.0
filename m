From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 00:00:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: add optional support
	for c-ares
Message-ID: <1456009225-3822-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When c-ares was compiled before, libeXosip2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/sip_reg | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcares.so.2]
[...]

The build system offers no option to en-/disable c-ares support:
http://git.savannah.gnu.org/cgit/exosip.git/tree/configure.in?h=exosip-3.X.X#n208

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libeXosip2/libeXosip2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index d7d0af8..d101f95 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_arc),y)
 LIBEXOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
 endif
 
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBEXOSIP2_DEPENDENCIES += c-ares
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEXOSIP2_DEPENDENCIES += openssl
 LIBEXOSIP2_CONF_OPTS += --enable-openssl
-- 
2.7.0
