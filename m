From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 12:24:23 +0200
Subject: [Buildroot] [git commit] package/berkeleydb: add host variant
Message-ID: <20190728113008.A2A8E83900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4ec3c15961254c1ab92ef67898a64b652ebede0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for the upcoming Exim security version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/berkeleydb/berkeleydb.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bddcf..e077eb4640 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -44,6 +44,22 @@ define BERKELEYDB_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_BERKELEYDB_CONFIGURE_CMDS
+	(cd $(@D)/build_unix; rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		../dist/configure $(QUIET) \
+		--prefix=$(HOST_DIR) \
+		--with-gnu-ld \
+		--disable-cxx \
+		--disable-java \
+		--disable-tcl \
+		--disable-compat185 \
+		--with-pic \
+		--enable-o_direct \
+		--disable-mutexsupport \
+	)
+endef
+
 ifneq ($(BR2_PACKAGE_BERKELEYDB_TOOLS),y)
 
 define BERKELEYDB_REMOVE_TOOLS
@@ -61,3 +77,4 @@ endef
 BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
