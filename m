From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:17 +0100
Subject: [Buildroot] [PATCH 4/7] uclibc: arc: Use git instead of website
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-5-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/uclibc/Config.in |    9 +++------
 package/uclibc/uclibc.mk |    5 +++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 82dd3aa..251927f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -20,12 +20,9 @@ choice
 		bool "uClibc 0.9.33.x"
 		depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
 
-	config BR2_UCLIBC_VERSION_0_9_33_ARC
-		bool "uClibc 0.9.33.x-arc"
-		depends on BR2_arc
-
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
+		depends on !(BR2_arc)
 
 endchoice
 
@@ -41,7 +38,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
+	default "56eaa0"	if BR2_arc
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -49,7 +46,7 @@ config BR2_UCLIBC_CONFIG
 	default "package/uclibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "package/uclibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
-	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
+	default "package/uclibc/uClibc-snapshot.config" if BR2_arc
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 20d3bb6..29933cc 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -9,8 +9,9 @@ UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.bz2
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
-else ifeq ($(findstring arc,$(UCLIBC_VERSION)),arc)
-UCLIBC_SITE = $(BR2_ARC_SITE)
+else ifeq ($(BR2_arc),y)
+UCLIBC_SITE = git://github.com/foss-for-synopsys-dwc-arc-processors/uClibc.git
+UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
 else
 UCLIBC_SITE = http://www.uclibc.org/downloads
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
-- 
1.7.9.5
