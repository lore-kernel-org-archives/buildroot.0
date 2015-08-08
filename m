From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:40 -0000
Subject: [Buildroot] [git commit branch/next] libfm-extra: new package
Message-ID: <20150808105629.6DFF37FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5d3c5abde69d3d085d496747c0da4c5852ce188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - adjust license: it's actually under GPLv2+, plus some bits under
    LGPLv2.1+ as noticed by Yann E. Morin, and add another license
    file for LGPLv2.1+
  - add missing dependency on host-intltool.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/libfm-extra/Config.in        |   15 +++++++++++++++
 package/libfm-extra/libfm-extra.hash |    2 ++
 package/libfm-extra/libfm-extra.mk   |   16 ++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9787521..1887c6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -786,6 +786,7 @@ menu "Graphics"
 	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
+	source "package/libfm-extra/Config.in"
 	source "package/libfreeimage/Config.in"
 	source "package/libgail/Config.in"
 	source "package/libgeotiff/Config.in"
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
index 0000000..f5b1928
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
+LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
+LIBFM_EXTRA_LICENSE = GPLv2+, LGPLv2.1+
+LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
+LIBFM_EXTRA_INSTALL_STAGING = YES
+LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
+
+$(eval $(autotools-package))
