From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 11:44:49 +0200
Subject: [Buildroot] [git commit] package/dropbear: add option to provide
 file with localoptions.h
Message-ID: <20190602201238.11420811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26708469adc3f5e4194f176fa51f1ce280b0b357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed in https://patchwork.ozlabs.org/patch/1104071/, this
commit adds a new option that allows the user to provide a file that
contains custom definitions to tweak the Dropbear configuration. It
will be appended to Dropbear's localoptions.h file before the build.

The patch was tested successfully with the DO_MOTD option.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
[Thomas: tweak commit log, rename config option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/Config.in   | 7 +++++++
 package/dropbear/dropbear.mk | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 62f77bad9d..e14a670c19 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -66,4 +66,11 @@ config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
 	    DSA public keys
 	    Diffie-Hellman Group1 key exchange
 
+config BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE
+	string "path to custom localoptions.h definitions file"
+	help
+	  Path to a file whose contents will be appended to Dropbear
+	  localoptions.h. It can be used to tweak the Dropbear
+	  configuration.
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e10c851606..185f8c4341 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -124,6 +124,14 @@ ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
 DROPBEAR_CONF_OPTS += --disable-lastlog
 endif
 
+DROPBEAR_LOCALOPTIONS_FILE = $(call qstrip,$(BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE))
+ifneq ($(DROPBEAR_LOCALOPTIONS_FILE),)
+define DROPBEAR_APPEND_LOCALOPTIONS_FILE
+	cat $(DROPBEAR_LOCALOPTIONS_FILE) >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_APPEND_LOCALOPTIONS_FILE
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
