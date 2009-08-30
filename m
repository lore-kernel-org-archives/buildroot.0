From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Aug 2009 22:08:21 +0200
Subject: [Buildroot] [git commit master] util-linux: fix build with locale
	in toolchain
Message-ID: <20090830200849.AF243766A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=014df317d47c17c8b98518bfd5062390ff35e5cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #529.

util-linux needs to link with libintl when locale support is available /
requested in the toolchain, similar to how it is done for avahi.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    6 ++++++
 package/util-linux/Config.in     |    2 ++
 package/util-linux/util-linux.mk |   11 ++++++++---
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 01f6cb1..a0e39f7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2009.08, Not yet released:
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#529: util-linux doesn't find headers and include libs correctly
+
 2009.08-rc3, Released August 26th, 2009:
 
 	Additional fixes and cleanups.
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 227d74e..f8af6bb 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_UTIL-LINUX
 	bool "util-linux"
+	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
 	  Various useful/essential Linux utilities.
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c9bae16..ad5a62c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -18,6 +18,11 @@ else
 UTIL-LINUX_SCHED_UTILS:=--disable-schedutils
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINTL),y)
+UTIL-LINUX_DEPENDENCIES += libintl
+UTIL-LINUX_MAKE_OPT = LIBS=-lintl
+endif
+
 $(DL_DIR)/$(UTIL-LINUX_SOURCE):
 	$(call DOWNLOAD,$(UTIL-LINUX_SITE),$(UTIL-LINUX_SOURCE))
 
@@ -56,6 +61,7 @@ $(UTIL-LINUX_BINARY): $(UTIL-LINUX_DIR)/.configured
 		ARCH=$(ARCH) \
 		CC=$(TARGET_CC) \
 		OPT="$(TARGET_CFLAGS)" \
+		$(UTIL-LINUX_MAKE_OPT) \
 		HAVE_SLANG="NO"
 
 $(UTIL-LINUX_TARGET_BINARY): $(UTIL-LINUX_BINARY)
@@ -66,11 +72,10 @@ $(UTIL-LINUX_TARGET_BINARY): $(UTIL-LINUX_BINARY)
 #If both util-linux and busybox are selected, make certain util-linux
 #wins the fight over who gets to have their utils actually installed
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-util-linux: uclibc busybox $(UTIL-LINUX_TARGET_BINARY)
-else
-util-linux: uclibc $(UTIL-LINUX_TARGET_BINARY)
+UTIL-LINUX_DEPENDENCIES = busybox $(UTIL-LINUX_DEPENDENCIES)
 endif
 
+util-linux: uclibc $(UTIL-LINUX_DEPENDENCIES) $(UTIL-LINUX_TARGET_BINARY)
 
 util-linux-source: $(DL_DIR)/$(UTIL-LINUX_SOURCE)
 
-- 
1.6.3.3
