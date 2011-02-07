From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Feb 2011 17:24:47 +0100
Subject: [Buildroot] [git commit master 1/1] Add dsp-tools package
Message-ID: <20110207164338.344F88F414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c7bffc1d32e985a0663bce9ca9e13ee191962cf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add tidsp-binaries dependency, cleanup]
Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/dsp-tools/Config.in    |    8 ++++++++
 package/dsp-tools/dsp-tools.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
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
index 0000000..ab31afb
--- /dev/null
+++ b/package/dsp-tools/dsp-tools.mk
@@ -0,0 +1,18 @@
+DSP_TOOLS_VERSION = 2.0
+DSP_TOOLS_SOURCE = dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
+DSP_TOOLS_SITE = http://gst-dsp.googlecode.com/files/
+DSP_TOOLS_DEPENDENCIES = tidsp-binaries
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
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
+endef
+
+$(eval $(call GENTARGETS,package,dsp-tools))
-- 
1.7.3.4
