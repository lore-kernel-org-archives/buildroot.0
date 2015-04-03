From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:31:15 +0200
Subject: [Buildroot] [git commit] kodi: switch smb support to samba4
Message-ID: <20150403123150.24EF681910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc6b46d1bacb03ebcec5196449c6aaf66bf42fb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba3 is deprecated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    7 +++++--
 package/kodi/kodi.mk   |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 1f98267..a0cbb18 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -202,10 +202,13 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 comment "shairport support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+comment "samba support needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
-	select BR2_PACKAGE_SAMBA
-	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ca8563d..ad73dcb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -140,7 +140,7 @@ KODI_CONF_OPTS += --disable-webserver
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_LIBSMBCLIENT),y)
-KODI_DEPENDENCIES += samba
+KODI_DEPENDENCIES += samba4
 KODI_CONF_OPTS += --enable-samba
 else
 KODI_CONF_OPTS += --disable-samba
