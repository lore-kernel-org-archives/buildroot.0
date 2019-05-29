From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Wed, 29 May 2019 13:27:06 +0300
Subject: [Buildroot] [PATCH] dropbear: add build opt to provide file with
 localoptions.h
In-Reply-To: <20190523121115.26098-1-ardeleanalex@gmail.com>
References: <20190523121115.26098-1-ardeleanalex@gmail.com>
Message-ID: <20190529102706.31865-1-alexandru.ardelean@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandru Ardelean <ardeleanalex@gmail.com>

Based on discussion here:
  https://patchwork.ozlabs.org/patch/1104071/
Thomas suggested to implement an option to specify a file that gets
appended to the `localoptions.h` of dropbear, as well as providing the code
for this

This patch implements the changes.
The patch was tested successfully with the DO_MOTD option, which the
initial patch tried to address.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
Changelog v1 -> v2:
* re-implemented with suggestions from Thomas
* tested patch with `#define DO_MOTD 1` option

 package/dropbear/Config.in   | 7 +++++++
 package/dropbear/dropbear.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 62f77bad9d..bc8d80ecf4 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -66,4 +66,11 @@ config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
 	    DSA public keys
 	    Diffie-Hellman Group1 key exchange
 
+config BR2_PACKAGE_DROPBEAR_CONFIG_FILE
+	string "path to dropbear config file"
+	help
+	  Path to a file whose contents will be appended to Dropbear
+	  localoptions.h. It can be used to tweak the Dropbear
+	  configuration.
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d93faa48ea..86c7769c51 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -124,6 +124,14 @@ ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
 DROPBEAR_CONF_OPTS += --disable-lastlog
 endif
 
+DROPBEAR_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_DROPBEAR_CONFIG_FILE))
+ifneq ($(DROPBEAR_CONFIG_FILE),)
+define DROPBEAR_APPEND_CONFIG_FILE
+	cat $(DROPBEAR_CONFIG_FILE) >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_APPEND_CONFIG_FILE
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
-- 
2.20.1
