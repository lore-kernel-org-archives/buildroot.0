From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:34:30 +0200
Subject: [Buildroot] [git commit branch/next] package/at-spi2-atk: bump to
 version 2.34.2
Message-ID: <20200509211851.7084A81464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b135c81e3f2514e1dc35389a953b0cfc7188786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove double space in AT_SPI2_ATK_SITE
- Add link to upstream sha256 file
- License is LPGL-2.1+ since
  https://gitlab.gnome.org/GNOME/at-spi2-atk/-/commit/468b527d8ad73e934dd03a2de6745995d8304435
- Switch to meson-package
- Add a patch to disable tests to avoid adding libxml2 dependency
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../at-spi2-atk/0001-meson-add-tests-option.patch  | 43 ++++++++++++++++++++++
 package/at-spi2-atk/at-spi2-atk.hash               |  6 ++-
 package/at-spi2-atk/at-spi2-atk.mk                 | 10 +++--
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/package/at-spi2-atk/0001-meson-add-tests-option.patch b/package/at-spi2-atk/0001-meson-add-tests-option.patch
new file mode 100644
index 0000000000..3a2aefa090
--- /dev/null
+++ b/package/at-spi2-atk/0001-meson-add-tests-option.patch
@@ -0,0 +1,43 @@
+From 466d04a57b32417dbf2d5e818af1b7593af5f802 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 May 2020 10:29:36 +0200
+Subject: [PATCH] meson: add tests option
+
+Add tests option to allow the user to build at-spi2-atk without tests,
+it is especially useful as one of the test requires libxml-2.0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/at-spi2-atk/-/merge_requests/22]
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 4 ++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9fce5d6..61bc93d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -61,4 +61,6 @@ install_data('at-spi2-atk.desktop',
+ 
+ subdir('droute')
+ subdir('atk-adaptor')
+-subdir('tests')
++if get_option('tests')
++  subdir('tests')
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 24c9228..a4abdc2 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,3 +2,7 @@ option('disable_p2p',
+        description: 'Disable peer-to-peer DBus connections',
+        type: 'boolean',
+        value: false)
++option('tests',
++       description: 'Whether to build tests',
++       type: 'boolean',
++       value: true)
+-- 
+2.26.2
+
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
index 77c8f68e47..9c564c32af 100644
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ b/package/at-spi2-atk/at-spi2-atk.hash
@@ -1,3 +1,5 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-atk/2.34/at-spi2-atk-2.34.2.sha256sum
+sha256  901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0  at-spi2-atk-2.34.2.tar.xz
+
 # locally calculated
-sha256 61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e  at-spi2-atk-2.26.2.tar.xz
-sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
index 4ef681b3b1..69d11f66bd 100644
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ b/package/at-spi2-atk/at-spi2-atk.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-AT_SPI2_ATK_VERSION_MAJOR = 2.26
+AT_SPI2_ATK_VERSION_MAJOR = 2.34
 AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
 AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
-AT_SPI2_ATK_SITE =  http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
-AT_SPI2_ATK_LICENSE = LGPL-2.0+
+AT_SPI2_ATK_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
+AT_SPI2_ATK_LICENSE = LGPL-2.1+
 AT_SPI2_ATK_LICENSE_FILES = COPYING
 AT_SPI2_ATK_INSTALL_STAGING = YES
 AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
+AT_SPI2_ATK_CONF_OPTS = -Dtests=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
