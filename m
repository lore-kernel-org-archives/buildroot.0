From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 23:27:12 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: new package
Message-ID: <20121228223037.170979A505@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e0b900c72bce75a3f86306d0aae79e9655a4753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We just need the transponders data, so we just install those.

[Peter: rework install step]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dvb-apps/dvb-apps.mk |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
new file mode 100644
index 0000000..721fbf0
--- /dev/null
+++ b/package/dvb-apps/dvb-apps.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# dvb-apps
+#
+#############################################################
+
+DVB_APPS_VERSION        = 3fc7dfa68484
+DVB_APPS_SOURCE         = dvb-apps-$(DVB_APPS_VERSION).tar.bz2
+DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps/archive/
+
+# We just install the transponders data. As this is not a 'work' as per
+# traditional copyright, but just a collection of 'facts', there's probably
+# no license to apply to these data files.
+# To be noted however, is that the dvb-apps package bundles a copy of the
+# GPLv2 and a copy of the LGPLv2.1, and that some of the source files refer
+# to either the GPLv2+ or the LGPLv2.1+.
+# But since we do not use any of those source files, their license do not
+# apply to us.
+DVB_APPS_LICENSE        = unknown (probably public domain)
+
+define DVB_APPS_INSTALL_TARGET_CMDS
+	for i in atsc dvb-c dvb-s dvb-t; do \
+		mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/$$i; \
+		$(INSTALL) $(@D)/util/scan/$$i/* $(TARGET_DIR)/usr/share/dvb-apps/scan/$$i; \
+	done
+endef
+
+$(eval $(generic-package))
