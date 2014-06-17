From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 17 Jun 2014 13:21:47 +0800
Subject: [Buildroot] [PATCH 2/7 v3] package/dropbear: Add separate
 configuration option for dropbear server
In-Reply-To: <1402982507.183937.570365596242.0.gpush@pablo>
Message-ID: <1402982507.184682.35787456543.2.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the dropbear package installs both client and server
components. This means that when we only want the client binaries, we
also get the server, which is run from init.

Even though it's a multi-call binary (the client and server
exist in the same executable), we can define which parts are
compiled-in. We'd also like to selectively install the links and init
scripts.

This change introduces a separate configuration for the dropbear server.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/dropbear/Config.in   |    6 ++++++
 package/dropbear/dropbear.mk |   11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 68c3b71..9ff5f47 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -8,6 +8,12 @@ config BR2_PACKAGE_DROPBEAR
 
 if BR2_PACKAGE_DROPBEAR
 
+config BR2_PACKAGE_DROPBEAR_SERVER
+	bool "dropbear ssh server"
+	default y
+	help
+	  Enable the dropbear ssh server, run from init
+
 config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	bool "disable reverse DNS lookups"
 	help
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 3a39169..4fa26da 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -8,8 +8,9 @@ DROPBEAR_VERSION = 2014.63
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
+DROPBEAR_MAKE_PROGRAMS = $(filter-out ssh, $(DROPBEAR_TARGET_BINS))
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
-		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
+		PROGRAMS="$(DROPBEAR_MAKE_PROGRAMS)"
 
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
 DROPBEAR_LICENSE_FILES = LICENSE
@@ -18,6 +19,10 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_SERVER),y)
+DROPBEAR_TARGET_BINS += dropbear
+endif
+
 define DROPBEAR_FIX_XAUTH
 	$(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND "/usr/bin/xauth,g' $(@D)/options.h
 endef
@@ -43,6 +48,7 @@ define DROPBEAR_DISABLE_STANDALONE
 	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_SERVER),y)
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/dropbear.service
@@ -59,6 +65,7 @@ endef
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
@@ -82,7 +89,7 @@ endif
 
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
-	for f in $(DROPBEAR_TARGET_BINS); do \
+	for f in $(filter-out dropbear,$(DROPBEAR_TARGET_BINS)); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
 	mkdir -p $(TARGET_DIR)/etc/dropbear
