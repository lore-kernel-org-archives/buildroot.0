From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:35 -0000
Subject: [Buildroot] [git commit branch/next] menu-cache: new package
Message-ID: <20150808105629.770F77FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91489ddc48c439004e718667f117fce391658577
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - Remove the MENU_CACHE_VERSION_MINOR variable, not needed. Noticed
    by Yann E. Morin.
  - Rewrap Config.in help text.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/menu-cache/Config.in       |   16 ++++++++++++++++
 package/menu-cache/menu-cache.hash |    2 ++
 package/menu-cache/menu-cache.mk   |   16 ++++++++++++++++
 4 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1887c6b..8a204b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -806,6 +806,7 @@ menu "Graphics"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvips/Config.in"
+	source "package/menu-cache/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
 	source "package/openjpeg/Config.in"
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
new file mode 100644
index 0000000..b75c8ec
--- /dev/null
+++ b/package/menu-cache/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_MENU_CACHE
+	bool "menu-cache"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBFM_EXTRA
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  Small library from LXDE project used for application menu
+	  integration
+
+	  http://wiki.lxde.org/
+
+comment "menu-cache needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
new file mode 100644
index 0000000..3b9e5c4
--- /dev/null
+++ b/package/menu-cache/menu-cache.hash
@@ -0,0 +1,2 @@
+# From http://blog.lxde.org/?p=1299
+sha1  e7b3854109f9826472cf9795e924acebe5e27861  menu-cache-1.0.0.tar.xz
diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
new file mode 100644
index 0000000..9d43864
--- /dev/null
+++ b/package/menu-cache/menu-cache.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# menu-cache
+#
+################################################################################
+
+MENU_CACHE_VERSION_MAJOR = 1.0
+MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).0
+MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
+MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
+MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
+MENU_CACHE_LICENSE = LGPLv2.1
+MENU_CACHE_LICENSE_FILES = COPYING
+MENU_CACHE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
