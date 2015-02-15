From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 15:44:11 +0000
Subject: [Buildroot] [PATCH 3/3] weston: bump version to 1.7.0
In-Reply-To: <1424015051-14779-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1424015051-14779-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1424015051-14779-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.7.0
- Add a hash file

libinput is now a required dependency:

configure: WARNING: unrecognized options: --disable-libinput-backend

checking for LIBINPUT_BACKEND... no
configure: error: Package requirements (libinput >= 0.8.0) were not met:

Package libinput was not found in the pkg-config search path.
Perhaps you should add the directory containing `libinput.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libinput' found

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/weston/Config.in   |    1 +
 package/weston/weston.hash |    2 ++
 package/weston/weston.mk   |   11 ++---------
 3 files changed, 5 insertions(+), 9 deletions(-)
 create mode 100644 package/weston/weston.hash

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 49130b4..624dc60 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
+	select BR2_PACKAGE_LIBINPUT
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_avr32 # wayland
 	depends on !BR2_STATIC_LIBS # wayland
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
new file mode 100644
index 0000000..8df6f07
--- /dev/null
+++ b/package/weston/weston.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-February/019977.html
+sha256  1c4511945f3f476c24af712e82a7b500ae91a99cbc0fe2e381da1449125166cd  weston-1.7.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 9964b90..8a5a891 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.6.0
+WESTON_VERSION = 1.7.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
-	jpeg mtdev udev cairo
+	jpeg mtdev udev cairo libinput
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
@@ -25,13 +25,6 @@ WESTON_CONF_OPTS = \
 	--disable-weston-launch \
 	--disable-colord
 
-ifeq ($(BR2_PACKAGE_LIBINPUT),y)
-WESTON_DEPENDENCIES += libinput
-WESTON_CONF_OPTS += --enable-libinput-backend
-else
-WESTON_CONF_OPTS += --disable-libinput-backend
-endif
-
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
1.7.1
