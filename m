From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 09:24:35 +0100
Subject: [Buildroot] [git commit] fontconfig: needs host-gperf
Message-ID: <20170302082453.D0E7E822BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d1128e8a898e32348618721473b82b09f4a6975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Thomas: improve comment in the code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fontconfig/fontconfig.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 93f2a15..8d395bc 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,8 +8,12 @@ FONTCONFIG_VERSION = 2.12.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
+
+# When
+# 0001-Avoid-conflicts-with-integer-width-macros-from-TS-1866.patch is
+# removed, the host-gperf dependency should be removed.
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf host-gperf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
