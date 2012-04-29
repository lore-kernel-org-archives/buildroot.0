From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 20:01:22 +0200
Subject: [Buildroot] [git commit] heirloom-mailx: new package
Message-ID: <20120429183216.35C9696BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ee5f4483952ccf1625af56a97c38f5b856d5a8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/heirloom-mailx/Config.in         |   13 +++++++++++++
 package/heirloom-mailx/heirloom-mailx.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 34570be..7d145c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/heirloom-mailx/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hiawatha/Config.in"
 endif
diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
new file mode 100644
index 0000000..9a871d4
--- /dev/null
+++ b/package/heirloom-mailx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HEIRLOOM_MAILX
+	bool "heirloom-mailx"
+	help
+	  Heirloom mailx (previously known as nail) is a mail user
+	  agent for Unix systems.
+
+	  It can be used as a command-line mail reader, but also more
+	  importantly on embedded systems, as a mail composition
+	  program and SMTP client, in order to send e-mail from shell
+	  scripts. It supports SMTP authentication (login, plain,
+	  cram-md5), SMTPS, MIME encoding of attachements, and more.
+
+	  http://heirloom.sourceforge.net/mailx.html
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
new file mode 100644
index 0000000..2b28a3f
--- /dev/null
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# heirloom-mailx
+#
+#############################################################
+
+HEIRLOOM_MAILX_VERSION = 12.5
+HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
+HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx/
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+HEIRLOOM_MAILX_DEPENDENCIES += openssl
+endif
+
+define HEIRLOOM_MAILX_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr \
+		UCBINSTALL=$(INSTALL) \
+		STRIP=/bin/true \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
+
+$(eval $(call GENTARGETS))
