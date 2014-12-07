From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:39:31 +0100
Subject: [Buildroot] [PATCH 5/6 v3] package/freerdp: install server key and
	certificate
In-Reply-To: <cover.1417952276.git.yann.morin.1998@free.fr>
References: <cover.1417952276.git.yann.morin.1998@free.fr>
Message-ID: <c356f0fac7be952421a754fc8168ecd3a30b19be.1417952276.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is mandatory for an RDP server to have a key and a certificate,
otherwise clients will refuse to connect to that server.

We install the key and certificate bundled in FreeRDP. The user can
install its own set using a post-build script if needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes v2 -> v3:
  - only install the keys when the server is enabled  (Samuel)
---
 package/freerdp/freerdp.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 67f9960..2fa880f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -48,6 +48,15 @@ endif
 
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
-- 
1.9.1
