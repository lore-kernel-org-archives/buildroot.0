From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  2 Feb 2016 23:52:35 -0200
Subject: [Buildroot] [PATCH 1/2] yad: fix libgtk2 related dependency error
Message-ID: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When yad is built using gtk3 backend, gtk3-x11 needs to be selected too
or following error will occur
*** libgtk2 is in the dependency chain of yad ...

NOTICE: This fix requires the user to re-run Kconfig to update the
config file

The dependency now is enforced by Kconfig, so there is no more need to
test explicitly for gtk3-x11 at build time.

Another solution would be to explicitly test for (gtk3 and gtk3-x11) or
gtk2 at build time and generate a comprehensive error message when the
requirement is not meet. But the builds would still break.

Fixes:
http://autobuild.buildroot.net/results/5b9/5b9e85324d5b4d8bd2390763e7819087cb6b3f65/
http://autobuild.buildroot.net/results/84d/84d97bbcc0ea4f8eaa50dd25bf9ee8fdee4b937f/
http://autobuild.buildroot.net/results/988/98887e469a6b490966a3315ce674bc8d2cd68753/

Keeps fixed:
http://autobuild.buildroot.net/results/91d/91dc6ab749f967ae046f856f3f592d5a548499c6/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: James Knight <james.knight@rockwellcollins.com>
---
 package/yad/Config.in | 1 +
 package/yad/yad.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/yad/Config.in b/package/yad/Config.in
index e4b63a2..e465e44 100644
--- a/package/yad/Config.in
+++ b/package/yad/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_YAD
 	bool "yad"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBGTK3_X11 if BR2_PACKAGE_LIBGTK3
 	help
 	  YAD (yet another dialog) is a tool for create graphical dialogs
 	  from shell scripts.
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index fc25267..9d7ab37 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -13,7 +13,7 @@ YAD_DEPENDENCIES = host-intltool host-pkgconf
 
 YAD_CONF_OPTS = --enable-html=no
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 YAD_DEPENDENCIES += libgtk3
 YAD_CONF_OPTS += --with-gtk=gtk3
 else
-- 
1.9.1
