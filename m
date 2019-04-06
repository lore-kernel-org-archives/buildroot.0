From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Apr 2019 23:10:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mxml: bump to version 3.0
Message-ID: <20190406211010.7676-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license files
- Change license to "Apache-2.0 with exceptions", see:
  https://github.com/michaelrsweet/mxml/commit/f166ad1977f2f13295689772a5d9e442f73d46f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-cross-target-installation.patch  | 55 -------------------
 package/mxml/mxml.hash                        |  6 +-
 package/mxml/mxml.mk                          |  8 +--
 3 files changed, 7 insertions(+), 62 deletions(-)
 delete mode 100644 package/mxml/0001-fix-cross-target-installation.patch

diff --git a/package/mxml/0001-fix-cross-target-installation.patch b/package/mxml/0001-fix-cross-target-installation.patch
deleted file mode 100644
index 3a9fa0c0cf..0000000000
--- a/package/mxml/0001-fix-cross-target-installation.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] mxml: workaround for cross build
-
-The added patch is a workaround for cross build as follows:
-
-	* disable run of a test binary at build time
-	* disable generation of documentation using the mxmldoc binary
-	* remove now non-existent entries from the install target
-	* disable strip when running install
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-diff -Nuar mxml-2.7-orig/Makefile.in mxml-2.7/Makefile.in
---- mxml-2.7-orig/Makefile.in	2011-04-13 18:43:32.000000000 +0300
-+++ mxml-2.7/Makefile.in	2012-05-16 07:21:42.677220980 +0300
-@@ -57,7 +57,7 @@
- # Install commands...
- #
- 
--INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -m 755 -s
-+INSTALL_BIN	=	$(LIBTOOL) $(INSTALL) -m 755
- INSTALL_DATA	=	$(INSTALL) -m 644
- INSTALL_DIR	=	$(INSTALL) -d
- INSTALL_LIB	=	$(LIBTOOL) $(INSTALL) -m 755
-@@ -88,7 +88,7 @@
- 			mxml-index.o mxml-node.o mxml-search.o mxml-set.o
- LIBOBJS		=	$(PUBLIBOBJS) mxml-private.o mxml-string.o
- OBJS		=	mxmldoc.o testmxml.o $(LIBOBJS)
--TARGETS		=	$(LIBMXML) mxmldoc testmxml mxml.xml doc/mxml.man
-+TARGETS		=	$(LIBMXML) libmxml.a
- 
- 
- #
-@@ -140,9 +140,6 @@
- #
- 
- install:	$(TARGETS) install-$(LIBMXML) install-libmxml.a
--	echo Installing mxmldoc in $(BUILDROOT)$(bindir)...
--	$(INSTALL_DIR) $(BUILDROOT)$(bindir)
--	$(INSTALL_BIN) mxmldoc $(BUILDROOT)$(bindir)
- 	echo Installing documentation in $(BUILDROOT)$(docdir)...
- 	$(INSTALL_DIR) $(BUILDROOT)$(docdir)
- 	for file in $(DOCFILES); do \
-@@ -154,11 +151,6 @@
- 	echo Installing pkgconfig files in $(BUILDROOT)$(libdir)/pkgconfig...
- 	$(INSTALL_DIR) $(BUILDROOT)$(libdir)/pkgconfig
- 	$(INSTALL_DATA) mxml.pc $(BUILDROOT)$(libdir)/pkgconfig
--	echo Installing man pages in $(BUILDROOT)$(mandir)...
--	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man1
--	$(INSTALL_MAN) doc/mxmldoc.man $(BUILDROOT)$(mandir)/man1/mxmldoc.1
--	$(INSTALL_DIR) $(BUILDROOT)$(mandir)/man3
--	$(INSTALL_MAN) doc/mxml.man $(BUILDROOT)$(mandir)/man3/mxml.3
- 
- install-libmxml.a:
- 	echo Installing libmxml.a to $(BUILDROOT)$(libdir)...
diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 90392755ba..3895dcfb24 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
-# From http://www.msweet.org/downloads.php?L+Z3
-md5 8804c961a24500a95690ef287d150abe mxml-2.10.tar.gz
 # Locally computed
-sha256 267ff58b64ddc767170d71dab0c729c06f45e1df9a9b6f75180b564f09767891 mxml-2.10.tar.gz
+sha256 88f05b3318f29ef6164d99c34b7dced76440c4a99106866b76b7fb729dc8310e mxml-3.0.tar.gz
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 LICENSE
+sha256 63cc06ba05adecb1fdf2c94460a98291fd71614865456e52a19a1e7cc674250f NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index ac270bd1bb..157c644a69 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MXML_VERSION = 2.10
-MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/release-$(MXML_VERSION)
-MXML_LICENSE = LGPL-2.0+ with exceptions
-MXML_LICENSE_FILES = COPYING
+MXML_VERSION = 3.0
+MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
+MXML_LICENSE = Apache-2.0 with exceptions
+MXML_LICENSE_FILES = LICENSE NOTICE
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPTS = DSTROOT=$(STAGING_DIR) install
-- 
2.20.1
