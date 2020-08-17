From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Aug 2020 20:36:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/thermald: bump to version 2.2
Message-ID: <20200817183612.2826191-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-autoconf-archive is needed for AX_CHECK_COMPILE_FLAG since version
2.1 and
https://github.com/intel/thermal_daemon/commit/16e067427e9cbc3d69500d351b4e6a2fba5df4a6

Extract from README.txt:

Release 2.2
- Ignore PPCC power limits when max and min power is same
- Regression in cpufreq cooling device causing min state to get stuck

Release 2.1
- Workaround for invalid PPCC power limits
- Reduce polling for power when PPCC is not present

Release 2.0
- Tiger Lake support
- PL1 limit setting from PPCC as is
- Optimize multi step, multi zone control
- Add new tag for product identification "product_sku"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thermald/thermald.hash | 2 +-
 package/thermald/thermald.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
index 34094ac8c0..6dda67e7e1 100644
--- a/package/thermald/thermald.hash
+++ b/package/thermald/thermald.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aaf5ffdc12344eef2417b41b433094bb30e4ebf321f0140b090f97bfcf24ea1f  thermald-1.9.1.tar.gz
+sha256  d23042e84dbd8a81c32fdc7bef3e2524b75ec68184a9ae3a324f54de382ea23f  thermald-2.2.tar.gz
 sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index 98e9c361e5..3c0356a04d 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-THERMALD_VERSION = 1.9.1
+THERMALD_VERSION = 2.2
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
+THERMALD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+THERMALD_DEPENDENCIES = \
+	host-autoconf-archive dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
-- 
2.27.0
