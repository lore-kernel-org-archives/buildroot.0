From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 13:39:00 +0200
Subject: [Buildroot] [git commit] package/ijs: New package ijs 0.35
Message-ID: <20150404113936.7155481906@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b392b3926cb266f7bb3ba51e879a9e7c454ef91e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Add BR2_USE_MMU dependency, since fork() is used.
  - Put <pkg>_SOURCE next to <pkg>_VERSION and <pkg>_SITE.
  - Improve comment about why autoreconf is needed.
  - Change the location in menuconfig of the package, "Networking
    applications" didn't seem like an appropriate location.]

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/ijs/Config.in |    8 ++++++++
 package/ijs/ijs.hash  |    2 ++
 package/ijs/ijs.mk    |   17 +++++++++++++++++
 4 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 89bed0d..c103854 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -727,6 +727,7 @@ menu "Graphics"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/harfbuzz/Config.in"
+	source "package/ijs/Config.in"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/ijs/Config.in b/package/ijs/Config.in
new file mode 100644
index 0000000..50e8161
--- /dev/null
+++ b/package/ijs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IJS
+	bool "ijs"
+	depends on BR2_USE_MMU # fork()
+	help
+	  The IJS package contains a library which implements a
+	  protocol for transmission of raster page images.
+
+	  http://www.openprinting.org/
diff --git a/package/ijs/ijs.hash b/package/ijs/ijs.hash
new file mode 100644
index 0000000..1a8f564
--- /dev/null
+++ b/package/ijs/ijs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9  ijs-0.35.tar.bz2
diff --git a/package/ijs/ijs.mk b/package/ijs/ijs.mk
new file mode 100644
index 0000000..dfd3ff9
--- /dev/null
+++ b/package/ijs/ijs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# ijs
+#
+################################################################################
+
+IJS_VERSION = 0.35
+IJS_SOURCE = ijs-$(IJS_VERSION).tar.bz2
+IJS_SITE = http://www.openprinting.org/download/ijs/download
+IJS_LICENSE = MIT
+IJS_LICENSE_FILES = README
+# Buildroot libtool patch does not apply, so we autoreconf the
+# package.
+IJS_AUTORECONF = YES
+IJS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
