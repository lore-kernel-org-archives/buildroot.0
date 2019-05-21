From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:29 +0200
Subject: [Buildroot] [PATCH v2 09/12] package/kismet: fix BUG_85180 build
 timeout
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-10-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling first files.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building kismet with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CXXFLAGS.

Fixes:
http://autobuild.buildroot.net/results/02f/02f6e616631f05a4f15f31f2b2e67d65ba7afcb0/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/kismet/kismet.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index cee814b52b..b06106f58b 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -15,6 +15,10 @@ KISMET_LICENSE_FILES = debian/copyright
 # We touch configure.in:
 KISMET_AUTORECONF = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+KISMET_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
 endif
-- 
2.17.1
