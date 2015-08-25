From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 16:41:43 +0200
Subject: [Buildroot] [git commit] package/libmbim: Now needs libgudev under
	systemd
Message-ID: <20150825182425.EF90C80058@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad4be753c15b7df9cd5e93f9edc3d58b8280baa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmbim uses code (originally from udev) that has since been split
from the main systemd codebase into libgudev.

Fixes: http://autobuild.buildroot.org/results/638/638dbf05b785a276a33983b0237b7cad54777b85/

Tweak the package files for libmbim to require libgudev when building
with systemd.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbim/Config.in  |    1 +
 package/libmbim/libmbim.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index bd34dd4..e79d51f 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBMBIM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBGUDEV if BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 8d49f28..cfba08e 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -13,6 +13,10 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2 udev
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LIBMBIM_DEPENDENCIES += libgudev
+endif
+
 # we don't want -Werror
 LIBMBIM_CONF_OPTS = --enable-more-warnings=no
 
