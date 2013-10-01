From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 23:25:45 +0200
Subject: [Buildroot] [git commit] package: add lesstif
Message-ID: <20131001220021.BF33A9B902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=498ba363e0fcfa62bc7466feceaa044f90fec8ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a quite old thing, latest version is from 2009
but it is useful to applications based on xmotif.
It has been tested with buildroot on ARM/iMX6.

[Peter: pass --no-recursion to not error out in test/configure]
Signed-off-by Thierry Bultel <thierry.bultel@wanadoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/lesstif/Config.in  |   10 ++++++++++
 package/lesstif/lesstif.mk |   41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index da10a23..9aa9d81 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -500,6 +500,7 @@ source "package/harfbuzz/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/lcms2/Config.in"
+source "package/lesstif/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
new file mode 100644
index 0000000..3a999ea
--- /dev/null
+++ b/package/lesstif/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LESSTIF
+	bool "lesstif"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_FREETYPE
+	help
+	  lesstif is the Hungry Programmers' version of OSF/Motif
+
+	  http://lesstif.sourceforge.net/
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
new file mode 100644
index 0000000..5115107
--- /dev/null
+++ b/package/lesstif/lesstif.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lesstif
+#
+################################################################################
+LESSTIF_VERSION = 0.95.2
+LESSTIF_SOURCE  = lesstif-$(LESSTIF_VERSION).tar.bz2
+LESSTIF_SITE    = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
+LESSTIF_INSTALL_STAGING = YES
+LESSTIF_DEPENDENCIES = \
+	xlib_libXt \
+	xlib_libXext \
+	freetype
+
+LESSTIF_CONF_OPT = \
+	--with-gnu-ld \
+	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
+	--enable-debug=no \
+	--enable-production=yes	\
+	--enable-build-tests=no \
+	--no-recursion
+
+# Reduces the buggy makefile to the smallest possible (and working) thing
+define LESSTIF_NOMAN2HTML
+	echo "all:" 	> $(@D)/doc/Makefile
+	echo "" 		>> $(@D)/doc/Makefile
+	echo "install:" >> $(@D)/doc/Makefile
+	echo "" 		>> $(@D)/doc/Makefile
+	echo "clean:" 	>> $(@D)/doc/Makefile
+endef
+
+# Prevents to copy ac_find_motif.m4 on target, it would else
+# be created at $(TARGET_DIR)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4
+define LESSTIF_FIXACLOCAL
+	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
+endef
+
+LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_NOMAN2HTML
+LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_FIXACLOCAL
+
+$(eval $(autotools-package))
