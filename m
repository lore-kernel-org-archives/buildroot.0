From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 15:38:05 +0100
Subject: [Buildroot] [git commit] boost: reorder build steps
Message-ID: <20151205144026.819FC80AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c35f31552b2259c9b60e081e4a317acc9a6e4fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host and target build steps were mixed between eachother. Reorder them
so we have the target steps before the host ones.

No functional change, but helps readability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 36710f7..b96969d 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -128,12 +128,6 @@ define BOOST_CONFIGURE_CMDS
 	echo "" >> $(@D)/user-config.jam
 endef
 
-define HOST_BOOST_CONFIGURE_CMDS
-	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
-	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
-	echo "" >> $(@D)/user-config.jam
-endef
-
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
@@ -143,6 +137,21 @@ define BOOST_INSTALL_TARGET_CMDS
 	--layout=$(BOOST_LAYOUT) install )
 endef
 
+define BOOST_INSTALL_STAGING_CMDS
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
+	--user-config=$(@D)/user-config.jam \
+	$(BOOST_OPTS) \
+	--prefix=$(STAGING_DIR)/usr \
+	--ignore-site-config \
+	--layout=$(BOOST_LAYOUT) install)
+endef
+
+define HOST_BOOST_CONFIGURE_CMDS
+	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
+	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "" >> $(@D)/user-config.jam
+endef
+
 define HOST_BOOST_BUILD_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
@@ -160,14 +169,5 @@ define HOST_BOOST_INSTALL_CMDS
 	--layout=$(BOOST_LAYOUT) install )
 endef
 
-define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--prefix=$(STAGING_DIR)/usr \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install)
-endef
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
