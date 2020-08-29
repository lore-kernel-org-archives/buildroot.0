From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 29 Aug 2020 09:59:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: new package
Message-ID: <20200829075901.19860-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/Config.in                             |  1 +
 .../0001-Cross-compilation-fixes.patch        | 13 +++++++
 package/makedumpfile/0002-gcc10-fixes.patch   | 35 +++++++++++++++++++
 package/makedumpfile/Config.in                | 11 ++++++
 package/makedumpfile/makedumpfile.hash        |  3 ++
 package/makedumpfile/makedumpfile.mk          | 23 ++++++++++++
 6 files changed, 86 insertions(+)
 create mode 100644 package/makedumpfile/0001-Cross-compilation-fixes.patch
 create mode 100644 package/makedumpfile/0002-gcc10-fixes.patch
 create mode 100644 package/makedumpfile/Config.in
 create mode 100644 package/makedumpfile/makedumpfile.hash
 create mode 100644 package/makedumpfile/makedumpfile.mk

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..10cb1f94d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2374,6 +2374,7 @@ menu "System tools"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
 	source "package/lxc/Config.in"
+	source "package/makedumpfile/Config.in"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
diff --git a/package/makedumpfile/0001-Cross-compilation-fixes.patch b/package/makedumpfile/0001-Cross-compilation-fixes.patch
new file mode 100644
index 0000000000..ebe495d89d
--- /dev/null
+++ b/package/makedumpfile/0001-Cross-compilation-fixes.patch
@@ -0,0 +1,13 @@
+Index: makedumpfile-1.6.7/Makefile
+===================================================================
+--- makedumpfile-1.6.7.orig/Makefile
++++ makedumpfile-1.6.7/Makefile
+@@ -8,7 +8,7 @@ ifeq ($(strip $CC),)
+ CC	= gcc
+ endif
+ 
+-CFLAGS_BASE := $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
++CFLAGS_BASE := $(EXTRA_CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
+ 		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+ CFLAGS      := $(CFLAGS_BASE) -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
+ CFLAGS_ARCH := $(CFLAGS_BASE)
diff --git a/package/makedumpfile/0002-gcc10-fixes.patch b/package/makedumpfile/0002-gcc10-fixes.patch
new file mode 100644
index 0000000000..10c4bf72c7
--- /dev/null
+++ b/package/makedumpfile/0002-gcc10-fixes.patch
@@ -0,0 +1,35 @@
+--- a/makedumpfile.h	2020-08-28 20:08:00.308241301 +0200
++++ b/makedumpfile.h	2020-08-28 20:08:10.484310117 +0200
+@@ -1262,7 +1262,9 @@
+ 	mdf_pfn_t		end_pfn;
+ 	off_t			offset_eraseinfo;
+ 	unsigned long		size_eraseinfo;
+-} splitting_info_t;
++};
++
++typedef struct splitting_info splitting_info_t;
+ 
+ struct parallel_info {
+ 	int			fd_memory;
+@@ -1275,7 +1277,9 @@
+ #ifdef USELZO
+ 	lzo_bytep		wrkmem;
+ #endif
+-} parallel_info_t;
++};
++
++typedef struct parallel_info parallel_info_t;
+ 
+ struct ppc64_vmemmap {
+ 	unsigned long		phys;
+@@ -2006,8 +2010,8 @@
+ };
+ 
+ #define CRASH_RESERVED_MEM_NR   8
+-struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
+-int crash_reserved_mem_nr;
++extern struct memory_range crash_reserved_mem[CRASH_RESERVED_MEM_NR];
++extern int crash_reserved_mem_nr;
+ 
+ unsigned long read_vmcoreinfo_symbol(char *str_symbol);
+ int readmem(int type_addr, unsigned long long addr, void *bufptr, size_t size);
diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
new file mode 100644
index 0000000000..6751282ea6
--- /dev/null
+++ b/package/makedumpfile/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MAKEDUMPFILE
+	bool "makedumpfile"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_XZ
+	help
+	  Makes a small dumpfile of kdump.
diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
new file mode 100644
index 0000000000..6cf882e3e5
--- /dev/null
+++ b/package/makedumpfile/makedumpfile.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  e702fbdf62b4cd829a76e46f3e24eb3fc7501918b85ebdcd8baef4f53d6ee2c8  makedumpfile-1.6.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
new file mode 100644
index 0000000000..b240944eaf
--- /dev/null
+++ b/package/makedumpfile/makedumpfile.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# makedumpfile
+#
+################################################################################
+
+MAKEDUMPFILE_VERSION = 1.6.7
+MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/Released-$(subst .,-,$(MAKEDUMPFILE_VERSION))
+MAKEDUMPFILE_DEPENDENCIES = zlib xz lzo
+MAKEDUMPFILE_LICENSE = GPL-2.0
+MAKEDUMPFILE_LICENSE_FILES = COPYING
+
+define MAKEDUMPFILE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		EXTRA_CFLAGS="$(TARGET_CFLAGS)" TARGET=$(BR2_ARCH) USELZO=on LINKTYPE=dynamic
+endef
+
+define MAKEDUMPFILE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+		DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.28.0
