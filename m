From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:56 +0200
Subject: [Buildroot] [PATCH 22/50] package/busybox: invert dependency with
 netcat-openbsd
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <ad4a8c5be4b51fc74003e5bde63025345338dfb0.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk               | 1 +
 package/netcat-openbsd/netcat-openbsd.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4039d1c9ad..47952d42e4 100644
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
-- 
2.14.1
