From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:27 +0100
Subject: [Buildroot] [PATCH 15/28] docker: depend on xlib_libX11 and not the
	X.org server
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3c27991f0c7b1542999f41169a8d968f33c84768.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker is a X client application, so it doesn't make sense to depend
on the X.org server. An inspection of docker Makefile and source code
shows that it only needs the libX11 library, so we replace the X.org
server dependency by a libX11 dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker/Config.in |    1 +
 package/docker/docker.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/docker/Config.in b/package/docker/Config.in
index 75bf5be..f07739a 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  a system tray dock for X
 
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 95799e8..b452386 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -16,6 +16,6 @@ DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
-DOCKER_DEPENDENCIES = host-pkgconf libglib2 xserver_xorg-server
+DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
 
 $(eval $(autotools-package))
-- 
1.7.9.5
