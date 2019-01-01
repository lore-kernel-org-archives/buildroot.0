From: Adam Heinrich <adam@adamh.cz>
Date: Tue,  1 Jan 2019 18:33:41 +0100
Subject: [Buildroot] [PATCH 1/2] jack1: new package
Message-ID: <20190101173342.3565-1-adam@adamh.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new jack1 package alongside the existing jack2.

While jack1 and jack2 are two equivalent implementations of the same
protocol, they differ in a few details and both of them are being
actively used (jack2 is not considered to be a replacement of jack1).

For more information, see:
https://github.com/jackaudio/jackaudio.github.com/wiki/Q_difference_jack1_jack2

Signed-off-by: Adam Heinrich <adam@adamh.cz>
---
 package/Config.in        |  1 +
 package/jack1/Config.in  | 36 ++++++++++++++++++++++++++++++++++++
 package/jack1/jack1.hash |  5 +++++
 package/jack1/jack1.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 package/jack1/Config.in
 create mode 100644 package/jack1/jack1.hash
 create mode 100644 package/jack1/jack1.mk

diff --git a/package/Config.in b/package/Config.in
index 0df9b73088..ad8070f54c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ menu "Audio and video applications"
 	source "package/gmrender-resurrect/Config.in"
 	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
+	source "package/jack1/Config.in"
 	source "package/jack2/Config.in"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
diff --git a/package/jack1/Config.in b/package/jack1/Config.in
new file mode 100644
index 0000000000..bedd3ec449
--- /dev/null
+++ b/package/jack1/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_JACK1
+	bool "jack1"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	help
+	  JACK Audio Connection Kit (JACK 1 implementation).
+
+	  JACK is a low-latency sound server, allowing multiple
+	  applications to connect to one audio device, and to share
+	  audio between themselves. This package contains the daemon
+	  jackd as well as some example clients.
+
+	  http://jackaudio.org/
+
+	  Another implementation (BR2_PACKAGE_JACK2) is also available,
+	  please consult the documentation to choose the right one:
+
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/Q_difference_jack1_jack2
+
+comment "jack1 needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "do not enable jack1 and jack2 together"
+	depends on BR2_PACKAGE_JACK1
+	depends on BR2_PACKAGE_JACK2
diff --git a/package/jack1/jack1.hash b/package/jack1/jack1.hash
new file mode 100644
index 0000000000..06458180f0
--- /dev/null
+++ b/package/jack1/jack1.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 c811826f2993d4f0245b0ee92e9d305d0b67990cea08a2c5f9b21a5d65939a82  jack1-0.125.0.tar.gz
+sha256 661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
+sha256 ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
new file mode 100644
index 0000000000..b346839393
--- /dev/null
+++ b/package/jack1/jack1.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# jack1
+#
+################################################################################
+
+JACK1_VERSION = 0.125.0
+# Do not use the official release link nor the github helper because
+# the archive contains empty directories (uninitialized submodules):
+JACK1_SITE = https://github.com/jackaudio/jack1.git
+JACK1_SITE_METHOD = git
+JACK1_GIT_SUBMODULES = YES
+JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
+JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
+JACK1_INSTALL_STAGING = YES
+JACK1_AUTORECONF = YES
+JACK1_CONF_OPTS = --without-html-dir --disable-oss
+JACK1_DEPENDENCIES = berkeleydb libsamplerate libsndfile alsa-lib
+
+ifeq ($(BR2_PACKAGE_OPUS),y)
+JACK1_DEPENDENCIES += opus
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+JACK1_DEPENDENCIES += readline
+endif
+
+# Dependency to celt can't be met: jack1 requires celt >= 0.8.0 but we
+# only have 0.5.1.3 and we cannot upgrade.
+
+define JACK1_RUN_AUTOGEN
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./autogen.sh)
+endef
+JACK1_PRE_CONFIGURE_HOOKS += JACK1_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
2.17.1
