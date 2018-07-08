From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:35 +0200
Subject: [Buildroot] [PATCH 10/50 v2] package/busybox: invert dependency
 with tar
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <6be897198de7213daabd55172f78da81ebd300b2.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Chamges v1 -> v2:
  - fix typo  (Baruch)
---
 package/busybox/busybox.mk | 1 +
 package/tar/tar.mk         | 7 +------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 270dcc1416..ff2e4c770c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_TAR),tar) \
 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 9942e77737..6f609d7a02 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -8,16 +8,11 @@ TAR_VERSION = 1.29
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
-# so that it overrides the Busybox symlinks.
+# so that we don't end up with two different tar
 TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 
-# Prefer full-blown tar over buybox's version
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-TAR_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
 TAR_CONF_OPTS += --with-posix-acls
-- 
2.14.1
