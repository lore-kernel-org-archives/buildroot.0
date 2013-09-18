From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:57:23 +0200
Subject: [Buildroot] [git commit] pciutils: fixup library permissions
Message-ID: <20130918222318.C00FD9B7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95cc2aab61f9c8ea21d4b1cc45f4aa13310e9637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpci.so* is installed without +x permissions thus preventing
stripping. Fix it up in the post install target hooks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 350ca0d..fd6f8aa 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -65,4 +65,12 @@ define PCIUTILS_INSTALL_STAGING_CMDS
 		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
+
+# Library lacks +x so strip skips it
+define PCIUTILS_FIX_LIBRARY_MODE
+	-chmod +x $(TARGET_DIR)/usr/lib/libpci.so*
+endef
+
+PCIUTILS_POST_INSTALL_TARGET_HOOKS += PCIUTILS_FIX_LIBRARY_MODE
+
 $(eval $(generic-package))
