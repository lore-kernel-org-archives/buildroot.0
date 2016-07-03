From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun,  3 Jul 2016 12:45:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] acpica: new package
Message-ID: <20160703104535.10401-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ACPI Component Architecture (ACPICA) project provides an operating
system (OS)-independent reference implementation of the Advanced
Configuration and Power Interface Specification (ACPI).

It contains tools such as acpidump, iasl, acpixtract, etc.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---

Romain had added a (conditional) Reviewed-by and Tested-by to v1 which I
hope to have solved in this v2, but I decided to not add it here from
the start as this v2 contains some other small fixes and includes a
version bump.
If you think that it is still appliable, please add it before applying
this patch. Thanks

Changes v1 -> v2:
  - Fixed license which is not only GPLv2 but dual BSD-3c or GPLv2
  (pointed out by Romain Naour)
  - Changed TARGET_MAKE_ENV to TARGET_CONFIGURE_OPTS (pointed out by
  Romain Naour). CC still has to be set as a make argument, otherwise it
  gets set back again by the Makefile.
  - TARGET_ARCH was wrong, should have been BR2_ARCH.
  - Got rid of the sed hack for 'uname' by passing HARDWARE_NAME as a
  make argument variable.
  - Fixed installing in architectures different than host, by removing
  the -s argument from 'install' to avoid running 'strip' from host.
  - Bumped up to 20160527 which has been released since patch v1
  submission.
---
 package/Config.in          |  1 +
 package/acpica/Config.in   |  9 +++++++++
 package/acpica/acpica.hash |  2 ++
 package/acpica/acpica.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/acpica/Config.in
 create mode 100644 package/acpica/acpica.hash
 create mode 100644 package/acpica/acpica.mk

diff --git a/package/Config.in b/package/Config.in
index 3fddf8e..3c8910d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ menu "Firmware"
 	source "package/zd1211-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
+	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
 	source "package/acpitool/Config.in"
 	source "package/aer-inject/Config.in"
diff --git a/package/acpica/Config.in b/package/acpica/Config.in
new file mode 100644
index 0000000..8c33d0f
--- /dev/null
+++ b/package/acpica/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ACPICA
+	bool "acpica"
+	help
+	  The ACPI Component Architecture (ACPICA) project provides an
+	  operating system (OS)-independent reference implementation of
+	  the Advanced Configuration and Power Interface Specification
+	  (ACPI).
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
index 0000000..9b32099
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
+		INSTALLFLAGS=-m555 install
+endef
+
+$(eval $(generic-package))
-- 
2.9.0
