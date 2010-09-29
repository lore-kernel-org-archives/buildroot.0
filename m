From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Sep 2010 22:54:53 +0200
Subject: [Buildroot] [git commit master 1/1] acpid: convert to gentargets
	and bump to 2.0.6
Message-ID: <20100929205517.42A2F8B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=299f7820de00ef6f34409735cbaaffc193142028
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, added acpi_listen to the target. It was being stripped, but not
copied.

acpi_listen is a simple shell-friendly tool which connects to acpid and
listens for events. When an event occurs, acpi_listen will print it on
stdout.

[Peter: no strip, install/remove man pages, add uninstall]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/acpid/acpid.mk |   61 ++++++++++++++++++-----------------------------
 2 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0ce74e4..cf85b85 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,7 +20,7 @@
 
 	New packages: xz
 
-	Updated/fixed packages: alsa-lib, argus, at, autoconf,
+	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
 	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 73c2fb8..d61ca41 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -3,46 +3,31 @@
 # acpid
 #
 #############################################################
-ACPID_VERSION:=1.0.8
-ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
-ACPID_SOURCE=acpid_$(ACPID_VERSION).orig.tar.gz
-ACPID_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
-
-$(DL_DIR)/$(ACPID_SOURCE):
-	$(call DOWNLOAD,$(ACPID_SITE),$(ACPID_SOURCE))
-
-$(ACPID_DIR)/.unpacked: $(DL_DIR)/$(ACPID_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(ACPID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(ACPID_DIR) package/acpid/ acpid-$(ACPID_VERSION)\*.patch
-	touch $(ACPID_DIR)/.unpacked
-
-$(ACPID_DIR)/acpid: $(ACPID_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC)" -C $(ACPID_DIR)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpid
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(ACPID_DIR)/acpi_listen
-	touch -c $(ACPID_DIR)/acpid $(ACPID_DIR)/acpi_listen
-
-$(TARGET_DIR)/usr/sbin/acpid: $(ACPID_DIR)/acpid
-	cp -a $(ACPID_DIR)/acpid $(TARGET_DIR)/usr/sbin/acpid
+ACPID_VERSION = 2.0.6
+ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
+ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
+
+define ACPID_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define ACPID_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/acpid $(TARGET_DIR)/usr/sbin/acpid
+	install -D -m 755 $(@D)/acpi_listen $(TARGET_DIR)/usr/bin/acpi_listen
+	install -D -m 644 $(@D)/acpid.8 $(TARGET_DIR)/usr/share/man/man8/acpid.8
+	install -D -m 644 $(@D)/acpi_listen.8 $(TARGET_DIR)/usr/share/man/man8/acpi_listen.8
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
 	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
-	touch -c $(TARGET_DIR)/usr/sbin/acpid
-
-acpid: $(TARGET_DIR)/usr/sbin/acpid
+endef
 
-acpid-source: $(DL_DIR)/$(ACPID_SOURCE)
+define ACPID_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/acpid
+	rm -f $(TARGET_DIR)/usr/bin/acpi_listen
+	rm -f $(addprefix )$(TARGET_DIR)/usr/share/man/man8/,acpid.8 acpi_listen.8)
+endef
 
-acpid-clean:
-	-$(MAKE) -C $(ACPID_DIR) clean
+define ACPID_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-acpid-dirclean:
-	rm -rf $(ACPID_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ACPID),y)
-TARGETS+=acpid
-endif
+$(eval $(call GENTARGETS,package,acpid))
-- 
1.7.1
