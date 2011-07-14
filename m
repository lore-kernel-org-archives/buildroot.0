From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 14 Jul 2011 09:16:28 +0200
Subject: [Buildroot] [PATCH] shared-mime-info: update to version 0.90
Message-ID: <1310627788-3185-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Need to use $(MAKE1) as parallel builds appear to be broken.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../shared-mime-info-0.60-fix-xmllint.patch        |   17 -----------------
 package/shared-mime-info/shared-mime-info.mk       |    7 ++++---
 2 files changed, 4 insertions(+), 20 deletions(-)
 delete mode 100644 package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch

diff --git a/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch b/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch
deleted file mode 100644
index 921333e..0000000
--- a/package/shared-mime-info/shared-mime-info-0.60-fix-xmllint.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: shared-mime-info-0.60/Makefile.am
-===================================================================
---- shared-mime-info-0.60.orig/Makefile.am
-+++ shared-mime-info-0.60/Makefile.am
-@@ -72,7 +72,7 @@
- 
- check: freedesktop.org.xml
- 	if test -n $(XMLLINT) ; then \
--		xmllint --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
-+		$(XMLLINT) --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
- 	fi
- 	if test -d CVS/ && test -x ../xdgmime/src/test-mime-data && test -x $(top_builddir)/test-tree-magic ; then \
- 		mkdir -p $(top_builddir)/temp-mime-dir/mime/packages ; \
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 6abfa75..50b0f25 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -3,7 +3,7 @@
 # shared-mime-info
 #
 #############################################################
-SHARED_MIME_INFO_VERSION = 0.60
+SHARED_MIME_INFO_VERSION = 0.90
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 
@@ -15,11 +15,12 @@ SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
+SHARED_MIME_INFO_MAKE = $(MAKE1)
 
 HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
 
-HOST_SHARED_MIME_INFO_CONF_OPT = \
-	--disable-update-mimedb
+HOST_SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
+HOST_SHARED_MIME_INFO_MAKE = $(MAKE1)
 
 define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(HOST_MAKE_ENV) $(SHARED_MIME_INFO_HOST_BINARY) $(STAGING_DIR)/usr/share/mime
-- 
1.7.1
