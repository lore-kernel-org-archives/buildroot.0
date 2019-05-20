From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 00:57:21 +0200
Subject: [Buildroot] [PATCH] package/jasper: fix BUG_85180 build timeout
Message-ID: <20190520225721.126124-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building jasper with optimization but not when building
with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/554/5546087cdf684099525dc5824ed428cd0fd74283/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/jasper/jasper.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index b544a7c1c6..360df563fb 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -25,4 +25,8 @@ else
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+JASPER_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
