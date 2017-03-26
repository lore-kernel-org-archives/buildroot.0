From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 21:52:39 +0200
Subject: [Buildroot] [git commit] lz4: pass {TARGET,
	HOST}_CONFIGURE_OPTS in the environment
Message-ID: <20170326195405.04933816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4dc73568b08bd96aa659c5ef29226349dee05de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

{TARGET,HOST}_CONFIGURE_OPTS are currently passed as $(MAKE) argument,
which causes some CPPFLAGS/CFLAGS defined by the package build system to
be overridden, leading to build failures. This commit changes the lz4
package to pass {TARGET,HOST}_CONFIGURE_OPTS through the environment to
avoid this issue.

Fixes:

  http://autobuild.buildroot.net/results/2a578a9c462463fde802c999156723494fe1b14d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lz4/lz4.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index be891dd..c2c8919 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -18,25 +18,25 @@ LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
 
 define HOST_LZ4_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define HOST_LZ4_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX=$(HOST_DIR)/usr \
 		install -C $(@D)
 endef
 
 define LZ4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
 		PREFIX=/usr install -C $(@D)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
 		PREFIX=/usr install -C $(@D)/lib
 endef
 
