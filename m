From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Dec 2018 17:26:41 +0100
Subject: [Buildroot] [git commit] Revert "package/x11r7/xcb-proto: remove
 pkgconf fix"
Message-ID: <20181222162313.59A7E816A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b7ada555863cc6c9b558fd6f93a182fa32a2101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 598cd3dc55dfd805de0fa7416062ee3c4a063402,
following the modification of the pkg-config behavior to be like it
used to be.

Fixes:

  http://autobuild.buildroot.net/results/41a4e6b9e17adc75b023e89b231a2e00e3484979/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index bf09cb6b07..b85dad7f2c 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -15,5 +15,15 @@ XCB_PROTO_INSTALL_STAGING = YES
 XCB_PROTO_DEPENDENCIES = host-python
 HOST_XCB_PROTO_DEPENDENCIES = host-python
 
+# xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
+# xml / python files, so ensure these expand to their full (host) paths
+define XCB_PROTO_FIXUP_PC_FILE
+	$(SED) 's|^\(xcbincludedir=\)|\1$(STAGING_DIR)|' \
+		-e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/xcb-proto.pc
+endef
+
+XCB_PROTO_POST_INSTALL_STAGING_HOOKS += XCB_PROTO_FIXUP_PC_FILE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
