From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 16:44:37 +1000
Subject: [Buildroot] [PATCH v2] p7zip-light: new package
Message-ID: <1344753877-30117-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in                                  |  1 +
 package/p7zip-light/Config.in                      | 29 +++++++
 package/p7zip-light/p7zip-light-disable-rar.patch  | 96 ++++++++++++++++++++++
 package/p7zip-light/p7zip-light-trim-install.patch | 34 ++++++++
 package/p7zip-light/p7zip-light.mk                 | 31 +++++++
 5 files changed, 191 insertions(+)
 create mode 100644 package/p7zip-light/Config.in
 create mode 100644 package/p7zip-light/p7zip-light-disable-rar.patch
 create mode 100644 package/p7zip-light/p7zip-light-trim-install.patch
 create mode 100644 package/p7zip-light/p7zip-light.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..fceedd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
+source "package/p7zip-light/Config.in"
 source "package/xz/Config.in"
 endmenu
 
diff --git a/package/p7zip-light/Config.in b/package/p7zip-light/Config.in
new file mode 100644
index 0000000..d1ed50a
--- /dev/null
+++ b/package/p7zip-light/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_P7ZIP_LIGHT
+	bool "p7zip-light"
+	help
+	  Command-line version of the 7-Zip compressed file archiver
+	  without RAR and GUI support.
+
+	  http://p7zip.sourceforge.net/
+
+if BR2_PACKAGE_P7ZIP_LIGHT
+
+config BR2_PACKAGE_P7ZIP_LIGHT_SFX
+	bool "SFX support"
+	default n
+	help
+	  Enable support for creating self-extracting archives.
+
+config BR2_PACKAGE_P7ZIP_LIGHT_7Z
+	bool "7z"
+	default n
+	help
+	  Build 7z executable. Uses plugins to handle archives.
+
+config BR2_PACKAGE_P7ZIP_LIGHT_7ZR
+	bool "7zr"
+	default n
+	help
+	  Build 7zr executable. Only supports 7z archives.
+
+endif
diff --git a/package/p7zip-light/p7zip-light-disable-rar.patch b/package/p7zip-light/p7zip-light-disable-rar.patch
new file mode 100644
index 0000000..3d5144b
--- /dev/null
+++ b/package/p7zip-light/p7zip-light-disable-rar.patch
@@ -0,0 +1,96 @@
+diff -Nur p7zip_9.20.1.orig/CPP/7zip/Bundles/Format7zFree/makefile p7zip_9.20.1/CPP/7zip/Bundles/Format7zFree/makefile
+--- p7zip_9.20.1.orig/CPP/7zip/Bundles/Format7zFree/makefile	2010-11-08 02:41:43.000000000 +1100
++++ p7zip_9.20.1/CPP/7zip/Bundles/Format7zFree/makefile	2012-08-12 16:07:11.324018639 +1000
+@@ -158,14 +158,6 @@
+   NsisIn.o \
+   NsisRegister.o \
+ 
+-RAR_OBJS = \
+-  RarHandler.o \
+-  RarHeader.o \
+-  RarIn.o \
+-  RarItem.o \
+-  RarVolumeInStream.o \
+-  RarRegister.o \
+-
+ TAR_OBJS = \
+   TarHandler.o \
+   TarHandlerOut.o \
+@@ -257,8 +249,6 @@
+   MyAes.o \
+   Pbkdf2HmacSha1.o \
+   RandGen.o \
+-  Rar20Crypto.o \
+-  RarAes.o \
+   Sha1.o \
+   WzAes.o \
+   ZipCrypto.o \
+@@ -314,7 +304,6 @@
+   $(HFS_OBJS) \
+   $(ISO_OBJS) \
+   $(NSIS_OBJS) \
+-  $(RAR_OBJS) \
+   $(TAR_OBJS) \
+   $(UDF_OBJS) \
+   $(WIM_OBJS) \
+diff -Nur p7zip_9.20.1.orig/makefile p7zip_9.20.1/makefile
+--- p7zip_9.20.1.orig/makefile	2011-03-13 22:52:45.000000000 +1100
++++ p7zip_9.20.1/makefile	2012-08-12 16:04:23.665309025 +1000
+@@ -56,7 +56,6 @@
+ 	$(MAKE) -C CPP/7zip/UI/Client7z           depend
+ 	$(MAKE) -C CPP/7zip/UI/Console            depend
+ 	$(MAKE) -C CPP/7zip/Bundles/Format7zFree  depend
+-	$(MAKE) -C CPP/7zip/Compress/Rar          depend
+ 	$(MAKE) -C CPP/7zip/UI/GUI                depend
+ 	$(MAKE) -C CPP/7zip/UI/FileManager        depend
+ 	$(MAKE) -C check/my_86_filter             depend
+@@ -68,7 +67,6 @@
+ common7z:common
+ 	$(MKDIR) bin/Codecs
+ 	$(MAKE) -C CPP/7zip/Bundles/Format7zFree all
+-	$(MAKE) -C CPP/7zip/Compress/Rar         all
+ 
+ 7z: common7z
+ 	$(MAKE) -C CPP/7zip/UI/Console           all
+@@ -93,7 +91,6 @@
+ 	$(MAKE) -C CPP/7zip/UI/FileManager       clean
+ 	$(MAKE) -C CPP/7zip/UI/GUI               clean
+ 	$(MAKE) -C CPP/7zip/Bundles/Format7zFree clean
+-	$(MAKE) -C CPP/7zip/Compress/Rar         clean
+ 	$(MAKE) -C CPP/7zip/Compress/LZMA_Alone  clean
+ 	$(MAKE) -C CPP/7zip/Bundles/AloneGCOV    clean
+ 	$(MAKE) -C CPP/7zip/TEST/TestUI          clean
+diff -Nur p7zip_9.20.1.orig/makefile.rules p7zip_9.20.1/makefile.rules
+--- p7zip_9.20.1.orig/makefile.rules	2010-11-08 03:08:51.000000000 +1100
++++ p7zip_9.20.1/makefile.rules	2012-08-12 16:07:41.905875384 +1000
+@@ -448,19 +448,6 @@
+ NsisRegister.o : ../../Archive/Nsis/NsisRegister.cpp
+ 	$(CXX) $(CXXFLAGS) ../../Archive/Nsis/NsisRegister.cpp
+ 
+-RarHandler.o : ../../Archive/Rar/RarHandler.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarHandler.cpp
+-RarHeader.o : ../../Archive/Rar/RarHeader.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarHeader.cpp
+-RarIn.o : ../../Archive/Rar/RarIn.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarIn.cpp
+-RarItem.o : ../../Archive/Rar/RarItem.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarItem.cpp
+-RarVolumeInStream.o : ../../Archive/Rar/RarVolumeInStream.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarVolumeInStream.cpp
+-RarRegister.o : ../../Archive/Rar/RarRegister.cpp
+-	$(CXX) $(CXXFLAGS) ../../Archive/Rar/RarRegister.cpp
+-
+ UdfHandler.o : ../../Archive/Udf/UdfHandler.cpp
+ 	$(CXX) $(CXXFLAGS) ../../Archive/Udf/UdfHandler.cpp
+ UdfIn.o : ../../Archive/Udf/UdfIn.cpp
+@@ -535,10 +522,6 @@
+ 	$(CXX) $(CXXFLAGS) ../../Crypto/7zAesRegister.cpp
+ WzAes.o : ../../Crypto/WzAes.cpp
+ 	$(CXX) $(CXXFLAGS) ../../Crypto/WzAes.cpp
+-Rar20Crypto.o : ../../Crypto/Rar20Crypto.cpp
+-	$(CXX) $(CXXFLAGS) ../../Crypto/Rar20Crypto.cpp
+-RarAes.o : ../../Crypto/RarAes.cpp
+-	$(CXX) $(CXXFLAGS) ../../Crypto/RarAes.cpp
+ HmacSha1.o : ../../Crypto/HmacSha1.cpp
+ 	$(CXX) $(CXXFLAGS) ../../Crypto/HmacSha1.cpp
+ Pbkdf2HmacSha1.o : ../../Crypto/Pbkdf2HmacSha1.cpp
diff --git a/package/p7zip-light/p7zip-light-trim-install.patch b/package/p7zip-light/p7zip-light-trim-install.patch
new file mode 100644
index 0000000..884e57c
--- /dev/null
+++ b/package/p7zip-light/p7zip-light-trim-install.patch
@@ -0,0 +1,34 @@
+diff -Nur p7zip_9.20.1.orig/install.sh p7zip_9.20.1/install.sh
+--- p7zip_9.20.1.orig/install.sh	2011-03-17 06:32:56.000000000 +1100
++++ p7zip_9.20.1/install.sh	2012-08-12 16:30:30.452439065 +1000
+@@ -104,12 +104,14 @@
+     chmod 555 "${DEST_DIR}${DEST_SHARE}/7z.so"
+   fi
+ 
++:<<DISABLED
+   if [ -d bin/Codecs ]
+   then
+     echo "- installing ${DEST_DIR}${DEST_SHARE}/Codecs"
+     cp -r bin/Codecs "${DEST_DIR}${DEST_SHARE}/"
+     chmod 555 "${DEST_DIR}${DEST_SHARE}"/*/*
+   fi
++DISABLED
+ 
+ else
+   if [ -x bin/7za ]
+@@ -129,6 +131,7 @@
+   fi
+ fi
+ 
++:<<DISABLED
+ mkdir -p "${DEST_DIR}${DEST_MAN}/man1"
+ if [ -d DOCS ]
+ then
+@@ -181,6 +184,7 @@
+   find "${DEST_DIR}${DEST_SHARE_DOC}/DOCS" -type d -exec chmod 555 {} \;
+   find "${DEST_DIR}${DEST_SHARE_DOC}/DOCS" -type f -exec chmod 444 {} \;
+ fi
++DISABLED
+ 
+ use_lang="n"
+ 
diff --git a/package/p7zip-light/p7zip-light.mk b/package/p7zip-light/p7zip-light.mk
new file mode 100644
index 0000000..844a1db
--- /dev/null
+++ b/package/p7zip-light/p7zip-light.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# p7zip-light
+#
+#############################################################
+P7ZIP_LIGHT_VERSION = 9.20.1
+P7ZIP_LIGHT_SOURCE = p7zip_$(P7ZIP_LIGHT_VERSION)_src_all.tar.bz2
+P7ZIP_LIGHT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/p7zip
+P7ZIP_LIGHT_LICENSE = LGPLv2.1+
+P7ZIP_LIGHT_TARGETS = 7za
+
+define P7ZIP_LIGHT_BUILD_CMDS
+	sed -i -e "s|CC=.*|CC=$(TARGET_CC) \$$(ALLFLAGS)|" -e "s|CXX=.*|CXX=$(TARGET_CXX) \$$(ALLFLAGS)|" $(@D)/makefile.machine
+	$(MAKE) -C $(@D) 7za \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_SFX),sfx,) \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7Z),7z,) \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7ZR),7zr,)
+endef
+
+define P7ZIP_LIGHT_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		make install DEST_DIR=$(TARGET_DIR) DEST_HOME=/usr DEST_MAN=/usr/share/man \
+	)
+endef
+
+define P7ZIP_LIGHT_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/7z{,a,r}
+	rm -rf $(TARGET_DIR)/usr/lib/p7zip
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
