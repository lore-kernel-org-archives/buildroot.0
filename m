From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon,  7 Feb 2011 01:45:04 +0200
Subject: [Buildroot] [PATCH 3/4] Add dsp-tools package
In-Reply-To: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
References: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1297035905-29896-3-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/dsp-tools/Config.in    |    8 ++++++++
 package/dsp-tools/dsp-tools.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/dsp-tools/Config.in
 create mode 100644 package/dsp-tools/dsp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index de51c46..0899578 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
 endif
+source "package/dsp-tools/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/dsp-tools/Config.in b/package/dsp-tools/Config.in
new file mode 100644
index 0000000..0267454
--- /dev/null
+++ b/package/dsp-tools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DSP_TOOLS
+	bool "dsp-tools"
+	depends on BR2_cortex_a8
+	select BR2_PACKAGE_TIDSP_BINARIES
+	help
+	  Utilities for TI OMAP3 DSP.
+
+	  http://github.com/felipec/dsp-tools
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
new file mode 100644
index 0000000..f67556d
--- /dev/null
+++ b/package/dsp-tools/dsp-tools.mk
@@ -0,0 +1,20 @@
+DSP_TOOLS_VERSION=2.0
+DSP_TOOLS_SOURCE=dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
+DSP_TOOLS_SITE=http://gst-dsp.googlecode.com/files/
+
+define DSP_TOOLS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define DSP_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+define DSP_TOOLS_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/bin/dsp-load
+	$(RM) $(TARGET_DIR)/usr/bin/dsp-probe
+	$(RM) $(TARGET_DIR)/usr/bin/dsp-test
+	$(RM) $(TARGET_DIR)/usr/bin/dsp-exec
+endef
+
+$(eval $(call GENTARGETS,package,dsp-tools))
-- 
1.7.4.1.gf4271.dirty
