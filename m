From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  6 Jun 2019 15:03:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/prboom: work around gcc bug 85180
In-Reply-To: <20190606130304.129551-1-giulio.benetti@micronovasrl.com>
References: <20190606130304.129551-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190606130304.129551-2-giulio.benetti@micronovasrl.com>
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
index 6d9b55e9f6..1ba8d968ab 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -18,6 +18,14 @@ endef
 
 PRBOOM_PRE_CONFIGURE_HOOKS += PRBOOM_FIXUP_CONFIGURE
 
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
