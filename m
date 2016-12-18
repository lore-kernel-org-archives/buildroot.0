From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Dec 2016 20:20:37 +0100
Subject: [Buildroot] [PATCH 3/3] package/lugaru: new package
In-Reply-To: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
References: <1482088837-3388-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1482088837-3388-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lugaru needs SDL2 library with OpenGL support which require X11 support.
Otherwise Lugaru error out with "No dynamic GL support in video driver"
message.

https://osslugaru.gitlab.io/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in          |  1 +
 package/lugaru/Config.in   | 36 ++++++++++++++++++++++++++++++++++++
 package/lugaru/lugaru.hash |  2 ++
 package/lugaru/lugaru.mk   | 22 ++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/lugaru/Config.in
 create mode 100644 package/lugaru/lugaru.hash
 create mode 100644 package/lugaru/lugaru.mk

diff --git a/package/Config.in b/package/Config.in
index be0d150..353d5bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ menu "Games"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
+	source "package/lugaru/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/lugaru/Config.in b/package/lugaru/Config.in
new file mode 100644
index 0000000..6da8601
--- /dev/null
+++ b/package/lugaru/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_LUGARU
+	bool "lugaru"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7 # SDL2 OpenGL (GLX)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on !BR2_STATIC_LIBS # SDL2
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLU # GL/glu.h
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_OPENGL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Lugaru (pronounced Loo-GAH-roo) is a cross-platform
+	  third-person action game. The main character, Turner, is an
+	  anthropomorphic rebel bunny rabbit with impressive combat
+	  skills. In his quest to find those responsible for
+	  slaughtering his village, he uncovers a far-reaching
+	  conspiracy involving the corrupt leaders of the rabbit
+	  republic and the starving wolves from a nearby den. Turner
+	  takes it upon himself to fight against their plot and save
+	  his fellow rabbits from slavery.
+
+	  https://osslugaru.gitlab.io/
+
+comment "lugaru needs X11 and a toolchain w/ C++, OpenGL backend, gcc >= 4.7, NPTL, dynamic library"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS
diff --git a/package/lugaru/lugaru.hash b/package/lugaru/lugaru.hash
new file mode 100644
index 0000000..e03b794
--- /dev/null
+++ b/package/lugaru/lugaru.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5e00f6fc611857926c67443580732b846619f9ff5cfe1801b011c7c5e738b82c lugaru-1.1.tar.xz
diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
new file mode 100644
index 0000000..0f722cd
--- /dev/null
+++ b/package/lugaru/lugaru.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# lugaru
+#
+################################################################################
+
+LUGARU_VERSION = 1.1
+LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
+LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
+
+LUGARU_LICENSE = GPLv2+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
+	CC-BY-SA-4.0 (OSS Lugaru, Jendraz and Philtron R. assets)
+LUGARU_LICENSE_FILES = COPYING.txt CONTENT-LICENSE.txt
+
+LUGARU_DEPENDENCIES = host-pkgconf jpeg libgl libglu libpng libvorbis \
+	openal sdl2 zlib
+
+LUGARU_CONF_OPTS = -DSYSTEM_INSTALL=ON \
+	-DCMAKE_INSTALL_BINDIR=games \
+	-DCMAKE_INSTALL_DATADIR=share/games \
+
+$(eval $(cmake-package))
-- 
2.5.5
