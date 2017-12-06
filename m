From: Mario Lang <mlang@blind.guru>
Date: Wed,  6 Dec 2017 12:09:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: Install default config and
 systemd .service file
Message-ID: <20171206110906.18712-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/tor/tor.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6a42dbce53..690772f5c0 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -47,4 +47,16 @@ endif
 # uses gnu extensions
 TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+define TOR_INSTALL_CONF
+	$(INSTALL) -D -m 644 $(@D)/src/config/torrc.minimal \
+		$(TARGET_DIR)/etc/tor/torrc
+endef
+
+TOR_POST_INSTALL_TARGET_HOOKS += TOR_INSTALL_CONF
+
+define TOR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 664 $(@D)/contrib/dist/tor.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tor.service
+endef
+
 $(eval $(autotools-package))
-- 
2.15.0
