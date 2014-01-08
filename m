From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 23:10:01 +0100
Subject: [Buildroot] [git commit] evemu: new package
Message-ID: <20140108221031.F119F9C3E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db1e4fb89113c00867fae968b09bf7552cace6c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: don't try to generate manpages even if host has asciidoc]
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/evemu/Config.in |    7 +++++++
 package/evemu/evemu.mk  |   27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e502cde..8af6a1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -277,6 +277,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/evemu/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/fconfig/Config.in"
diff --git a/package/evemu/Config.in b/package/evemu/Config.in
new file mode 100644
index 0000000..07b7174
--- /dev/null
+++ b/package/evemu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EVEMU
+	bool "evemu"
+	select BR2_PACKAGE_LIBEVDEV
+	help
+	  evemu records and replays device descriptions and events
+
+	  http://www.freedesktop.org/wiki/Evemu/
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
new file mode 100644
index 0000000..38b792d
--- /dev/null
+++ b/package/evemu/evemu.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# evemu
+#
+################################################################################
+
+EVEMU_VERSION = 1.0.10
+EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
+EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
+EVEMU_LICENSE_FILES = COPYING COPYING.GPL3
+
+# asciidoc used to generate manpages, which we don't need, and if it's
+# present on the build host, it ends getting called with our host-python
+# which doesn't have all the needed modules enabled, breaking the build
+EVEMU_CONF_ENV = ac_cv_path_ASCIIDOC=""
+
+# Uses PKG_CHECK_MODULES() in configure.ac
+EVEMU_DEPENDENCIES = host-pkgconf libevdev
+
+# Needs Python to generate a wrapper
+EVEMU_DEPENDENCIES += host-python
+
+# package source code coming from git, so it doesn't have generated
+# configure and Makefile.in
+EVEMU_AUTORECONF = YES
+
+$(eval $(autotools-package))
