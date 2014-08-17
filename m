From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:32:47 +0200
Subject: [Buildroot] [git commit] odhcploc: new package
Message-ID: <20140901132446.1F8B59D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=039cd77e642f3473e439b241b76280036ce96f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds odhcploc, a network utility to scan for (rogue) DHCP servers.

[Thomas:
- remove ODHCPLOC_SOURCE line, not needed since the value was the
  default
- use 'make install' instead of manually installing the program
- use TARGET_CONFIGURE_OPTS instead of passing just CC and LD
- use tab for indentation inside command definitions instead of spaces]

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/odhcploc/Config.in   |    8 ++++++++
 package/odhcploc/odhcploc.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4520ba6..7bb8fc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1031,6 +1031,7 @@ endif
 	source "package/noip/Config.in"
 	source "package/ntp/Config.in"
 	source "package/nuttcp/Config.in"
+	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
diff --git a/package/odhcploc/Config.in b/package/odhcploc/Config.in
new file mode 100644
index 0000000..74bf363
--- /dev/null
+++ b/package/odhcploc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ODHCPLOC
+	bool "odhcploc"
+	help
+	  Open DHCP Locate (ODHCPLoc) is program to locate and
+	  display active DHCP servers on a subnet.
+	  Can be used to scan for rogue DHCP servers.
+
+	  http://odhcploc.sourceforge.net/
diff --git a/package/odhcploc/odhcploc.mk b/package/odhcploc/odhcploc.mk
new file mode 100644
index 0000000..3995551
--- /dev/null
+++ b/package/odhcploc/odhcploc.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# odhcploc
+#
+################################################################################
+
+ODHCPLOC_VERSION = 20111021
+ODHCPLOC_SITE = http://downloads.sourceforge.net/project/odhcploc/$(ODHCPLOC_VERSION)
+ODHCPLOC_LICENSE = ISC
+ODHCPLOC_LICENSE_FILES = COPYING
+
+define ODHCPLOC_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define ODHCPLOC_INSTALL_TARGET_CMDS
+	$(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
