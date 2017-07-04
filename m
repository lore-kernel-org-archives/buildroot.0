From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:48 +0200
Subject: [Buildroot] [PATCH 068/100] pv: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-69-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pv/Config.in | 1 -
 package/pv/pv.mk     | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/pv/Config.in b/package/pv/Config.in
index d732296..671f78e 100644
--- a/package/pv/Config.in
+++ b/package/pv/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PV
 	bool "pv"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Pipe Viewer - is a terminal-based tool for
 	  monitoring the progress of data through a
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 2279805..0ef5a6f 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -9,13 +9,7 @@ PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
 PV_LICENSE_FILES = doc/COPYING
-
-# pv configure script is somewhat stupid: if it cannot find the host
-# gettext tool msgfmt, it concludes that gettext is not available, and
-# provides its own minimal version. Unfortunately, this minimal
-# version conflicts with the available target gettext. We fix this by
-# ensuring that host-gettext is built if gettext support is enabled;
-PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
+PV_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # --relax linker option is enabled by default on sparc/sparc64
 # architectures, and it can't be used together with -r option, so
-- 
2.9.4
