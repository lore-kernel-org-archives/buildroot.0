From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:17:11 +0200
Subject: [Buildroot] [git commit] package/freeswitch: add optional
	dependency to unixodbc
Message-ID: <20160417201716.A32257FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df15486ef51e61960a5eb68a13ec8b7257ccb9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index c00fc85..6a5a2c6 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -69,7 +69,6 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
 FREESWITCH_CONF_OPTS = \
-	--disable-core-odbc-support \
 	--disable-libvpx \
 	--disable-libyuv \
 	--without-erlang \
@@ -176,4 +175,13 @@ FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+FREESWITCH_DEPENDENCIES += unixodbc
+FREESWITCH_CONF_OPTS += \
+	--enable-core-odbc-support \
+	--with-odbc=$(STAGING_DIR)/usr
+else
+FREESWITCH_CONF_OPTS += --disable-core-odbc-support
+endif
+
 $(eval $(autotools-package))
