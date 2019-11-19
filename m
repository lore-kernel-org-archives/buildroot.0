From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 09:04:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/neardal:
 unconditionally use libedit
Message-ID: <20191119075720.C843C8F325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a0d09fcd65c1c7cbef6a375bf87cb89f97c43dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

neardal is licensed under LGPL-2.0, which is (most likely) not license
compatible with readline (GPL-3.0+), so always use the libedit backend.

The choice is done by ./configure, which first checks for libedit, and
uses readline only as a fallback. Since we do build libedit before
neardal, that's what is going to be picked up.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr:
  - add blurb about preference in ./configure
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 93e9b5378d8ed6c67caf0aa9aca18b65d0ce0b45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/Config.in  |  2 +-
 package/neardal/neardal.mk | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index c729283380..5f33ae4953 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NEARDAL
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
+	select BR2_PACKAGE_LIBEDIT
 	help
 	  Provides a simple C API to exchange data with the neard NFC
 	  manager daemon.
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 423e24a590..f511201b9f 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -10,17 +10,9 @@ NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = LGPL-2.0
 NEARDAL_LICENSE_FILES = COPYING
 
-NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
+NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib libedit
 NEARDAL_AUTORECONF = YES
 
-# Either readline or libedit are needed, and the Config.in file
-# guarantees at least one of them is enabled
-ifeq ($(BR2_PACKAGE_READLINE),y)
-NEARDAL_DEPENDENCIES += readline
-else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-NEARDAL_DEPENDENCIES += libedit
-endif
-
 define NEARDAL_INSTALL_NCL
 	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
 endef
