From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Apr 2016 15:33:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/tripwire: new package
Message-ID: <1461677602-29089-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |  1 +
 .../tripwire/0001-disable-install-data-hook.patch  | 26 ++++++++++++++++++++++
 package/tripwire/Config.in                         | 22 ++++++++++++++++++
 package/tripwire/tripwire.hash                     |  2 ++
 package/tripwire/tripwire.mk                       | 15 +++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 package/tripwire/0001-disable-install-data-hook.patch
 create mode 100644 package/tripwire/Config.in
 create mode 100644 package/tripwire/tripwire.hash
 create mode 100644 package/tripwire/tripwire.mk

diff --git a/package/Config.in b/package/Config.in
index e860f72..a3f7163 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1675,6 +1675,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/tar/Config.in"
 endif
 	source "package/tpm-tools/Config.in"
+	source "package/tripwire/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 endmenu
diff --git a/package/tripwire/0001-disable-install-data-hook.patch b/package/tripwire/0001-disable-install-data-hook.patch
new file mode 100644
index 0000000..40d1da5
--- /dev/null
+++ b/package/tripwire/0001-disable-install-data-hook.patch
@@ -0,0 +1,26 @@
+Prevent running an interactive install script
+
+Downloaded from
+http://repository.timesys.com/buildsources/t/tripwire/tripwire-2.4.2.2/tripwire-2.4.2.2-disable-install-data-hook.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur tripwire-2.4.2.2-src.orig/Makefile.in tripwire-2.4.2.2-src/Makefile.in
+--- tripwire-2.4.2.2-src.orig/Makefile.in	2012-01-16 17:56:59.000000000 -0500
++++ tripwire-2.4.2.2-src/Makefile.in	2012-01-16 17:57:12.000000000 -0500
+@@ -589,9 +589,12 @@
+ 
+ 
+ install-data-hook:
+-	prefix="$(prefix)" sysconfdir="$(sysconfdir)" \
+-        path_to_vi="$(path_to_vi)" path_to_sendmail="$(path_to_sendmail)" \
+-        ./install/install.sh
++	$(mkdir_p) $(DESTDIR)$(sbindir)
++	$(install_sh_SCRIPT) install/install.sh $(DESTDIR)$(sbindir)
++#	prefix="$(prefix)" sysconfdir="$(sysconfdir)" \
++#        path_to_vi="$(path_to_vi)" path_to_sendmail="$(path_to_sendmail)" \
++#        ./install/install.sh
++
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
diff --git a/package/tripwire/Config.in b/package/tripwire/Config.in
new file mode 100644
index 0000000..a7590a4
--- /dev/null
+++ b/package/tripwire/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_TRIPWIRE
+	bool "tripwire"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Open Source Tripwire? software is a security and data integrity
+	  tool useful for monitoring and alerting on specific file
+	  change(s) on a range of systems. The project is based on code
+	  originally contributed by Tripwire, Inc. in 2000.
+	  Open Source Tripwire is suitable for monitoring a small number
+	  of Linux servers, where centralized control and reporting is
+	  not needed and professional support or system automation is not
+	  a requirement.
+
+	  https://github.com/Tripwire/tripwire-open-source
+
+comment "tripwire needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/tripwire/tripwire.hash b/package/tripwire/tripwire.hash
new file mode 100644
index 0000000..2d78812
--- /dev/null
+++ b/package/tripwire/tripwire.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	9744af4de7ecb1d643442eb22f08c819556494bb6f56f5879e22c3438f2db896	tripwire-2.4.3.1.tar.gz
diff --git a/package/tripwire/tripwire.mk b/package/tripwire/tripwire.mk
new file mode 100644
index 0000000..5cf40ca
--- /dev/null
+++ b/package/tripwire/tripwire.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# tripwire
+#
+################################################################################
+
+TRIPWIRE_VERSION = 2.4.3.1
+TRIPWIRE_SITE = $(call github,Tripwire,tripwire-open-source,$(TRIPWIRE_VERSION))
+TRIPWIRE_LICENSE = GPLv2+
+TRIPWIRE_LICENSE_FILES = COPYING
+TRIPWIRE_DEPENDENCIES = openssl
+TRIPWIRE_CONF_ENV = \
+	ac_cv_openssldir=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
-- 
2.8.0.rc3
