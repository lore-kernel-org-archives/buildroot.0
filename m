From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jul 2017 23:30:01 +0200
Subject: [Buildroot] [PATCH] package/cache-calibrator: fix legal-info
Message-ID: <20170703213001.5404-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cache-calibrator is a single C file that is downloaded as-is, and we
patch it. We also use that file as the license file.

Thus, the file when it is downloaded has a specific hash, but when
saved by legal-info, it has a different hash.

However, we can't store two different hashes for the same _filename_
with different content.

So, we extract the license file as a pre-patch hook, and store it in a
separate file, for which we can now add a hash.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Stephan Hoffmann <sho@relinux.de>
---
 package/cache-calibrator/cache-calibrator.hash | 1 +
 package/cache-calibrator/cache-calibrator.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/cache-calibrator/cache-calibrator.hash b/package/cache-calibrator/cache-calibrator.hash
index df61d17e10..a4b4b70cf7 100644
--- a/package/cache-calibrator/cache-calibrator.hash
+++ b/package/cache-calibrator/cache-calibrator.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 2018ed8fa733155d44ceb1c0066c5cf8df7771cdf7cfca0a07b8dd9bebd9c221 calibrator.c
+sha256 a853663f5b4fb3ad77bf2790ab53146f456b8d9b9ddf83b99fe28c0bdec42514 calibrator.c.license
diff --git a/package/cache-calibrator/cache-calibrator.mk b/package/cache-calibrator/cache-calibrator.mk
index d0620655c7..6f12d119ef 100644
--- a/package/cache-calibrator/cache-calibrator.mk
+++ b/package/cache-calibrator/cache-calibrator.mk
@@ -7,12 +7,17 @@
 CACHE_CALIBRATOR_SOURCE = calibrator.c
 CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
 CACHE_CALIBRATOR_LICENSE = Cache calibrator license
-CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c
+CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c.license
 
 define CACHE_CALIBRATOR_EXTRACT_CMDS
 	cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(@D)
 endef
 
+define CACHE_CALIBRATOR_EXTRACT_LICENSE
+	head -n 38 $(@D)/calibrator.c >$(@D)/calibrator.c.license
+endef
+CACHE_CALIBRATOR_PRE_PATCH_HOOKS += CACHE_CALIBRATOR_EXTRACT_LICENSE
+
 define CACHE_CALIBRATOR_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/calibrator.c -o $(@D)/cache_calibrator -lm
 endef
-- 
2.11.0
