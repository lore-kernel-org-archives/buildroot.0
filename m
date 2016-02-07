From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:31:22 +0100
Subject: [Buildroot] [git commit] yad: fix libgtk3 dependency
Message-ID: <20160207223138.7DBFF80333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38542368aa3c5a503b0548b70de525cf02c0c950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make it depend explicitly on BR2_PACKAGE_LIBGTK3_X11 (the X11 backend
option) to avoid the checker from complaining.
Also add a comment about yad requiring the X11 backend otherwise it's
ambiguous if a user has libgtk3 enabled with broadway/wayland and the
comment shows up. Fixes:
http://autobuild.buildroot.net/results/84d/84d97bbcc0ea4f8eaa50dd25bf9ee8fdee4b937f/

Also cleanup some tiny whitespace in the package mk file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yad/Config.in | 6 +++---
 package/yad/yad.mk    | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/yad/Config.in b/package/yad/Config.in
index e4b63a2..50b97c5 100644
--- a/package/yad/Config.in
+++ b/package/yad/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_YAD
 	bool "yad"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
 	help
 	  YAD (yet another dialog) is a tool for create graphical dialogs
 	  from shell scripts.
 
 	  http://sourceforge.net/projects/yad-dialog/
 
-comment "yad needs libgtk2 or libgtk3"
+comment "yad needs libgtk2 or libgtk3 w/ X11 backend"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
+	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index fc25267..24d331c 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -10,7 +10,6 @@ YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
 YAD_LICENSE = GPLv3
 YAD_LICENSE_FILES = COPYING
 YAD_DEPENDENCIES = host-intltool host-pkgconf
-
 YAD_CONF_OPTS = --enable-html=no
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
