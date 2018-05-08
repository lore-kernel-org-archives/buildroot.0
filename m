From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:39:16 +0200
Subject: [Buildroot] [git commit] Revert "libcrossguid: bump to version
 0.2.2"
Message-ID: <20180508133901.376368C062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ac12d8b18b4e1ebd8b11279e98068d2b3ba449e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit dededf0ff2177e5aeb051db25e178bb951debce5.

Building the only package depending on libcrossguid, Kodi, breaks due to
this bump:

/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp: In static member function ???static std::__cxx11::string
StringUtils::CreateUUID()???:
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp:1194:10: error: ???GuidGenerator??? does not name a type
   static GuidGenerator guidGenerator;
          ^~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp:1195:15: error: ???guidGenerator??? was not declared in this
scope
   auto guid = guidGenerator.newGuid();
               ^~~~~~~~~~~~~

This happens due to changes in libcrossguid:
https://github.com/graeme-hill/crossguid/blob/master/README.md

"This is version 0.2 of CrossGuid. If you all already using CrossGuid and
your code uses GuidGenerator then you are using version 0.1."

Even Kodi master branch has no support for libcrossguid-0.2.x yet so we
revert the bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcrossguid/libcrossguid.hash | 3 +--
 package/libcrossguid/libcrossguid.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index 08791947ce..a991da56a0 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 48321928473c682b0cdc7e17bbd3390f79f4b98ab22fef3b81a852dda81fd195  libcrossguid-v0.2.2.tar.gz
-sha256 779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
+sha256 022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
diff --git a/package/libcrossguid/libcrossguid.mk b/package/libcrossguid/libcrossguid.mk
index 46daaec206..46d9a9dcc6 100644
--- a/package/libcrossguid/libcrossguid.mk
+++ b/package/libcrossguid/libcrossguid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCROSSGUID_VERSION = v0.2.2
+LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
 LIBCROSSGUID_SITE = $(call github,graeme-hill,crossguid,$(LIBCROSSGUID_VERSION))
 LIBCROSSGUID_LICENSE = MIT
 LIBCROSSGUID_LICENSE_FILES = LICENSE
@@ -15,14 +15,14 @@ LIBCROSSGUID_DEPENDENCIES = util-linux
 
 define LIBCROSSGUID_BUILD_CMDS
 	(cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -std=c++11 -DGUID_LIBUUID \
-		-c Guid.cpp -o guid.o)
+		-c guid.cpp -o guid.o)
 	(cd $(@D); $(TARGET_AR) rvs libcrossguid.a guid.o)
 endef
 
 define LIBCROSSGUID_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 644 $(@D)/libcrossguid.a \
 		$(STAGING_DIR)/usr/lib/libcrossguid.a
-	$(INSTALL) -D -m 644 $(@D)/Guid.hpp $(STAGING_DIR)/usr/include/guid.h
+	$(INSTALL) -D -m 644 $(@D)/guid.h $(STAGING_DIR)/usr/include/guid.h
 endef
 
 $(eval $(generic-package))
