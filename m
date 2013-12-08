From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Dec 2013 18:01:08 +0100
Subject: [Buildroot] [PATCH 2/3] package/parted: relax dependency on readline
In-Reply-To: <cover.1386521954.git.yann.morin.1998@free.fr>
References: <cover.1386521954.git.yann.morin.1998@free.fr>
Message-ID: <745e43f9f327464a5ef2c8787dcae7d8a97c198f.1386521954.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

parted can be configured without support for readline (ie. can be
not interactive), so we can relax the dependency on readline, and
make it an optional feature.

(Based on a code-snippet from Thomas.)

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/parted/Config.in | 1 -
 package/parted/parted.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/parted/Config.in b/package/parted/Config.in
index 321fdf7..45170aa 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 231ab35..afb8287 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -7,11 +7,18 @@
 PARTED_VERSION = 3.1
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
-PARTED_DEPENDENCIES = readline util-linux
+PARTED_DEPENDENCIES = util-linux
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPLv3+
 PARTED_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+PARTED_DEPENDENCIES += readline
+PARTED_CONF_OPT += --with-readline
+else
+PARTED_CONF_OPT += --without-readline
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2),y)
 PARTED_DEPENDENCIES += lvm2
 PARTED_CONF_OPT += --enable-device-mapper
-- 
1.8.1.2
