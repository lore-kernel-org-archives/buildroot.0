From: Martin Banky <martin.banky@gmail.com>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] fconfig: convert to gentargets
	and bump to 20080329
Message-ID: <20100929204137.AB4E78B770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3da887298563ac77c6e60f55a0c919b0097906e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: no strip, remove _BINARY vars, add homepage URL]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    6 +-
 package/fconfig/Config.in              |    1 +
 package/fconfig/fconfig-listmode.patch |  177 --------------------------------
 package/fconfig/fconfig.mk             |   54 +++-------
 4 files changed, 20 insertions(+), 218 deletions(-)
 delete mode 100644 package/fconfig/fconfig-listmode.patch

diff --git a/CHANGES b/CHANGES
index 345b927..80c6a0f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,9 +24,9 @@
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
 	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes, gtkperf,
-	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, iperf,
-	iproute2, iptables, jpeg, kexec, kismet, less, libcgi,
+	fconfig, ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes,
+	gtkperf, gvfs, haserl, hdparm, hostapd, hwdata, ifplugd,
+	iperf, iproute2, iptables, jpeg, kexec, kismet, less, libcgi,
 	libcurl, libdaemon, libdnet, libevent, libglade, libgtk2,
 	libiconv, libidn, libmms, libnl, liboil, libpcap, libpng,
 	libtool, libungif, libxml2, libxslt, lighttpd, lite,
diff --git a/package/fconfig/Config.in b/package/fconfig/Config.in
index e679c09..e7dd58a 100644
--- a/package/fconfig/Config.in
+++ b/package/fconfig/Config.in
@@ -3,3 +3,4 @@ config BR2_PACKAGE_FCONFIG
 	help
 	  fconfig - get/set RedBoot configuration parameters from Linux.
 
