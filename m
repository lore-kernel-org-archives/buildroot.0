From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:05:18 +0100
Subject: [Buildroot] [git commit] package/tor: Install default config and
 systemd .service file
Message-ID: <20171206215804.03E6E8286B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=398859e815eae1a90fcc3f35599ad452495d985f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tor/tor.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6a42dbc..925e4d8 100644
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
+	$(INSTALL) -D -m 644 $(@D)/contrib/dist/tor.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tor.service
+endef
+
 $(eval $(autotools-package))
