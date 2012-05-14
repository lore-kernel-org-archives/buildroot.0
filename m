From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 May 2012 09:29:58 -0300
Subject: [Buildroot] [PATCH 1/3] libnl: bump to version 3.2.9 and enhance
Message-ID: <1336998600-3373-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 3.2.9 and add an option to install the tools.
Since they're not usually required we default to N to reduce size.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/Config.in |    6 ++++++
 package/libnl/libnl.mk  |   13 ++++++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 24e4813..c7d4359 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -4,3 +4,9 @@ config BR2_PACKAGE_LIBNL
 	  A library for applications dealing with netlink socket.
 
 	  http://people.suug.ch/~tgr/libnl/
+
+config BR2_PACKAGE_LIBNL_TOOLS
+	bool "install tools"
+	depends on BR2_PACKAGE_LIBNL
+	help
+	  Install binary tools.
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 40aaf38..a723701 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,15 +4,26 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.8
+LIBNL_VERSION = 3.2.9
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
 LIBNL_MAKE = $(MAKE1)
+LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
+	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
+	qdisc-list
 
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
 	rm -rf $(TARGET_DIR)/usr/lib/libnl
 endef
 
+define LIBNL_REMOVE_TOOLS
+	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
+endef
+
+ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
+LIBNL_POST_INSTALL_TARGET_HOOKS += LIBNL_REMOVE_TOOLS
+endif
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
