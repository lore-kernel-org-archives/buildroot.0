From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 14:58:59 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/prboom: work around gcc bug 85180
In-Reply-To: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190626125900.48230-7-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building prboom with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
force using -O0.

Fixes:
http://autobuild.buildroot.net/results/e72/e72a2070ab7e9a093c3c70002ee94ee57a6154f6/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/prboom/prboom.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 325bf3eb02..36692d29a3 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -12,6 +12,14 @@ PRBOOM_LICENSE = GPL-2.0+
 PRBOOM_LICENSE_FILES = COPYING
 PRBOOM_AUTORECONF = YES
 
+PRBOOM_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+PRBOOM_CFLAGS += -O0
+endif
+
+PRBOOM_CONF_ENV += CFLAGS="$(PRBOOM_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 PRBOOM_DEPENDENCIES += libpng
 endif
-- 
2.17.1
