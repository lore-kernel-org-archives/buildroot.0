From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:53:56 -0600
Subject: [Buildroot] [PATCH 04/30] checkpolicy: new package
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in.host             |  1 +
 package/checkpolicy/Config.in.host | 10 ++++++++++
 package/checkpolicy/checkpolicy.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/checkpolicy/Config.in.host
 create mode 100644 package/checkpolicy/checkpolicy.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..af25e12 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
diff --git a/package/checkpolicy/Config.in.host b/package/checkpolicy/Config.in.host
new file mode 100644
index 0000000..75794be
--- /dev/null
+++ b/package/checkpolicy/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_CHECKPOLICY
+	bool "host checkpolicy"
+	help
+	  checkpolicy is the policy compiler. It uses libsepol to 
+	  generate the binary policy. checkpolicy uses the static 
+	  libsepol since it deals with low level details of the policy 
+	  that have not been encapsulated/abstracted by a proper 
+	  shared library interface. 
+	  
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
new file mode 100644
index 0000000..0d91794
--- /dev/null
+++ b/package/checkpolicy/checkpolicy.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# checkpolicy
+#
+################################################################################
+
+CHECKPOLICY_VERSION = 2.1.12
+CHECKPOLICY_SITE = http://userspace.selinuxproject.org/releases/20130423/
+CHECKPOLICY_LICENSE = GPLv2
+CHECKPOLICY_LICENSE_FILES = COPYING
+
+HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
+
+HOST_CHECKPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+
+define HOST_CHECKPOLICY_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_CHECKPOLICY_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
