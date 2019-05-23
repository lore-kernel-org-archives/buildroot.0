From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 23 May 2019 15:11:15 +0300
Subject: [Buildroot] [PATCH] package: dropbear: add support for displaying
 /etc/motd
Message-ID: <20190523121115.26098-1-ardeleanalex@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When dropbear changed the way how to configure things, by providing a
`localoptions.h` file, it also defaulted (somehow) to disable the display
of /etc/motd by default.

This can be configured by adding a `#define DO_MOTD 1` in the
`localoptions.h`, which requires it's own `BR2_PACKAGE_DROPBEAR_MOTD`
Kconfig option.

By default, support for displaying `/etc/motd` on login is disabled.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/dropbear/Config.in   | 6 ++++++
 package/dropbear/dropbear.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 62f77bad9d..936379d10c 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
 	  Enable logging of dropbear access to lastlog. Notice that
 	  Buildroot does not generate lastlog by default.
 
+config BR2_PACKAGE_DROPBEAR_MOTD
+	bool "display motd on login"
+	help
+	  Add support for displaying the contents of /etc/motd
+	  when a user logs into a SSH session.
+
 config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
 	bool "enable legacy crypto"
 	help
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e10c851606..d16b578b2d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -71,6 +71,10 @@ define DROPBEAR_ENABLE_REVERSE_DNS
 	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
 endef
 
+define DROPBEAR_ENABLE_MOTD
+	echo '#define DO_MOTD 1'                        >> $(@D)/localoptions.h
+endef
+
 define DROPBEAR_BUILD_FEATURED
 	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
@@ -124,6 +128,10 @@ ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
 DROPBEAR_CONF_OPTS += --disable-lastlog
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_MOTD),y)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_MOTD
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
-- 
2.17.1
