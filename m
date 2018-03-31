From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 00:28:21 +0200
Subject: [Buildroot] [git commit] netcat: force-remove nc link before install
Message-ID: <20180331223058.E26B8817D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b28d77789a4ba327532674efd6250b8634a99feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nc -> netcat symlink is not created if nc exists already, e.g.
from busybox.

For netcat itself this is not needed, it is always installed.

Cc: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netcat/netcat.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 6c7c4b8f29..d8b3c930b9 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -9,10 +9,17 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 
-# Ensure Busybox gets built/installed before, so that this package overrides
-# Busybox nc.
+# Ensure Busybox gets built/installed before, so that this package
+# overrides Busybox nc.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 NETCAT_DEPENDENCIES += busybox
 endif
 
+# Netcat doesn't overwrite a pre-existing 'nc' (e.g. from busybox) so
+# force-remove it.
+define NETCAT_RMOVE_NC_LINK
+	rm -f $(TARGET_DIR)/usr/bin/nc
+endef
+NETCAT_PRE_INSTALL_TARGET_HOOKS += NETCAT_RMOVE_NC_LINK
+
 $(eval $(autotools-package))
