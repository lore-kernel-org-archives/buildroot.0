From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 21:11:57 +0100
Subject: [Buildroot] [git commit] fluxbox: add xsession profile
Message-ID: <20111207203228.1A1D38F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b87f2942f0ab9e8ee003cac08a172d2a51a3535f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add .xsession profile to get fluxbox being started automatically
by XDM.

[Peter: Only install if not available in skeleton, use install -D,
	Make it an executable script and don't hide it]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fluxbox/fluxbox.mk |    7 +++++++
 package/fluxbox/xsession   |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 85a8eae..5a123f0 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -13,4 +13,11 @@ FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+define FLUXBOX_INSTALL_XSESSION_FILE
+	[ -f $(TARGET_DIR)/root/.xsession ] || $(INSTALL) -m 0755 -D \
+		package/fluxbox/xsession $(TARGET_DIR)/root/.xsession
+endef
+
+FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
+
 $(eval $(call AUTOTARGETS))
diff --git a/package/fluxbox/xsession b/package/fluxbox/xsession
new file mode 100644
index 0000000..b51acff
--- /dev/null
+++ b/package/fluxbox/xsession
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec startfluxbox
