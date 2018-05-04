From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  4 May 2018 22:37:26 +0200
Subject: [Buildroot] [PATCH] package/busybox: disable setfattr when attr
 package is enabled
Message-ID: <20180504203726.19657-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The install procedure of attr is kinda borked: it does not unlink any
existing destination file during installation, but directly wites into
it. So, when busybox is instaleld before attr and installs its applets
as hardlinks, attr will overwrite the setfattr file, thus borking the
busybox binary and all its applets.

So, when the attr package is enabled, we disable the setfattr applet.

Fixes: #10986.

Reported-by: mzweerspenko+bugzilla at gmail.com
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: mzweerspenko+bugzilla at gmail.com
---
 package/busybox/busybox.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 60a55a2c78..5f4b18e47f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -254,6 +254,14 @@ define BUSYBOX_LINUX_PAM
 endef
 endif
 
+# attr's install procedure is borked and overwrites any existing
+# destination file. So, disable conflicting applets in that case
+ifeq ($(BR2_PACKAGE_ATTR),y)
+define BUSYBOX_DISABLE_ATTR
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SETFATTR,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 # Telnet support
 define BUSYBOX_INSTALL_TELNET_SCRIPT
 	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
@@ -294,6 +302,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 	$(BUSYBOX_MUSL_TWEAKS)
+	$(BUSYBOX_DISABLE_ATTR)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-- 
2.14.1
