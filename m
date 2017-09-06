From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 13:32:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] transmission: gtk option
	needs libgtk3
Message-ID: <20170906112608.C07BA81932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1aeb48b66ff43e4c6f5015fb6b03bbc0302e2c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following configure issue:

checking for GTK... no
configure: error: Package requirements (gtk+-3.0 >= 3.4.0
                              glib-2.0 >= 2.32.0
                              gio-2.0 >= 2.26.0,
                              gmodule-2.0 >= 2.32.0
                              gthread-2.0 >= 2.32.0) were not met:

libgtk2 support was dropped in commit cdd71c642724 ((trunk gtk) #4970 remove
deprecated GTK+ API calls, raise GTK+ dependency to 3.2) which was part of
transmission-2.61.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a2935ee28886b5198093c824c4ee4892d02d10c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/Config.in       | 4 ++--
 package/transmission/transmission.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index b47c36f..38a459c 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -39,12 +39,12 @@ config BR2_PACKAGE_TRANSMISSION_REMOTE
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
-	depends on BR2_PACKAGE_LIBGTK2 && BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGTK3 && BR2_ENABLE_LOCALE
 	help
 	  Install transmission GTK-based GUI interface.
 
 comment "transmission-gtk needs a toolchain w/ locale"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGTK3 && !BR2_ENABLE_LOCALE
 endif
 
 comment "transmission needs a toolchain w/ threads"
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 6b8e12e..e4a3680 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -83,7 +83,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += --with-gtk
-TRANSMISSION_DEPENDENCIES += libgtk2
+TRANSMISSION_DEPENDENCIES += libgtk3
 else
 TRANSMISSION_CONF_OPTS += --without-gtk
 endif
