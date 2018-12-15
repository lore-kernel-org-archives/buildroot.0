From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 15 Dec 2018 18:35:53 -0500
Subject: [Buildroot] [PATCH v9 2/4] prelink-cross: new package
In-Reply-To: <20181215233555.98482-1-aduskett@gmail.com>
References: <20181215233555.98482-1-aduskett@gmail.com>
Message-ID: <20181215233555.98482-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Prelink-cross emulates a runtime linker for a given sysroot. This is
necessary to allow gobject-introspection to build it's typelib files
during cross-compiling.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v7:
  - Add patch to series.

Changes v7 -> v8:
  - None

Changes v8 -> v9:
  - Add the package to the DEVELOPERS file under my name.
  - Bump version to a853a5d715d84eec93aa68e8f2df26b7d860f5b2
  - Add host-elfutils as a dependency.

 DEVELOPERS                               |  1 +
 package/Config.in.host                   |  1 +
 package/prelink-cross/Config.in.host     |  9 +++++++++
 package/prelink-cross/prelink-cross.hash |  3 +++
 package/prelink-cross/prelink-cross.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/prelink-cross/Config.in.host
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4192681bf8..5bbb458151 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -51,6 +51,7 @@ F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
+F:	package/prelink-cross/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
diff --git a/package/Config.in.host b/package/Config.in.host
index 16b474fc9d..f7384af979 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -44,6 +44,7 @@ menu "Host utilities"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pkgconf/Config.in.host"
+	source "package/prelink-cross/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
diff --git a/package/prelink-cross/Config.in.host b/package/prelink-cross/Config.in.host
new file mode 100644
index 0000000000..0c54f6a8c4
--- /dev/null
+++ b/package/prelink-cross/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_PRELINK_CROSS
+	bool "host prelink-cross"
+	help
+	  The prelink package contains a utility which modifies
+	  ELF shared libraries and executables, so that far fewer
+	  relocations need to be resolved at runtime and thus
+	  programs come up faster.
+
+	  https://wiki.yoctoproject.org/wiki/Cross-Prelink
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
new file mode 100644
index 0000000000..3ac33ac3d0
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cb3f5d833cd74b7e90e38465c9c948b0f4138c017509cb91e391b0931063429e  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2.tar.gz
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
new file mode 100644
index 0000000000..ab7a967f95
--- /dev/null
+++ b/package/prelink-cross/prelink-cross.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# host-prelink-cross
+#
+################################################################################
+
+HOST_PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+HOST_PRELINK_CROSS_SITE = git://git.yoctoproject.org/prelink-cross
+HOST_PRELINK_CROSS_SITE_METHOD = git
+HOST_PRELINK_CROSS_LICENSE = GPL-2.0
+HOST_PRELINK_CROSS_LICENSE_FILES = COPYING
+HOST_PRELINK_CROSS_AUTORECONF = YES
+HOST_PRELINK_CROSS_DEPENDENCIES = host-binutils host-elfutils
+
+$(eval $(host-autotools-package))
-- 
2.19.2
