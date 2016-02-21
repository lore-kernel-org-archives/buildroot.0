From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:39:10 +0100
Subject: [Buildroot] [git commit] package/libeXosip2: add optional support
	for c-ares
Message-ID: <20160221133955.F30C080415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88b756986a46340603676397383a07cf5580101f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When c-ares was compiled before, libeXosip2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/sip_reg | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcares.so.2]
[...]

The build system offers no option to en-/disable c-ares support:
http://git.savannah.gnu.org/cgit/exosip.git/tree/configure.in?h=exosip-3.X.X#n208

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
