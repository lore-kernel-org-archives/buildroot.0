From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Sep 2012 22:08:39 +0200
Subject: [Buildroot] [git commit] evtest: add as a seperate package
Message-ID: <20120929201754.EA9909975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d1473859dab0be549eadb605cfe492f72494fbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evtest is nowadays maintained as a seperate package by Peter Hutterer.

The project doesn't release any tarballs, so use the one of Fedora instead
so we don't need to autoreconf:

http://comments.gmane.org/gmane.comp.freedesktop.xorg.announce/1671

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/evtest/Config.in |   18 ++++++++++++++++++
 package/evtest/evtest.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 58dd5e8..d777454 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ endif
 source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/eeprog/Config.in"
+source "package/evtest/Config.in"
 source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
diff --git a/package/evtest/Config.in b/package/evtest/Config.in
new file mode 100644
index 0000000..e8f9e37
--- /dev/null
+++ b/package/evtest/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_EVTEST
+	bool "evtest"
+	help
+	  evtest displays information on the input device specified on
+	  the command line, including all the events supported by the
+	  device. It then monitors the device and displays all the
+	  events layer events generated.
+
+	  http://www.freedesktop.org/wiki/Evtest
+
+config BR2_PACKAGE_EVTEST_CAPTURE
+	bool "evtest-capture"
+	depends on BR2_PACKAGE_EVTEST
+	select BR2_PACKAGE_LIBXML2
+	help
+	  evtest-capture captures the information and events from the
+	  input device specified on the command line and writes it to
+	  the xml file given.
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
new file mode 100644
index 0000000..582d1a7
--- /dev/null
+++ b/package/evtest/evtest.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# evtest
+#
+#############################################################
+
+EVTEST_VERSION = 1.30
+EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
+# no official upstream tarball
+EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
+EVTEST_LICENSE = GPLv2
+EVTEST_LICENSE_FILES = COPYING
+EVTEST_DEPENDENCIES = host-pkg-config
+
+ifeq ($(BR2_PACKAGE_EVTEST_CAPTURE),y)
+EVTEST_DEPENDENCIES += libxml2
+else
+# evtest-capture will unconditionally be built/installed if libxml2 is present
+define EVTEST_REMOVE_EVTEST_CAPTURE
+	rm -rf $(TARGET_DIR)/usr/bin/evtest-capture \
+	       $(TARGET_DIR)/usr/share/evtest \
+	       $(TARGET_DIR)/usr/share/man/man1/evtest-capture.1
+endef
+
+EVTEST_POST_INSTALL_TARGET_HOOKS += EVTEST_REMOVE_EVTEST_CAPTURE
+endif
+
+$(eval $(autotools-package))
