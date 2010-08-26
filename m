From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Aug 2010 17:47:43 +0200
Subject: [Buildroot] [git commit master 1/1] qt: fix sysroot confusion in
	./configure
Message-ID: <20100826155043.D16038905D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b415edef35094310aa89dcfc7f694f1c07dea14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt's configure script is getting confused now that we're passing --sysroot=
in QMAKE_CC / QMAKE_CXX, causing misdetection of features and runtime
breakage.

Fix it by passing --sysroot in CFLAGS/CXXFLAGS instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    2 +-
 package/qt/qt.mk |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5658b61..2d244bc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,7 +16,7 @@
 	added.
 
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, sysvinit, util-linux
+	luafilesystem, lzo, netcat, php, qt, sysvinit, util-linux
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index baf6539..eb1ef0f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -483,16 +483,16 @@ ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
 endif
 	# Fix compiler path
-	$(call QT_QMAKE_SET,CC,$(TARGET_CC))
-	$(call QT_QMAKE_SET,CXX,$(TARGET_CXX))
+	$(call QT_QMAKE_SET,CC,$(filter-out --sysroot=%,$(TARGET_CC)))
+	$(call QT_QMAKE_SET,CXX,$(filter-out --sysroot=%,$(TARGET_CXX)))
 	$(call QT_QMAKE_SET,LINK,$(TARGET_CXX))
 	$(call QT_QMAKE_SET,LINK_SHLIB,$(TARGET_CXX))
 	$(call QT_QMAKE_SET,AR,$(TARGET_AR) cqs)
 	$(call QT_QMAKE_SET,OBJCOPY,$(TARGET_OBJCOPY))
 	$(call QT_QMAKE_SET,RANLIB,$(TARGET_RANLIB))
 	$(call QT_QMAKE_SET,STRIP,$(TARGET_STRIP))
-	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_CFLAGS))
-	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_CXXFLAGS))
+	$(call QT_QMAKE_SET,CFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CFLAGS))
+	$(call QT_QMAKE_SET,CXXFLAGS,$(TARGET_SYSROOT_OPT) $(TARGET_CXXFLAGS))
 	$(call QT_QMAKE_SET,LFLAGS,$(TARGET_LDFLAGS))
 	-[ -f $(QT_QCONFIG_FILE) ] && cp $(QT_QCONFIG_FILE) \
 		$(QT_TARGET_DIR)/$(QT_QCONFIG_FILE_LOCATION)
-- 
1.7.1
