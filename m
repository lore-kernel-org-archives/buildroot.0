From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Jul 2018 14:49:40 +0200
Subject: [Buildroot] [PATCH 1/1] boost: detect missing selects
Message-ID: <20180707124940.15961-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout during the review of
http://patchwork.ozlabs.org/patch/934589, add a mechanism to detect a
missing boost select by checking that we do not install a boost library
which hasn't been selected by the user.

To manage a change of boost configuration by the user between two
builds, add a BOOST_PRE_INSTALL_TARGET_HOOKS to remove all boost
libraries before installing them.

Also, use ls with a wildcard instead of test to avoid trying to guess
library names if boost layout is set to tagged or versionned (the
wildcard will also help us to manage shared or static library)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index cf0cea7edd..b2605a70b7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -159,6 +159,24 @@ define BOOST_INSTALL_STAGING_CMDS
 	--layout=$(BOOST_LAYOUT) install)
 endef
 
+# These hooks will help us to detect missing select in Config.in
+# Indeed boost buildsystem can select a library even if the user has
+# disable it
+define BOOST_REMOVE_TARGET_LIBRARIES
+	rm -rf $(TARGET_DIR)/usr/lib/libboost_*
+endef
+
+BOOST_PRE_INSTALL_TARGET_HOOKS += BOOST_REMOVE_TARGET_LIBRARIES
+
+define BOOST_CHECK_TARGET_LIBRARIES
+	@$(foreach disabled,$(BOOST_WITHOUT_FLAGS),\
+		! ls $(TARGET_DIR)/usr/lib/libboost_$(disabled)* 1>/dev/null 2>&1 || \
+			! echo "libboost_$(disabled) shouldn't have been installed: missing select in boost/Config.in" || \
+			exit 1;)
+endef
+
+BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_CHECK_TARGET_LIBRARIES
+
 define HOST_BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
 	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
-- 
2.14.1
