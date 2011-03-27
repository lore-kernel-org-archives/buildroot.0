From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Mar 2011 21:48:30 +0200
Subject: [Buildroot] [git commit master 1/1] pkg-config: add
	usr/share/pkgconfig to search path as well
Message-ID: <20110327195056.C3E0281914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a86dd9c8eb0238a4bb8ffdd0fb04e62c12739fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few packages (like xlib_xtrans) install their .pc files here, and
upstream pkg-config defaults to searching both /usr/lib/pkgconfig and
/usr/share/pkgconfig, so add it as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in              |    2 +-
 package/pkg-config/pkg-config.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ef2c591..e1ffe15 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -241,7 +241,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index bb52db8..7189c91 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -12,7 +12,7 @@ PKG_CONFIG_DEPENDENCIES = libglib2
 PKG_CONFIG_CONF_OPT = --with-installed-glib
 
 HOST_PKG_CONFIG_CONF_OPT = \
-		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
 		--with-sysroot="$(STAGING_DIR)" \
 		--disable-static
 
-- 
1.7.3.4
