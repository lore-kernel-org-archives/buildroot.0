From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Nov 2014 12:02:17 +0000
Subject: [Buildroot] [PATCH 1/4] libfm-extra: new package
In-Reply-To: <1416571340-3550-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416571340-3550-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1416571340-3550-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in                    |    1 +
 package/libfm-extra/Config.in        |   15 +++++++++++++++
 package/libfm-extra/libfm-extra.hash |    2 ++
 package/libfm-extra/libfm-extra.mk   |   16 ++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/libfm-extra/Config.in
 create mode 100644 package/libfm-extra/libfm-extra.hash
 create mode 100644 package/libfm-extra/libfm-extra.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..7b544cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -644,6 +644,7 @@ menu "Graphics"
 	source "package/libdmtx/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfm-extra/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
new file mode 100644
index 0000000..f0e0b63
--- /dev/null
+++ b/package/libfm-extra/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBFM_EXTRA
+	bool "libfm-extra"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	help
+	  The libfm-extra package contains a library and other files
+	  required by menu-cache-gen libexec of menu-cache-1.0.0
+
+	  http://wiki.lxde.org/en/Libfm
+
+comment "libfm-extra needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfm-extra/libfm-extra.hash b/package/libfm-extra/libfm-extra.hash
new file mode 100644
index 0000000..5311dec
--- /dev/null
+++ b/package/libfm-extra/libfm-extra.hash
@@ -0,0 +1,2 @@
+# From http://blog.lxde.org/?p=1280
+sha1  c3f2f34086761d89d6aba549883610084ba00750  libfm-1.2.3.tar.xz
diff --git a/package/libfm-extra/libfm-extra.mk b/package/libfm-extra/libfm-extra.mk
new file mode 100644
index 0000000..70e37b9
--- /dev/null
+++ b/package/libfm-extra/libfm-extra.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libfm-extra
+#
+################################################################################
+
+LIBFM_EXTRA_VERSION = 1.2.3
+LIBFM_EXTRA_SOURCE = libfm-$(LIBFM_EXTRA_VERSION).tar.xz
+LIBFM_EXTRA_SITE = http://sourceforge.net/projects/pcmanfm/files
+LIBFM_EXTRA_DEPENDENCIES = libglib2
+LIBFM_EXTRA_LICENSE = GPLv2
+LIBFM_EXTRA_LICENSE_FILES = COPYING
+LIBFM_EXTRA_INSTALL_STAGING = YES
+LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
+
+$(eval $(autotools-package))
-- 
1.7.1
