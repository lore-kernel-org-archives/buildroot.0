From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 May 2017 08:07:44 +0300
Subject: [Buildroot] [PATCH] daemon: new package
Message-ID: <fbdaa88f9b37850b3c15e3f0c521ef4d225a2eb9.1493701664.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3: add threads dependency (Romain)
    define DEB_BUILD_OPTIONS to avoid strip at install (Romain)

v2: add target installation (thanks Romain)
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/daemon/0001-fix-musl.patch | 18 ++++++++++++++++++
 package/daemon/Config.in           | 11 +++++++++++
 package/daemon/daemon.hash         |  3 +++
 package/daemon/daemon.mk           | 26 ++++++++++++++++++++++++++
 6 files changed, 60 insertions(+)
 create mode 100644 package/daemon/0001-fix-musl.patch
 create mode 100644 package/daemon/Config.in
 create mode 100644 package/daemon/daemon.hash
 create mode 100644 package/daemon/daemon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8db6dc82a613..61b84309f2de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -140,6 +140,7 @@ F:	package/pulseview/
 F:	package/sigrok-cli/
 
 N:	Baruch Siach <baruch@tkos.co.il>
+F:	package/daemon/
 F:	package/ebtables/
 F:	package/openipmi/
 F:	package/ti-uim/
diff --git a/package/Config.in b/package/Config.in
index 674b812d22d8..9d873f705fb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1795,6 +1795,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
+	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
diff --git a/package/daemon/0001-fix-musl.patch b/package/daemon/0001-fix-musl.patch
new file mode 100644
index 000000000000..9454d72ae635
--- /dev/null
+++ b/package/daemon/0001-fix-musl.patch
@@ -0,0 +1,18 @@
+daemon: fix build with musl
+
+musl requires the ttydefaults.h to be included explicitly for CEOF.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff -Nuar daemon-0.6.4-orig/daemon.c daemon-0.6.4/daemon.c
+--- daemon-0.6.4-orig/daemon.c	2010-06-12 16:37:00.000000000 +0300
++++ daemon-0.6.4/daemon.c	2017-05-01 22:02:17.721413468 +0300
+@@ -665,6 +665,7 @@
+ #ifdef _RESTORE_POSIX_SOURCE
+ #define _POSIX_SOURCE
+ #endif
++#include <sys/ttydefaults.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+ #include <sys/select.h>
diff --git a/package/daemon/Config.in b/package/daemon/Config.in
new file mode 100644
index 000000000000..26663242610d
--- /dev/null
+++ b/package/daemon/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DAEMON
+	bool "daemon"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Daemon turns other process into daemons.
+
+	  http://www.libslack.org/daemon/
+
+comment "daemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
new file mode 100644
index 000000000000..32308ea3f773
--- /dev/null
+++ b/package/daemon/daemon.hash
@@ -0,0 +1,3 @@
+# md5 from http://www.libslack.org/daemon/; sha256 locally calculated
+md5 6cd0a28630a29ac279bc501f39baec66 daemon-0.6.4.tar.gz
+sha256 c4b9ea4aa74d55ea618c34f1e02c080ddf368549037cb239ee60c83191035ca1 daemon-0.6.4.tar.gz
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
new file mode 100644
index 000000000000..dfa573f42652
--- /dev/null
+++ b/package/daemon/daemon.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# daemon
+#
+################################################################################
+
+DAEMON_VERSION = 0.6.4
+DAEMON_SITE = http://libslack.org/daemon/download
+DAEMON_LICENSE = GPL-2.0+
+DAEMON_LICENSE_FILES = LICENSE
+
+define DAEMON_CONFIGURE_CMDS
+	(cd $(@D); ./config)
+endef
+
+define DAEMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define DAEMON_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DEB_BUILD_OPTIONS=nostrip \
+		$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) \
+		install-daemon-bin
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
