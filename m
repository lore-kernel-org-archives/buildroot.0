From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  2 Feb 2017 17:45:03 -0500
Subject: [Buildroot] [PATCH 2/4] checkpolicy: allow compiling for target
In-Reply-To: <20170202224505.22882-1-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
Message-ID: <20170202224505.22882-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

checkpolicy is currently a host-only package, however it is a dependency
of audit2allow.  This patch allows for checkpolicy to be compiled for the
target.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in                  |  1 +
 package/checkpolicy/Config.in      | 11 +++++++++++
 package/checkpolicy/checkpolicy.mk | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/checkpolicy/Config.in

diff --git a/package/Config.in b/package/Config.in
index 9fedc23..90d9273 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1706,6 +1706,7 @@ menu "Real-Time"
 endmenu
 
 menu "Security"
+	source "package/checkpolicy/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/sepolgen/Config.in"
 	source "package/setools/Config.in"
diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
new file mode 100644
index 0000000..894ce39
--- /dev/null
+++ b/package/checkpolicy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CHECKPOLICY
+	bool "checkpolicy"
+	select BR2_PACKAGE_FLEX
+	help
+	  checkpolicy is the SELinux policy compiler. It uses libsepol
+	  to generate the binary policy. checkpolicy uses the static
+	  libsepol since it deals with low level details of the policy
+	  that have not been encapsulated/abstracted by a proper
+	  shared library interface.
+
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 8328b39..7af5edf 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -8,6 +8,28 @@ CHECKPOLICY_VERSION = 2.6
 CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 CHECKPOLICY_LICENSE = GPLv2
 CHECKPOLICY_LICENSE_FILES = COPYING
+LIBSELINUX_INSTALL_STAGING = YES
+
+CHECKPOLICY_DEPENDENCIES = libselinux host-bison flex
+
+TARGET_CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+	
+
+# DESTDIR is used at build time to find libselinux
+define CHECKPOLICY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define CHECKPOLICY_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+
+endef
+
+define CHECKPOLICY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
 
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
 
@@ -24,4 +46,5 @@ define HOST_CHECKPOLICY_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.9.3
