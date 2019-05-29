From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 16:33:19 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/fxload: re-enable package on
 Microblaze
In-Reply-To: <20190529143320.37508-1-giulio.benetti@micronovasrl.com>
References: <f7870ce7-56f9-ce83-37c7-4d6cf125eafa@micronovasrl.com>
 <20190529143320.37508-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190529143320.37508-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build gives:
'Error: operation combines symbols in different segments'
This is due to bug 63261:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. To avoid this, the
fxload package has a !BR2_microblaze dependency. However, gcc bug
63261 only triggers when optimization is enabled, so we can work
around the issue by passing -O0, which is what we do in other
Buildroot packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_63261, and
re-enables fxload on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/fxload/Config.in | 4 ----
 package/fxload/fxload.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/fxload/Config.in b/package/fxload/Config.in
index 88cc6d1e5f..f4d6ef54f5 100644
--- a/package/fxload/Config.in
+++ b/package/fxload/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_FXLOAD
 	bool "fxload"
-	# Hits gcc PR63261 on Microblaze with debugging symbols
-	# enabled. Since this package is unlikely to be useful on
-	# Microblaze, just disable it on this architecture.
-	depends on !BR2_microblaze
 	help
 	  This program is conveniently able to download firmware into
 	  FX, FX2, and FX2LP EZ-USB devices, as well as the original
diff --git a/package/fxload/fxload.mk b/package/fxload/fxload.mk
index 94b11d0f1e..23c513b1c0 100644
--- a/package/fxload/fxload.mk
+++ b/package/fxload/fxload.mk
@@ -9,8 +9,15 @@ FXLOAD_SITE = http://downloads.sourceforge.net/project/linux-hotplug/fxload/$(FX
 FXLOAD_LICENSE = GPL-2.0+
 FXLOAD_LICENSE_FILES = COPYING
 
+FXLOAD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_63261),y)
+FXLOAD_CFLAGS += -O0
+endif
+
 define FXLOAD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(FXLOAD_CFLAGS)" -C $(@D) all
 endef
 
 define FXLOAD_INSTALL_TARGET_CMDS
-- 
2.17.1
