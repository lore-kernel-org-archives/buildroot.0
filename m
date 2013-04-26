From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 12:39:18 +0200
Subject: [Buildroot] [git commit] neardal: add support for ncl tool
Message-ID: <20130426104356.6F0EA9B842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfe3f67df38063ba9024d241c0317e51e5beacc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move directly under neardal option so it gets indented]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neardal/Config.in  |    6 ++++++
 package/neardal/neardal.mk |    8 ++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index 045ccee..76b5ffa 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -11,5 +11,11 @@ config BR2_PACKAGE_NEARDAL
 
 	  https://github.com/connectivity/neardal
 
+config BR2_PACKAGE_NEARDAL_NCL
+	bool "ncl tool"
+	depends on BR2_PACKAGE_NEARDAL
+	help
+	  Build and install neardal ncl command line interpreter tool.
+
 comment "neardal requires a toolchain with WCHAR and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 9625f0e..b937acb 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -14,4 +14,12 @@ NEARDAL_LICENSE_FILES = COPYING
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
 NEARDAL_AUTORECONF = YES
 
+define NEARDAL_INSTALL_NCL
+	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
+endef
+
+ifeq ($(BR2_PACKAGE_NEARDAL_NCL),y)
+	NEARDAL_POST_INSTALL_TARGET_HOOKS += NEARDAL_INSTALL_NCL
+endif
+
 $(eval $(autotools-package))
