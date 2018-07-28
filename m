From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 15:33:51 +0200
Subject: [Buildroot] [git commit] dtc: do not build/install python support
Message-ID: <20180728133536.312D28A44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b50c95e914c6366e30145378fa82f286d4412c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pylibfdt in dtc is new since 1.4.5, and therefore built since the
bump from 1.4.4 to 1.4.7 in commit
7b929ddcf0812310d0113cf3675429dbd123aa99. Unfortunately, this Python
support causes a number of build failures, be it for host-dtc or dtc.

Since this Python support is not used/needed by anything in Buildroot
at this point, let's simply disable it by passing NO_PYTHON=1. While
doing this, introduce DTC_MAKE_OPTS and HOST_DTC_MAKE_OPTS to avoid
duplicating the variables several times.

Fixes:

  http://autobuild.buildroot.net/results/1ad41fd4890af0c97ee4ff2994ea5431b8953ef8/ (host-dtc)
  http://autobuild.buildroot.net/results/0aefc3aa03a93b1fdf76f2d8946b6f423405382f/ (dtc)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtc/dtc.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 8388793c01..7cb879bff4 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -13,6 +13,14 @@ DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
 HOST_DTC_DEPENDENCIES = host-bison host-flex
 
+DTC_MAKE_OPTS = \
+	PREFIX=/usr \
+	NO_PYTHON=1
+
+HOST_DTC_MAKE_OPTS = \
+	PREFIX=$(HOST_DIR) \
+	NO_PYTHON=1
+
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
 endef
@@ -32,26 +40,26 @@ DTC_INSTALL_GOAL = install-lib
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 define DTC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) PREFIX=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) $(DTC_MAKE_OPTS)
 endef
 
 # For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) $(DTC_MAKE_OPTS) install-lib \
 		install-includes
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(DTC_MAKE_OPTS) $(DTC_INSTALL_GOAL)
 endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) PREFIX=$(HOST_DIR)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) $(HOST_DTC_MAKE_OPTS)
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS) install
 endef
 
 $(eval $(generic-package))
