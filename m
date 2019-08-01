From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:51:38 +0200
Subject: [Buildroot] [git commit] package/dtc: add optional libyaml
 dependency
Message-ID: <20190801085607.06BA6812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=495e757d2076c55086fc8d810437e00783527e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to version 1.5.0 with commit
b2f4dc7bc15bcf2cc0282e6a226d97f050975c35, dtc binary optionally depends
on libyaml which is enabled if it is found by pkgconfig so:
 - add host-pkgconf and libyaml dependencies only if
   BR2_PACKAGE_DTC_PROGRAMS and BR2_PACKAGE_LIBYAML are set
 - disable yaml for host build (and so remove host-pkgconf from
   HOST_DTC_DEPENDENCIES)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/dtc.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index fd736532f3..b99a96df83 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -10,8 +10,8 @@ DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
-HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
+DTC_DEPENDENCIES = host-bison host-flex
+HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 DTC_MAKE_OPTS = \
 	PREFIX=/usr \
@@ -19,7 +19,8 @@ DTC_MAKE_OPTS = \
 
 HOST_DTC_MAKE_OPTS = \
 	PREFIX=$(HOST_DIR) \
-	NO_PYTHON=1
+	NO_PYTHON=1 \
+	NO_YAML=1
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
@@ -33,6 +34,10 @@ ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYAML),y)
+DTC_DEPENDENCIES += host-pkgconf libyaml
+endif
+
 else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 DTC_INSTALL_GOAL = install-lib
