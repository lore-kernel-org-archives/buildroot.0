From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 22:16:32 +0200
Subject: [Buildroot] [git commit] package: add Mini-XML
Message-ID: <20110713202027.8982E8A592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9eb41624ffdff466087749b64a57c5673cd2d2e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: don't build mxmldoc as it needs spawn.h]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/mxml/Config.in                             |    6 ++
 .../mxml-2.6-fix-cross-target-installation.patch   |   53 ++++++++++++++++++++
 package/mxml/mxml.mk                               |   15 ++++++
 4 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 package/mxml/Config.in
 create mode 100644 package/mxml/mxml-2.6-fix-cross-target-installation.patch
 create mode 100644 package/mxml/mxml.mk

diff --git a/package/Config.in b/package/Config.in
index 2fa9ff5..fb5a570 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,7 @@ source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
+source "package/mxml/Config.in"
 source "package/xerces/Config.in"
 source "package/yajl/Config.in"
 endmenu
diff --git a/package/mxml/Config.in b/package/mxml/Config.in
new file mode 100644
index 0000000..d3202b4
--- /dev/null
+++ b/package/mxml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MXML
+	bool "Mini-XML"
+	help
+	  Lightweight XML Library
+
+	  http://www.minixml.org
diff --git a/package/mxml/mxml-2.6-fix-cross-target-installation.patch b/package/mxml/mxml-2.6-fix-cross-target-installation.patch
new file mode 100644
index 0000000..62b6bbc
--- /dev/null
+++ b/package/mxml/mxml-2.6-fix-cross-target-installation.patch
@@ -0,0 +1,53 @@
+From: Baruch Siach <baruch@tkos.co.il>
+Subject: [PATCH] mxml: workaround for cross build
+
+The added patch is a workaround for cross build as follows:
+
+	* disable run of a test binary at build time
+	* disable generation of documentation using the mxmldoc binary
+	* remove now non-existent entries from the install target
+	* disable strip when running install
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar mxml-2.6-dist//Makefile.in mxml-2.6/Makefile.in
+--- mxml-2.6-dist//Makefile.in	2008-12-06 06:20:38.000000000 +0200
++++ mxml-2.6/Makefile.in	2011-07-13 07:25:36.615999491 +0300
+@@ -59,7 +59,7 @@
+ # Install commands...
+ #
+ 
+-INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -m 755 -s
++INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -m 755
+ INSTALL_DATA	=	$(INSTALL) -m 644
+ INSTALL_DIR	=	$(INSTALL) -d
+ INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -m 755
+@@ -88,7 +88,7 @@
+ 			mxml-node.o mxml-search.o mxml-set.o
+ LIBOBJS		=	$(PUBLIBOBJS) mxml-private.o mxml-string.o
+ OBJS		=	mxmldoc.o testmxml.o $(LIBOBJS)
+-TARGETS		=	$(LIBMXML) mxmldoc testmxml mxml.xml doc/mxml.man
++TARGETS		=	$(LIBMXML) libmxml.a
+ 
+ 
+ #
+@@ -134,8 +134,6 @@
+ #
+ 
+ install:	$(TARGETS) install-$(LIBMXML) install-libmxml.a
+-	$(INSTALL_DIR) $(BUILDROOT)$(bindir)
+-	$(INSTALL_BIN) mxmldoc $(BUILDROOT)$(bindir) 
+ 	$(INSTALL_DIR) $(BUILDROOT)$(docdir)
+ 	for file in $(DOCFILES); do \
+ 		$(INSTALL_MAN) $$file $(BUILDROOT)$(docdir); \
+@@ -144,10 +142,6 @@
+ 	$(INSTALL_DATA) mxml.h $(BUILDROOT)$(includedir)
+ 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)/pkgconfig
+ 	$(INSTALL_DATA) mxml.pc $(BUILDROOT)$(libdir)/pkgconfig
+-	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man1
+-	$(INSTALL_MAN) doc/mxmldoc.man $(BUILDROOT)$(mandir)/man1/mxmldoc.1
+-	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man3
+-	$(INSTALL_MAN) doc/mxml.man $(BUILDROOT)$(mandir)/man3/mxml.3
+ 
+ install-libmxml.a:
+ 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
new file mode 100644
index 0000000..e45abe9
--- /dev/null
+++ b/package/mxml/mxml.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# mxml
+#
+#############################################################
+MXML_VERSION = 2.6
+MXML_SITE = http://ftp.easysw.com/pub/mxml/2.6
+MXML_INSTALL_STAGING = YES
+
+MXML_INSTALL_STAGING_OPT = DSTROOT=$(TARGET_DIR) install
+MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
+MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(TARGET_DIR) uninstall
+MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
+
+$(eval $(call AUTOTARGETS,package,mxml))
-- 
1.7.3.4
