From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 21:17:08 +0100
Subject: [Buildroot] [git commit] nmon: new package
Message-ID: <20170108201752.A623E81926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea0ac289fcda7b844051e7f5113c3d09ffea86be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add _LICENSE_FILES, pass TARGET_CFLAGS/LDFLAGS, indent]
Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |  1 +
 package/nmon/Config.in |  7 +++++++
 package/nmon/nmon.hash |  5 +++++
 package/nmon/nmon.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3a52a36..9de98fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -99,6 +99,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
 	source "package/netsniff-ng/Config.in"
+	source "package/nmon/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
 	source "package/pv/Config.in"
diff --git a/package/nmon/Config.in b/package/nmon/Config.in
new file mode 100644
index 0000000..9a620f4
--- /dev/null
+++ b/package/nmon/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NMON
+	bool "nmon"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Nmon is short for Nigel's performance Monitor for Linux
+
+	  http://nmon.sourceforge.net/pmwiki.php
diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
new file mode 100644
index 0000000..f3a073f
--- /dev/null
+++ b/package/nmon/nmon.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/nmon/files/
+md5 a72e3eb737c230cd309329330a5545bd    lmon16f.c
+sha1    b69fdddf86ffe674e0133426fa09935ed678ab7d    lmon16f.c
+# Locally computed
+sha256  280a371e17488f8a2c5e0c64273155789be6fa5b937ab5c465488e591bdc5cd9    lmon16f.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
new file mode 100644
index 0000000..9b9f889
--- /dev/null
+++ b/package/nmon/nmon.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# nmon
+#
+################################################################################
+
+NMON_VERSION = 16f
+NMON_SITE = http://sourceforge.net/projects/nmon/files
+NMON_SOURCE = lmon$(NMON_VERSION).c
+NMON_LICENSE = GPLv3+
+NMON_LICENSE_FILES = $(NMON_SOURCE)
+NMON_DEPENDENCIES = ncurses
+NMON_CFLAGS = $(TARGET_CFLAGS) -D JFS -D GETUSER -D LARGEMEM -D DEBIAN
+
+define NMON_EXTRACT_CMDS
+	cp $(DL_DIR)/$(NMON_SOURCE) $(@D)
+endef
+
+define NMON_BUILD_CMDS
+	$(TARGET_CC) $(NMON_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/nmon \
+		$(@D)/$(NMON_SOURCE) -lncurses -lm
+endef
+
+define NMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/nmon $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
