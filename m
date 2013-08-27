From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:08:05 +0200
Subject: [Buildroot] [PATCHv2 3/3] subversion: new package
In-Reply-To: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377623285-3359-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rico Bachmann <bachmann@tofwerk.com>

[Thomas: added license informations, fixed dependencies, and several
cleanups.]

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/subversion/Config.in     | 11 +++++++++++
 package/subversion/subversion.mk | 28 ++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 package/subversion/Config.in
 create mode 100644 package/subversion/subversion.mk

diff --git a/package/Config.in b/package/Config.in
index 2347229..1ac26f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -97,6 +97,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 endif
 source "package/sstrip/Config.in"
+source "package/subversion/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
diff --git a/package/subversion/Config.in b/package/subversion/Config.in
new file mode 100644
index 0000000..c1358fe
--- /dev/null
+++ b/package/subversion/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SUBVERSION
+	bool "subversion"
+	select BR2_PACKAGE_APR_UTIL
+	# apr really needs shared library support
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_XML
+	help
+	  Subversion is an open source version control system
+
+	  http://subversion.apache.org/
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
new file mode 100644
index 0000000..de4db7c
--- /dev/null
+++ b/package/subversion/subversion.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# subversion
+#
+################################################################################
+
+SUBVERSION_VERSION = 1.7.9
+SUBVERSION_SITE = http://archive.apache.org/dist/subversion
+SUBVERSION_LICENSE = Apache 2.0
+SUBVERSION_LICENSE_FILES = LICENSE
+
+SUBVERSION_DEPENDENCIES = apr apr-util expat neon zlib
+SUBVERSION_CONF_OPT = \
+	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
+	--with-apr=$(STAGING_DIR)/usr \
+	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-zlib=$(STAGING_DIR)/usr \
+	--with-neon=$(STAGING_DIR)/usr \
+	--without-gssapi \
+	--without-serf \
+	--without-apxs \
+	--without-berkeyley-db \
+	--without-sasl \
+	--without-gnome-keyring \
+	--without-ssl \
+	--without-libmagic
+
+$(eval $(autotools-package))
-- 
1.8.1.2
