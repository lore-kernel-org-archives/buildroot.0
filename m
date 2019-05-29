From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 16:33:20 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/dmalloc: re-enable package on
 Microblaze
In-Reply-To: <20190529143320.37508-1-giulio.benetti@micronovasrl.com>
References: <f7870ce7-56f9-ce83-37c7-4d6cf125eafa@micronovasrl.com>
 <20190529143320.37508-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190529143320.37508-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build gives:
'Error: operation combines symbols in different segments'
This is due to bug 63261:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. To avoid this,
the dmalloc package has a !BR2_microblaze dependency. However, gcc bug
63261 only triggers when optimization is enabled, so we can work around
the issue by passing -O0, which is what we do in other Buildroot
packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_63261, and
re-enables dmalloc on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/dmalloc/Config.in  | 4 ----
 package/dmalloc/dmalloc.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dmalloc/Config.in b/package/dmalloc/Config.in
index e5be109332..0c01970b04 100644
--- a/package/dmalloc/Config.in
+++ b/package/dmalloc/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_DMALLOC
 	bool "dmalloc"
-	# On some packages, Microblaze gcc has issues when debugging
-	# symbols are enabled: "Error: operation combines symbols in
-	# different segments".
-	depends on !(BR2_microblaze && BR2_ENABLE_DEBUG)
 	help
 	  A debug memory allocation library which is a drop in
 	  replacement for the system's malloc, realloc, calloc, free and
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 6ebb44c5c0..38b2c02027 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -35,6 +35,10 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 DMALLOC_CFLAGS += -marm
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_63261),y)
+DMALLOC_CFLAGS += -O0
+endif
+
 DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
 
 define DMALLOC_POST_PATCH
-- 
2.17.1
