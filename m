From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:38:31 +0100
Subject: [Buildroot] [git commit branch/next] package/lz4: bump version to
	r131
Message-ID: <20160229213908.F0B11802AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ad38a4fc2007df4bee9a941aed46c8771b6a84c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

systemd v228 requires lz4 >= 125

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas: only pass PREFIX=/usr at install time instead of using
LZ4_MAKE_OPTS, and also pass it for the host installation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lz4/lz4.hash |  2 ++
 package/lz4/lz4.mk   | 15 +++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
new file mode 100644
index 0000000..1281284
--- /dev/null
+++ b/package/lz4/lz4.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 9d4d00614d6b9dec3114b33d1224b6262b99ace24434c53487a0c8fd0b18cfed  lz4-r131.tar.gz
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 38e10d8..576b2a2 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = r123
+LZ4_VERSION = r131
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
@@ -12,7 +12,7 @@ LZ4_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define LZ4_DISABLE_SHARED
-	$(SED) '/SHARED/d' $(@D)/Makefile
+	$(SED) '/SHARED/d' $(@D)/lib/Makefile
 endef
 LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
@@ -22,19 +22,22 @@ define HOST_LZ4_BUILD_CMDS
 endef
 
 define HOST_LZ4_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
+	$(MAKE) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
+		PREFIX=/usr install -C $(@D)
 endef
 
 define LZ4_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) liblz4
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(STAGING_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
+		PREFIX=/usr install -C $(@D)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install -C $(@D)/lib
 endef
 
 $(eval $(generic-package))
