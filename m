From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:11:29 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 3.16.2
Message-ID: <20141007101314.EEC6BB0D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eab4e5605bf72d316eeded9fccdda26f05d75bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Add-support-for-DISABLE_DOCUMENTATION.patch |   41 --------
 ...-Improve-static-building-and-installation.patch |  101 --------------------
 package/btrfs-progs/btrfs-progs.hash               |    4 +-
 package/btrfs-progs/btrfs-progs.mk                 |    4 +-
 4 files changed, 4 insertions(+), 146 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs-0001-Add-support-for-DISABLE_DOCUMENTATION.patch b/package/btrfs-progs/btrfs-progs-0001-Add-support-for-DISABLE_DOCUMENTATION.patch
deleted file mode 100644
index ad71f79..0000000
--- a/package/btrfs-progs/btrfs-progs-0001-Add-support-for-DISABLE_DOCUMENTATION.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5e101a32087bbba18ebbcdf75faee3fff27f7168 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 30 Aug 2014 14:42:00 +0200
-Subject: [PATCH 1/2] Add support for DISABLE_DOCUMENTATION
-
-This commit adds the support for a make variable named
-"DISABLE_DOCUMENTATION", which allows to disable the build of the
-documentation. This is useful in contexts where the tools needed to
-build the documentation are not necessarily available.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e721e99..926885f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -57,10 +57,15 @@ btrfs_image_libs = -lpthread
- btrfs_fragments_libs = -lgd -lpng -ljpeg -lfreetype
- 
- SUBDIRS =
--BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS)) build-Documentation
--INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS)) install-Documentation
-+BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
-+INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
- CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
- 
-+ifneq ($(DISABLE_DOCUMENTATION),1)
-+BUILDDIRS += build-Documentation
-+INSTALLDIRS += install-Documentation
-+endif
-+
- .PHONY: $(SUBDIRS)
- .PHONY: $(BUILDDIRS)
- .PHONY: $(INSTALLDIRS)
--- 
-2.0.0
-
diff --git a/package/btrfs-progs/btrfs-progs-0002-Improve-static-building-and-installation.patch b/package/btrfs-progs/btrfs-progs-0002-Improve-static-building-and-installation.patch
deleted file mode 100644
index 827c631..0000000
--- a/package/btrfs-progs/btrfs-progs-0002-Improve-static-building-and-installation.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 6cef3077e0e7073e3449286b3e544ec60e3c5270 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 30 Aug 2014 14:43:04 +0200
-Subject: [PATCH 2/2] Improve static building and installation
-
-This commit improves the static-only building of btrfs-progs, and adds
-support for installing the static only tools:
-
- - It now ensures that all programs are built statically, not only a
-   small subset of them, by defining 'progs_static' from the existing
-   'progs' variable.
-
- - It changes the order of libraries in the btrfs-%.static rule so
-   that -lpthread (part of STATIC_LIBS) appears *after* the '$($(subst
-   -,_,$(subst .static,,$@)-libs))' logic, which brings in
-   -lcom_err. This is needed because libcom_err.a uses the semaphore
-   functions, which are available in the pthread library.
-
- - Adds the necessary rules to generate the btrfsck.static link and
-   btrfstune.static binary.
-
- - Adds an 'install-static' target to install the static
-   binaries. Note that they are renamed to not carry a '.static'
-   suffix.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 22 +++++++++++++++++++---
- 1 file changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 926885f..93e264b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -50,6 +50,8 @@ progs = mkfs.btrfs btrfs-debug-tree btrfsck \
- 	btrfs btrfs-map-logical btrfs-image btrfs-zero-log btrfs-convert \
- 	btrfs-find-root btrfstune btrfs-show-super
- 
-+progs_static = $(foreach p,$(progs),$(p).static)
-+
- # external libs required by various binaries; for btrfs-foo,
- # specify btrfs_foo_libs = <list of libs>; see $($(subst...)) rules below
- btrfs_convert_libs = -lext2fs -lcom_err
-@@ -141,7 +143,7 @@ test:
- # NOTE: For static compiles, you need to have all the required libs
- # 	static equivalent available
- #
--static: btrfs.static mkfs.btrfs.static btrfs-find-root.static
-+static: $(progs_static)
- 
- version.h:
- 	@echo "    [SH]     $@"
-@@ -174,8 +176,8 @@ $(lib_links):
- btrfs-%.static: $(static_objects) btrfs-%.static.o $(static_libbtrfs_objects)
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) $(STATIC_CFLAGS) -o $@ $@.o $(static_objects) \
--		$(static_libbtrfs_objects) $(STATIC_LDFLAGS) $(STATIC_LIBS) \
--		$($(subst -,_,$(subst .static,,$@)-libs))
-+		$(static_libbtrfs_objects) $(STATIC_LDFLAGS) \
-+		$($(subst -,_,$(subst .static,,$@)-libs)) $(STATIC_LIBS)
- 
- btrfs-%: $(objects) $(libs) btrfs-%.o
- 	@echo "    [LD]     $@"
-@@ -196,6 +198,10 @@ btrfsck: btrfs
- 	@echo "    [LN]     $@"
- 	$(Q)$(LN) -f btrfs btrfsck
- 
-+btrfsck.static: btrfs.static
-+	@echo "    [LN]     $@"
-+	$(Q)$(LN) -f $^ $@
-+
- mkfs.btrfs: $(objects) $(libs) mkfs.o
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) $(CFLAGS) -o mkfs.btrfs $(objects) mkfs.o $(LDFLAGS) $(LIBS)
-@@ -209,6 +215,11 @@ btrfstune: $(objects) $(libs) btrfstune.o
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) $(CFLAGS) -o btrfstune $(objects) btrfstune.o $(LDFLAGS) $(LIBS)
- 
-+btrfstune.static: $(static_objects) btrfstune.static.o $(static_libbtrfs_objects)
-+	@echo "    [LD]     $@"
-+	$(Q)$(CC) $(STATIC_CFLAGS) -o $@ btrfstune.static.o $(static_objects) \
-+		$(static_libbtrfs_objects) $(STATIC_LDFLAGS) $(STATIC_LIBS)
-+
- dir-test: $(objects) $(libs) dir-test.o
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) $(CFLAGS) -o dir-test $(objects) dir-test.o $(LDFLAGS) $(LIBS)
-@@ -258,6 +269,11 @@ install: $(libs) $(progs) $(INSTALLDIRS)
- 	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)
- 	$(INSTALL) -m644 $(headers) $(DESTDIR)$(incdir)
- 
-+install-static: $(progs_static) $(INSTALLDIRS)
-+	for p in $(progs_static) ; do \
-+		$(INSTALL) -D -m755 $$p $(DESTDIR)$(bindir)/`basename $$p .static` ; \
-+	done
-+
- $(INSTALLDIRS):
- 	@echo "Making install in $(patsubst install-%,%,$@)"
- 	$(Q)$(MAKE) $(MAKEOPTS) -C $(patsubst install-%,%,$@) install
--- 
-2.0.0
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index b22acf3..af4c9cd 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs/sha256sums.asc
-sha256	9a7651df6c0430b75fa0637519ca5be29a756684dada241b4398007ae3cb0b5e	btrfs-progs-v3.16.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
+sha256	d4d62abe0c2b8e86888f96e4bd21ca7e25c2d53120a3b9e8c6f987344147732b	btrfs-progs-v3.16.2.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index a91791b..154cb98 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.16
-BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs
+BTRFS_PROGS_VERSION = 3.16.2
+BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
 BTRFS_PROGS_LICENSE = GPLv2
