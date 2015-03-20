From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:32:15 +0100
Subject: [Buildroot] [git commit] hwloc: new package
Message-ID: <20150320203254.377DA7F932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e80c3007bf1425cc0a98654a6c89f311f4a5d5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - remove mandatory libpciaccess and numactl dependencies. Those
    dependencies are optional.
  - add dependency on threads.
  - use a HWLOC_VERSION_MAJOR variable to avoid repeating the major
    version number in HWLOC_SITE.
  - explicitly disable features we don't support.
  - explicitly enable/disable pci and numa support, depending on the
    availability of the corresponding dependencies.
  - add dependency on host-pkgconf, since pkg-config can be used by
    hwloc configure script.]

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/hwloc/Config.in  |   15 +++++++++++++++
 package/hwloc/hwloc.hash |    2 ++
 package/hwloc/hwloc.mk   |   38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d310abc..c938326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,6 +331,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/hdparm/Config.in"
 endif
 	source "package/hwdata/Config.in"
+	source "package/hwloc/Config.in"
 	source "package/i2c-tools/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/input-tools/Config.in"
diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
new file mode 100644
index 0000000..51aef4a
--- /dev/null
+++ b/package/hwloc/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HWLOC
+	bool "hwloc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Portable Hardware Locality
+
+	  Provides a portable abstraction (across OS, versions,
+	  architectures, ...)  of the hierarchical topology of modern
+	  architectures, including NUMA memory nodes, sockets, shared
+	  caches, cores and simultaneous multithreading.
+
+	  http://www.open-mpi.org/projects/hwloc/
+
+comment "hwloc needs a toolchain w/ threads"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
new file mode 100644
index 0000000..53563dd
--- /dev/null
+++ b/package/hwloc/hwloc.hash
@@ -0,0 +1,2 @@
+# From http://www.open-mpi.org/software/hwloc/v1.10/
+sha1	76291124e4638b2fbd4deb4cc3cd680e153077b5	hwloc-1.10.1.tar.bz2
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
new file mode 100644
index 0000000..c1f6fea
--- /dev/null
+++ b/package/hwloc/hwloc.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# hwloc
+#
+################################################################################
+
+HWLOC_VERSION_MAJOR = 1.10
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
+HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
+HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/downloads
+HWLOC_LICENSE = BSD-3c
+HWLOC_LICENSE_FILES = COPYING
+HWLOC_DEPENDENCIES = host-pkgconf
+
+HWLOC_CONF_OPTS = \
+	--disable-opencl \
+	--disable-cuda \
+	--disable-nvml \
+	--disable-gl \
+	--disable-cairo \
+	--disable-libxml2 \
+	--disable-doxygen
+
+ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
+HWLOC_CONF_OPTS += --enable-pci
+HWLOC_DEPENDENCIES += libpciaccess
+else
+HWLOC_CONF_OPTS += --disable-pci
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+HWLOC_CONF_OPTS += --enable-libnuma
+HWLOC_DEPENDENCIES += numactl
+else
+HWLOC_CONF_OPTS += --disable-libnuma
+endif
+
+$(eval $(autotools-package))
