From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:33:33 +0100
Subject: [Buildroot] [git commit] package/dropbear: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
Message-ID: <20181231132916.6406381522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7f3f462c526e51698b6d63284e80ad24c044c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use the configuration option $(BR2_SYSTEM_DEFAULT_PATH) to set the
default PATH in dropbear sessions.

$(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
quoted, which is exactly what we want.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/dropbear.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7b1468cfb1..a5a8243bd4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -81,6 +81,12 @@ define DROPBEAR_DISABLE_STANDALONE
 	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
 endef
 
+define DROPBEAR_CUSTOM_PATH
+	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
+endef
+
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
+
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
