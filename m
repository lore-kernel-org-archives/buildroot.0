From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:11 +0200
Subject: [Buildroot] [PATCH 18/20] Update all packages to quote $(TARGET_CC)
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a1c8fa41f6f6e5047182fe90656bcd30243bca8d.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that TARGET_CC contains several space-separated words, it must be
used quoted everywhere.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk                                  |    8 ++++----
 boot/grub2/grub2.mk                                |    4 ++--
 package/acpid/acpid.mk                             |    2 +-
 package/busybox/busybox.mk                         |    6 +++---
 package/coreutils/coreutils.mk                     |    4 ++--
 package/dillo/dillo.mk                             |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/eeprog/eeprog.mk                           |    2 +-
 package/ezxml/ezxml.mk                             |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk             |    2 +-
 package/games/rubix/rubix.mk                       |    2 +-
 package/gettext/gettext.mk                         |    4 ++--
 package/gtk2-engines/gtk2-engines.mk               |    2 +-
 package/iostat/iostat.mk                           |    2 +-
 package/iproute2/iproute2.mk                       |    2 +-
 package/libfloat/libfloat.mk                       |    4 ++--
 package/libglib12/libglib12.mk                     |    2 +-
 package/libgtk12/libgtk12.mk                       |    2 +-
 package/lmbench/lmbench.mk                         |    4 ++--
 package/mdadm/mdadm.mk                             |    2 +-
 package/memstat/memstat.mk                         |    2 +-
 package/microperl/microperl.mk                     |    2 +-
 package/microwin/microwin.mk                       |    4 ++--
 package/mii-diag/mii-diag.mk                       |    4 ++--
 package/mrouted/mrouted.mk                         |    2 +-
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 package/multimedia/festival/festival/festival.mk   |    2 +-
 .../festival/speech-tools/speech-tools.mk          |    2 +-
 package/multimedia/mplayer/mplayer.mk              |    2 +-
 package/netkitbase/netkitbase.mk                   |    8 ++++----
 package/netkittelnet/netkittelnet.mk               |   10 +++++-----
 package/netplug/netplug.mk                         |    2 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/newt/newt.mk                               |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 package/openssh/openssh.mk                         |    2 +-
 package/pcmcia/pcmcia.mk                           |    2 +-
 package/portmap/portmap.mk                         |    2 +-
 package/pppd/pppd.mk                               |    2 +-
 package/python/python.mk                           |    4 ++--
 package/sed/sed.mk                                 |    4 ++--
 package/slang/slang.mk                             |    2 +-
 package/stunnel/stunnel.mk                         |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/tcpdump/dhcpdump.mk                        |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/util-linux/util-linux.mk                   |    2 +-
 package/vsftpd/vsftpd.mk                           |    2 +-
 package/wipe/wipe.mk                               |    4 ++--
 package/wireless-tools/wireless-tools.mk           |    6 +++---
 package/xvkbd/xvkbd.mk                             |    2 +-
 toolchain/gdb/gdb.mk                               |    4 ++--
 52 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 3805afe..401d346 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -79,12 +79,12 @@ $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
 	touch $@
 
 $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(GRUB_DIR)
 	rm -f $(GRUB_DIR)/$(GRUB_BINARY)
-	$(MAKE) CC=$(TARGET_CC) CFLAGS+=-static -C $(GRUB_DIR)/grub grub
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS+=-static -C $(GRUB_DIR)/grub grub
 	mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
 	mv $(GRUB_DIR)/$(GRUB_BINARY) $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
-	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)/grub
+	$(MAKE) CC="$(TARGET_CC)" -C $(GRUB_DIR)/grub
 
 $(GRUB_DIR)/.installed: $(GRUB_DIR)/$(GRUB_BINARY)
 	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/$(GRUB_TARGET_BINARY)
