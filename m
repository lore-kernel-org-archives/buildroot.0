From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:34:24 +0200
Subject: [Buildroot] [git commit] package/cukinia: new package
Message-ID: <20201006192512.DB3D681504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7317bbbf500d917a7a0fecd1b1e68399fc9cc638
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cukinia is a test framework designed to help Linux-based embedded
systems developers run simple system-level validation tests on their
firmware.

It is designed to integrate well with embedded Linux systems
generation tools, and can be run manually (providing a quick
colourized summary to eye-catch regressions), or any of continuous
available integration framework, by generating Junit-XML or CSV test
reports.

Signed-off-by: J??r??me Oufella <jerome.oufella@savoirfairelinux.com>
Signed-off-by: Shyam Saini <shyam.saini@savoirfairelinux.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cukinia/Config.in    | 15 +++++++++++++++
 package/cukinia/cukinia.conf |  4 ++++
 package/cukinia/cukinia.hash |  4 ++++
 package/cukinia/cukinia.mk   | 18 ++++++++++++++++++
 6 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f8655fa054..407b2b2afc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2434,6 +2434,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shyam Saini <shyam.saini@savoirfairelinux.com>
+F:	package/cukinia/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/package/Config.in b/package/Config.in
index 51583d07d6..22112b524e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -155,6 +155,7 @@ menu "Development tools"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
+	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
diff --git a/package/cukinia/Config.in b/package/cukinia/Config.in
new file mode 100644
index 0000000000..37373e9a08
--- /dev/null
+++ b/package/cukinia/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CUKINIA
+	bool "cukinia"
+	select BR2_PACKAGE_GAWK if !BR2_PACKAGE_BUSYBOX
+	help
+	  Cukinia is designed to help Linux-based embedded firmware
+	  developers run system-level validation tests on their product.
+	  It provides a simple POSIX shell overlay, and primitives to
+	  make sure system integrations and features keep behaving the
+	  way they should.
+
+	  By default, cukinia reports colorized test results on stdout,
+	  but can also report them as CSV and JUnit-XML for easy
+	  integration with CI systems such as Jenkins.
+
+	  https://github.com/savoirfairelinux/cukinia
diff --git a/package/cukinia/cukinia.conf b/package/cukinia/cukinia.conf
new file mode 100644
index 0000000000..e5f304d39f
--- /dev/null
+++ b/package/cukinia/cukinia.conf
@@ -0,0 +1,4 @@
+# Note: Cukinia will produce colorized output if the TERM environment
+# variable matches vt220, xterm or linux.
+cukinia_log $(_colorize blue "############# Cukinia tests ##############")
+cukinia_user root
diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
new file mode 100644
index 0000000000..e6ae602011
--- /dev/null
+++ b/package/cukinia/cukinia.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  b867ec63e448e7fa0a9276f6844a8b3a8f92d99e63e8518fe24e9debd32679b5  cukinia-0.5.1.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
new file mode 100644
index 0000000000..84d4e60ea8
--- /dev/null
+++ b/package/cukinia/cukinia.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# cukinia
+#
+################################################################################
+
+CUKINIA_VERSION = 0.5.1
+CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
+CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
+CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
+
+define CUKINIA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cukinia $(TARGET_DIR)/usr/bin/cukinia
+	$(INSTALL) -D -m 0644 $(CUKINIA_PKGDIR)/cukinia.conf \
+		$(TARGET_DIR)/etc/cukinia/cukinia.conf
+endef
+
+$(eval $(generic-package))
