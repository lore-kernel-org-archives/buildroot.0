From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Oct 2011 11:24:30 +0200
Subject: [Buildroot] [git commit] dropbear: add options to disable wtmp /
	lastlog logging
Message-ID: <20111026092916.34B448F307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aeea387d82fc84272ebc216665cf9aeb5567438e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot does not have wtmp or lastlog support by default so allow dropbear
to be configured to stop using them and hence to stop generating system log
error messages.

[Peter: invert to positive options, and disable by default]
Signed-off-by: Will Moore <will.moore@beraninstruments.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/Config.in   |   14 ++++++++++++++
 package/dropbear/dropbear.mk |    8 ++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index c30228f..0903ad1 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -23,3 +23,17 @@ config BR2_PACKAGE_DROPBEAR_SMALL
 
 	  Tradeoffs are slower hashes and ciphers, and disabling of the
 	  blowfish cipher and zlib.
+
+config BR2_PACKAGE_DROPBEAR_WTMP
+	bool "log dropbear access to wtmp"
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Enable logging of dropbear access to wtmp. Notice that
+	  Buildroot does not generate wtmp by default.
+
+config BR2_PACKAGE_DROPBEAR_LASTLOG
+	bool "log dropbear access to lastlog"
+	depends on BR2_PACKAGE_DROPBEAR
+	help
+	  Enable logging of dropbear access to lastlog. Notice that
+	  Buildroot does not generate lastlog by default.
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e9da42d..bced0ef 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -46,6 +46,14 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
 DROPBEAR_DEPENDENCIES += zlib
 endif
 
+ifneq ($(BR2_PACKAGE_DROPBEAR_WTMP),y)
+DROPBEAR_CONF_OPT += --disable-wtmp
+endif
+
+ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
+DROPBEAR_CONF_OPT += --disable-lastlog
+endif
+
 define DROPBEAR_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
