From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  7 Mar 2018 08:59:41 +0200
Subject: [Buildroot] [PATCH] ntp: fix build without SSP support
Message-ID: <ab4e9cb9b31bd917e77118e2f619562556df70e5.1520405981.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In version 4.2.8p11 ntp changed its configure script build hardening
parameter to '--with-hardenfile'. Update the parameter name to avoid
-fstack-protector-all when the toolchain does not support this option.

Fixes:
http://autobuild.buildroot.net/results/60e/60e8b9864932f2cabc7deb43234abe168bd113c5/
http://autobuild.buildroot.net/results/592/592db6836817bb078a2f1146d2ce6241bf7997a3/
http://autobuild.buildroot.net/results/b07/b070fbc66a928888df8d2561dad3632778d55e0d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ntp/ntp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 1f66ad996b8e..b5e2c1e026fe 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -30,9 +30,9 @@ NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
-NTP_CONF_OPTS += --with-locfile=linux
+NTP_CONF_OPTS += --with-hardenfile=linux
 else
-NTP_CONF_OPTS += --with-locfile=default
+NTP_CONF_OPTS += --with-hardenfile=default
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-- 
2.16.1
