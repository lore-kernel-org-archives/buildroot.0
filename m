From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Dec 2013 19:18:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/parted: relax dependency on lvm2
In-Reply-To: <cover.1386872011.git.yann.morin.1998@free.fr>
References: <cover.1386872011.git.yann.morin.1998@free.fr>
Message-ID: <7c051fe6ad26ec2762c1bdb78114d4b5c59b5c71.1386872011.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

parted can be configured without support for LVM volumes, so
we can relax the dependency on lvm2, and make it an optional
feature.

Remove now no-longer needed dependency on MMU because of lvm2.

(Based on a code-snippet from Thomas.)

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/parted/Config.in | 3 ---
 package/parted/parted.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/parted/Config.in b/package/parted/Config.in
index 8af2693..321fdf7 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	depends on BR2_USE_MMU # lvm2
-	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -13,5 +11,4 @@ config BR2_PACKAGE_PARTED
 	  http://www.gnu.org/software/parted/
 
 comment "parted needs a toolchain w/ largefile, wchar"
-	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 773e332..231ab35 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -7,9 +7,16 @@
 PARTED_VERSION = 3.1
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
-PARTED_DEPENDENCIES = readline util-linux lvm2
+PARTED_DEPENDENCIES = readline util-linux
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPLv3+
 PARTED_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LVM2),y)
+PARTED_DEPENDENCIES += lvm2
+PARTED_CONF_OPT += --enable-device-mapper
+else
+PARTED_CONF_OPT += --disable-device-mapper
+endif
+
 $(eval $(autotools-package))
-- 
1.8.1.2
