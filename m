From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Feb 2011 10:26:24 +0100
Subject: [Buildroot] [git commit master 1/1] package: add xmlstarlet package
Message-ID: <20110211093539.E989E88E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e0efb0d334dc3d882e286027e6c583d18ff9396c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: don't link statically, only depend on iconv if !BR_ENABLE_LOCALE]
Signed-off-by: Nate Ford <nford@westpond.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/xmlstarlet/Config.in     |    9 +++++++++
 package/xmlstarlet/xmlstarlet.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/xmlstarlet/Config.in
 create mode 100644 package/xmlstarlet/xmlstarlet.mk

diff --git a/package/Config.in b/package/Config.in
index 0899578..0f0ec47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 source "package/which/Config.in"
+source "package/xmlstarlet/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
new file mode 100644
index 0000000..99762b8
--- /dev/null
+++ b/package/xmlstarlet/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XMLSTARLET
+	bool "xmlstarlet"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Command Line XML Toolkit
+
+	  http://xmlstar.sourceforge.net/
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
new file mode 100644
index 0000000..d7613f8
--- /dev/null
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# XMLstarlet
+#
+#############################################################
+
+XMLSTARLET_VERSION:=1.0.4
+XMLSTARLET_SOURCE:=xmlstarlet-$(XMLSTARLET_VERSION).tar.gz
+XMLSTARLET_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_INSTALL_STAGING:=NO
+XMLSTARLET_INSTALL_TARGET:=YES
+
+XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+XMLSTARLET_CONF_OPT += --disable-static-libs \
+	--with-libxml-prefix=${STAGING_DIR}/usr \
+	--with-libxslt-prefix=${STAGING_DIR}/usr \
+	--with-libiconv-prefix=${STAGING_DIR}/usr
+
+$(eval $(call AUTOTARGETS,package,xmlstarlet))
-- 
1.7.3.4
