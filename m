From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  7 Aug 2018 08:29:46 -0500
Subject: [Buildroot] [PATCH] openresolv: new package
Message-ID: <1533648586-60818-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

This patch added 'openresolv' package support. This tool
provides a dns management framework to track currently
available nameservers.

A key feature of this tool vs resolvconf is the ability to
manage multiple name server input configuration files and
generate the /etc/resolv.conf.  This is handy when you have
multiple dynamic communication paths providing nameserver
information.

REF: https://github.com/rsmarples/openresolv

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                  |  1 +
 package/openresolv/Config.in       | 13 +++++++++++++
 package/openresolv/openresolv.hash |  3 +++
 package/openresolv/openresolv.mk   | 12 ++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/openresolv/Config.in
 create mode 100644 package/openresolv/openresolv.hash
 create mode 100644 package/openresolv/openresolv.mk

diff --git a/package/Config.in b/package/Config.in
index f5a1749..2ad6687 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1843,6 +1843,7 @@ endif
 	source "package/open-plc-utils/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
+	source "package/openresolv/Config.in"
 	source "package/openssh/Config.in"
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
diff --git a/package/openresolv/Config.in b/package/openresolv/Config.in
new file mode 100644
index 0000000..3eb736f
--- /dev/null
+++ b/package/openresolv/Config.in
@@ -0,0 +1,13 @@
+comment "openresolv needs a bash shell"
+	depends on !BR2_SYSTEM_BIN_SH_BASH
+
+config BR2_PACKAGE_OPENRESOLV
+	bool "openresolv"
+	depends on BR2_SYSTEM_BIN_SH_BASH # bash runtime dependency
+	select BR2_PACKAGE_BASH
+	help
+	  openresolv is a resolvconf implementation which
+	  manages resolv.conf. This tool provides a dns management
+	  framework to track currently available nameservers.
+
+	  https://github.com/rsmarples/openresolv
diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
new file mode 100644
index 0000000..e1a1fb5
--- /dev/null
+++ b/package/openresolv/openresolv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 96b3f84435a183426c622db7097a930fb0d48a99e82cd87ce83bd343b8c20574 openresolv-fe4e1ec4e2be2adfc1530ade94ebb30aa6f51540.tar.gz
+sha256 d1f9dcd2dac4e095b14caab517cfe791a6e0785346164b7d0cafc13c714f8aa5 LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
new file mode 100644
index 0000000..2faa6e1
--- /dev/null
+++ b/package/openresolv/openresolv.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# openresolv
+#
+################################################################################
+
+OPENRESOLV_VERSION = fe4e1ec4e2be2adfc1530ade94ebb30aa6f51540
+OPENRESOLV_SITE = $(call github,rsmarples,openresolv,$(OPENRESOLV_VERSION))
+OPENRESOLV_LICENSE = BSD-2-Clause
+OPENRESOLV_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
1.9.1
