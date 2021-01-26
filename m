From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Jan 2021 13:26:05 -0600
Subject: [Buildroot] [PATCH] package/opkg-utils: add opkg-utils as target pkg
Message-ID: <20210126192605.20002-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Supports a use case of building container rootfs images where a matching
target version of the tools is required for online repackaging
of a installer archive.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                       | 1 +
 package/Config.in                | 1 +
 package/opkg-utils/Config.in     | 6 ++++++
 package/opkg-utils/opkg-utils.mk | 9 +++++++++
 4 files changed, 17 insertions(+)
 create mode 100644 package/opkg-utils/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index 7af3081760..3638efe6d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1750,6 +1750,7 @@ F:	package/mtools/
 F:	package/nginx-upload/
 F:	package/omniorb/
 F:	package/openresolv/
+F:	package/opkg-utils/
 F:	package/paxtest/
 F:	package/picocom/
 F:	package/policycoreutils/
diff --git a/package/Config.in b/package/Config.in
index 12bd0608e3..18873c46c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2334,6 +2334,7 @@ comment "See the manual:                                        "
 comment "http://buildroot.org/manual.html#faq-no-binary-packages"
 comment "-------------------------------------------------------"
 	source "package/opkg/Config.in"
+	source "package/opkg-utils/Config.in"
 	source "package/rpm/Config.in"
 endmenu
 
diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
new file mode 100644
index 0000000000..03172ea4da
--- /dev/null
+++ b/package/opkg-utils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OPKG_UTILS
+	bool "opkg-utils"
+	help
+	  Helper scripts for use with the opkg package manager.
+
+	  https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index a94a4cd5cd..ed4e73e7f0 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -12,6 +12,14 @@ OPKG_UTILS_LICENSE_FILES = COPYING
 
 HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
 
+define OPKG_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define OPKG_UTILS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
+endef
+
 define HOST_OPKG_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
 endef
@@ -20,4 +28,5 @@ define HOST_OPKG_UTILS_INSTALL_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.17.1
