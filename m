From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 00:07:01 +0100
Subject: [Buildroot] [git commit] pciutils: install to /usr/bin rather than
	/usr/sbin
Message-ID: <20141127231208.4549B7FF2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab949f9130a91182e7f01572fbf51c9a2478cb2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow busybox thinks debian standards are the rule and installs lspci
to /usr/bin instead of /usr/sbin where upstream says it belongs.
So install pciutils binaries there as well to really win over busybox
PATH-wise and overwrite the little bugger symlink.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pciutils/pciutils.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
