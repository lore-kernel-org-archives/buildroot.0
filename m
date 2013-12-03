From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Dec 2013 13:51:52 -0300
Subject: [Buildroot] [PATCH] net-tools: new package
Message-ID: <1386089512-5956-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Loosely based on the patch from bug #5066.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  3 +++
 package/net-tools/Config.in    | 10 ++++++++
 package/net-tools/net-tools.mk | 58 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 package/net-tools/Config.in
 create mode 100644 package/net-tools/net-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 7b19221..d28d054 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -840,6 +840,9 @@ endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/net-tools/Config.in"
+endif
 source "package/network-manager/Config.in"
 source "package/nfacct/Config.in"
 source "package/ngircd/Config.in"
diff --git a/package/net-tools/Config.in b/package/net-tools/Config.in
new file mode 100644
index 0000000..f98dca0
--- /dev/null
+++ b/package/net-tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NET_TOOLS
+	bool "net-tools"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  A collection of programs that form the base set of the NET-3
+	  networking distribution for the Linux operating system.
+	  Includes: arp, hostname, ifconfig, netstat, rarp, route,
+	  plipconfig, slattach, mii-tool, iptunnel and ipmaddr.
+
+	  http://sourceforge.net/projects/net-tools/
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
new file mode 100644
index 0000000..3538655
--- /dev/null
+++ b/package/net-tools/net-tools.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# net-tools
+#
+################################################################################
+
+NET_TOOLS_VERSION = 3eb367aedf1280f35105ede465c350a39b55fa91
+NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
+NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+NET_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
+NET_TOOLS_LICENSE = GPLv2+
+NET_TOOLS_LICENSE_FILES = COPYING
+
+# Install after busybox for the full-blown versions
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	NET_TOOLS_DEPENDENCIES += busybox
+endif
+
+# Install after util-linux since net-tools hostname is better
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),y)
+	NET_TOOLS_DEPENDENCIES += util-linux
+endif
+
+define NET_TOOLS_CONFIGURE_CMDS
+	(cd $(@D); yes "" | ./configure.sh config.in )
+endef
+
+# Enable I18N when appropiate
+ifeq ($(BR2_ENABLE_LOCALE),y)
+define NET_TOOLS_ENABLE_I18N
+	$(SED) 's:I18N 0:I18N 1:' $(@D)/config.h
+endef
+endif
+
+# Enable IPv6 when appropiate
+ifeq ($(BR2_INET_IPV6),y)
+define NET_TOOLS_ENABLE_IPV6
+	$(SED) 's:_AFINET6 0:_AFINET6 1:' $(@D)/config.h
+endef
+endif
+
+NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
+
+define NET_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
+		LDFLAGS="$(NET_TOOLS_LDFLAGS)" $(MAKE) -C $(@D)
+endef
+
+# install renames conflicting binaries, update does not
+# ifconfig & route reside in /sbin for busybox
+define NET_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) update
+	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
+	mv -f $(TARGET_DIR)/bin/route $(TARGET_DIR)/sbin/route
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
