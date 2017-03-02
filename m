From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 2 Mar 2017 13:03:53 +0530
Subject: [Buildroot] [PATCH] fontconfig: needs host-gperf
Message-ID: <1488440033-18982-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 701380c53b4d("fontconfig: add build fix for glibc 2.25") added
a patch that touches src/fcobjs.h. Package build system detects change
in timestamp and tries to regenerate fcobjshash.gperf which requires
gperf tool. So this commit adds dependency on host-gperf.

Since the patch is in upstream fontconfig, we can get rid of this
dependency once version is bumped next time.

Fixes:
  http://autobuild.buildroot.net/results/174/17471088b26ebc840d1922d7f2aa9e69b4b49ced

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/fontconfig/fontconfig.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 93f2a15..f9a6cb0 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,8 +8,10 @@ FONTCONFIG_VERSION = 2.12.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
+
+# When bumping version next time, we can get rid of dependency on host-gperf
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf host-gperf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
-- 
2.6.2
