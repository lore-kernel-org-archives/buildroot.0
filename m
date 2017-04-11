From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:32 +0200
Subject: [Buildroot] [PATCH 03/14] package/libspatialindex: new package
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
test-pkg reported an internal compiler error on microblaze (br-microblazeel-full)
Index.cc: In member function 'void SpatialIndex::RTree::Index::adjustTree(SpatialIndex::RTree::Node*, std::stack<long long int>&)':
Index.cc:327:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1027
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/libspatialindex/Config.in            | 30 ++++++++++++++++++++++++++++
 package/libspatialindex/libspatialindex.hash |  4 ++++
 package/libspatialindex/libspatialindex.mk   | 14 +++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/libspatialindex/Config.in
 create mode 100644 package/libspatialindex/libspatialindex.hash
 create mode 100644 package/libspatialindex/libspatialindex.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 354866e..64fe583 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1339,6 +1339,7 @@ F:	package/iqvlinux/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
+F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
diff --git a/package/Config.in b/package/Config.in
index 19315f7..58b196b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1385,6 +1385,7 @@ menu "Other"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
+	source "package/libspatialindex/Config.in"
 	source "package/libtasn1/Config.in"
 	source "package/libtommath/Config.in"
 	source "package/libtpl/Config.in"
diff --git a/package/libspatialindex/Config.in b/package/libspatialindex/Config.in
new file mode 100644
index 0000000..0d066f6
--- /dev/null
+++ b/package/libspatialindex/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LIBSPATIALINDEX
+	bool "libspatialindex"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The purpose of libspatialindex is to provide:
+
+	  * An extensible framework that will support robust spatial
+	    indexing methods.
+
+	  * Support for sophisticated spatial queries. Range, point
+	    location, nearest neighbor and k-nearest neighbor as well
+	    as parametric queries (defined by spatial constraints)
+	    should be easy to deploy and run.
+
+	  * Easy to use interfaces for inserting, deleting and updating
+	    information.
+
+	  * Wide variety of customization capabilities. Basic index and
+	    storage characteristics like the page size, node capacity,
+	    minimum fan-out, splitting algorithm, etc. should be easy
+	    to customize.
+
+	  * Index persistence. Internal memory and external memory
+	    structures should be supported. Clustered and non-clustered
+	    indices should be easy to be persisted.
+
+	  https://libspatialindex.github.io
+
+comment "libspatialindex needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libspatialindex/libspatialindex.hash b/package/libspatialindex/libspatialindex.hash
new file mode 100644
index 0000000..3aa636d
--- /dev/null
+++ b/package/libspatialindex/libspatialindex.hash
@@ -0,0 +1,4 @@
+# From http://download.osgeo.org/libspatialindex/spatialindex-src-1.8.5.tar.bz2.md5
+md5 3303c47fd85aa17e64ef52ebec212762 spatialindex-src-1.8.5.tar.bz2
+# Locally computed
+sha256 31ec0a9305c3bd6b4ad60a5261cba5402366dd7d1969a8846099717778e9a50a spatialindex-src-1.8.5.tar.bz2
diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
new file mode 100644
index 0000000..d815364
--- /dev/null
+++ b/package/libspatialindex/libspatialindex.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libspatialindex
+#
+################################################################################
+
+LIBSPATIALINDEX_VERSION = 1.8.5
+LIBSPATIALINDEX_SITE = http://download.osgeo.org/libspatialindex
+LIBSPATIALINDEX_SOURCE = spatialindex-src-$(LIBSPATIALINDEX_VERSION).tar.bz2
+LIBSPATIALINDEX_INSTALL_STAGING = YES
+LIBSPATIALINDEX_LICENSE = MIT
+LIBSPATIALINDEX_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.9.3
