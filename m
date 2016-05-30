From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 08:35:45 +0200
Subject: [Buildroot] [PATCH] inputevent: add package
Message-ID: <20160530063545.GA31737@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inputevent is an input-device to ascii tranlator.
Its output is of the format 'TIME CODE VALUE' and it's easy
to pipe it into a shell script.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/Config.in                |  1 +
 package/inputevent/Config.in     |  6 ++++++
 package/inputevent/inputevent.mk | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/inputevent/Config.in
 create mode 100644 package/inputevent/inputevent.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..112e516 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ endif
 	source "package/i2c-tools/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/input-tools/Config.in"
+	source "package/inputevent/Config.in"
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
diff --git a/package/inputevent/Config.in b/package/inputevent/Config.in
new file mode 100644
index 0000000..44422a3
--- /dev/null
+++ b/package/inputevent/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_INPUTEVENT
+	bool "inputevent"
+	help
+	  inputevent is a simple program that traces input events.
+	  When piped to a another program or script, you get similar
+	  functionality as input-event-daemon.
diff --git a/package/inputevent/inputevent.mk b/package/inputevent/inputevent.mk
new file mode 100644
index 0000000..14a8d31
--- /dev/null
+++ b/package/inputevent/inputevent.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# inputevent
+#
+################################################################################
+
+INPUTEVENT_VERSION = r8
+INPUTEVENT_SITE = git://github.com/kurt-vd/inputevent.git
+INPUTEVENT_LICENSE = GPLv3
+INPUTEVENT_LICENSE_FILES = LICENSE
+
+define INPUTEVENT_CONFIGURE_CMDS
+	echo "PREFIX=/" > $(@D)/config.mk
+	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(@D)/config.mk
+	echo "CPPFLAGS=-D_GNU_SOURCE $(TARGET_CPPFLAGS)" >> $(@D)/config.mk
+	echo "CXXFLAGS=$(TARGET_CXXFLAGS)" >> $(@D)/config.mk
+	echo "LDFLAGS=$(TARGET_LDFLAGS)" >> $(@D)/config.mk
+	echo "LDLIBS+=$(TARGET_LDLIBS)" >> $(@D)/config.mk
+	echo "CC=$(TARGET_CC)" >> $(@D)/config.mk
+	echo "CXX=$(TARGET_CXX)" >> $(@D)/config.mk
+	echo "LD=$(TARGET_LD)" >> $(@D)/config.mk
+	echo "AS=$(TARGET_AS)" >> $(@D)/config.mk
+
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+define INPUTEVENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define INPUTEVENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
+#$(eval $(configmk-package))
-- 
1.8.5.rc3
