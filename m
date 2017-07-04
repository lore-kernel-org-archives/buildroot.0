From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:38 +0200
Subject: [Buildroot] [PATCH 058/100] ndisc6: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-59-thomas.petazzoni@free-electrons.com>
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
 package/ndisc6/Config.in | 1 -
 package/ndisc6/ndisc6.mk | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 321bfbc..a397ea6 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
 
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 8326fc7..3ab8306 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -7,15 +7,11 @@
 NDISC6_VERSION = 1.0.2
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
-NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
+NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)
 NDISC6_CONF_OPTS = --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPL-2.0 or GPL-3.0
 NDISC6_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-NDISC6_DEPENDENCIES += gettext
-NDISC6_CONF_ENV += LIBS="-lintl"
-endif
+NDISC8_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 NDISC6_BIN_ += dnssort # perl script
 NDISC6_BIN_$(BR2_PACKAGE_NDISC6_NAME2ADDR) += name2addr addr2name
-- 
2.9.4
