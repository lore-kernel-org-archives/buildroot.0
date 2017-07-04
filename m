From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:56 +0200
Subject: [Buildroot] [PATCH 076/100] sysstat: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-77-thomas.petazzoni@free-electrons.com>
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
 package/sysstat/Config.in  | 1 -
 package/sysstat/sysstat.mk | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index 923c48a..442b787 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
 	depends on BR2_USE_MMU 	# fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  The sysstat utilities are a collection of performance
 	  monitoring tools for Linux. These include sar, sadf, mpstat,
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index bd73214..e4ba662 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -8,14 +8,10 @@ SYSSTAT_VERSION = 11.4.4
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
-SYSSTAT_DEPENDENCIES = host-gettext
+SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-SYSSTAT_DEPENDENCIES += gettext
-SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) -lintl"
-endif
+SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 
 # The isag tool is a post processing script that depends on tcl/tk
 # among other things. So we don't install it.
-- 
2.9.4
