From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] batctl: new package
Message-ID: <20150302222715.E207F8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20fcdcb34bfb7e03db1254bc8489c0e20ab31dab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - remove trailing whitespace
 - remove "# libnl" comment in Config.in
 - remove BATCTL_SOURCE, which is not needed, since the default value
   is used
 - pass $(TARGET_CONFIGURE_OPTS) in the make environment, not as a
   make option, otherwise the CFLAGS += lines of batctl Makefile do
   not have any effect, and lead to not have the proper include path
   to the libnl header files.]

Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/batctl/Config.in   |   12 ++++++++++++
 package/batctl/batctl.hash |    2 ++
 package/batctl/batctl.mk   |   21 +++++++++++++++++++++
 4 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..b9d6753 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1055,6 +1055,7 @@ menu "Networking applications"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
 	source "package/bandwidthd/Config.in"
+	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
 	source "package/bluez_utils/Config.in"
diff --git a/package/batctl/Config.in b/package/batctl/Config.in
new file mode 100644
index 0000000..a60f4f6
--- /dev/null
+++ b/package/batctl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BATCTL
+	bool "batctl"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  Batctl is the configuration and debugging tool for batman-adv.
+
+	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
+
+comment "batctl needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
new file mode 100644
index 0000000..663e602
--- /dev/null
+++ b/package/batctl/batctl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36  batctl-2014.4.0.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
new file mode 100644
index 0000000..c458752
--- /dev/null
+++ b/package/batctl/batctl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# batctl
+#
+################################################################################
+
+BATCTL_VERSION = 2014.4.0
+BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
+BATCTL_LICENSE = GPLv2
+BATCTL_DEPENDENCIES = libnl host-pkgconf
+
+define BATCTL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
+endef
+
+define BATCTL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
