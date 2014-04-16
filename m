From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:00:29 +0200
Subject: [Buildroot] [git commit] package: add Boehm-Demers-Weiser gc library
Message-ID: <20140416170059.DBC8C9C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8986a221172cac4f84e74212476c12c288995abf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for applications like Zile

[Thomas:
 - use $(...) instead of ${...} to reference LIBGC_VERSION
 - add missing dependency on libatomic_ops dependencies
 - fix DEPENDANCIES -> DEPENDENCIES
 - replace += by = in dependencies definition
 - add host-pkgconf to the list of dependencies
 - fix license, it's a X11-style permissive license
 - fix license file, COPYING didn't exist, use README.md instead]

Signed-off-by: Alex Benn??e <alex.bennee@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/libgc/Config.in |   11 +++++++++++
 package/libgc/libgc.mk  |   15 +++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 01c7ae9..51f2515 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -792,6 +792,7 @@ source "package/libev/Config.in"
 source "package/libevdev/Config.in"
 source "package/libevent/Config.in"
 source "package/libffi/Config.in"
+source "package/libgc/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
diff --git a/package/libgc/Config.in b/package/libgc/Config.in
new file mode 100644
index 0000000..5e23b3d
--- /dev/null
+++ b/package/libgc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBGC
+	bool "libgc"
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	help
+	  The Boehm-Demers-Weiser conservative garbage collector can be used
+	  as a garbage collecting replacement for C malloc or C++ new. It allows
+	  you to allocate memory basically as you normally would, without
+	  explicitly deallocating memory that is no longer useful.
+
+	  http://www.hboehm.info/gc/
diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
new file mode 100644
index 0000000..a8611f1
--- /dev/null
+++ b/package/libgc/libgc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libgc
+#
+################################################################################
+
+LIBGC_VERSION = 7.4.0
+LIBGC_SOURCE = gc-$(LIBGC_VERSION).tar.gz
+LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
+LIBGC_DEPENDENCIES = libatomic_ops host-pkgconf
+LIBGC_LICENSE = Permissive X11-style
+LIBGC_LICENSE_FILES = README.md
+LIBGC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
