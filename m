From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:52 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_04/36=5D_package/vde2=3A_new_packa?=
	=?utf-8?q?ge?=
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-4-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

VDE is an ethernet compliant virtual network that can be
spawned over a set of physical computer over the Internet.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in      |    1 +
 package/vde2/Config.in |   10 +++++++++
 package/vde2/vde2.mk   |   51 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 package/vde2/Config.in
 create mode 100644 package/vde2/vde2.mk

diff --git a/package/Config.in b/package/Config.in
index f139e29..3b581a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -611,6 +611,7 @@ source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/ushare/Config.in"
+source "package/vde2/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
diff --git a/package/vde2/Config.in b/package/vde2/Config.in
new file mode 100644
index 0000000..1591bc4
--- /dev/null
+++ b/package/vde2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_VDE2
+	bool "vde2"
+	help
+	  VDE is an ethernet compliant virtual network that can be
+	  spawned over a set of physical computer over the Internet.
+	  VDE is part of virtualsquare project.
+	  
+	  http://vde.sourceforge.net/
+	  
+	  Note: only the libraries are installed.
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
new file mode 100644
index 0000000..404c85d
--- /dev/null
+++ b/package/vde2/vde2.mk
@@ -0,0 +1,51 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+VDE2_VERSION         = 2.3.2
+VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
+VDE2_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
+VDE2_LICENSE         = LGPLv2.1+
+VDE2_LICENSE_FILES   = COPYING.libvdeplug
+#?Note: only the libs are LGPLv2.1+, binaries are not installed for now.
+VDE2_INSTALL_STAGING = YES
+
+#----------------------------------------------------------------------------
+# Package options
+
+# Reasons for enabling/disabling stuff:
+#?- tuntap is enabled in the hope we're using a recent-enough toolchain
+#   that does have if_tun.h (virtually everything these days)
+# - kvde_switch is disabled because it requires a patched kernel
+# - cryptcab is disabled to not depend on openSSL
+# - python is disabled to not depend on Python
+# - pcap is disabled to not depend on libpcap
+# - profiling is disabled because we do not want to debug/profile
+#
+# Note: disabled features can be added with corresponding dependencies
+#       in future commits.
+VDE2_CONF_OPT = --disable-experimental  \
+                --disable-cryptcab      \
+                --disable-pcap          \
+                --disable-python        \
+                --disable-profile       \
+                --disable-kernel-switch \
+                --enable-tuntap         \
+
+#----------------------------------------------------------------------------
+# Package build process
+
+#?Package does not build in parallel due to improper make rules
+VDE2_MAKE = $(MAKE1)
+
+# For now, we install only the libraries
+# Installing the complete VDE suite can come in a later patch
+#?In that case, do not forget to update the license!
+define VDE2_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libvde*.so*    \
+	                      $(TARGET_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/vde2/vde_l3
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/vde2/vde_l3/*.so   \
+	                      $(TARGET_DIR)/usr/lib/vde2/vde_l3
+endef
+
+$(eval $(autotools-package))
-- 
1.7.2.5
