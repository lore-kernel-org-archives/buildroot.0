From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:53 +0200
Subject: [Buildroot] [PATCH 07/10] package/freerdp: install server key and
	certificate
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <21f6bb06dc7bd3e4efda24924c344a0c5b39b95a.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is mandatory for an RDP server to have a key and a certificate,
otherwise clients will refuse to connect to that server.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3dc257b..9c974b7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -83,4 +83,14 @@ else
 FREERDP_CONF_OPT += -DWITH_XV=OFF
 endif
 
+# Install the server key and certificate, so that a client can connect.
+# A user can override them with its opwn in a post-build script, if needed.
+define FREERDP_INSTALL_KEYS
+	$(INSTALL) -D $(@D)/server/X11/server.key \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.key
+	$(INSTALL) -D $(@D)/server/X11/server.crt \
+		      $(TARGET_DIR)/etc/freerdp/keys/server.crt
+endef
+FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
+
 $(eval $(cmake-package))
-- 
1.9.1
