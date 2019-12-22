From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 15:02:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/jimtcl: add host variant
Message-ID: <20191222140237.2389908-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-jimtcl is needed for host-openocd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jimtcl/jimtcl.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 643a87d5c4..795f20883c 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -78,4 +78,27 @@ define JIMTCL_INSTALL_TARGET_CMDS
 	$(JIMTCL_LINK_TCLSH)
 endef
 
+define HOST_JIMTCL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		CCACHE=none \
+		./configure --prefix=$(HOST_DIR) \
+		--shared \
+	)
+endef
+
+define HOST_JIMTCL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_JIMTCL_INSTALL_CMDS
+	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
+		cp -a $(@D)/$$i $(HOST_DIR)/usr/include/ || exit 1 ; \
+	done;
+	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
+		$(HOST_DIR)/usr/lib/libjim.so.$(JIMTCL_VERSION)
+	ln -sf libjim.so.$(JIMTCL_VERSION) $(HOST_DIR)/usr/lib/libjim.so
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.24.0
