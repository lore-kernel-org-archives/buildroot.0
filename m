From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 15:37:50 +0100
Subject: [Buildroot] [git commit] boost: make package less verbose when
	building with -s
Message-ID: <20151205144026.6055180AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27281af4bf969a943c81afcfbcd881728a3c1172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost build is very verbose (11K+ lines even when no sub options are
enabled).  While this can be handy for debugging, make is less verbose when
'make -s' is used, similar to how we do it for autotools.

With this, make -s boost outputs less than 100 lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 178f7b8..36710f7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -118,6 +118,10 @@ BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
+# how verbose should the build be?
+BOOST_OPTS += $(if $(QUIET),-d,-d+1)
+HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
+
 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
 	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
@@ -131,7 +135,7 @@ define HOST_BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -140,7 +144,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define HOST_BOOST_BUILD_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--ignore-site-config \
@@ -148,7 +152,7 @@ define HOST_BOOST_BUILD_CMDS
 endef
 
 define HOST_BOOST_INSTALL_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--prefix=$(HOST_DIR)/usr \
@@ -157,7 +161,7 @@ define HOST_BOOST_INSTALL_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
