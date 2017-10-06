From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Oct 2017 22:28:29 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/freeswitch: Use mod_g729 only
	when freeswitch-mod-bcg729 is disabled
In-Reply-To: <20171006202829.431-1-bernd.kuhls@t-online.de>
References: <20171006202829.431-1-bernd.kuhls@t-online.de>
Message-ID: <20171006202829.431-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mod_g729 contained in freeswitch source provides pass-through:
https://freeswitch.org/confluence/display/FREESWITCH/mod_g729

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: added comment (Arnout)
v3: no changes
v2: no changes

 package/freeswitch/freeswitch.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index ce22ffc28f..defa00f47a 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -116,7 +116,6 @@ FREESWITCH_ENABLED_MODULES += \
 	applications/mod_valet_parking \
 	applications/mod_voicemail \
 	codecs/mod_g723_1 \
-	codecs/mod_g729 \
 	dialplans/mod_dialplan_asterisk \
 	dialplans/mod_dialplan_xml \
 	endpoints/mod_loopback \
@@ -175,6 +174,12 @@ FREESWITCH_DEPENDENCIES += alsa-lib
 FREESWITCH_ENABLED_MODULES += endpoints/mod_alsa
 endif
 
+# Use the pass-through g729 module provided by freeswitch instead of
+# the external mod_bcg729 provided by freeswitch-mod-bcg729.
+ifeq ($(BR2_PACKAGE_FREESWITCH_MOD_BCG729),)
+FREESWITCH_ENABLED_MODULES += codecs/mod_g729
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 FREESWITCH_DEPENDENCIES += freetype
 endif
-- 
2.11.0
