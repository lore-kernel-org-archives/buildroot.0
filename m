From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 18:07:51 -0300
Subject: [Buildroot] [PATCH] lksctp-tools: new package
Message-ID: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                      |  1 +
 package/lksctp-tools/Config.in         | 16 ++++++++++++++++
 package/lksctp-tools/lksctp-tools.hash |  3 +++
 package/lksctp-tools/lksctp-tools.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/lksctp-tools/Config.in
 create mode 100644 package/lksctp-tools/lksctp-tools.hash
 create mode 100644 package/lksctp-tools/lksctp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index cc7fd58..1179157 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1147,6 +1147,7 @@ menu "Networking"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
+	source "package/lksctp-tools/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/lksctp-tools/Config.in b/package/lksctp-tools/Config.in
new file mode 100644
index 0000000..b8a8c7a
--- /dev/null
+++ b/package/lksctp-tools/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LKSCTP_TOOLS
+	bool "lksctp-tools"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  The lksctp-tools project provides a Linux user space library
+	  for SCTP (libsctp) including C language header files
+	  (netinet/sctp.h) for accessing SCTP specific application
+	  programming interfaces not provided by the standard sockets,
+	  and also some helper utilities around SCTP.
+
+	  http://lksctp.sourceforge.net/
+
+comment "lksctp-tools needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
new file mode 100644
index 0000000..ae6b0dc
--- /dev/null
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
+md5	708bb0b5a6806ad6e8d13c55b067518e	lksctp-tools-1.0.16.tar.gz
+sha1	8b17f913844851ee6872374cffec0745c804637b	lksctp-tools-1.0.16.tar.gz
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
new file mode 100644
index 0000000..91b96a6
--- /dev/null
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# lksctp-tools
+#
+################################################################################
+
+LKSCTP_TOOLS_VERSION = 1.0.16
+LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
+LKSCTP_TOOLS_INSTALL_STAGING = YES
+# configure not shipped
+LKSCTP_TOOLS_AUTORECONF = YES
+LKSCTP_TOOLS_LICENSE = LGPLv2.1 (library), GPLv2+ (programs)
+LKSCTP_TOOLS_LICENSE_FILES = COPYING.lib COPYING
+
+# Needed by autoreconf
+define LKSCTP_TOOLS_MAKE_M4
+	mkdir -p $(@D)/m4
+endef
+LKSCTP_TOOLS_POST_PATCH_HOOKS += LKSCTP_TOOLS_MAKE_M4
+
+# Cleanup installed target source code
+define LKSCTP_TOOLS_CLEANUP_TARGET
+	rm -rf $(TARGET_DIR)/usr/share/lksctp-tools
+endef
+LKSCTP_TOOLS_POST_INSTALL_TARGET_HOOKS += LKSCTP_TOOLS_CLEANUP_TARGET
+
+$(eval $(autotools-package))
-- 
2.4.10
