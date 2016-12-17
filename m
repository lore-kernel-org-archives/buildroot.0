From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:13:02 +0100
Subject: [Buildroot] [git commit] package/linux-syscall-support: new package
Message-ID: <20161217151355.E60928180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a069c16526316e01e786958c13f66a74555c6e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provide a header file which will be used by
Google-breakpad package. This avoid using depot-tools script to fetch
all third parties used by Google-breakpad.

Use the version corresponding to the Google-breakpad svn revision 1373:
http://linux-syscall-support.googlecode.com/svn/trunk/lss at 24 829466d3-f3f5-3ae4-62ad-de35cf9bba21

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Pascal Huerst <pascal.huerst@gmail.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas: directly implement installation in the install commands, rather
than using post-install hooks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/linux-syscall-support/Config.in            |  8 ++++++
 .../linux-syscall-support.hash                     |  2 ++
 .../linux-syscall-support/linux-syscall-support.mk | 29 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 17a7e1a..be0d150 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "Miscellaneous"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
+	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
 	source "package/qemu/Config.in"
diff --git a/package/linux-syscall-support/Config.in b/package/linux-syscall-support/Config.in
new file mode 100644
index 0000000..323dfbd
--- /dev/null
+++ b/package/linux-syscall-support/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
+	bool "linux-syscall-support (lss)"
+	help
+	  This project provides a header file that can be included into
+	  your application whenever you need to make direct system
+	  calls.
+
+	  https://chromium.googlesource.com/linux-syscall-support/
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
new file mode 100644
index 0000000..e800e8a
--- /dev/null
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3ac36d3f3cef7a3a111ea61b04b470282ec15ccc27d03a117e13ac0ab9973ba8  linux-syscall-support-e6c7682c40c27527894fbb8bcba38f77edbbb6b7.tar.gz
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
new file mode 100644
index 0000000..6ff4508
--- /dev/null
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# linux-syscall-support
+#
+################################################################################
+
+# Use the same version that the one used by Google-breakpad 1373
+LINUX_SYSCALL_SUPPORT_VERSION = e6c7682c40c27527894fbb8bcba38f77edbbb6b7
+LINUX_SYSCALL_SUPPORT_SITE = https://chromium.googlesource.com/linux-syscall-support
+LINUX_SYSCALL_SUPPORT_SITE_METHOD = git
+LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3c
+LINUX_SYSCALL_SUPPORT_LICENSE_FILES = linux_syscall_support.h
+
+# Provide only one header file.
+LINUX_SYSCALL_SUPPORT_INSTALL_TARGET = NO
+LINUX_SYSCALL_SUPPORT_INSTALL_STAGING = YES
+
+define LINUX_SYSCALL_SUPPORT_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
+		$(STAGING_DIR)/usr/include/linux_syscall_support.h
+endef
+
+define HOST_LINUX_SYSCALL_SUPPORT_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/linux_syscall_support.h \
+		$(HOST_DIR)/usr/include/linux_syscall_support.h
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
