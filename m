From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:48 +0200
Subject: [Buildroot] [PATCH 23/50 v2] package/busybox: invert dependency
 with netcat
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <3e51c98ee1c3de7488e1a46cbc662221cd8e4958.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since netcat would be installed before busybox, we don't need to remove
a pre-installed 'nc' anymore.

If another netcat implementation (e.g. netcat-openbsd) is also enabled,
there is no way to tell which would win in the end, especially when we
add TLPB, in which case that will be forbidden.

So, we don't need to remove anything anymore.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.14.1
