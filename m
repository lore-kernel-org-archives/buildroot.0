From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  6 Jun 2019 15:10:35 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: work around gcc bug 85180
Message-ID: <20190606131035.47417-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building kmsxx with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/360/360f19645e76314048c75424bb4b64da91742f47/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/kmsxx/kmsxx.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index c664d52361..829beb1d68 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,6 +12,14 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = libdrm host-pkgconf
 KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
 
+KMSXX_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+KMSXX_CXXFLAGS += -O0
+endif
+
+KMSXX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(KMSXX_CXXFLAGS)"
+
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_TESTS = \
 	fbtest kmsblank kmscapture \
-- 
2.17.1
