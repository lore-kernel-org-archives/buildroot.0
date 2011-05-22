From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] kbd: make sure to link against libintl
	when needed
Message-ID: <20110522145942.40C728356F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=383074a6335d310918aa11430341614dc79580a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kbd/Config.in                      |    2 +
 package/kbd/kbd-link-against-libintl.patch |   34 ++++++++++++++++++++++++++++
 package/kbd/kdb.mk                         |    2 +
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/kbd/kbd-link-against-libintl.patch

diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index b6d13b5..1fe4dff 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_KBD
 	bool "kbd"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Keytable files and keyboard utilities.
 
diff --git a/package/kbd/kbd-link-against-libintl.patch b/package/kbd/kbd-link-against-libintl.patch
new file mode 100644
index 0000000..39fd461
--- /dev/null
+++ b/package/kbd/kbd-link-against-libintl.patch
@@ -0,0 +1,34 @@
+Make sure we link against libintl if needed
+
+We modify directly the Makefile.in so that we don't have to
+autoreconfigure the package, which doesn't work because packages using
+gettext need the autopoint tool for their autoregeneration step and
+this thing doesn't work (yet) in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: kbd-1.15.2/src/Makefile.am
+===================================================================
+--- kbd-1.15.2.orig/src/Makefile.am	2011-05-22 16:08:51.144530776 +0200
++++ kbd-1.15.2/src/Makefile.am	2011-05-22 16:09:09.892530778 +0200
+@@ -5,6 +5,8 @@
+ AM_CPPFLAGS = -DDATADIR=\"$(datadir)\" -DLOCALEDIR=\"$(localedir)\" $(WARNINGS) \
+ 	-funit-at-a-time
+ 
++LDADD = @INTLLIBS@
++
+ OLDPROGS = mapscrn loadunimap
+ PROGS = \
+ 	dumpkeys loadkeys showkey setfont showconsolefont \
+Index: kbd-1.15.2/src/Makefile.in
+===================================================================
+--- kbd-1.15.2.orig/src/Makefile.in	2011-05-22 16:10:27.540530777 +0200
++++ kbd-1.15.2/src/Makefile.in	2011-05-22 16:10:51.172530778 +0200
+@@ -26,6 +26,7 @@
+ install_sh_PROGRAM = $(install_sh) -c
+ install_sh_SCRIPT = $(install_sh) -c
+ INSTALL_HEADER = $(INSTALL_DATA)
++LDADD = @INTLLIBS@
+ transform = $(program_transform_name)
+ NORMAL_INSTALL = :
+ PRE_INSTALL = :
diff --git a/package/kbd/kdb.mk b/package/kbd/kdb.mk
index 526e1ff..ec67c5f 100644
--- a/package/kbd/kdb.mk
+++ b/package/kbd/kdb.mk
@@ -2,4 +2,6 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+
 $(eval $(call AUTOTARGETS,package,kbd))
-- 
1.7.3.4
