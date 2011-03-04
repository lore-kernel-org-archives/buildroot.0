From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Mar 2011 11:22:26 -0300
Subject: [Buildroot] [PATCH 2/2] dropbear: bump to version 0.53.1
In-Reply-To: <1299248546-7165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1299248546-7165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1299248546-7165-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump dropbear to version 0.53.1
Changelog @ http://matt.ucc.asn.au/dropbear/CHANGES

Since some build-time defaults have changed that make dropbear somewhat
bigger we introduce a new option to optimize dropbear for size.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/Config.in   |   10 ++++++++++
 package/dropbear/dropbear.mk |   17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index e47ba45..4bc0e3e 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -13,3 +13,13 @@ config BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS
 	  Disable reverse DNS lookups on connection. This can be handy
 	  on systems without working DNS, as connections otherwise
 	  stall until DNS times out.
+
+config BR2_PACKAGE_DROPBEAR_SMALL
+	bool "optimize for size"
+	default y
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Compile dropbear for the smallest possible binary size.
+
+	  Tradeoffs are slower hashes and ciphers, and disabling of the
+	  blowfish cipher.
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b07cb63..fab7c96 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DROPBEAR_VERSION = 0.52
+DROPBEAR_VERSION = 0.53.1
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_DEPENDENCIES = zlib
@@ -27,10 +27,25 @@ define DROPBEAR_DISABLE_REVERSE_DNS
 	$(SED) 's,^#define DO_HOST_LOOKUP.*,/* #define DO_HOST_LOOKUP */,' $(@D)/options.h
 endef
 
+define DROPBEAR_BUILD_SMALL
+	echo "#define DROPBEAR_SMALL_CODE" >>$(@D)/options.h
+	echo "#define NO_FAST_EXPTMOD" >>$(@D)/options.h
+endef
+
+define DROPBEAR_BUILD_FEATURED
+	echo "#define DROPBEAR_BLOWFISH" >>$(@D)/options.h
+endef
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_SMALL
+else
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
-- 
1.7.3.4
