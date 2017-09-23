From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add support for PRI
	signalling
Message-ID: <20170923171328.499F98103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef84afa8d61c103a2297824b1f92757b57590eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 20ae502..02d0f29 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -81,7 +81,6 @@ ASTERISK_CONF_OPTS = \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-pri \
 	--without-pwlib \
 	--without-resample \
 	--without-sdl \
@@ -197,6 +196,13 @@ ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
 ASTERISK_DEPENDENCIES += dahdi-linux dahdi-tools
 ASTERISK_CONF_OPTS += --with-dahdi --with-tonezone
 
+ifeq ($(BR2_PACKAGE_LIBPRI),y)
+ASTERISK_DEPENDENCIES += libpri
+ASTERISK_CONF_OPTS += --with-pri
+else
+ASTERISK_CONF_OPTS += --without-pri
+endif # PRI
+
 ifeq ($(BR2_PACKAGE_LIBSS7),y)
 ASTERISK_DEPENDENCIES += libss7
 ASTERISK_CONF_OPTS += --with-ss7
@@ -205,7 +211,9 @@ ASTERISK_CONF_OPTS += --without-ss7
 endif # SS7
 
 else
-ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone --without-ss7
+ASTERISK_CONF_OPTS += \
+	--without-dahdi --without-tonezone \
+	--without-pri --without-ss7
 endif # DAHDI
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
