From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:52:40 +0200
Subject: [Buildroot] [git commit] xxhash: new package
Message-ID: <20150919135323.EF84381990@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d6a1575acdcc0740a7f9f1517dd846746b10e62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"xxHash is an extremely fast hash algorithm, running at RAM speed
limits."

[Thomas:
 - tweak commit log title
 - add correct license and license files information, using the
   suggestion from Yann E. Morin
 - add $(TARGET_MAKE_ENV) in the environment in the build step.]

Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/xxhash/Config.in |    7 +++++++
 package/xxhash/xxhash.mk |   20 ++++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1bd2759..22aef52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1458,6 +1458,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/which/Config.in"
 endif
 	source "package/xmlstarlet/Config.in"
+	source "package/xxhash/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/xxhash/Config.in b/package/xxhash/Config.in
new file mode 100644
index 0000000..f2cccda
--- /dev/null
+++ b/package/xxhash/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XXHASH
+	bool "xxhash"
+	help
+	  xxHash is an extremely fast hash algorithm, running at RAM
+	  speed limits.
+
+	  https://github.com/Cyan4973/xxHash
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
new file mode 100644
index 0000000..47ead75
--- /dev/null
+++ b/package/xxhash/xxhash.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# xxhash
+#
+################################################################################
+
+XXHASH_VERSION = r40
+XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
+XXHASH_LICENSE = BSD-2c, GPLv2+
+XXHASH_LICENSE_FILES = LICENSE xxhsum.c
+
+define XXHASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) xxhsum
+endef
+
+define XXHASH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/xxhsum $(TARGET_DIR)/usr/bin/xxhsum
+endef
+
+$(eval $(generic-package))
