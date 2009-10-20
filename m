From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Oct 2009 22:42:44 +0200
Subject: [Buildroot] [git commit master] gvfs: build archive backend if
	libarchive is selected
Message-ID: <20091020204320.88F107779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0cbfcbe43358ab37f94886b90db70bdb5f8e338c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_PACKAGE_LIBARCHIVE is enabled, build the gvfs archive
backend.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs.mk |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 5c71fef..94a5eb7 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -22,7 +22,6 @@ GVFS_CONF_OPT = \
 	--disable-obexftp		\
 	--disable-gphoto2		\
 	--disable-keyring		\
-	--disable-archive		\
 	--disable-bash-completion	\
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
@@ -32,6 +31,20 @@ else
 GVFS_CONF_OPT += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_HAL),y)
+GVFS_DEPENDENCIES += hal
+GVFS_CONF_OPT += --enable-hal
+else
+GVFS_CONF_OPT += --disable-hal
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+GVFS_DEPENDENCIES += libarchive
+GVFS_CONF_OPT += --enable-archive
+else
+GVFS_CONF_OPT += --disable-archive
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 GVFS_DEPENDENCIES += libfuse
 GVFS_CONF_OPT += --enable-fuse
@@ -46,13 +59,6 @@ else
 GVFS_CONF_OPT += --disable-http
 endif
 
-ifeq ($(BR2_PACKAGE_HAL),y)
-GVFS_DEPENDENCIES += hal
-GVFS_CONF_OPT += --enable-hal
-else
-GVFS_CONF_OPT += --disable-hal
-endif
-
 ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
 GVFS_DEPENDENCIES += samba
 GVFS_CONF_OPT += \
-- 
1.6.3.3
