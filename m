From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:34:49 +0200
Subject: [Buildroot] [git commit branch/next] package/powertop: bump to
	version 2.9
Message-ID: <20170511213453.9306882926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01048deab6035cfc066c407eaa7043ccb87a06e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove upstream patch, so we don't need to autoreconf
Rename patch 0002 -> 0001
Add POWERTOP_SOURCE to adjust to the new archive naming.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-autotune-fix-use-after-close.patch        | 15 ----------
 ...001-dont-force-stack-smashing-protection.patch} |  0
 .../0003-add-missing-sys-time.h-header.patch       | 35 ----------------------
 .../powertop/0004-add-missing-stdio.h-header.patch | 35 ----------------------
 package/powertop/powertop.hash                     |  2 +-
 package/powertop/powertop.mk                       |  6 ++--
 6 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/package/powertop/0001-autotune-fix-use-after-close.patch b/package/powertop/0001-autotune-fix-use-after-close.patch
deleted file mode 100644
index f2b3dff..0000000
--- a/package/powertop/0001-autotune-fix-use-after-close.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Patch pulled from https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/powertop&id=37469c47b885c50365f57044e4ad72e0e3512b91
-
-Fixes a use-after-close bug in create_all_devfreq_devices().
-
-Signed-off-by: Steven Noonan <steven@uplinklabs.net>
-
---- a/src/devices/devfreq.cpp
-+++ b/src/devices/devfreq.cpp
-@@ -247,6 +247,7 @@ void create_all_devfreq_devices(void)
-		fprintf(stderr, "Devfreq not enabled\n");
-		is_enabled = false;
-		closedir(dir);
-+		dir = NULL;
-		return;
-	}
diff --git a/package/powertop/0002-dont-force-stack-smashing-protection.patch b/package/powertop/0001-dont-force-stack-smashing-protection.patch
similarity index 100%
rename from package/powertop/0002-dont-force-stack-smashing-protection.patch
rename to package/powertop/0001-dont-force-stack-smashing-protection.patch
diff --git a/package/powertop/0003-add-missing-sys-time.h-header.patch b/package/powertop/0003-add-missing-sys-time.h-header.patch
deleted file mode 100644
index 7156e42..0000000
--- a/package/powertop/0003-add-missing-sys-time.h-header.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 283cab667a9ac3ae3a675b5e5d1a42191188699f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 8 Aug 2015 18:24:48 +0200
-Subject: [PATCH] add missing sys/time.h header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-struct timeval is defined in sys/time.h with a musl toolchain.
-
-Fixes:
-In file included from devices/devfreq.cpp:35:0:
-devices/devfreq.h:35:18: error: field ???stamp_before??? has incomplete type ???timeval???
-  struct timeval  stamp_before, stamp_after;
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/devices/devfreq.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/devices/devfreq.h b/src/devices/devfreq.h
-index 16a60fb..4a8983b 100644
---- a/src/devices/devfreq.h
-+++ b/src/devices/devfreq.h
-@@ -27,6 +27,7 @@
- 
- #include "device.h"
- #include "../parameters/parameters.h"
-+#include <sys/time.h>
- 
- struct frequency;
- 
--- 
-2.4.3
-
diff --git a/package/powertop/0004-add-missing-stdio.h-header.patch b/package/powertop/0004-add-missing-stdio.h-header.patch
deleted file mode 100644
index 7619cca..0000000
--- a/package/powertop/0004-add-missing-stdio.h-header.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e6cfd977c81b335664db1d5d3d6b5488c245e30f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 8 Aug 2015 18:26:15 +0200
-Subject: [PATCH] add missing stdio.h header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-snprinf is defined in stdio.h.
-
-Fixes:
-perf/perf_bundle.cpp: In function ???void parse_event_format(const char*)???:
-perf/perf_bundle.cpp:141:75: error: ???sprintf??? was not declared in this scope
-  sprintf(file, "/sys/kernel/debug/tracing/events/%s/%s/format", sys, event);
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/perf/perf_bundle.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/perf/perf_bundle.cpp b/src/perf/perf_bundle.cpp
-index cf1ae11..3d216ff 100644
---- a/src/perf/perf_bundle.cpp
-+++ b/src/perf/perf_bundle.cpp
-@@ -31,6 +31,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <stdio.h>
- 
- #include "perf_bundle.h"
- #include "perf_event.h"
--- 
-2.4.3
-
diff --git a/package/powertop/powertop.hash b/package/powertop/powertop.hash
index b64981e..0f9acdc 100644
--- a/package/powertop/powertop.hash
+++ b/package/powertop/powertop.hash
@@ -1,2 +1,2 @@
 # Locally-generated hash
-sha256	8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca	powertop-2.7.tar.gz
+sha256	aa7fb7d8e9a00f05e7d8a7a2866d85929741e0d03a5bf40cab22d2021c959250	powertop-v2.9.tar.gz
diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index bd73e19..62b716f 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-POWERTOP_VERSION = 2.7
+POWERTOP_VERSION = 2.9
 POWERTOP_SITE = https://01.org/sites/default/files/downloads/powertop
+POWERTOP_SOURCE = powertop-v$(POWERTOP_VERSION).tar.gz
 POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-gettext host-pkgconf
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
-# We're patching Makefile.am
-POWERTOP_AUTORECONF = YES
-POWERTOP_GETTEXTIZE = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
 POWERTOP_DEPENDENCIES += gettext
