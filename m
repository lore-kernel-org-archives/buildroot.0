From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 17 Dec 2018 16:51:16 -0800
Subject: [Buildroot] [PATCH 4/4] dropbear: use BR2_SYSTEM_DEFAULT_PATH as
 default PATH
In-Reply-To: <20181218005116.17435-1-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
Message-ID: <20181218005116.17435-5-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use the configuration option BR2_SYSTEM_DEFAULT_PATH to set the
default PATH in dropbear sessions.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/dropbear/dropbear.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7b1468cfb100..7dc5f46bcc81 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -81,6 +81,14 @@ define DROPBEAR_DISABLE_STANDALONE
 	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
 endef
 
+ifneq ($(BR2_SYSTEM_DEFAULT_PATH),"")
+define DROPBEAR_CUSTOM_PATH
+	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
+endef
+
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
+endif
+
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
-- 
2.17.1
