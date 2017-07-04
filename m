From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:35:41 +0200
Subject: [Buildroot] [git commit] rrdtool: use the new gettext logic
Message-ID: <20170704233519.15AD77FB43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fa80a811d744a64492086ede087e5578b5cbf7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rrdtool/Config.in  | 1 -
 package/rrdtool/rrdtool.mk | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 3d8c0c6..631ed32 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_RRDTOOL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  RRDtool is the OpenSource industry standard, high performance
 	  data logging and graphing system for time series data.
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 028b7cb..ea5c892 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -8,7 +8,7 @@ RRDTOOL_VERSION = 1.6.0
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
-RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
+RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 # autoreconf needed to avoid link failure due to missing -lintl,
 # gettextize needed as a consequence of autoreconf
 RRDTOOL_AUTORECONF = YES
@@ -25,10 +25,6 @@ RRDTOOL_CONF_OPTS = \
 	--disable-ruby \
 	--disable-tcl
 
-ifeq ($(BR2_NEEDS_GETTEXT),y)
-RRDTOOL_DEPENDENCIES += gettext
-endif
-
 ifeq ($(BR2_PACKAGE_RRDTOOL_RRDGRAPH),y)
 RRDTOOL_DEPENDENCIES += cairo pango
 else
