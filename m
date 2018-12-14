From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:39:35 +0100
Subject: [Buildroot] [git commit] package/vdr-plugin-vnsiserver: fix build
 with pkgconf 1.5.3
Message-ID: <20181214213540.03F7586C00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba1e720d84f8805d5c6212b95587751b9a83237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

vdr-plugin-vnsiserver uses the locdir variable from vdr.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the LOCDIR to use
explicitly instead of relying on vdr.pc.

Fixes:
 - http://autobuild.buildroot.org/results/9be3719f7b2137a5f039f3c4209c3bc7edeae2b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index a25a99dfa8..f41ad701d3 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -19,7 +19,8 @@ endef
 
 define VDR_PLUGIN_VNSISERVER_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		install DESTDIR=$(TARGET_DIR) LIBDIR=/usr/lib/vdr
+		install DESTDIR=$(TARGET_DIR) LIBDIR=/usr/lib/vdr \
+		LOCDIR=/usr/share/locale
 endef
 
 $(eval $(generic-package))
