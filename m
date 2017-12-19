From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Dec 2017 17:12:32 +0200
Subject: [Buildroot] [PATCH] pulseaudio: remove the ConsoleKit module
Message-ID: <b7568fe9d9659520356ec09c58908edd27656a03.1513696352.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ConsoleKit module is loaded by default from the default.pa
configuration file, but its initialization fails because Buildroot has
no ConsoleKit package yet. This breaks per-user pulseaudio daemon.
The default.pa configuration load module-console-kit only when it
exists. Remove module-console-kit to fix pulseaudio per-user startup.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b021fc93a4dd..a30d5401bae2 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -140,11 +140,17 @@ else
 PULSEAUDIO_CONF_OPTS += --disable-x11
 endif
 
+# ConsoleKit module init failure breaks user daemon startup
+define PULSEAUDIO_REMOVE_CONSOLE_KIT
+	rm -f $(TARGET_DIR)/usr/lib/pulse-$(PULSEAUDIO_VERSION)/modules/module-console-kit.so
+endef
+
 define PULSEAUDIO_REMOVE_VALA
 	rm -rf $(TARGET_DIR)/usr/share/vala
 endef
 
-PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
+PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA \
+	PULSEAUDIO_REMOVE_CONSOLE_KIT
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO_DAEMON),y)
 define PULSEAUDIO_USERS
-- 
2.15.1
