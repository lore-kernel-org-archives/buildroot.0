From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Jul 2018 22:43:55 +0200
Subject: [Buildroot] [RFC v3 4/4] libinput: bump version to 1.11.0 and
 convert to meson build
In-Reply-To: <20180719204355.10465-1-ps.report@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
Message-ID: <20180719204355.10465-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details since 1.8.x see [1], [2] and [3].

Build system changed from autotools to meson exclusively
since 1.9.0 (see [1]).

Add hash for license file.

[1] https://lists.freedesktop.org/archives/wayland-devel/2017-October/035469.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2018-February/036957.html
[3] https://lists.freedesktop.org/archives/wayland-devel/2018-June/038349.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch

Changes v2 -> v3:
  - add hash for license file
---
 package/libinput/libinput.hash | 13 ++++++++-----
 package/libinput/libinput.mk   | 10 +++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 4e64568ca3..01389ebb4c 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-September/034949.html
-md5  e94e9aa765da9533c23b80b440638de9  libinput-1.8.2.tar.xz
-sha1 1c55462eb598b91c9c360f31170a408fb8d38d22  libinput-1.8.2.tar.xz
-sha256 013518ee0adb2287e6e1f08412efba2137320738cadb5399b783738f04cbab38  libinput-1.8.2.tar.xz
-sha512 555a7680cc8aaf62c5370a865f3aff0a933d42d94a3d8861c072666b02c9e1be45ea39de9a749a9575cdfb613b6150e412e18559d94d4919f21ca4680a3c76a7  libinput-1.8.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-June/038349.html
+md5 a182dab52f4d33bc1ef50668dcf53cc6 libinput-1.11.0.tar.xz
+sha1 5c242a99c7e4c678e15f7bd100f94fa338b81240 libinput-1.11.0.tar.xz
+sha256 64a36c4f826f4b5d473bf2cb803122f96390a18243ec810f2ce8ac5076a0bc12 libinput-1.11.0.tar.xz
+sha512 382a6c9ec4aaf13ac209ee5a7f507c7a6d2dd399c5104703ac7c6ac62fb3f393de6f4e15d7895b18c8b8d845ce8fc1f551a90aa7532f0de4cc17e57a09cfe857 libinput-1.11.0.tar.xz
+
+# Hash for license files:
+sha256 e8835710c129c0cc396be3d78320c9ca9ed10da8051e1cbc91b4a9a77087cdbf COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f904b796b7..8c4870f269 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.8.2
+LIBINPUT_VERSION = 1.11.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -12,13 +12,13 @@ LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
-LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
+LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-LIBINPUT_CONF_OPTS += --enable-debug-gui
+LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
 else
-LIBINPUT_CONF_OPTS += --disable-debug-gui
+LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.18.0
