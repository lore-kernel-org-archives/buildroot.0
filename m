From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:08:18 +0200
Subject: [Buildroot] [git commit] package/dvdauthor: libdvdread can now be
	linked statically
Message-ID: <20160619213724.4627980489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf5c4641823e3e4c4669348a547b540a276ece67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After libdvdread bump to version 5.0.3 static linking works, tested
using this defconfig:
http://autobuild.buildroot.net/toolchains/configs/br-arm-full-static.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvdauthor/Config.in    | 5 -----
 package/dvdauthor/dvdauthor.mk | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
index 6f8e2e4..8b2bcb3 100644
--- a/package/dvdauthor/Config.in
+++ b/package/dvdauthor/Config.in
@@ -17,13 +17,8 @@ if BR2_PACKAGE_DVDAUTHOR
 config BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR
 	bool "dvdunauthor"
 	select BR2_PACKAGE_LIBDVDREAD
-	depends on !BR2_STATIC_LIBS # libdvdread
 	help
 	  This option enables the dvdunauthor program, which requires
 	  libdvdread.
 
-comment "dvdunauthor needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-
 endif
-
diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
index 6b90c43..e982a40 100644
--- a/package/dvdauthor/dvdauthor.mk
+++ b/package/dvdauthor/dvdauthor.mk
@@ -40,6 +40,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR),y)
 DVDAUTHOR_DEPENDENCIES += libdvdread
+# dvdauthor configure does not use pkg-config to detect libdvdread
+ifeq ($(BR2_PACKAGE_LIBDVDCSS)$(BR2_STATIC_LIBS),yy)
+DVDAUTHOR_CONF_ENV += LIBS="-ldvdcss"
+endif
 DVDAUTHOR_CONF_OPTS += --enable-dvdunauthor
 else
 DVDAUTHOR_CONF_OPTS += --disable-dvdunauthor
