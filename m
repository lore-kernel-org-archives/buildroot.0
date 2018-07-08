From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:04 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 netcat
Message-ID: <20180708110810.91BFA863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=355eadf4ab89049bb0a907faf6a1f13d75322808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since netcat would be installed before busybox, we don't need to remove
a pre-installed 'nc' anymore.

If another netcat implementation (e.g. netcat-openbsd) is also enabled,
there is no way to tell which would win in the end, especially when we
add TLPB, in which case that will be forbidden.

So, we don't need to remove anything anymore.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk |  1 +
 package/netcat/netcat.mk   | 13 -------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 003909806a..eeb9dc5bac 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_NETCAT),netcat) \
 	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
 	$(if $(BR2_PACKAGE_NMAP),nmap) \
 	$(if $(BR2_PACKAGE_NTP),ntp) \
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index d8b3c930b9..eb7ddcac27 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -9,17 +9,4 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 
-# Ensure Busybox gets built/installed before, so that this package
-# overrides Busybox nc.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-NETCAT_DEPENDENCIES += busybox
-endif
-
-# Netcat doesn't overwrite a pre-existing 'nc' (e.g. from busybox) so
-# force-remove it.
-define NETCAT_RMOVE_NC_LINK
-	rm -f $(TARGET_DIR)/usr/bin/nc
-endef
-NETCAT_PRE_INSTALL_TARGET_HOOKS += NETCAT_RMOVE_NC_LINK
-
 $(eval $(autotools-package))