+	  http://andrzejekiert.ovh.org/software.html.en
diff --git a/package/fconfig/fconfig-listmode.patch b/package/fconfig/fconfig-listmode.patch
deleted file mode 100644
index e7f2418..0000000
--- a/package/fconfig/fconfig-listmode.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-diff -x.svn -u fconfig/crunchfc.c ../../../snapgear_avila/user/fconfig/crunchfc.c
---- fconfig/crunchfc.c	2006-03-15 01:18:17.000000000 +1100
-+++ ../../../snapgear_avila/user/fconfig/crunchfc.c	2007-09-06 13:48:38.000000000 +1000
-@@ -320,6 +320,48 @@
- }
- 
- /*
-+ * List known keys.
-+ */
-+int8_t list_keys(struct config_data *data)
-+{
-+	struct fconfig_key key;
-+	uint32_t len = data->reallen;
-+	uint8_t *keyptr = NULL;
-+	uint8_t *ptr = data->buf+8;
-+	uint8_t *ptrend = data->buf+len-9;
-+	printer_t printer;
-+
-+	while (ptr < ptrend-4) {
-+		keyptr = ptr;
-+		ptr = get_key(ptr, &key);
-+		if (ptr == NULL) {
-+			MESSAGE(VERB_LOW, "Error in structure\n");
-+			return -1;
-+		}
-+		if (ptr > ptrend) {
-+			MESSAGE(VERB_LOW, "Parser went out of struct!\n");
-+			return -1;
-+		}
-+
-+		if ((key.type == 0) && (key.namelen==0)) {
-+			MESSAGE(VERB_NORMAL, "EOF reached - key not found\n");
-+			return -1;
-+		}
-+		
-+		print_key(&key, VERB_HIGH, data->swab);
-+
-+		printf("%s: ", key.keyname);
-+		printer = TYPE_PRINTER(key.type);
-+		if (printer == NULL) {
-+			MESSAGE(VERB_LOW, "Printer missing for type %d\n", key.type);
-+			return -1;
-+		}	
-+		printer(key.dataval);
-+		printf("\n");
-+	}
-+}
-+
-+/*
-  * Find a key with given nickname, check its type and set value
-  * Assumes that verify_fconfig() has been called on 'data' before. 
-  */
-diff -x.svn -u fconfig/crunchfc.h ../../../snapgear_avila/user/fconfig/crunchfc.h
---- fconfig/crunchfc.h	2006-03-15 01:18:17.000000000 +1100
-+++ ../../../snapgear_avila/user/fconfig/crunchfc.h	2007-09-06 13:48:38.000000000 +1000
-@@ -31,6 +31,7 @@
- int8_t verify_fconfig(struct config_data *data);
- int8_t get_key_value(struct config_data *data, uint8_t *nickname);
- int8_t set_key_value(struct config_data *data, uint8_t *nickname, void *value);
-+int8_t list_keys(struct config_data *data);
- void recalculate_crc(struct config_data *data);
- 
- #endif //CRUNCHFC_H
-diff -x.svn -u fconfig/fconfig.c ../../../snapgear_avila/user/fconfig/fconfig.c
---- fconfig/fconfig.c	2006-03-15 01:18:18.000000000 +1100
-+++ ../../../snapgear_avila/user/fconfig/fconfig.c	2007-09-06 13:48:38.000000000 +1000
-@@ -35,8 +35,9 @@
- #include <string.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <getopt.h>
- 
- #include "debug.h"
- #include "ftypes.h"
- #include "crunchfc.h"
- 
-@@ -72,7 +73,7 @@
- 	}
- 
- 	fputs("Read or write Redboot configuration\n", stdout);
--	fputs("usage: fconfig [-r|-w] -d dev -n nickname -x value\n", stdout);
-+	fputs("usage: fconfig [-r|-w|-l] -d dev -n nickname -x value\n", stdout);
- 	fputs("'dev' may be a char device, block device or a file\n", stdout);
- 	fputs("Supported types: \n", stdout);
- 	for (i = 0; i < NUM_TYPES; i++) {
-@@ -181,7 +182,33 @@
- 	close_fconfig_handle(data);
- 	return 0;
- 
--exit_fail: 
-+exit_fail:
-+	close_fconfig_handle(data);
-+	return 1;
-+}
-+
-+/*
-+ * List mode of operation: list parameter values from the configuration.
-+ */
-+static int list_mode(struct config_data *data, uint8_t *device)
-+{
-+	if (get_fconfig_handle(data, device, O_RDONLY) == NULL) {
-+		MESSAGE(VERB_LOW, "Could not get a config data handle!\n");
-+		return 1;
-+	}
-+	if (verify_fconfig(data)) {
-+		MESSAGE(VERB_LOW, "Config verification failed!\n");
-+		goto exit_fail;
-+	}
-+
-+	if (list_keys(data)) {
-+		goto exit_fail;
-+	}
-+
-+	close_fconfig_handle(data);
-+	return 0;
-+
-+exit_fail:
- 	close_fconfig_handle(data);
- 	return 1;
- }
-@@ -189,6 +216,7 @@
- #define MODE_NONE 0
- #define MODE_WRITE 1
- #define MODE_READ 2
-+#define MODE_LIST 3
- 
- /*
-  * main(). ...nuff said.
-@@ -202,14 +230,17 @@
- 	uint8_t *value = NULL;
- 	uint8_t *device = NULL;
- 
--	while ((c = getopt(argc, argv, "hrwvsd:n:x:")) != -1) {
-+	while ((c = getopt(argc, argv, "hrwlvsd:n:x:")) != -1) {
- 		switch (c) {
- 		case 'r':
- 			mode = MODE_READ;
- 			break;
--		case 'w': 
-+		case 'w':
- 			mode = MODE_WRITE;
- 			break;
-+		case 'l':
-+			mode = MODE_LIST;
-+			break;
- 		case 'n':
- 			nickname = optarg;
- 			break;
-@@ -240,7 +271,7 @@
- 	MESSAGE(VERB_NORMAL, "Normal verbosity messages are printed.\n");
- 	MESSAGE(VERB_HIGH, "High verbosity messages are printed.\n");
- 
--	if (nickname == NULL) {
-+	if (nickname == NULL && mode != MODE_LIST) {
- 		usage();
- 		exit(1);
- 	}
-@@ -251,13 +282,16 @@
- 	}
- 
- 	switch (mode) {
--		case MODE_WRITE : 
-+		case MODE_WRITE :
- 			ret = write_mode(&data, device, nickname, value);
- 			break;
--		case MODE_READ : 
-+		case MODE_READ :
- 			ret = read_mode(&data, device, nickname);
- 			break;
--		default : 
-+		case MODE_LIST :
-+			ret = list_mode(&data, device);
-+			break;
-+		default :
- 			MESSAGE(VERB_LOW, "Unknown mode of operation\n");
- 			usage();
- 			ret = 1;
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 72f6c4a..c595678 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -3,48 +3,26 @@
 # fconfig
 #
 #############################################################
-FCONFIG_VERSION:=20060419
-FCONFIG_SOURCE:=fconfig-$(FCONFIG_VERSION).tar.gz
-FCONFIG_SITE:=http://andrzejekiert.ovh.org/software/fconfig/
-FCONFIG_CAT:=$(ZCAT)
-FCONFIG_DIR:=$(BUILD_DIR)/fconfig
-FCONFIG_BINARY:=fconfig
-FCONFIG_TARGET_BINARY:=sbin/fconfig
+FCONFIG_VERSION = 20080329
+FCONFIG_SOURCE = fconfig-$(FCONFIG_VERSION).tar.gz
+FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
 
-$(DL_DIR)/$(FCONFIG_SOURCE):
-	 $(call DOWNLOAD,$(FCONFIG_SITE),$(FCONFIG_SOURCE))
-
-fconfig-source: $(DL_DIR)/$(FCONFIG_SOURCE)
-
-$(FCONFIG_DIR)/.unpacked: $(DL_DIR)/$(FCONFIG_SOURCE)
-	$(FCONFIG_CAT) $(DL_DIR)/$(FCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FCONFIG_DIR) package/fconfig \*.patch
-	touch $@
-
-$(FCONFIG_DIR)/$(FCONFIG_BINARY): $(FCONFIG_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FCONFIG_DIR) \
+define FCONFIG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
 
-$(TARGET_DIR)/$(FCONFIG_TARGET_BINARY): $(FCONFIG_DIR)/$(FCONFIG_BINARY)
-	rm -f $(TARGET_DIR)/$(FCONFIG_TARGET_BINARY)
-	$(INSTALL) -D -m 0755 $(FCONFIG_DIR)/$(FCONFIG_BINARY) $(TARGET_DIR)/$(FCONFIG_TARGET_BINARY)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-fconfig: $(TARGET_DIR)/$(FCONFIG_TARGET_BINARY)
+define FCONFIG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fconfig $(TARGET_DIR)/sbin/fconfig
+endef
 
-fconfig-clean:
-	-$(MAKE) -C $(FCONFIG_DIR) clean
-	rm -f $(TARGET_DIR)/$(FCONFIG_TARGET_BINARY)
+define FCONFIG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/fconfig
+endef
 
-fconfig-dirclean:
-	rm -rf $(FCONFIG_DIR)
+define FCONFIG_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FCONFIG),y)
-TARGETS+=fconfig
-endif
+$(eval $(call GENTARGETS,package,fconfig))
-- 
1.7.1
