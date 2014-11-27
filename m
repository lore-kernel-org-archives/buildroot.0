From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 19:51:11 -0300
Subject: [Buildroot] [PATCH] pciutils: install to /usr/bin rather than
	/usr/sbin
Message-ID: <1417128671-27132-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Somehow busybox thinks debian standards are the rule and installs lspci
to /usr/bin instead of /usr/sbin where upstream says it belongs.
So install pciutils binaries there as well to really win over busybox
PATH-wise and overwrite the little bugger symlink.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 3abbf18..2eefdc5 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -65,12 +65,14 @@ endef
 
 define PCIUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
-		PREFIX=$(TARGET_DIR)/usr install install-lib install-pcilib
+		PREFIX=$(TARGET_DIR)/usr SBINDIR=$(TARGET_DIR)/usr/bin \
+		install install-lib install-pcilib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
-		PREFIX=$(STAGING_DIR)/usr install install-lib install-pcilib
+		PREFIX=$(STAGING_DIR)/usr SBINDIR=$(STAGING_DIR)/usr/bin \
+		install install-lib install-pcilib
 endef
 
 $(eval $(generic-package))
-- 
2.0.4
