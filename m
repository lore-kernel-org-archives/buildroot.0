From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:44:03 +1300
Subject: [Buildroot] [git commit] udpxy: new package
Message-ID: <20170125104556.8A9EB81EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e2439c81d34a6b002f5ca096fdd7cb9e9e27f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
[Thomas:
 - keep only sha256 hash, not needed to have md5 and sha1 when sha256 is
   provided
 - add BR2_USE_MMU dependency, since the program uses fork()
 - remove UDPXY_MAKE_OPTS, and use the appropriate options during the
   build and install steps directly
 - use TARGET_MAKE_ENV in the build and install steps]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/udpxy/Config.in  |  9 +++++++++
 package/udpxy/udpxy.hash |  2 ++
 package/udpxy/udpxy.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 434f406..c7b6862 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -45,6 +45,7 @@ menu "Audio and video applications"
 	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
+	source "package/udpxy/Config.in"
 	source "package/upmpdcli/Config.in"
 	source "package/v4l2grab/Config.in"
 	source "package/vlc/Config.in"
diff --git a/package/udpxy/Config.in b/package/udpxy/Config.in
new file mode 100644
index 0000000..f442a2f
--- /dev/null
+++ b/package/udpxy/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UDPXY
+	bool "udpxy"
+	depends on BR2_USE_MMU
+	help
+	  udpxy is a UDP-to-HTTP multicast traffic relay daemon: it
+	  forwards UDP traffic from a given multicast subscription to
+	  the requesting HTTP client.
+
+	  http://www.udpxy.com/
diff --git a/package/udpxy/udpxy.hash b/package/udpxy/udpxy.hash
new file mode 100644
index 0000000..4042a41
--- /dev/null
+++ b/package/udpxy/udpxy.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd    udpxy.1.0.23-9-prod.tar.gz
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
new file mode 100644
index 0000000..dd8c91f
--- /dev/null
+++ b/package/udpxy/udpxy.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# udpxy
+#
+#################################################################################
+
+UDPXY_VERSION = 1.0.23-9-prod
+UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
+UDPXY_SITE = http://www.udpxy.com/download/1_23
+UDPXY_LICENSE = GPLv3+
+UDPXY_LICENSE_FILES = README
+
+define UDPXY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define UDPXY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
