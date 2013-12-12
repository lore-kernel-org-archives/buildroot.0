From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:06 -0600
Subject: [Buildroot] [ PATCH v4 06/20] checkpolicy: new package
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-7-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v3 -> v4:
  - Removed the clean command.
Changes v2 -> v3:
  - Added checkpolicy as a host package (suggested by Arnout).
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Removed the option to do a target build because it should never
    be needed during normal operation.
  - Added checkpolicy as a host package (suggested by Arnout).
---
 package/Config.in.host             |    1 +
 package/checkpolicy/Config.in.host |   10 ++++++++++
 package/checkpolicy/checkpolicy.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/checkpolicy/Config.in.host
 create mode 100644 package/checkpolicy/checkpolicy.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 5fd2570..1b3e11b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/checkpolicy/Config.in.host"
 source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
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
1.7.1