@@ -99,7 +99,7 @@ endif
 grub: $(GRUB_DIR)/.installed
 
 grub-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GRUB_DIR) uninstall
 	-$(MAKE) -C $(GRUB_DIR) clean
 	rm -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) \
 		$(TARGET_DIR)/sbin/$(GRUB_BINARY) \
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 6c3bbef..f939d9a 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -67,7 +67,7 @@ $(GRUB2_DIR)/.configured: $(GRUB2_DIR)/.unpacked
 	touch $@
 
 $(GRUB2_DIR)/.compiled: $(GRUB2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
 	touch $@
 
 $(GRUB2_DIR)/.installed: $(GRUB2_DIR)/.compiled
@@ -77,7 +77,7 @@ $(GRUB2_DIR)/.installed: $(GRUB2_DIR)/.compiled
 grub2: host-automake host-autoconf $(GRUB2_DIR)/.installed
 
 grub2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB2_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GRUB2_DIR) uninstall
 	-$(MAKE) -C $(GRUB2_DIR) clean
 
 grub2-dirclean:
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index cbd6257..73c2fb8 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -17,7 +17,7 @@ $(ACPID_DIR)/.unpacked: $(DL_DIR)/$(ACPID_SOURCE)
 	touch $(ACPID_DIR)/.unpacked
 
 $(ACPID_DIR)/acpid: $(ACPID_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) -C $(ACPID_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(ACPID_DIR)
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpid
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpi_listen
 	touch -c $(ACPID_DIR)/acpid $(ACPID_DIR)/acpi_listen
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 668861d..e17d12a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -99,20 +99,20 @@ ifeq ($(BR2_PACKAGE_NETKITTELNET),y)
 	$(SED) "s/^.*CONFIG_TELNETD.*/CONFIG_TELNETD=n/;" $(BUSYBOX_DIR)/.config
 	@echo "WARNING!! CONFIG_TELNETD option disabled!"
 endif
-	yes "" | $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+	yes "" | $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" -C $(BUSYBOX_DIR) oldconfig
 	touch $@
 
 
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR)
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
-	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR) install
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e2f7bc5..f9910c6 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -109,7 +109,7 @@ $(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured
 	rm -f $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
 
 $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY): $(COREUTILS_DIR)/$(COREUTILS_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(COREUTILS_DIR) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(COREUTILS_DIR) install
 	# some things go in root rather than usr
 	for f in $(BIN_PROGS); do \
 		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
@@ -132,7 +132,7 @@ endif
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
 coreutils-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(COREUTILS_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(COREUTILS_DIR) uninstall
 	-$(MAKE) -C $(COREUTILS_DIR) clean
 
 coreutils-dirclean:
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 8b8171c..cffb827 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -33,7 +33,7 @@ $(DILLO_DIR)/.configured: $(DILLO_DIR)/.unpacked
 	touch $(DILLO_DIR)/.configured
 
 $(DILLO_DIR)/src/dillo: $(DILLO_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DILLO_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(DILLO_DIR)
 
 $(DILLO_DIR)/.installed: $(DILLO_DIR)/src/dillo
 	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 8525d64..5e38653 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -10,7 +10,7 @@ DOCKER_AUTORECONF = NO
 DOCKER_INSTALL_STAGING = NO
 DOCKER_INSTALL_TARGET = YES
 
-DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
+DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
 					CFLAGS="-I$(STAGING_DIR)/usr/include \
 						-I$(STAGING_DIR)/usr/include/glib-2.0 \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 070fcd4..e61aecb 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -8,7 +8,7 @@ EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://codesink.org/download
 
 define EEPROG_BUILD_CMDS
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define EEPROG_INSTALL_TARGET_CMDS
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index bf2e35f..3746b51 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -21,7 +21,7 @@ $(EZXML_DIR)/.configured: $(EZXML_DIR)/.unpacked
 	touch $@
 
 $(EZXML_DIR)/libezxml.a: $(EZXML_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
 	-f GNUmakefile -C $(EZXML_DIR)
 
 $(STAGING_DIR)/usr/lib/libezxml.a: $(EZXML_DIR)/libezxml.a
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 572755b..e3ab95e 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -7,7 +7,7 @@ GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
 GADGETFS_TEST_SITE=http://avr32linux.org/twiki/pub/Main/GadgetFsTest/
 GADGETFS_TEST_DIR=$(BUILD_DIR)/gadgetfs-test
 
-GADGETFS_TEST_MAKEOPTS:=CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
+GADGETFS_TEST_MAKEOPTS:=CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
 GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 308e94b..3440c23 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -10,7 +10,7 @@ RUBIX_INSTALL_STAGING = NO
 RUBIX_INSTALL_TARGET = YES
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
-RUBIX_MAKE_OPT = CC=$(TARGET_CC) XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
+RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
 RUBIX_DEPENDENCIES = xserver_xorg-server
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 8ec8bdf..80215c8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -119,8 +119,8 @@ gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
 gettext-clean:
-	-$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
+	-$(MAKE) DESTDIR=$(STAGING_DIR) CC="$(TARGET_CC)" -C $(GETTEXT_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GETTEXT_DIR) uninstall
 	-$(MAKE) -C $(GETTEXT_DIR) clean
 
 gettext-dirclean:
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 4c7776e..f188188 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -119,7 +119,7 @@ $(GTK2_ENGINES_DIR)/.configured: $(GTK2_ENGINES_DIR)/.unpacked
 	touch $(GTK2_ENGINES_DIR)/.configured
 
 $(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY): $(GTK2_ENGINES_DIR)/.configured
-	$(GTK2_ENGINES_BUILD_ENV) $(MAKE) CC=$(TARGET_CC) -C $(GTK2_ENGINES_DIR)
+	$(GTK2_ENGINES_BUILD_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(GTK2_ENGINES_DIR)
 	touch -c $(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY)
 
 $(STAGING_DIR)/lib/$(GTK2_ENGINES_BINARY): $(GTK2_ENGINES_DIR)/gtk/.libs/$(GTK2_ENGINES_BINARY)
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 04e58d0..651f397 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -21,7 +21,7 @@ $(IOSTAT_DIR)/.unpacked: $(DL_DIR)/$(IOSTAT_SOURCE)
 	touch $(IOSTAT_DIR)/.unpacked
 
 $(IOSTAT_DIR)/$(IOSTAT_BINARY): $(IOSTAT_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) -C $(IOSTAT_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(IOSTAT_DIR)
 	$(STRIPCMD) $(IOSTAT_DIR)/$(IOSTAT_BINARY)
 
 $(TARGET_DIR)/$(IOSTAT_TARGET_BINARY): $(IOSTAT_DIR)/$(IOSTAT_BINARY)
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 573f080..4a713a8 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -31,7 +31,7 @@ $(IPROUTE2_DIR)/$(IPROUTE2_BINARY): $(IPROUTE2_DIR)/.configured
 	$(MAKE) \
 		-C $(IPROUTE2_DIR) \
 		KERNEL_INCLUDE=$(LINUX_SOURCE_DIR)/include \
-		CC=$(TARGET_CC) \
+		CC="$(TARGET_CC)" \
 		AR=$(TARGET_CROSS)ar \
 		NETEM_DIST="" \
 		SUBDIRS="lib ip tc"
diff --git a/package/libfloat/libfloat.mk b/package/libfloat/libfloat.mk
index 8efc935..0c4ae28 100644
--- a/package/libfloat/libfloat.mk
+++ b/package/libfloat/libfloat.mk
@@ -34,8 +34,8 @@ $(LIBFLOAT_DIR)/.unpacked: $(DL_DIR)/$(LIBFLOAT_SOURCE) $(DL_DIR)/$(LIBFLOAT_PAT
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) package/libfloat/ libfloat\*.patch
 	touch $@
 
-$(LIBFLOAT_DIR)/libfloat.so.1: $(LIBFLOAT_DIR)/.unpacked $(TARGET_CC)
-	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld -C $(LIBFLOAT_DIR)
+$(LIBFLOAT_DIR)/libfloat.so.1: $(LIBFLOAT_DIR)/.unpacked
+	$(MAKE) CC="$(TARGET_CC)" LD=$(TARGET_CROSS)ld -C $(LIBFLOAT_DIR)
 
 $(STAGING_DIR)/lib/libfloat.so $(STAGING_DIR)/lib/libfloat.a: $(LIBFLOAT_DIR)/libfloat.so.1
 	cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(STAGING_DIR)/lib/libfloat.a
diff --git a/package/libglib12/libglib12.mk b/package/libglib12/libglib12.mk
index 4020f3e..6d7d101 100644
--- a/package/libglib12/libglib12.mk
+++ b/package/libglib12/libglib12.mk
@@ -45,7 +45,7 @@ $(LIBGLIB12_DIR)/.configured: $(LIBGLIB12_DIR)/.unpacked
 	touch $@
 
 $(LIBGLIB12_DIR)/.libs/$(LIBGLIB12_BINARY): $(LIBGLIB12_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBGLIB12_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(LIBGLIB12_DIR)
 
 $(STAGING_DIR)/lib/$(LIBGLIB12_BINARY): $(LIBGLIB12_DIR)/.libs/$(LIBGLIB12_BINARY)
 	$(MAKE) prefix=$(STAGING_DIR) \
diff --git a/package/libgtk12/libgtk12.mk b/package/libgtk12/libgtk12.mk
index d7976a2..63aac1a 100644
--- a/package/libgtk12/libgtk12.mk
+++ b/package/libgtk12/libgtk12.mk
@@ -54,7 +54,7 @@ $(LIBGTK12_DIR)/.configured: $(LIBGTK12_DIR)/.unpacked
 	touch $(LIBGTK12_DIR)/.configured
 
 $(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBGTK12_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(LIBGTK12_DIR)
 	touch -c $(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY)
 
 $(STAGING_DIR)/lib/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY)
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index c271ffb..fefb34f 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -16,11 +16,11 @@ define LMBENCH_CONFIGURE_CMDS
 endef
 
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) -C $(@D)/src
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) BASE=$(TARGET_DIR)/usr -C $(@D)/src install
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
 endef
 
 define LMBENCH_CLEAN_CMDS
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 8dabddf..1368a1e 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -14,7 +14,7 @@ MDADM_INSTALL_STAGING = NO
 MDADM_INSTALL_TARGET = YES
 
 MDADM_MAKE_OPT = \
-	CFLAGS="$(TARGET_CFLAGS)" CC=$(TARGET_CC) -C $(MDADM_DIR) mdadm
+	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
 
 MDADM_INSTALL_TARGET_OPT = \
 	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 75c7875..0ad8eba 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -9,7 +9,7 @@ MEMSTAT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
 MEMSTAT_SOURCE = memstat_$(MEMSTAT_VERSION).tar.gz
 
 define MEMSTAT_BUILD_CMDS
-	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(@D) memstat
 endef
 
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 869d99c..bf76fa7 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -68,7 +68,7 @@ $(MICROPERL_DIR)/.configured: $(MICROPERL_DIR)/.host_make_fixed
 	touch $@
 
 $(MICROPERL_DIR)/microperl: $(MICROPERL_DIR)/.configured
-	$(MAKE) -f $(MICROPERL_DIR)/Makefile.micro CC=$(TARGET_CC) \
+	$(MAKE) -f $(MICROPERL_DIR)/Makefile.micro CC="$(TARGET_CC)" \
 		OPTIMIZE="$(TARGET_CFLAGS)" -C $(MICROPERL_DIR)
 ifeq ($(BR2_PACKAGE_AUTOMAKE),y)
 	#(cd $(@D); \
diff --git a/package/microwin/microwin.mk b/package/microwin/microwin.mk
index f1deca2..5c7d303 100644
--- a/package/microwin/microwin.mk
+++ b/package/microwin/microwin.mk
@@ -38,10 +38,10 @@ $(MICROWIN_DIR)/.configured: $(MICROWIN_DIR)/.prepared
 	touch $(MICROWIN_DIR)/.configured
 
 $(MICROWIN_BINARY): $(MICROWIN_DIR)/.configured
-	$(MAKE) ARCH=LINUX-$(shell echo $(ARCH) | tr a-z A-Z) $(shell echo $(ARCH) | tr a-z A-Z)TOOLSPREFIX=$(TARGET_CROSS) CC=$(TARGET_CC) -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG)
+	$(MAKE) ARCH=LINUX-$(shell echo $(ARCH) | tr a-z A-Z) $(shell echo $(ARCH) | tr a-z A-Z)TOOLSPREFIX=$(TARGET_CROSS) CC="$(TARGET_CC)" -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG)
 
 $(MICROWIN_TARGET_BINARY): $(MICROWIN_BINARY)
-	$(MAKE) INSTALL_PREFIX=$(TARGET_DIR)/usr INSTALL_OWNER1= INSTALL_OWNER2= CC=$(TARGET_CC) -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG) install
+	$(MAKE) INSTALL_PREFIX=$(TARGET_DIR)/usr INSTALL_OWNER1= INSTALL_OWNER2= CC="$(TARGET_CC)" -C $(MICROWIN_DIR)/src CONFIG=$(MICROWIN_CONFIG) install
 
 microwin: $(MICROWIN_TARGET_BINARY)
 
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index ca31a10..ba01c0e 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -34,10 +34,10 @@ $(MIIDIAG_DIR)/.configured: $(MIIDIAG_DIR)/.unpacked
 	touch $@
 
 $(MIIDIAG_DIR)/mii-diag: $(MIIDIAG_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR)
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR)
 
 $(TARGET_DIR)/$(MIIDIAG_BINARY): $(MIIDIAG_DIR)/mii-diag
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR) DESTDIR=$(TARGET_DIR) install
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(MIIDIAG_DIR) DESTDIR=$(TARGET_DIR) install
 	$(STRIPCMD) $@
 	touch $@
 
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index a3d9c14..4438c6d 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -27,7 +27,7 @@ $(MROUTED_DIR)/.unpacked: $(DL_DIR)/$(MROUTED_SOURCE) $(DL_DIR)/$(MROUTED_PATCH)
 
 $(MROUTED_DIR)/$(MROUTED_BINARY): $(MROUTED_DIR)/.unpacked
 	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) CC=$(TARGET_CC) -C $(MROUTED_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(MROUTED_DIR)
 
 $(TARGET_DIR)/$(MROUTED_TARGET_BINARY): $(MROUTED_DIR)/$(MROUTED_BINARY)
 	cp -a $(MROUTED_DIR)/$(MROUTED_BINARY) $(TARGET_DIR)/$(MROUTED_TARGET_BINARY)
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 8348f4c..3d1b0ef 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -44,7 +44,7 @@ $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
 	touch $@
 
 $(ALSA_UTILS_DIR)/$(ALSA_UTILS_BINARY): $(ALSA_UTILS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(ALSA_UTILS_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(ALSA_UTILS_DIR)
 	touch -c $@
 
 ALSA_UTILS_TARGETS_ :=
diff --git a/package/multimedia/festival/festival/festival.mk b/package/multimedia/festival/festival/festival.mk
index 1c4fa7e..4c270d4 100644
--- a/package/multimedia/festival/festival/festival.mk
+++ b/package/multimedia/festival/festival/festival.mk
@@ -13,7 +13,7 @@ FESTIVAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) instal
 
 FESTIVAL_CONF_OPT = --prefix=/usr --libdir=/usr/share/festival/lib
 
-FESTIVAL_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
+FESTIVAL_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"
 
 FESTIVAL_DEPENDENCIES = alsa-lib speech-tools
 
diff --git a/package/multimedia/festival/speech-tools/speech-tools.mk b/package/multimedia/festival/speech-tools/speech-tools.mk
index fa345e3..0aa44cc 100644
--- a/package/multimedia/festival/speech-tools/speech-tools.mk
+++ b/package/multimedia/festival/speech-tools/speech-tools.mk
@@ -12,7 +12,7 @@ SPEECH_TOOLS_INSTALL_TARGET = YES
 SPEECH_TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 
 SPEECH_TOOLS_CONF_OPT =
-SPEECH_TOOLS_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
+SPEECH_TOOLS_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"
 
 SPEECH_TOOLS_DEPENDENCIES = ncurses
 
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 6e03cff..206c422 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -53,7 +53,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		--confdir=/etc \
 		--target=$(GNU_TARGET_NAME) \
 		--host-cc=$(HOSTCC) \
-		--cc=$(TARGET_CC) \
+		--cc="$(TARGET_CC)" \
 		--as=$(TARGET_CROSS)as \
 		--with-extraincdir=$(STAGING_DIR)/usr/include \
 		--with-extralibdir=$(STAGING_DIR)/lib \
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index adb52a3..311c8b2 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -27,13 +27,13 @@ $(NETKITBASE_DIR)/.unpacked: $(DL_DIR)/$(NETKITBASE_SOURCE)
 
 $(NETKITBASE_DIR)/.configured: $(NETKITBASE_DIR)/.unpacked
 	(cd $(NETKITBASE_DIR); rm -f config.cache; \
-	 PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
-	./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
+	 PATH=$(TARGET_PATH) CC="$(TARGET_CC)" \
+	./configure --installroot=$(TARGET_DIR) --with-c-compiler="$(TARGET_CC)" \
 	)
 	touch $(NETKITBASE_DIR)/.configured
 
 $(NETKITBASE_DIR)/$(NETKITBASE_BINARY): $(NETKITBASE_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(NETKITBASE_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(NETKITBASE_DIR)
 	$(STRIPCMD) $(NETKITBASE_DIR)/$(NETKITBASE_BINARY)
 
 $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY)
@@ -50,7 +50,7 @@ $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY): $(NETKITBASE_DIR)/$(NETKITBASE_BINARY
 netkitbase: $(TARGET_DIR)/$(NETKITBASE_TARGET_BINARY)
 
 netkitbase-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETKITBASE_DIR) uninstall
+	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITBASE_DIR) uninstall
 	-rm -f $(TARGET_DIR)/usr/sbin/inetd $(TARGET_DIR)/etc/inetd.conf
 	-rm -f $(TARGET_DIR)/etc/inetd.conf
 	-$(MAKE) -C $(NETKITBASE_DIR) clean
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index 33142ca..afa3bc4 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -28,13 +28,13 @@ $(NETKITTELNET_DIR)/.unpacked: $(DL_DIR)/$(NETKITTELNET_SOURCE)
 
 $(NETKITTELNET_DIR)/.configured: $(NETKITTELNET_DIR)/.unpacked
 	(cd $(NETKITTELNET_DIR); rm -f config.cache; \
-	 PATH=$(TARGET_PATH) CC=$(TARGET_CC) \
-	./configure --installroot=$(TARGET_DIR) --with-c-compiler=$(TARGET_CC) \
+	 PATH=$(TARGET_PATH) CC="$(TARGET_CC)" \
+	./configure --installroot=$(TARGET_DIR) --with-c-compiler="$(TARGET_CC)" \
 	)
 	touch $(NETKITTELNET_DIR)/.configured
 
 $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY): $(NETKITTELNET_DIR)/.configured
