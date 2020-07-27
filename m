From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 23:06:14 +0200
Subject: [Buildroot] [git commit] package/lz4: simplify build/install logic
Message-ID: <20200727210345.52B0882DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7153651868e1afe621a4b8a2a98f3d251868d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change.

Rather than tracking both build targets and sub directory to run 'make
install' from, use a make loop for the staging/target install logic, similar
to how we are doing it to for the build step and directly use the Makefile
in the sub directory rather than the helper lib/lz4 targets in the top level
Makefile.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lz4/lz4.mk | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 1cdd39106c..fa309e8dbb 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -32,29 +32,31 @@ define HOST_LZ4_INSTALL_CMDS
 		install -C $(@D)
 endef
 
+LZ4_DIRS = lib
+
 ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
-LZ4_BUILD_TARGETS = lib lz4
-LZ4_INSTALL_OPTS = install -C $(@D)
-else
-LZ4_BUILD_TARGETS = lib
-LZ4_INSTALL_OPTS = install -C $(@D)/lib
+LZ4_DIRS += programs
 endif
 
 define LZ4_BUILD_CMDS
-	$(foreach target,$(LZ4_BUILD_TARGETS),\
+	$(foreach dir,$(LZ4_DIRS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
-			-C $(@D) $(target)
+			-C $(@D)/$(dir)
 	)
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
-		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
+	$(foreach dir,$(LZ4_DIRS),\
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
+			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
+	)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
+	$(foreach dir,$(LZ4_DIRS),\
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
+			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
+	)
 endef
 
 $(eval $(generic-package))
