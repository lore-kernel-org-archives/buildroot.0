From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 00:38:13 +0200
Subject: [Buildroot] [PATCH] package/opus: fix BUG_85180 build timeout
Message-ID: <20190520223813.45725-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building opus with optimization but not when building with
-O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/73d/73dc9610a13d6e14eec58d529617210d93d5dec4/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/opus/opus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index f23461a3af..4b127aa187 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -10,6 +10,10 @@ OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+OPUS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPTS += --enable-fixed-point
 endif
-- 
2.17.1
