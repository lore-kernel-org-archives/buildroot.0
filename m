From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:23:16 +0100
Subject: [Buildroot] [git commit] package/freerdp: Always install key and
	certificate
Message-ID: <20150302222722.9C08C8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ab4692407710dbf382dd643513ddef5a61338b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the keys are only installed if the server is enabled.

However, other packages (e.g. weston) may implement an RDP server,
using the FreeRDP library.

So, we must always install the key and certificate.

Install them world-readable so non-root users may start an RDP server
without requiring to generate their own keys.

Add a comment in the help text about key and certificate management.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in  |    6 ++++++
 package/freerdp/freerdp.mk |   23 ++++++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 47fd8be..1c203c7 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -10,6 +10,12 @@ config BR2_PACKAGE_FREERDP
 
 	  http://www.freerdp.com/
 
+	  Note: this also installs a key and certificate in
+	  /etc/freerdp/keys/ . These are publicly-known, as they
+	  are present in FreeRDP's source tree. It is strongly
+	  suggested that you overwrite them with your own set,
+	  either in an overlay rootfs or in a post-build script.
+
 if BR2_PACKAGE_FREERDP
 
 config BR2_PACKAGE_FREERDP_SERVER
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 50b8f18..f73bdd7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -71,15 +71,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
 FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
-# Install the server key and certificate, so that a client can connect.
-# A user can override them with its own in a post-build script, if needed.
-define FREERDP_INSTALL_KEYS
-	$(INSTALL) -D $(@D)/server/X11/server.key \
-		      $(TARGET_DIR)/etc/freerdp/keys/server.key
-	$(INSTALL) -D $(@D)/server/X11/server.crt \
-		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
-endef
-FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
 else
 FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
 endif
@@ -178,4 +169,18 @@ FREERDP_CONF_OPTS += -DWITH_X11=OFF
 
 endif # ! SERVER && ! CLIENT
 
+# Install the server key and certificate, so that a client can connect.
+# A user can override them with its own in a post-build script, if needed.
+# We install them even if the server is not enabled, since another server
+# can be built and linked with libfreerdp (e.g. weston with the  RDP
+# backend). Key and cert are installed world-readable, so non-root users
+# can start a server.
+define FREERDP_INSTALL_KEYS
+	$(INSTALL) -m 0644 -D $(@D)/server/X11/server.key \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.key
+	$(INSTALL) -m 0644 -D $(@D)/server/X11/server.crt \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
+
 $(eval $(cmake-package))
