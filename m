From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Mon, 31 Aug 2020 13:12:26 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
Message-ID: <20200831111226.15764-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 ...move-duplicated-variable-definitions.patch | 103 ++++++++++++++++++
 package/makedumpfile/Config.in                |  18 +++
 package/makedumpfile/makedumpfile.hash        |   3 +
 package/makedumpfile/makedumpfile.mk          |  28 +++++
 6 files changed, 156 insertions(+)
 create mode 100644 package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
 create mode 100644 package/makedumpfile/Config.in
 create mode 100644 package/makedumpfile/makedumpfile.hash
 create mode 100644 package/makedumpfile/makedumpfile.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..18e7a68665 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -137,6 +137,9 @@ F:	package/fastd/
 F:	package/libuecc/
 F:	package/putty/
 
+N:	Alexander Egorenkov <egorenar-dev@posteo.net>
+F:	package/makedumpfile/
+
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
 
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
diff --git a/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch b/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
new file mode 100644
index 0000000000..0255de796e
--- /dev/null
+++ b/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
@@ -0,0 +1,103 @@
+From 399f2c9a3acd5bd913e50a4dde52dee6527b297e Mon Sep 17 00:00:00 2001
+From: Kairui Song <kasong@redhat.com>
+Date: Wed, 29 Jan 2020 13:37:13 +0800
+Subject: [PATCH 1/1] [PATCH] Remove duplicated variable definitions
+
+When building on Fedora 32 (with GCC 10), following error is observed:
+
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2010: multiple definition of
+ `crash_reserved_mem_nr'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2010: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2009: multiple definition of
+ `crash_reserved_mem'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2009: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1278: multiple definition of
+ `parallel_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1278: first defined here
+/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1265: multiple definition of
+ `splitting_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1265: first defined here
+...
+collect2: error: ld returned 1 exit status
+make: *** [Makefile:97: makedumpfile] Error 1
+
+These variables are wrongly defined multiple times. So remove the
+duplicated definitions.
+
+Signed-off-by: Kairui Song <kasong@redhat.com>
+Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>
+---
+ makedumpfile.c | 8 ++++----
+ makedumpfile.h | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/makedumpfile.c b/makedumpfile.c
+index e290fbd..ae7336a 100644
+--- a/makedumpfile.c
++++ b/makedumpfile.c
+@@ -10954,7 +10954,7 @@ check_param_for_reassembling_dumpfile(int argc, char *argv[])
+ 		return FALSE;
+ 
+ 	if ((info->splitting_info
+-	    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
++	    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
+ 	    == NULL) {
+ 		MSG("Can't allocate memory for splitting_info.\n");
+ 		return FALSE;
+@@ -11042,7 +11042,7 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
+ 			return FALSE;
+ 		}
+ 		if ((info->splitting_info
+-		    = malloc(sizeof(splitting_info_t) * info->num_dumpfile))
++		    = malloc(sizeof(struct splitting_info) * info->num_dumpfile))
+ 		    == NULL) {
+ 			MSG("Can't allocate memory for splitting_info.\n");
+ 			return FALSE;
+@@ -11077,13 +11077,13 @@ check_param_for_creating_dumpfile(int argc, char *argv[])
+ 
+ 	if (info->num_threads) {
+ 		if ((info->parallel_info =
+-		     malloc(sizeof(parallel_info_t) * info->num_threads))
++		     malloc(sizeof(struct parallel_info) * info->num_threads))
+ 		    == NULL) {
+ 			MSG("Can't allocate memory for parallel_info.\n");
+ 			return FALSE;
+ 		}
+ 
+-		memset(info->parallel_info, 0, sizeof(parallel_info_t)
++		memset(info->parallel_info, 0, sizeof(struct parallel_info)
+ 							* info->num_threads);
+ 	}
+ 
+diff --git a/makedumpfile.h b/makedumpfile.h
+index 68d9691..7217407 100644
+--- a/makedumpfile.h
++++ b/makedumpfile.h
+@@ -1262,7 +1262,7 @@ struct splitting_info {
+ 	mdf_pfn_t		end_pfn;
+ 	off_t			offset_eraseinfo;
+ 	unsigned long		size_eraseinfo;
+-} splitting_info_t;
++};
+ 
+ struct parallel_info {
+ 	int			fd_memory;
+@@ -1275,7 +1275,7 @@ struct parallel_info {
+ #ifdef USELZO
+ 	lzo_bytep		wrkmem;
+ #endif
+-} parallel_info_t;
++};
+ 
+ struct ppc64_vmemmap {
+ 	unsigned long		phys;
+@@ -2006,8 +2006,8 @@ struct memory_range {
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
+-- 
+2.28.0
+
diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
new file mode 100644
index 0000000000..1a9016a766
--- /dev/null
+++ b/package/makedumpfile/Config.in
@@ -0,0 +1,18 @@
+comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
+config BR2_PACKAGE_MAKEDUMPFILE
+	bool "makedumpfile"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_ZLIB
+	help
+	  Makes a small dumpfile of kdump.
+
+	  https://github.com/makedumpfile/makedumpfile  
diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
new file mode 100644
index 0000000000..2ecfc5b1c5
--- /dev/null
+++ b/package/makedumpfile/makedumpfile.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  cd3642dfe780d446f2dc328736bb2070007032718f5628262d5f59baf03619a4  makedumpfile-1.6.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
new file mode 100644
index 0000000000..1876e1158a
--- /dev/null
+++ b/package/makedumpfile/makedumpfile.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# makedumpfile
+#
+################################################################################
+
+MAKEDUMPFILE_VERSION = 1.6.7
+MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,Released-$(subst .,-,$(MAKEDUMPFILE_VERSION)))
+MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
+MAKEDUMPFILE_LICENSE = GPL-2.0
+MAKEDUMPFILE_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LZO),y)
+MAKEDUMPFILE_DEPENDENCIES += lzo
+MAKEDUMPFILE_MAKE_OPTS += USELZO=on
+endif
+
+define MAKEDUMPFILE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		TARGET=$(BR2_ARCH) LINKTYPE=dynamic
+endef
+
+define MAKEDUMPFILE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.28.0