-	$(MAKE) SUB=telnetd CC=$(TARGET_CC) -C $(NETKITTELNET_DIR)
+	$(MAKE) SUB=telnetd CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR)
 	$(STRIPCMD) $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY)
 
 $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY)
@@ -44,14 +44,14 @@ $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY): $(NETKITTELNET_DIR)/$(NETKITTELNET_
 	cp $(NETKITTELNET_DIR)/$(NETKITTELNET_BINARY) $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 	# Enable telnet in inetd
 	$(SED) "s~^#telnet.*~telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\t/usr/sbin/telnetd~;" $(TARGET_DIR)/etc/inetd.conf
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETKITTELNET_DIR) install
+	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR) install
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	# $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 
 netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 
 netkittelnet-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETKITTELNET_DIR) uninstall
+	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETKITTELNET_DIR) uninstall
 	-rm -f $(TARGET_DIR)/usr/sbin/telnetd
 	-$(MAKE) -C $(NETKITTELNET_DIR) clean
 
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 33da90c..74fa0c5 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -22,7 +22,7 @@ $(NETPLUG_DIR)/.unpacked: $(DL_DIR)/$(NETPLUG_SOURCE)
 	touch $(NETPLUG_DIR)/.unpacked
 
 $(NETPLUG_DIR)/$(NETPLUG_BINARY): $(NETPLUG_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) -C $(NETPLUG_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(NETPLUG_DIR)
 	$(STRIPCMD) $(NETPLUG_DIR)/$(NETPLUG_BINARY)
 
 $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY): $(NETPLUG_DIR)/$(NETPLUG_BINARY)
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 86f7a94..c5232c7 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -133,7 +133,7 @@ netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
 netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
 
 netsnmp-clean:
