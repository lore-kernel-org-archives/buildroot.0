From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 17:46:56 +0200
Subject: [Buildroot] [PATCH 1/2] heirloom-mailx: new package
In-Reply-To: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334677614.git.thomas.petazzoni@free-electrons.com>
Message-ID: <892cb61cad940f6b378ebc04e9cc3a216d1d11f0.1334677614.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/heirloom-mailx/Config.in         |   13 +++++++++++++
 package/heirloom-mailx/heirloom-mailx.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/heirloom-mailx/Config.in
 create mode 100644 package/heirloom-mailx/heirloom-mailx.mk

diff --git a/package/Config.in b/package/Config.in
index 567fbed..1fb6c4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ source "package/dnsmasq/Config.in"
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
-- 
1.7.4.1
