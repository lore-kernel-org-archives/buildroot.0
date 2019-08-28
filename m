From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 29 Aug 2019 00:36:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/dawgdic: work around gcc bug 91591
In-Reply-To: <20190828223646.61333-1-giulio.benetti@micronovasrl.com>
References: <20190828223646.61333-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190828223646.61333-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Arc Gcc version 8.x the build fails due to bug 91591:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91591. The bug shows up
when building dawgdic with optimization but not when building with
-O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_91591=y we
force using -O0.

Fixes:

http://autobuild.buildroot.net/results/02f6e616631f05a4f15f31f2b2e67d65ba7afcb0/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/dawgdic/dawgdic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
index 443782c9f3..2706db95e4 100644
--- a/package/dawgdic/dawgdic.mk
+++ b/package/dawgdic/dawgdic.mk
@@ -11,4 +11,12 @@ DAWGDIC_LICENSE_FILES = COPYING
 DAWGDIC_AUTORECONF = YES
 DAWGDIC_INSTALL_STAGING = YES
 
+DAWGDIC_CXXFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_91591),y)
+DAWGDIC_CXXFLAGS += -O0
+endif
+
+DAWGDIC_CONF_ENV += CXXFLAGS="$(DAWGDIC_CXXFLAGS)"
+
 $(eval $(autotools-package))
-- 
2.17.1
