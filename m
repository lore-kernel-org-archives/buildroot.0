From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:36:42 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] lz4: install programs as
 well as libraries
Message-ID: <20180130225021.47DA68813D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17cf7e511e6919d5b6744deb21770c2d0ea922a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Prior to commit 8ad38a4fc2007df4bee9a941aed46c8771b6a84c
("package/lz4: bump version to r131"), the lz4 package was installing
both libraries and programs, but this commit changed the behavior to
only install libraries.

The contributor might have been confused by the fact that the build
command was "$(MAKE) ... -C $(@D) liblz4", suggesting that only the
library was built. But since the install command was "$(MAKE) ... -C
$(@D) install", the programs were effectively built as part of the
install step, and installed as well.

Since it makes sense for lz4 to also installs its programs, this
commit adjusts the package accordingly.

It is worth mentioning that using the "all" target during the build
step is important. Indeed, otherwise the programs/Makefile has a
"default" target that doesn't build everything (especially the lz4c
program) and it end up being built as part of the install step, due to
how the makefile dependencies are handled in the lz4 project. To make
sure that everything gets built during the build step, we explicitly
use the "all" target.

Fixes bug #9996

Reported-by: Jamin Collins <jamin.collins@gmail.com>
Initial-analysis-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f1c11f79a64387c1f1749550804f8aae0cfa7a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 139be54128..b0d45474cd 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -18,7 +18,7 @@ LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
 
 define HOST_LZ4_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
 endef
 
 define HOST_LZ4_INSTALL_CMDS
@@ -27,7 +27,7 @@ define HOST_LZ4_INSTALL_CMDS
 endef
 
 define LZ4_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
@@ -37,7 +37,7 @@ endef
 
 define LZ4_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
-		PREFIX=/usr install -C $(@D)/lib
+		PREFIX=/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))
