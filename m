From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 14:00:29 -0300
Subject: [Buildroot] [PATCHv4 3/4] ifupdown: new package
In-Reply-To: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1417107630-14909-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |  3 +++
 .../ifupdown/0001-dont-use-dpkg-architecture.patch | 17 ++++++++++++++
 package/ifupdown/Config.in                         | 17 ++++++++++++++
 package/ifupdown/ifupdown.hash                     |  2 ++
 package/ifupdown/ifupdown.mk                       | 26 ++++++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/ifupdown/0001-dont-use-dpkg-architecture.patch
 create mode 100644 package/ifupdown/Config.in
 create mode 100644 package/ifupdown/ifupdown.hash
 create mode 100644 package/ifupdown/ifupdown.mk

diff --git a/package/Config.in b/package/Config.in
index ab4ab6b..ae365f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1014,6 +1014,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/ifplugd/Config.in"
 endif
 	source "package/iftop/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/ifupdown/Config.in"
+endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
diff --git a/package/ifupdown/0001-dont-use-dpkg-architecture.patch b/package/ifupdown/0001-dont-use-dpkg-architecture.patch
new file mode 100644
index 0000000..bb5c58f
--- /dev/null
+++ b/package/ifupdown/0001-dont-use-dpkg-architecture.patch
@@ -0,0 +1,17 @@
+Drop the need for dpkg-architecture, we only build for linux.
+Thanks to K?roly Kasza for catching this one.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura ifupdown.orig/defn2c.pl ifupdown/defn2c.pl
+--- ifupdown.orig/defn2c.pl	2014-11-18 16:39:28.878772655 -0300
++++ ifupdown/defn2c.pl	2014-11-18 16:43:41.120456676 -0300
+@@ -2,7 +2,7 @@
+ 
+ use strict;
+ 
+-my $DEB_HOST_ARCH_OS = `dpkg-architecture -qDEB_HOST_ARCH_OS`;
++my $DEB_HOST_ARCH_OS = "linux";
+ 
+ $DEB_HOST_ARCH_OS =~ s/\n//;
+ 
diff --git a/package/ifupdown/Config.in b/package/ifupdown/Config.in
new file mode 100644
index 0000000..10cf2be
--- /dev/null
+++ b/package/ifupdown/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_IFUPDOWN
+	bool "ifupdown"
+	depends on BR2_USE_MMU # fork()
+	# Default/our uclibc lacks wordexp()
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	# runtime for ip binary
+	select BR2_PACKAGE_IPROUTE2 if !BR2_PACKAGE_BUSYBOX
+	# runtime for run-parts
+	select BR2_PACKAGE_DEBIANUTILS if !BR2_PACKAGE_BUSYBOX
+	help
+	  High level tools to configure network interfaces.
+
+	  https://tracker.debian.org/pkg/ifupdown
+
+comment "ifupdown needs an (e)glibc or musl toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
new file mode 100644
index 0000000..f0c314b
--- /dev/null
+++ b/package/ifupdown/ifupdown.hash
@@ -0,0 +1,2 @@
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.7.49.dsc
+sha256	5d07c73610ff90393c7273e2af9003eeb1825fc88144ae5ed11a5517547d0f58	ifupdown_0.7.49.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
new file mode 100644
index 0000000..5c78eed
--- /dev/null
+++ b/package/ifupdown/ifupdown.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# ifupdown
+#
+################################################################################
+
+IFUPDOWN_VERSION = 0.7.49
+IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20140923T221921Z/pool/main/i/ifupdown
+IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+IFUPDOWN_LICENSE = GPLv2+
+IFUPDOWN_LICENSE_FILES = COPYING
+
+define IFUPDOWN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
+		-C $(@D)
+endef
+
+# install doesn't overwrite
+define IFUPDOWN_INSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/sbin/{ifdown,ifquery}
+	$(TARGET_MAKE_ENV) $(MAKE) BASEDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.0.4