-	-$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
+	-$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETSNMP_DIR) uninstall
 	-$(MAKE) -C $(NETSNMP_DIR) clean
 	-rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
 		$(TARGET_DIR)/etc/default/snmpd \
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 8c532ae..28b5321 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -42,7 +42,7 @@ $(NEWT_DIR)/.configured: $(NEWT_DIR)/.source
 	touch $(NEWT_DIR)/.configured
 
 $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION): $(NEWT_DIR)/.configured
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC=$(TARGET_CC) -C $(NEWT_DIR)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC="$(TARGET_CC)" -C $(NEWT_DIR)
 	touch -c $@
 
 $(STAGING_DIR)/usr/lib/libnewt.a: $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index d2b5df0..efaa6e3 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -47,7 +47,7 @@ $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
 	touch $@
 
 $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY): $(NFS_UTILS_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" \
+	$(MAKE) CC="$(TARGET_CC)" CC_FOR_BUILD="$(HOSTCC)" \
 		RPCGEN=/usr/bin/rpcgen -C $(NFS_UTILS_DIR)
 	touch -c $@
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 9a06d12..64274e5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 OPENSSH_VERSION=5.1p1
 OPENSSH_SITE=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 
-OPENSSH_CONF_ENV = LD=$(TARGET_CC)
+OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --without-x
 
diff --git a/package/pcmcia/pcmcia.mk b/package/pcmcia/pcmcia.mk
index 00ee358..8080b87 100644
--- a/package/pcmcia/pcmcia.mk
+++ b/package/pcmcia/pcmcia.mk
@@ -42,7 +42,7 @@ $(PCMCIA_DIR)/.patched: $(PCMCIA_DIR)/.unpacked
 $(PCMCIA_DIR)/.configured: $(PCMCIA_DIR)/.patched
 	( cd $(PCMCIA_DIR); ./Configure --kernel=$(LINUX26_DIR) --noprompt \
 		--rcdir=/etc --arch=$(ARCH) --trust --srctree --nocardbus \
-		--sysv --kcc=$(TARGET_CROSS)gcc --ucc=$(TARGET_CC) --ld=$(TARGET_CROSS)ld \
+		--sysv --kcc=$(TARGET_CROSS)gcc --ucc="$(TARGET_CC)" --ld=$(TARGET_CROSS)ld \
 		--target=$(TARGET_DIR))
 	$(SED) "s/pump/udhcpc/" $(PCMCIA_DIR)/etc/network
 	$(SED) "s/ide_cs/ide-cs/" $(PCMCIA_DIR)/etc/config
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 789a9ed..0132c72 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -22,7 +22,7 @@ $(PORTMAP_DIR)/.unpacked: $(DL_DIR)/$(PORTMAP_SOURCE)
 	touch $(PORTMAP_DIR)/.unpacked
 
 $(PORTMAP_DIR)/$(PORTMAP_BINARY): $(PORTMAP_DIR)/.unpacked
-	$(MAKE) CC=$(TARGET_CC) O="$(TARGET_CFLAGS)" -C $(PORTMAP_DIR)
+	$(MAKE) CC="$(TARGET_CC)" O="$(TARGET_CFLAGS)" -C $(PORTMAP_DIR)
 
 $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY): $(PORTMAP_DIR)/$(PORTMAP_BINARY)
 	$(INSTALL) -D $(PORTMAP_DIR)/$(PORTMAP_BINARY) $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 31ddbb6..9d081f2 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -9,7 +9,7 @@ PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
