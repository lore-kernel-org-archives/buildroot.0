From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 16:52:18 +0800
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <1389862338.918265.958087681541.2.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the dropbear package installs both client and server
components. For example, this means that when we only want the
client binaries, we also get the server run from init.

Even though it's a multi-call binary (the client and server
exist in the same executable), we'd like to selectively install the
links and init scripts. This change introduces separate configuration
options (both 'default y') for the client and server bits.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/dropbear/Config.in   |   12 ++++++++++++
 package/dropbear/dropbear.mk |    9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 68c3b71a..4a7327b7 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -8,6 +8,18 @@ config BR2_PACKAGE_DROPBEAR
 
 if BR2_PACKAGE_DROPBEAR
 
+config BR2_PACKAGE_DROPBEAR_SERVER
+	bool "dropbear ssh server"
+	default y
+	help
+	  Enable the dropbear ssh server, run from init
+
+config BR2_PACKAGE_DROPBEAR_CLIENT
+	bool "dropbear ssh client"
+	default y
+	help
+	  Enable the dropbear ssh client, scp and utilities
+
 config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	bool "disable reverse DNS lookups"
 	help
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 3ef6c8da..a1cc5691 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -7,7 +7,7 @@
 DROPBEAR_VERSION = 2013.62
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
-DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
+DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
@@ -43,6 +43,7 @@ define DROPBEAR_DISABLE_STANDALONE
 	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_SERVER),y)
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
 		$(TARGET_DIR)/etc/systemd/system/dropbear.service
@@ -60,6 +61,12 @@ else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 endif
 
+endif
+
+ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
+DROPBEAR_TARGET_BINS += dbclient scp ssh
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
