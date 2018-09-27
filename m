From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 23:18:35 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] qt: fix build on
 powerpc_e500mc
Message-ID: <20180927211802.C8748890CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b015095c5a40e8edb2a865d6f2a7ff345cbea825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

gcc bug internal compiler error: in validate_condition_mode, at
config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.
Workaround is to set -mno-isel, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html

This bug is also raised on BR2_powerpc_8540, BR2_powerpc_8548 and
BR2_powerpc_e5500.

Fixes:
 - http://autobuild.buildroot.net/results/9b9d11b3281a72c8f54fc675408acb96d24d8e7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75f975f8ad7b9f8dee8f1de9ce3243d69763637b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 1dcb05d6af..921ff13d29 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -32,6 +32,15 @@ QT_LDFLAGS = $(TARGET_LDFLAGS)
 # use an older c++ standard to prevent build failure
 QT_CXXFLAGS += -std=gnu++98
 
+# gcc bug internal compiler error: in validate_condition_mode, at
+# config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.
+# Workaround is to set -mno-isel, see
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
+# https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
+ifeq ($(BR2_powerpc_8540)$(BR2_powerpc_8548)$(BR2_powerpc_e500mc)$(BR2_powerpc_e5500):$(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y:)
+QT_CXXFLAGS += -mno-isel
+endif
+
 # Qt has some assembly function that are not present in thumb1 mode:
 # Error: selected processor does not support Thumb mode `swp r3,r7,[r4]'
 # so, we desactivate thumb mode
