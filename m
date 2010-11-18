From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:24:08 -0500
Subject: [Buildroot] [PATCH 2/2 v2] busybox: let buildroot handle stripping
In-Reply-To: <1290052856-19294-1-git-send-email-vapier@gentoo.org>
References: <1290052856-19294-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290075848-30441-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some ABI's (like FLAT), we cannot strip busybox as the file format
does not support it and strip will abort with errors like 'File format
not recognized'.  Since the toplevel already takes care of stripping
things, simply disable the busybox step.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v3
	- pull patch from upstream to allow SKIP_STRIP=y rather than set STRIP=...

 .../busybox-1.17.3/busybox-1.17.3-skip_strip.patch |   26 ++++++++++++++++++++
 package/busybox/busybox.mk                         |    2 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-skip_strip.patch

diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-skip_strip.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-skip_strip.patch
new file mode 100644
index 0000000..0c2321e
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-skip_strip.patch
@@ -0,0 +1,26 @@
+From b78d561ec79b6a7c29d14bf49c82b600815b2cc4 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Tue, 16 Nov 2010 09:01:30 -0500
+Subject: [PATCH] allow SKIP_STRIP to be set in the env
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile.flags |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 60bb888..363300b 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -4,7 +4,7 @@
+ 
+ BB_VER = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+ export BB_VER
+-SKIP_STRIP = n
++SKIP_STRIP ?= n
+ 
+ # -std=gnu99 needed for [U]LLONG_MAX on some systems
+ CPPFLAGS += $(call cc-option,-std=gnu99,)
+-- 
+1.7.3.2
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5ef1622..fd0be15 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -124,7 +124,7 @@ define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(BUSYBOX_DIR)
+		SKIP_STRIP=y -C $(BUSYBOX_DIR)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
-- 
1.7.3.2
