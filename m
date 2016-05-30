From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 08:36:56 +0200
Subject: [Buildroot] [PATCH] mpdstate: add package
Message-ID: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mpdstate listens for MPD state changes and outputs them
on stdout. It is easy to write a script that receives mpdstate's output
on stdin an act upon some of the events.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/Config.in            |  1 +
 package/mpdstate/Config.in   | 11 +++++++++++
 package/mpdstate/mpdstate.mk | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 package/mpdstate/Config.in
 create mode 100644 package/mpdstate/mpdstate.mk

diff --git a/package/Config.in b/package/Config.in
index 112e516..629a7d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -26,6 +26,7 @@ menu "Audio and video applications"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpd-mpc/Config.in"
+	source "package/mpdstate/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
 	source "package/musepack/Config.in"
diff --git a/package/mpdstate/Config.in b/package/mpdstate/Config.in
new file mode 100644
index 0000000..e3a5688
--- /dev/null
+++ b/package/mpdstate/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MPDSTATE
+	bool "mpdstate"
+	help
+	  mpdstate is a small C-program which outputs the state of an MPD
+	  (Music Player Daemon). The program keeps waiting for changes and
+	  outputs immediately the state changes that I found important.
+
+	  The output is easily parsed with shell scripting,
+	  and that is how I automate my MPD boxes to:
+	  - enable a LED when MPD is playing
+	  - activate the power amplifier's power when MPD is playing
diff --git a/package/mpdstate/mpdstate.mk b/package/mpdstate/mpdstate.mk
new file mode 100644
index 0000000..82436d4
--- /dev/null
+++ b/package/mpdstate/mpdstate.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# mpdstate
+#
+################################################################################
+
+MPDSTATE_VERSION = r3
+MPDSTATE_SITE = git://github.com/kurt-vd/mpdstate.git
+MPDSTATE_LICENSE = GPLv3
+MPDSTATE_LICENSE_FILES = LICENSE
+
+define MPDSTATE_CONFIGURE_CMDS
+	echo "PREFIX=/" > $(@D)/config.mk
+	echo "CFLAGS=$(TARGET_CFLAGS)" >> $(@D)/config.mk
+	echo "CPPFLAGS=$(TARGET_CPPFLAGS)" >> $(@D)/config.mk
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
+define MPDSTATE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define MPDSTATE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.rc3