-PPPD_MAKE = $(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
+PPPD_MAKE = $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 	PPPD_DEPENDENCIES += libpcap
diff --git a/package/python/python.mk b/package/python/python.mk
index b65869d..8721d40 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -116,7 +116,7 @@ $(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
 ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 	export PYTHON_DISABLE_SSL=1
 endif
-	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
+	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
@@ -128,7 +128,7 @@ ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 endif
 	rm -rf $(PYTHON_DIR)/Lib/test
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
-	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
+	$(MAKE) CC="$(TARGET_CC)" -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index e5a5d00..c393dd9 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -141,7 +141,7 @@ sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
 	      -o $(TARGET_DIR)/$(SED_TARGET_BINARY) \
 	      -ot $(SED_DIR2)/$(SED_BINARY) ]; then \
 		set -x; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SED_DIR2) install; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(SED_DIR2) install; \
 		mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/; \
 		rm -rf $(TARGET_DIR)/share/locale; \
 		rm -rf $(TARGET_DIR)/usr/share/doc; \
@@ -150,7 +150,7 @@ sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
 sed: sed-target_binary
 
 sed-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SED_DIR2) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(SED_DIR2) uninstall
 	-$(MAKE) -C $(SED_DIR2) clean
 
 sed-dirclean:
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 42ca9ab..43e910b 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -16,7 +16,7 @@ $(SLANG_DIR): $(DL_DIR)/$(SLANG_SOURCE)
 	$(SLANG_CAT) $(DL_DIR)/$(SLANG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 
 $(SLANG_DIR)/libslang.so: $(SLANG_DIR)
-	$(MAKE1) CFLAGS="-Os -g -fPIC $(TARGET_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
+	$(MAKE1) CFLAGS="-Os -g -fPIC $(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(SLANG_DIR)
 
 $(STAGING_DIR)/usr/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
 	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/usr/lib
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8f7c86b..834ef96 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -51,7 +51,7 @@ $(STUNNEL_DIR)/.configured: $(STUNNEL_DIR)/.unpacked
 	touch $(STUNNEL_DIR)/.configured
 
 $(STUNNEL_DIR)/src/stunnel: $(STUNNEL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(STUNNEL_DIR)
+	$(MAKE) CC="$(TARGET_CC)" -C $(STUNNEL_DIR)
 
 $(TARGET_DIR)/usr/bin/stunnel: $(STUNNEL_DIR)/src/stunnel
 	install -c $(STUNNEL_DIR)/src/stunnel $(TARGET_DIR)/usr/bin/stunnel
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 6309e3e..0b827e6 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -21,7 +21,7 @@ $(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
 	touch $@
 
 $(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
-	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC=$(TARGET_CC) -C $(SYSVINIT_DIR)/src
+	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" -C $(SYSVINIT_DIR)/src
 
 $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
 	for x in halt init shutdown; do \
diff --git a/package/tcpdump/dhcpdump.mk b/package/tcpdump/dhcpdump.mk
index e579f46..0b2d64a 100644
--- a/package/tcpdump/dhcpdump.mk
+++ b/package/tcpdump/dhcpdump.mk
@@ -23,7 +23,7 @@ $(DHCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(DHCPDUMP_SOURCE)
 
 $(DHCPDUMP_DIR)/.configured: $(DHCPDUMP_DIR)/.unpacked
 	(cd $(DHCPDUMP_DIR); rm -f config.cache; \
-		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
+		BUILD_CC="$(TARGET_CC)" HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure $(QUIET) \
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index ccefae0..90dbdce 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -42,7 +42,7 @@ UDEV_BUILD_EXTRAS=$(addprefix extras/,$(UDEV_EXTRAS))
 # Build
 #
 define UDEV_BUILD_CMDS
-	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC=$(TARGET_CC) LD=$(TARGET_CC)\
+	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) CC="$(TARGET_CC)" LD="$(TARGET_CC)"\
 		CFLAGS="$(BR2_UDEV_CFLAGS)" \
 		USE_LOG=false USE_SELINUX=false \
 		udevdir=$(UDEV_ROOT) EXTRAS="$(UDEV_BUILD_EXTRAS)" -C $(@D)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 001ca75..f330447 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -59,7 +59,7 @@ $(UTIL-LINUX_BINARY): $(UTIL-LINUX_DIR)/.configured
 	$(MAKE) \
 		-C $(UTIL-LINUX_DIR) \
 		ARCH=$(ARCH) \
-		CC=$(TARGET_CC) \
+		CC="$(TARGET_CC)" \
 		OPT="$(TARGET_CFLAGS)" \
 		$(UTIL-LINUX_MAKE_OPT) \
 		HAVE_SLANG="NO"
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3b1d7eb..1a29244 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -46,7 +46,7 @@ endif
 
 
 $(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(VSFTPD_TARGET_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 44d5cc4..2b2d14e 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -33,7 +33,7 @@ $(WIPE_DIR)/.configured: $(WIPE_DIR)/.unpacked
 
 $(WIPE_DIR)/$(WIPE_BINARY): $(WIPE_DIR)/.configured
 	rm -f $(WIPE_DIR)/$(WIPE_BINARY)
-	$(MAKE) CC=$(TARGET_CC) CC_GENERIC=$(TARGET_CC) CCO_GENERIC="$(TARGET_CFLAGS)" -C $(WIPE_DIR) generic
+	$(MAKE) CC="$(TARGET_CC)" CC_GENERIC="$(TARGET_CC)" CCO_GENERIC="$(TARGET_CFLAGS)" -C $(WIPE_DIR) generic
 
 $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
 	cp -a $(WIPE_DIR)/$(WIPE_BINARY) $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
@@ -41,7 +41,7 @@ $(TARGET_DIR)/$(WIPE_TARGET_BINARY): $(WIPE_DIR)/$(WIPE_BINARY)
 wipe: $(TARGET_DIR)/$(WIPE_TARGET_BINARY)
 
 wipe-clean:
-	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(WIPE_DIR) uninstall
+	#$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(WIPE_DIR) uninstall
 	-$(MAKE) -C $(WIPE_DIR) clean
 
 wipe-dirclean:
diff --git a/package/wireless-tools/wireless-tools.mk b/package/wireless-tools/wireless-tools.mk
index b2cf2d9..9c16ff8 100644
--- a/package/wireless-tools/wireless-tools.mk
+++ b/package/wireless-tools/wireless-tools.mk
@@ -29,13 +29,13 @@ $(WIRELESS_TOOLS_BUILD_DIR)/.configured: $(WIRELESS_TOOLS_BUILD_DIR)/.unpacked
 
 $(WIRELESS_TOOLS_BUILD_DIR)/iwmulticall: $(WIRELESS_TOOLS_BUILD_DIR)/.configured
 	$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) \
-		CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
+		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		iwmulticall
 
 $(TARGET_DIR)/sbin/iwconfig: $(WIRELESS_TOOLS_BUILD_DIR)/iwmulticall
 	$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) \
 		PREFIX="$(TARGET_DIR)" \
-		CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
+		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		install-iwmulticall
 
 wireless-tools: $(TARGET_DIR)/sbin/iwconfig
@@ -43,7 +43,7 @@ wireless-tools: $(TARGET_DIR)/sbin/iwconfig
 wireless-tools-source: $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE)
 
 wireless-tools-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(WIRELESS_TOOLS_BUILD_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(WIRELESS_TOOLS_BUILD_DIR) uninstall
 	-$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) clean
 
 wireless-tools-dirclean:
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index b7da396..c40fa57 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -10,7 +10,7 @@ XVKBD_AUTORECONF = NO
 XVKBD_INSTALL_STAGING = NO
 XVKBD_INSTALL_TARGET = YES
 
-XVKBD_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) \
+XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 				CFLAGS="-O2 -I$(STAGING_DIR)/usr/include" USRLIBDIR="$(STAGING_DIR)/usr/lib"
 
 XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 5725067..c4fef89 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -95,7 +95,7 @@ endif
 $(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
 	# force ELF support since it fails due to BFD linking problems
 	gdb_cv_var_elf=yes \
-	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_TARGET_DIR)
 	$(STRIPCMD) $(GDB_TARGET_DIR)/gdb/gdb
 
@@ -150,7 +150,7 @@ $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 	touch $@
 
 $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_SERVER_DIR)
 	$(STRIPCMD) $(GDB_SERVER_DIR)/gdbserver
 
-- 
1.7.0.4
