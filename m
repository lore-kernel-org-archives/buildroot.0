From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Aug 2019 20:02:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix build without libyaml
Message-ID: <20190813180225.12350-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Pass NO_YAML=1 to make when libyaml is disabled
- Move BR2_PACKAGE_LIBYAML block outside
  BR2_PACKAGE_DTC_PROGRAMS block to avoid duplicating NO_YAML=1 even if
  libyaml is only used / needed with dtc program

Fixes:
 - http://autobuild.buildroot.org/results/68a1ba8d615951931567bc8a409c1d16624c902b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 1188e954b2..0ed914ba41 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -24,6 +24,12 @@ HOST_DTC_MAKE_OPTS = \
 	NO_VALGRIND=1 \
 	NO_YAML=1
 
+ifeq ($(BR2_PACKAGE_LIBYAML),y)
+DTC_DEPENDENCIES += host-pkgconf libyaml
+else
+DTC_MAKE_OPTS += NO_YAML=1
+endif
+
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
 endef
@@ -36,10 +42,6 @@ ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBYAML),y)
-DTC_DEPENDENCIES += host-pkgconf libyaml
-endif
-
 else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 DTC_INSTALL_GOAL = install-lib
-- 
2.20.1
