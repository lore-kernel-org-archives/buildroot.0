From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:28:33 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] pulseaudio: remove the
 ConsoleKit module
Message-ID: <20171227223843.693D78376D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9c2e2ba62a2507431fce5fc058c4f3a3cd46cca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

The ConsoleKit module is loaded by default from the default.pa
configuration file, but its initialization fails because Buildroot has
no ConsoleKit package yet. This breaks per-user pulseaudio daemon.
The default.pa configuration load module-console-kit only when it
exists. Remove module-console-kit to fix pulseaudio per-user startup.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 64dab3c67256e5373eaf4d5e5d6f3f29602b6587)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b021fc9..a30d540 100644
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
