From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:23 +0100
Subject: [Buildroot] [PATCH v2] nmon: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-2-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - use upstream SHA1/MD5 sums in hash file
---
 package/Config.in      |  1 +
 package/nmon/Config.in |  7 +++++++
 package/nmon/nmon.hash |  5 +++++
 package/nmon/nmon.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/nmon/Config.in
 create mode 100644 package/nmon/nmon.hash
 create mode 100644 package/nmon/nmon.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..3377db2 100644
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
index 0000000..6643688
--- /dev/null
+++ b/package/nmon/nmon.mk
@@ -0,0 +1,26 @@
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
+
+NMON_DEPENDENCIES = ncurses
+
+define NMON_EXTRACT_CMDS
+  cp $(DL_DIR)/$(NMON_SOURCE) $(@D)
+endef
+
+define NMON_BUILD_CMDS
+  $(TARGET_CC) -o $(NMON_DIR)/nmon $(NMON_DIR)/$(NMON_SOURCE) -Wall -D JFS -D GETUSER -D LARGEMEM -D DEBIAN -lncurses -lm
+endef
+
+define NMON_INSTALL_TARGET_CMDS
+  $(INSTALL) -m 0755 -D $(@D)/nmon $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
