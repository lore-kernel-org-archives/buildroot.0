From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Aug 2009 22:25:04 +0200
Subject: [Buildroot] [git commit] package/: new package iw
Message-ID: <20090802202924.01AF577784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9a6d6cf52b59d5812e78610ecedd298eecdcf327
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #289

This package is a wireless configuration utility for the linux mac80211
kernel stack.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-By: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 package/Config.in    |    1 +
 package/iw/Config.in |    7 +++++++
 package/iw/iw.mk     |   27 +++++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/iw/Config.in
 create mode 100644 package/iw/iw.mk

diff --git a/CHANGES b/CHANGES
index 0245a95..322458a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,6 +22,7 @@
 	#247: ntfsprogs: new package
 	#271: Library 'libgcc_s.so.1' not installed in search path
 	#287: New package libnl
+	#289: New package iw
 	#331: Update MPlayer to version 1.0rc2
 	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
diff --git a/package/Config.in b/package/Config.in
index cb5e9e0..f5f7760 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -150,6 +150,7 @@ source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
+source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
diff --git a/package/iw/Config.in b/package/iw/Config.in
new file mode 100644
index 0000000..81584e7
--- /dev/null
+++ b/package/iw/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IW
+	bool "iw"
+	select BR2_PACKAGE_LIBNL
+	help
+	  Utility for wireless devices using the mac80211 kernel stack
+
+	  http://wireless.kernel.org/en/users/Documentation/iw
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
new file mode 100644
index 0000000..dab6eee
--- /dev/null
+++ b/package/iw/iw.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# iw
+#
+#############################################################
+
+IW_VERSION = 0.9.15
+IW_SOURCE = iw-$(IW_VERSION).tar.bz2
+IW_SITE = http://wireless.kernel.org/download/iw
+IW_DEPENDENCIES = libnl
+IW_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+IW_CONFIG = $(IW_DIR)/.config
+IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	GIT_DIR=$(IW_DIR)
+
+$(eval $(call AUTOTARGETS,package,iw))
+
+$(IW_TARGET_CONFIGURE):
+	echo "CC = $(TARGET_CC)" >$(IW_CONFIG)
+	echo "CFLAGS = $(TARGET_CFLAGS)" >>$(IW_CONFIG)
+	echo "LDFLAGS = $(TARGET_LDFLAGS)" >>$(IW_CONFIG)
+	touch $@
+
+$(IW_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/bin/iw
+	rm -f $(IW_TARGET_INSTALL_TARGET) $(IW_HOOK_POST_INSTALL)
-- 
1.6.3.3
