From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] wget: bump to 1.12 and migrate to
	Makefile.autotools.in
Message-ID: <20100322145737.8BA6F77716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8fe6cc98d9211fbb5d7e18f16cc97d4a525a0126
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1111.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    3 +-
 package/wget/Config.in |    4 +-
 package/wget/wget.mk   |   60 ++++++-----------------------------------------
 3 files changed, 12 insertions(+), 55 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3f5f941..efc1136 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,10 +6,11 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	libglib2, libpng, mtd-utils, pppd, setserial, squashfs
+	libglib2, libpng, mtd-utils, pppd, setserial, squashfs, wget
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 
diff --git a/package/wget/Config.in b/package/wget/Config.in
index b53cc95..3877a3a 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
 	help
-	  Network utility to retrieve files from http/ftp/etc...
+	  Network utility to retrieve files from http, https and ftp.
 
-	  http://wget.sunsite.dk/
+	  http://www.gnu.org/software/wget/
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 06e54c7..cb0c60a 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -3,58 +3,14 @@
 # wget
 #
 #############################################################
-WGET_VERSION:=1.10.2
-WGET_SOURCE:=wget-$(WGET_VERSION).tar.gz
-WGET_SITE:=$(BR2_GNU_MIRROR)/wget
-WGET_DIR:=$(BUILD_DIR)/wget-$(WGET_VERSION)
-WGET_CAT:=$(ZCAT)
-WGET_BINARY:=src/wget
-WGET_TARGET_BINARY:=bin/wget
 
-$(DL_DIR)/$(WGET_SOURCE):
-	$(call DOWNLOAD,$(WGET_SITE),$(WGET_SOURCE))
+WGET_VERSION = 1.12
+WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_CONF_OPT = $(DISABLE_IPV6)
 
-wget-source: $(DL_DIR)/$(WGET_SOURCE)
-
-$(WGET_DIR)/.unpacked: $(DL_DIR)/$(WGET_SOURCE)
-	$(WGET_CAT) $(DL_DIR)/$(WGET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(WGET_DIR)
-	touch $@
-
-$(WGET_DIR)/.configured: $(WGET_DIR)/.unpacked
-	(cd $(WGET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--disable-ipv6 \
-		$(DISABLE_NLS) \
-		--without-ssl \
-	)
-	touch $@
-
-$(WGET_DIR)/$(WGET_BINARY): $(WGET_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(WGET_DIR)
-
-$(TARGET_DIR)/$(WGET_TARGET_BINARY): $(WGET_DIR)/$(WGET_BINARY)
-	install -D $(WGET_DIR)/$(WGET_BINARY) $(TARGET_DIR)/$(WGET_TARGET_BINARY)
-
-wget: $(TARGET_DIR)/$(WGET_TARGET_BINARY)
-
-wget-clean:
-	rm -f $(TARGET_DIR)/$(WGET_TARGET_BINARY)
-	-$(MAKE) -C $(WGET_DIR) clean
-
-wget-dirclean:
-	rm -rf $(WGET_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_WGET),y)
-TARGETS+=wget
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	WGET_CONF_OPT += --with-ssl --with-libssl-prefix=$(STAGING_DIR)
+	WGET_DEPENDENCIES += openssl
 endif
+
+$(eval $(call AUTOTARGETS,package,wget))
-- 
1.6.3.3
