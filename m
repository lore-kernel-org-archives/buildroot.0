From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:44:02 +0100
Subject: [Buildroot] [git commit] libass: new package
Message-ID: <20140128214501.325EF9C6A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08b32ea9588219efad6796929cf1e185268f016e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libass is a portable subtitle renderer for the
ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: make fontconfig/enca optional, fix license, add host-pkgconf,
 optionaliconv/harfbuzz support]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/libass/Config.in |    9 +++++++++
 package/libass/libass.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 47d1d32..3d6f675 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -630,6 +630,7 @@ source "package/yajl/Config.in"
 endmenu
 
 menu "Multimedia"
+source "package/libass/Config.in"
 source "package/libbluray/Config.in"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
diff --git a/package/libass/Config.in b/package/libass/Config.in
new file mode 100644
index 0000000..7690685
--- /dev/null
+++ b/package/libass/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBASS
+	bool "libass"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBFRIBIDI
+	help
+	  libass is a portable subtitle renderer for the ASS/SSA
+	  (Advanced Substation Alpha/Substation Alpha) subtitle format
+
+	  http://code.google.com/p/libass/
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
new file mode 100644
index 0000000..de1f4b8
--- /dev/null
+++ b/package/libass/libass.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# libass
+#
+################################################################################
+
+LIBASS_VERSION = 0.10.2
+LIBASS_SITE = http://libass.googlecode.com/files
+LIBASS_INSTALL_STAGING = YES
+LIBASS_LICENSE = ISC
+LIBASS_LICENSE_FILES = COPYING
+LIBASS_DEPENDENCIES = \
+	host-pkgconf \
+	freetype \
+	libfribidi \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBASS_DEPENDENCIES += fontconfig
+LIBASS_CONF_OPT += --enable-fontconfig
+else
+LIBASS_CONF_OPT += --disable-fontconfig
+endif
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+LIBASS_DEPENDENCIES += harfbuzz
+LIBASS_CONF_OPT += --enable-harfbuzz
+else
+LIBASS_CONF_OPT += --disable-harfbuzz
+endif
+
+ifeq ($(BR2_PACKAGE_LIBENCA),y)
+LIBASS_DEPENDENCIES += libenca
+LIBASS_CONF_OPT += --enable-enca
+else
+LIBASS_CONF_OPT += --disable-enca
+endif
+
+$(eval $(autotools-package))
