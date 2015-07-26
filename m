From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:44:44 +0200
Subject: [Buildroot] [git commit branch/next] nmap: remove redundant
	--static flag to pkg-config
Message-ID: <20150808105643.059BA7FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c38869b41b7b6b0ace06884ff13c5d751023b861
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
from package .mk files.

Additionally, replace a missed occurrence of $(shell) with backticks.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nmap/nmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index d450f5e..1a0e977 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -30,7 +30,7 @@ NMAP_POST_PATCH_HOOKS += NMAP_WRAPPER_EXEC
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
 NMAP_DEPENDENCIES += host-pkgconf openssl
-NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs --static openssl)
+NMAP_LIBS_FOR_STATIC_LINK += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else
 NMAP_CONF_OPTS += --without-openssl
 endif
