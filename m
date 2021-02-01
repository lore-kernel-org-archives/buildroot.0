From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 18:51:12 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/stress-ng: disable libbsd
 on static build"
Message-ID: <20210201175113.937333-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit f2d6c5ff9092aa7735c7a739d15180910ae734df.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress-ng/stress-ng.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index c26206cd2e..53d7b7e5b7 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -10,11 +10,8 @@ STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LIBBSD):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
 STRESS_NG_DEPENDENCIES += libbsd
-else
-STRESS_NG_MAKE_OPTS += HAVE_LIB_BSD=0 HAVE_WCSLCAT=0 \
-	HAVE_WCSLCPY=0 HAVE_SETPROCTITLE=0
 endif
 
 ifeq ($(BR2_PACKAGE_KEYUTILS),y)
@@ -22,7 +19,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 define STRESS_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(STRESS_NG_MAKE_OPTS) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 # Don't use make install otherwise stress-ng will be rebuild without
-- 
2.29.2
