From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:11:05 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: install
	server key and certificate
Message-ID: <20150222111227.425AB7F930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5848e87f5ee90b2a758aaf5ce2392119581313d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is mandatory for an RDP server to have a key and a certificate,
otherwise clients will refuse to connect to that server.

We install the key and certificate bundled in FreeRDP. The user can
install its own set using a post-build script if needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e680e39..37568c0 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -71,6 +71,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREERDP_SERVER),y)
 FREERDP_CONF_OPTS += -DWITH_SERVER=ON -DWITH_SERVER_INTERFACE=ON
+# Install the server key and certificate, so that a client can connect.
+# A user can override them with its own in a post-build script, if needed.
+define FREERDP_INSTALL_KEYS
+	$(INSTALL) -D $(@D)/server/X11/server.key \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.key
+	$(INSTALL) -D $(@D)/server/X11/server.crt \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
 else
 FREERDP_CONF_OPTS += -DWITH_SERVER=OFF -DWITH_SERVER_INTERFACE=OFF
 endif
