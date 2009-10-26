From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Oct 2009 08:31:34 +0100
Subject: [Buildroot] [git commit master] libelf: convert to
	Makefile.autotools.in and get rid of LIBELF_HEADERS option
Message-ID: <20091026073314.9912577705@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a305c33209abba05fa9371e09abc5dc4c397973b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have the generic BR2_HAVE_DEVFILES now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    6 ++--
 package/libelf/Config.in |   14 ++------
 package/libelf/libelf.mk |   84 +++++-----------------------------------------
 package/ltrace/Config.in |    2 +-
 4 files changed, 16 insertions(+), 90 deletions(-)

diff --git a/CHANGES b/CHANGES
index d6b7c03..f939cfb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,9 +6,9 @@
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
-	libevent, libglib2, liblockfile, libmad, libnl, libupnp, libuuid,
-	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g,
-	openssl, php, python, quagga, radvd, rsync, samba, sawman,
+	libelf, libevent, libglib2, liblockfile, libmad, libnl, libupnp,
+	libuuid, ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, netsnmp,
+	ntfs-3g, openssl, php, python, quagga, radvd, rsync, samba, sawman,
 	shared-mime-info, speech-tools, sqlite, squashfs, syslinux, u-boot,
 	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, zlib
diff --git a/package/libelf/Config.in b/package/libelf/Config.in
index 197f993..600ef68 100644
--- a/package/libelf/Config.in
+++ b/package/libelf/Config.in
@@ -1,15 +1,7 @@
 config BR2_PACKAGE_LIBELF
 	bool "libelf"
 	help
-	  This is the public release of libelf-0.8.5, a free ELF object
-	  file access library. This build does not generate a shared
-	  library.
+	  The elf library provides routines to access, and manipulate,
+	  Elf object files.
 
-	  http://www.stud.uni-hannover.de/~michael/software/
-
-config BR2_PACKAGE_LIBELF_HEADERS
-	bool "headers on the target"
-	depends on BR2_PACKAGE_LIBELF
-	help
-	  Whether to copy the lib and the headers to the
-	  target system.
+	  http://www.mr511.de/software/
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 1d1b175..ade369e 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -6,82 +6,16 @@
 LIBELF_VERSION=0.8.10
 LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
 LIBELF_SITE=http://www.mr511.de/software/
-LIBELF_DIR=$(BUILD_DIR)/libelf-$(LIBELF_VERSION)
+LIBELF_INSTALL_STAGING = YES
+LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
+LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
 
-LIBELF_ARCH:=$(ARCH)
-ifeq ("$(strip $(ARCH))","armeb")
-LIBELF_ARCH:=arm
-endif
-
-ifeq ($(BR2_LARGEFILE),y)
-LIBELF_CONFIG:=--enable-elf64
-endif
-
-$(DL_DIR)/$(LIBELF_SOURCE):
-	$(call DOWNLOAD,$(LIBELF_SITE),$(LIBELF_SOURCE))
-
-$(LIBELF_DIR)/.unpacked: $(DL_DIR)/$(LIBELF_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LIBELF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBELF_DIR) package/libelf libelf\*.patch
-	$(CONFIG_UPDATE) $(LIBELF_DIR)
-	touch $@
-
-$(LIBELF_DIR)/.configured: $(LIBELF_DIR)/.unpacked
-	(cd $(LIBELF_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		libelf_cv_working_memmove=yes \
+LIBELD_CONF_ENV = libelf_cv_working_memmove=yes \
 		mr_cv_target_elf=yes \
-		libelf_64bit=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--disable-debug \
-		--disable-sanity-checks \
-		$(LIBELF_CONFIG) \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VERSION): $(LIBELF_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBELF_DIR)
-
-$(STAGING_DIR)/usr/lib/libelf.a $(STAGING_DIR)/usr/lib/libelf.so.$(LIBELF_VERSION): $(LIBELF_DIR)/lib/libelf.so.$(LIBELF_VERSION)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		instroot=$(STAGING_DIR) -C $(LIBELF_DIR) install
-
-ifeq ($(BR2_PACKAGE_LIBELF_HEADERS),y)
-$(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VERSION): $(STAGING_DIR)/usr/lib/libelf.a
-	mkdir -p $(@D)
-	cp -dpf $(STAGING_DIR)/usr/lib/libelf* $(@D)
-	mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpR $(STAGING_DIR)/usr/include/{gelf.h,libelf*} $(TARGET_DIR)/usr/include/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+		libelf_64bit=yes
 
-libelf: $(TARGET_DIR)/usr/lib/libelf.so.$(LIBELF_VERSION)
-else
-libelf: $(STAGING_DIR)/usr/lib/libelf.so.$(LIBELF_VERSION)
-endif
-libelf-source: $(DL_DIR)/$(LIBELF_SOURCE)
+LIBELF_CONF_OPT = --enable-shared --disable-sanity-checks \
+		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
+		$(if $(BR2_LARGEFILE),--enable-elf64)
 
-libelf-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBELF_DIR) uninstall
-	$(MAKE) instroot=$(STAGING_DIR) -C $(LIBELF_DIR) uninstall
-	-$(MAKE) -C $(LIBELF_DIR) clean
-
-libelf-dirclean:
-	rm -rf $(LIBELF_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBELF),y)
-TARGETS+=libelf
-endif
+$(eval $(call AUTOTARGETS,package,libelf))
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index a8b6a91..8e090a4 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -4,7 +4,7 @@ comment "ltrace has no inherent support for AVR32"
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	#depends on BR2_LARGEFILE
-	select BR2_PACKAGE_LIBELF_HEADERS
+	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
-- 
1.6.3.3
