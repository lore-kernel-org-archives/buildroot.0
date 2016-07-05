From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 10:12:42 +0200
Subject: [Buildroot] [git commit] acpica: new package
Message-ID: <20160705081537.E991881E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0639d15d3aff49acd006c489c039df329df52b31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ACPI Component Architecture (ACPICA) project provides an operating
system (OS)-independent reference implementation of the Advanced
Configuration and Power Interface Specification (ACPI).

It contains tools such as acpidump, iasl, acpixtract, etc.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: adjust install flags to -m755.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/acpica/Config.in   |  9 +++++++++
 package/acpica/acpica.hash |  2 ++
 package/acpica/acpica.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2c4c196..9d20f6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -335,6 +335,7 @@ menu "Firmware"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
+	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
 	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
diff --git a/package/acpica/Config.in b/package/acpica/Config.in
new file mode 100644
index 0000000..74d1f26
--- /dev/null
+++ b/package/acpica/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ACPICA
+	bool "acpica"
+	help
+	  The ACPI Component Architecture (ACPICA) project provides an
+	  operating system (OS)-independent reference implementation
+	  of the Advanced Configuration and Power Interface
+	  Specification (ACPI).
+
+	  https://www.acpica.org
diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
new file mode 100644
index 0000000..8d5257f
--- /dev/null
+++ b/package/acpica/acpica.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 4ac73a5887b643dcca483f0241cbb808a53326846928edad9a2f86cffcde5850 acpica-unix2-20160527.tar.gz
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
new file mode 100644
index 0000000..b8459d8
--- /dev/null
+++ b/package/acpica/acpica.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# acpica
+#
+################################################################################
+
+ACPICA_VERSION = 20160527
+ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
+ACPICA_SITE = https://acpica.org/sites/acpica/files
+ACPICA_LICENSE = BSD-3c or GPLv2
+ACPICA_LICENSE_FILES = source/include/acpi.h
+ACPICA_DEPENDENCIES = host-bison host-flex
+
+define ACPICA_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
+		all
+endef
+
+define ACPICA_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(TARGET_DIR)" \
+		INSTALLFLAGS=-m755 install
+endef
+
+$(eval $(generic-package))
