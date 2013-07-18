From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Jul 2013 12:18:16 +0200
Subject: [Buildroot] [git commit] uclibc: uclibc-menuconfig: don't depend on
	gcc/binutils
Message-ID: <20130718102246.806539A31C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1ba6ef59579d28be7bbef030cfe138011135d13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the move of uclibc to package/uclibc, the uclibc-menuconfig target now
depends on uclibc-configure, which brings in the build of
binutils/gcc-initial/mpfr/gmp, causing it to take ages with a clean tree.

Fix it by moving the basic .config mangling to the patch step, and depend
on that for menuconfig instead.

Notice that this is broken for _OVERRIDE_SRCDIR users, just like for
busybox, but as that is presumably a small subset of the buildroot
user base (and these advanced users can just run menuconfig in their
local uClibc tree), so this is considered the lesser evil of the two.

The proposed out-of-tree build series will also cause problems with
this.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/uclibc.mk |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8eca5fe..f775b15 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -358,7 +358,7 @@ UCLIBC_MAKE_FLAGS = \
 	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
-define UCLIBC_CONFIGURE_CMDS
+define UCLIBC_SETUP_DOT_CONFIG
 	cp -f $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
@@ -395,6 +395,11 @@ define UCLIBC_CONFIGURE_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(STAGING_DIR) \
 		oldconfig
+endef
+
+UCLIBC_POST_PATCH_HOOKS += UCLIBC_SETUP_DOT_CONFIG
+
+define UCLIBC_CONFIGURE_CMDS
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
@@ -470,13 +475,13 @@ define UCLIBC_INSTALL_STAGING_CMDS
 	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
 endef
 
-uclibc-menuconfig: dirs uclibc-configure
+uclibc-menuconfig: dirs uclibc-patch
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(STAGING_DIR)/ \
 		menuconfig
-	rm -f $(UCLIBC_DIR)/.stamp_{built,target_installed,staging_installed}
+	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
 
 $(eval $(generic-package))
