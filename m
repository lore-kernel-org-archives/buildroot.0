From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:45 +0200
Subject: [Buildroot] [PATCH 065/100] powertop: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-66-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/Config.in   | 1 -
 package/powertop/powertop.mk | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index a532302..36701f8 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_POWERTOP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBNL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  A tool to diagnose issues with power consumption and power management
 
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 62b716f..ce7a118 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -7,14 +7,11 @@
 POWERTOP_VERSION = 2.9
 POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop
 POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION).tar.gz
-POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
+POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_NEEDS_GETTEXT),y)
-POWERTOP_DEPENDENCIES += gettext
-POWERTOP_CONF_ENV += LIBS='-lintl'
-endif
+POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 # Help powertop at finding the right ncurses library depending on
 # which one is available.
-- 
2.9.4
