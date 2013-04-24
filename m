From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 21:48:51 +0200
Subject: [Buildroot] [git commit] libxml++: new package
Message-ID: <20130424194920.7194F9B80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=536ac0f7aaaef63e4c749219125fd1eeed5e76ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxml++ is a C++ wrapper for libxml2.

[Peter: misc Config.in fixes]
Signed-off-by: Nicolas M??n??gale <nicolas.menegale@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libxmlpp/Config.in   |   13 +++++++++++++
 package/libxmlpp/libxmlpp.mk |   17 +++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ca947d9..ede0ba0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -623,6 +623,7 @@ source "package/json-glib/Config.in"
 source "package/libroxml/Config.in"
 source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
+source "package/libxmlpp/Config.in"
 source "package/libxslt/Config.in"
 source "package/libyaml/Config.in"
 source "package/mxml/Config.in"
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
new file mode 100644
index 0000000..cf29c2c
--- /dev/null
+++ b/package/libxmlpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBXMLPP
+	bool "libxml++"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GLIBMM
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  libxml++ is a C++ wrapper for the libxml XML parser library.
+
+	  http://libxmlplusplus.sourceforge.net/
+
+comment "libxml++ requires a toolchain with C++ & WCHAR support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
new file mode 100644
index 0000000..1ed60de
--- /dev/null
+++ b/package/libxmlpp/libxmlpp.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# LibXML++
+#
+#############################################################
+
+LIBXMLPP_VERSION_MAJOR = 2.34
+LIBXMLPP_VERSION_MINOR = 2
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).$(LIBXMLPP_VERSION_MINOR)
+LIBXMLPP_LICENSE = LGPLv2.1 (library), LGPLv2+ (examples)
+LIBXMLPP_LICENSE_FILE = COPYING
+LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
+LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
+LIBXMLPP_INSTALL_STAGING = YES
+LIBXMLPP_DEPENDENCIES = libxml2 glibmm host-pkgconf
+
+$(eval $(autotools-package))
