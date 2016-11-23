From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:12:06 +0100
Subject: [Buildroot] [git commit] makedevs: remove target package
Message-ID: <20161201222139.618E47FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=207294ffa9bbc0a01476646ed37afbd866b74191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The makedevs package is a fork of the makedevs tool from busybox. It is
part of the Buildroot infrastructure, not something that should be used
on the target. It something like this is needed on the target, upstream
busybox should be used. And if one of the Buildroot-specific features
is needed, then that feature should be upstreamed to busybox.

Besides, there were already two things wrong with the target package:
- it didn't take into account the overlap with busybox (no depends on
  BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, no dependency on busybox);
- it didn't take into account the libcap feature.

The target package was introduced more or less accidentally in 81cd9d45
where the intention was to make it more similar to other packages.

So, kill it with fire.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/makedevs/Config.in   |  5 -----
 package/makedevs/makedevs.mk | 10 ----------
 4 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c0b8498..cfb1276 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_MAKEDEVS
+	bool "makedevs removed"
+	select BR2_LEGACY
+	help
+	  The makedevs tool is part of busybox. The Buildroot fork
+	  should not be used outside of the Buildroot infrastructure.
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09 removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index b2e1a2a..b076dfd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,7 +170,6 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
-	source "package/makedevs/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
diff --git a/package/makedevs/Config.in b/package/makedevs/Config.in
deleted file mode 100644
index 923150d..0000000
--- a/package/makedevs/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_MAKEDEVS
-	bool "makedevs"
-	help
-	  The makedevs utility allows to create a set of device files
-	  according to a configuration file.
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 95933c4..9bd684f 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -15,15 +15,6 @@ HOST_MAKEDEVS_CFLAGS += -DEXTENDED_ATTRIBUTES
 HOST_MAKEDEVS_LDFLAGS += -lcap
 endif
 
-define MAKEDEVS_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		package/makedevs/makedevs.c -o $(@D)/makedevs
-endef
-
-define MAKEDEVS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/makedevs $(TARGET_DIR)/usr/sbin/makedevs
-endef
-
 define HOST_MAKEDEVS_BUILD_CMDS
 	$(HOSTCC) $(HOST_MAKEDEVS_CFLAGS) package/makedevs/makedevs.c \
 		-o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)
@@ -33,5 +24,4 @@ define HOST_MAKEDEVS_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
 endef
 
-$(eval $(generic-package))
 $(eval $(host-generic-package))
