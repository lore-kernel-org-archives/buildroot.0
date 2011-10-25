From: Will Moore <will.moore@beraninstruments.com>
Date: Tue, 25 Oct 2011 10:36:42 +0100
Subject: [Buildroot] [PATCH] Allow build of dropbear without wtmp and
	lastlog support to stop it from generating system log error messages
Message-ID: <1319535402-2358-1-git-send-email-will.moore@beraninstruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Moore <will.moore@beraninstruments.com>
---
 package/dropbear/Config.in   |   16 ++++++++++++++++
 package/dropbear/dropbear.mk |    8 ++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index c30228f..58fed4a 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -23,3 +23,19 @@ config BR2_PACKAGE_DROPBEAR_SMALL
 
 	  Tradeoffs are slower hashes and ciphers, and disabling of the
 	  blowfish cipher and zlib.
+
+config BR2_PACKAGE_DROPBEAR_DISABLE_WTMP
+	bool "disable logging of dropbear access to wtmp"
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Disable logging of dropbear access to wtmp. Buildroot does not generate
+	  wtmp by default and so by disabling dropbear's use of wtmp this
+	  prevents warnings in the system log.
+
+config BR2_PACKAGE_DROPBEAR_DISABLE_LASTLOG
+	bool "disable logging of dropbear access to lastlog"
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Disable logging of dropbear access to lastlog. Buildroot does not
+	  generate lastlog by default and so by disabling dropbear's use of
+	  lastlog this prevents warnings in the system log.
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e9da42d..0c9c5fc 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -46,6 +46,14 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
 DROPBEAR_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_WTMP),y)
+DROPBEAR_CONF_OPT += --disable-wtmp
+endif
+
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_LASTLOG),y)
+DROPBEAR_CONF_OPT += --disable-lastlog
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
-- 
1.7.0.4
