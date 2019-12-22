From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 16:01:00 +0100
Subject: [Buildroot] [git commit] package/jimtcl: add host variant
Message-ID: <20191222145255.D65B58D6B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f98c1447f87af3a87e8710f5cd8c31644e4d8074
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-jimtcl is needed for host-openocd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - call hook to update config.{guess,sub}
  - reformat the build commands
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jimtcl/jimtcl.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 643a87d5c4..e712dff0be 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -42,6 +42,7 @@ endif
 # Buildroot, so update config.guess / config.sub like we do in
 # pkg-autotools.mk
 JIMTCL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+HOST_JIMTCL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 # jimtcl really wants to find a existing $CXX, so feed it false
 # when we do not have one.
@@ -78,4 +79,25 @@ define JIMTCL_INSTALL_TARGET_CMDS
 	$(JIMTCL_LINK_TCLSH)
 endef
 
+define HOST_JIMTCL_CONFIGURE_CMDS
+	cd $(@D) && \
+		$(HOST_CONFIGURE_OPTS) \
+		CCACHE=none \
+		./configure --prefix=$(HOST_DIR) --shared
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
