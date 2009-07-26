From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jul 2009 21:10:56 +0200
Subject: [Buildroot] [git commit] libnl: new package
Message-ID: <20090726191450.5CCEE7755D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57c2e79b27273f1a3ca76008c4a428496680e75e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #287.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    1 +
 package/Config.in       |    1 +
 package/libnl/Config.in |    6 ++++++
 package/libnl/libnl.mk  |   22 ++++++++++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/libnl/Config.in
 create mode 100644 package/libnl/libnl.mk

diff --git a/CHANGES b/CHANGES
index 3d61bc7..7111e91 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,6 +6,7 @@
 	#163: Xtensa architecture port
 	#241: device mapper + lvm2: build together
 	#271: Library 'libgcc_s.so.1' not installed in search path
+	#287: New package libnl
 	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
 	#359,#413: Upgrade openvpn to Makefile.autotools.in
diff --git a/package/Config.in b/package/Config.in
index d27c017..c4cad8d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -155,6 +155,7 @@ source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
+source "package/libnl/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/libsoup/Config.in"
diff --git a/package/libnl/Config.in b/package/libnl/Config.in
new file mode 100644
index 0000000..24e4813
--- /dev/null
+++ b/package/libnl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBNL
+	bool "libnl"
+	help
+	  A library for applications dealing with netlink socket.
+
+	  http://people.suug.ch/~tgr/libnl/
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
new file mode 100644
index 0000000..1a66746
--- /dev/null
+++ b/package/libnl/libnl.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libnl
+#
+#############################################################
+
+LIBNL_VERSION = 1.1
+LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
+LIBNL_SITE = http://distfiles.gentoo.org/distfiles
+LIBNL_INSTALL_STAGING = YES
+LIBNL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package,libnl))
+
+$(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
+	touch $@
+
+$(LIBNL_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
+	rm -f $(LIBNL_TARGET_INSTALL_TARGET) $(LIBNL_HOOK_POST_INSTALL)
-- 
1.6.3.3
