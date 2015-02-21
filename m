From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:26:01 +0100
Subject: [Buildroot] [git commit branch/next] hans: new package
Message-ID: <20150221144904.8B31F80438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f29f8663db43fbcdbf981e87f6d37b1932bc2ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/hans/Config.in |   13 +++++++++++++
 package/hans/hans.hash |    3 +++
 package/hans/hans.mk   |   20 ++++++++++++++++++++
 4 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a45b0f9..c169369 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1091,6 +1091,7 @@ endif
 	source "package/fping/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
+	source "package/hans/Config.in"
 	source "package/hiawatha/Config.in"
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
diff --git a/package/hans/Config.in b/package/hans/Config.in
new file mode 100644
index 0000000..7b60090
--- /dev/null
+++ b/package/hans/Config.in
@@ -0,0 +1,13 @@
+comment "hans needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_HANS
+	bool "hans"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Hans makes it possible to tunnel IPv4 through ICMP echo packets,
+	  so you could call it a ping tunnel.
+	  This can be useful when you find yourself in the situation
+	  that your Internet access is firewalled, but pings are allowed.
+
+	  http://code.gerade.org/hans/
diff --git a/package/hans/hans.hash b/package/hans/hans.hash
new file mode 100644
index 0000000..c1a28df
--- /dev/null
+++ b/package/hans/hans.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/hanstunnel/files/source/
+md5	97a93a886bc766212257198fd99d1061	hans-0.4.4.tar.gz
+sha1	8a21a9acc6d52cf7d2a5049523469e2609716ab3	hans-0.4.4.tar.gz
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
new file mode 100644
index 0000000..bda091f
--- /dev/null
+++ b/package/hans/hans.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# hans
+#
+################################################################################
+
+HANS_VERSION = 0.4.4
+HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
+HANS_LICENSE = GPLv3+
+HANS_LICENSE_FILES = LICENSE
+
+define HANS_BUILD_CMDS
+	$(MAKE) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
+endef
+
+define HANS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/hans $(TARGET_DIR)/usr/sbin/hans
+endef
+
+$(eval $(generic-package))
