From: Shyam Saini <mayhs11saini@gmail.com>
Date: Mon, 27 Apr 2020 13:35:25 +0530
Subject: [Buildroot] [V2 PATCH 1/1] cukinia: new package
In-Reply-To: <20200427080525.617-1-shyam.saini@savoirfairelinux.com>
References: <20200427080525.617-1-shyam.saini@savoirfairelinux.com>
Message-ID: <20200427080525.617-2-shyam.saini@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cukinia is a test framework designed to help Linux-based embedded
systems developers run simple system-level validation tests on their
firmware.

It is designed to integrate well with embedded Linux systems
generation tools, and can be run manually (providing a quick
colourized summary to eye-catch regressions), or any of continuous
available integration framework, by generating Junit-XML or CSV test
reports.

Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
Signed-off-by: Shyam Saini <shyam.saini@savoirfairelinux.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cukinia/Config.in    | 15 +++++++++++++++
 package/cukinia/cukinia.conf | 36 ++++++++++++++++++++++++++++++++++++
 package/cukinia/cukinia.hash |  4 ++++
 package/cukinia/cukinia.mk   | 20 ++++++++++++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/cukinia/Config.in
 create mode 100644 package/cukinia/cukinia.conf
 create mode 100644 package/cukinia/cukinia.hash
 create mode 100644 package/cukinia/cukinia.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d6557f1143ed..0eeac69d1c64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2345,6 +2345,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shyam Saini <shyam.saini@savoirfairelinux.com>
+F:	package/cukinia/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/package/Config.in b/package/Config.in
index 6c55c5bc4290..2cf35f46fcdd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -153,6 +153,7 @@ menu "Development tools"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
 	source "package/cppunit/Config.in"
+	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
diff --git a/package/cukinia/Config.in b/package/cukinia/Config.in
new file mode 100644
index 000000000000..003e6110b12b
--- /dev/null
+++ b/package/cukinia/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CUKINIA
+	bool "cukinia"
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK
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
index 000000000000..3ac34e72cf0b
--- /dev/null
+++ b/package/cukinia/cukinia.conf
@@ -0,0 +1,36 @@
+# Sample configuration bits for an embedded system.
+# Note: Cukinia will produce colorized output if the TERM environment
+# variable matches vt220, xterm or linux.
+
+cukinia_log $(_colorize blue "############# Cukinia tests ##############")
+
+# Make sure our essential users are present
+cukinia_user www-data
+cukinia_user important-user
+
+# Check a few essential services keep running as well
+as "watchdog service is running" \
+	cukinia_process watchdog
+as "rngd systemd service is active" \
+	cukinia_cmd systemctl is-active rngd
+
+# Check for custom ssh signs
+as "dropbear is running" \
+	cukinia_process dropbear root
+as "tcp port 122 is open" cukinia_listen4 tcp 122
+as "tcp port 22 is not open" not cukinia_listen4 tcp 22
+
+# Misc. app-related tests
+as "timeout busybox applet is present" \
+	cukinia_symlink /usr/bin/timeout /bin/busybox
+
+# Example using regular shell scripting
+test -x /usr/bin/gpioget && test -x /usr/bin/gpioset
+as "libgpiod utils we use are present" cukinia_test $? -eq 0
+
+
+# That's how we'd include subsystem or package-specific tests
+# cukinia_conf_include /etc/cukinia/conf.d/*.conf
+
+cukinia_log $(_colorize blue "############ Cukinia test results #############")
+cukinia_log "Ran $(_colorize blue $cukinia_tests) tests, $(_colorize red $cukinia_failures) failures"
diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
new file mode 100644
index 000000000000..e6fdbbb9a990
--- /dev/null
+++ b/package/cukinia/cukinia.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  7737cf2b4b00eb29bf5c42905da5c96c6683e182645dc72e3cdecf1d569c14b4  cukinia-0.5.0.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
new file mode 100644
index 000000000000..75eb67f23d61
--- /dev/null
+++ b/package/cukinia/cukinia.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cukinia
+#
+################################################################################
+
+CUKINIA_VERSION = 0.5.0
+CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
+CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
+CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
+
+define CUKINIA_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/cukinia \
+                $(TARGET_DIR)/usr/bin/cukinia
+
+        $(INSTALL) -D -m 0644 $(CUKINIA_PKGDIR)/cukinia.conf \
+                $(TARGET_DIR)/etc/cukinia/cukinia.conf
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
