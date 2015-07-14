From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:42:01 +0200
Subject: [Buildroot] [git commit] boost: use backtick instead of $(shell
	...) make function
Message-ID: <20150714225134.A7A1981D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e77354d28f8087fed75b2fe66fbd50799e68eca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove the variables TARGET_CC_VERSION and HOST_CC_VERSION which
lack the BOOST_ prefix and are used only once.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/boost.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index dbb5de5..cc3ba9e 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -11,9 +11,6 @@ BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = Boost Software License 1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 
-TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
-HOST_CC_VERSION = $(shell $(HOSTCC) -dumpversion)
-
 HOST_BOOST_DEPENDENCIES =
 
 # keep host variant as minimal as possible
@@ -111,13 +108,13 @@ BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
-	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
 	echo "" >> $(@D)/user-config.jam
 endef
 
 define HOST_BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
-	echo "using gcc : $(HOST_CC_VERSION) : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
 	echo "" >> $(@D)/user-config.jam
 endef
 
