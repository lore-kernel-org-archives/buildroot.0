From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:51:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/kismet: work
 around gcc bug 85180
Message-ID: <20190606154047.3238F8141E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57324fed874bb86b1f480e789052d3b7a51b0747
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug shows up
when building kismet with optimization but not when building with
-O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/02f6e616631f05a4f15f31f2b2e67d65ba7afcb0/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit a7d313e980d9e68457d95ba23f1f077e7b53a606)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kismet/kismet.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index cee814b52b..d3946d65f3 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -15,6 +15,14 @@ KISMET_LICENSE_FILES = debian/copyright
 # We touch configure.in:
 KISMET_AUTORECONF = YES
 
+KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+KISMET_CXXFLAGS += -O0
+endif
+
+KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 endif
