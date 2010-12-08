From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Dec 2010 23:37:48 +0100
Subject: [Buildroot] [git commit master 1/1] rsh-redone: new package for
	rsh/rlogin clients
Message-ID: <20101208223824.7BC1B8D570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea7ab91c66dfceba414218c8156a347681b86df9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    2 +-
 package/Config.in                |    1 +
 package/rsh-redone/Config.in     |   31 +++++++++++++++++++++++++++++++
 package/rsh-redone/rsh-redone.mk |   36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 package/rsh-redone/Config.in
 create mode 100644 package/rsh-redone/rsh-redone.mk

diff --git a/CHANGES b/CHANGES
index 45585c1..47ba38d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	Updated/fixed packages: cloop, m4, openssh, qt, xz
 
-	New packages: lsuio
+	New packages: lsuio, rsh-redone
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index b026828..7c550cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -416,6 +416,7 @@ source "package/rp-pppoe/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
+source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
 source "package/ser2net/Config.in"
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
new file mode 100644
index 0000000..454bf30
--- /dev/null
+++ b/package/rsh-redone/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_RSH_REDONE
+	bool "rsh-redone"
+	help
+	  Rsh-redone is a reimplementation of the remote shell clients and
+	  servers.  It is written from the ground up to avoid the bugs found
+	  in the standard clients and servers.  It also fully supports IPv6.
+
+	  http://packages.debian.org/source/sid/rsh-redone
+
+# this is incomplete in the source
+#config BR2_PACKAGE_RSH_REDONE_RCP
+#	bool "rcp"
+#	depends on BR2_PACKAGE_RSH_REDONE
+
+config BR2_PACKAGE_RSH_REDONE_RLOGIN
+	bool "rlogin"
+	depends on BR2_PACKAGE_RSH_REDONE
+
+# requires PAM
+#config BR2_PACKAGE_RSH_REDONE_RLOGIND
+#	bool "rlogind"
+#	depends on BR2_PACKAGE_RSH_REDONE
+
+config BR2_PACKAGE_RSH_REDONE_RSH
+	bool "rsh"
+	depends on BR2_PACKAGE_RSH_REDONE
+
+# requires PAM
+#config BR2_PACKAGE_RSH_REDONE_RSHD
+#	bool "rshd"
+#	depends on BR2_PACKAGE_RSH_REDONE
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
new file mode 100644
index 0000000..6217cb1
--- /dev/null
+++ b/package/rsh-redone/rsh-redone.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# rsh-redone
+#
+#############################################################
+
+RSH_REDONE_VERSION = 85
+RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
+RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
+
+rsh-redone-bin-y =
+rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RCP) += rcp
+rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
+rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
+rsh-redone-sbin-y =
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += rlogind
+rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += rshd
+
+define RSH_REDONE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
+endef
+
+define RSH_REDONE_INSTALL_TARGET_CMDS
+	$(if $(rsh-redone-bin-y)$(rsh-redone-sbin-y),
+		$(RSH_REDONE_BUILD_CMDS) DESTDIR=$(TARGET_DIR) \
+			$(if $(rsh-redone-bin-y),install-bin) \
+			$(if $(rsh-redone-sbin-y),install-sbin))
+endef
+
+define RSH_REDONE_UNINSTALL_TARGET_CMDS
+	rm -f \
+		$(addprefix $(TARGET_DIR)/usr/bin/,$(rsh-redone-bin-y)) \
+		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
+endef
+
+$(eval $(call GENTARGETS,package,rsh-redone))
-- 
1.7.2.2
