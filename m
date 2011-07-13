From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 12:57:54 +0200
Subject: [Buildroot] [git commit] package: add libroxml
Message-ID: <20110713105828.9E8368A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b28de60c24ad4bef4ff7a6ad51cbb6e79906c868
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3595

Based on patch by Tristan Lelong <tristan.lelong@blunderer.org>.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                           |    1 +
 package/Config.in                                 |    1 +
 package/libroxml/Config.in                        |    8 +++++
 package/libroxml/libroxml-2.0.3-fix-install.patch |   25 ++++++++++++++++
 package/libroxml/libroxml.mk                      |   33 +++++++++++++++++++++
 5 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 package/libroxml/Config.in
 create mode 100644 package/libroxml/libroxml-2.0.3-fix-install.patch
 create mode 100644 package/libroxml/libroxml.mk

diff --git a/CHANGES b/CHANGES
index 4c29ffe..0b3e28a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,6 +18,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#3559: libnspr: Add new package
+	#3595: patch to add libroxml
 	#3565: libnss: Add new package
 	#3907: 2011.05 - Qt 4.7.3 not building on ARM
 
diff --git a/package/Config.in b/package/Config.in
index 55ea343..d073a1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,6 +363,7 @@ endmenu
 menu "JSON/XML"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
+source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
diff --git a/package/libroxml/Config.in b/package/libroxml/Config.in
new file mode 100644
index 0000000..e26d239
--- /dev/null
+++ b/package/libroxml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBROXML
+	bool "roxml"
+	help
+	  libroxml is a light and powerful xml parsing library with
+	  xpath handling. Roxml is a binary using libroxml to explore
+	  xml file from shell scripts.
+
+	  http://libroxml.googlecode.com
diff --git a/package/libroxml/libroxml-2.0.3-fix-install.patch b/package/libroxml/libroxml-2.0.3-fix-install.patch
new file mode 100644
index 0000000..fe3cfad
--- /dev/null
+++ b/package/libroxml/libroxml-2.0.3-fix-install.patch
@@ -0,0 +1,25 @@
+[PATCH] fix make install if doxygen isn't available
+
+If doxygen isn't available, then man pages / html docs won't get created,
+so don't try to install them.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: libroxml-2.0.3/Makefile
+===================================================================
+--- libroxml-2.0.3.orig/Makefile
++++ libroxml-2.0.3/Makefile
+@@ -153,8 +153,8 @@
+ 	$E install -D $(INC) $(DESTDIR)/usr/include
+ 	$E install -D LGPL.txt $(DESTDIR)/usr/share/doc/libroxml/
+ 	$E install -D docs/roxml.1 $(DESTDIR)/usr/share/man/man1/
+-	$E install -D docs/man/man3/* $(DESTDIR)/usr/share/man/man3/
+-	$E install -D docs/html/* $(DESTDIR)/usr/share/doc/libroxml/html/
++	$E [ ! -d docs/man/man3 ] || install -D docs/man/man3/* $(DESTDIR)/usr/share/man/man3/
++	$E [ ! -d docs/html ] || install -D docs/html/* $(DESTDIR)/usr/share/doc/libroxml/html/
+ 	$E install -m644 libroxml.pc $(DESTDIR)/usr/lib/pkgconfig
+ 	$E cp -d $(TARGET_LN) $(DESTDIR)/usr/lib
+ 
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
new file mode 100644
index 0000000..bf067df
--- /dev/null
+++ b/package/libroxml/libroxml.mk
@@ -0,0 +1,33 @@
+#
+# libroxml
+#
+
+LIBROXML_VERSION = 2.0.3
+LIBROXML_SITE = http://libroxml.googlecode.com/files
+LIBROXML_INSTALL_STAGING = YES
+
+define LIBROXML_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIM= -C $(@D) V=1 all
+endef
+
+define LIBROXML_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+endef
+
+define LIBROXML_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define LIBROXML_UNINSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
+endef
+
+define LIBROXML_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+define LIBROXML_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,libroxml))
-- 
1.7.3.4
