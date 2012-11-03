From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:14:18 +0100
Subject: [Buildroot] [git commit] arptables: add new package
Message-ID: <20121103182342.C805199A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efc10eb6b87884f1f7917462d78af6953fcd99e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/arptables/Config.in    |    6 ++++++
 package/arptables/arptables.mk |   21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3b7458f..6125abc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -550,6 +550,7 @@ endmenu
 
 menu "Networking applications"
 source "package/argus/Config.in"
+source "package/arptables/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
 source "package/bluez_utils/Config.in"
diff --git a/package/arptables/Config.in b/package/arptables/Config.in
new file mode 100644
index 0000000..510eedf
--- /dev/null
+++ b/package/arptables/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ARPTABLES
+	bool "arptables"
+	help
+	  Tool to set up, maintain, and inspect the tables of ARP rules.
+
+	  http://ebtables.sourceforge.net
diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
new file mode 100644
index 0000000..dac5ca4
--- /dev/null
+++ b/package/arptables/arptables.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# arptables
+#
+#############################################################
+
+ARPTABLES_VERSION = 0.0.3
+ARPTABLES_VERSION_MINOR = 4
+ARPTABLES_SOURCE = arptables-v$(ARPTABLES_VERSION)-$(ARPTABLES_VERSION_MINOR).tar.gz
+ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arptables-v$(ARPTABLES_VERSION)
+
+define ARPTABLES_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" COPT_FLAGS="$(TARGET_CFLAGS)"
+endef
+
+define ARPTABLES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/arptables $(TARGET_DIR)/usr/sbin/arptables
+endef
+
+$(eval $(generic-package))
