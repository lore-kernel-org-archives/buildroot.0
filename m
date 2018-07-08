From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:04 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 netcat-openbsd
Message-ID: <20180708110810.88B8E863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3da9ffff010d3b5fee984bb20a1f39df4b973f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk               | 1 +
 package/netcat-openbsd/netcat-openbsd.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 55c3d25b8e..003909806a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
 	$(if $(BR2_PACKAGE_NMAP),nmap) \
 	$(if $(BR2_PACKAGE_NTP),ntp) \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 5784e4d68e..e98b479c4f 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -10,12 +10,6 @@ NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
-# Ensure Busybox gets built/installed before, so that this package
-# overrides Busybox nc.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-NETCAT_OPENBSD_DEPENDENCIES += busybox
-endif
-
 define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
