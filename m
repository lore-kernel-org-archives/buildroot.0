From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 22:03:49 +0200
Subject: [Buildroot] [git commit] package/sofia-sip: fix build without
 openssl
Message-ID: <20200913201714.899B882724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97759dbc263a13e67a1fcff851c7d73522b95833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HTTP-related modules are enabled by default and depend on openssl since
https://github.com/freeswitch/sofia-sip/commit/5b4103a12596ea01b4cdbb21b75826a085d557aa

Fixes:
 - http://autobuild.buildroot.org/results/95b6c489fed07d6fe626200ea057c83756d54deb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sofia-sip/sofia-sip.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 0ce0340d87..ef1b35fa2c 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -20,10 +20,14 @@ SOFIA_SIP_CONF_OPTS += --without-glib
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SOFIA_SIP_CONF_OPTS += --with-openssl=pkg-config
+SOFIA_SIP_CONF_OPTS += \
+	--enable-nth \
+	--with-openssl=pkg-config
 SOFIA_SIP_DEPENDENCIES += openssl
 else
-SOFIA_SIP_CONF_OPTS += --without-openssl
+SOFIA_SIP_CONF_OPTS += \
+	--disable-nth \
+	--without-openssl
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
