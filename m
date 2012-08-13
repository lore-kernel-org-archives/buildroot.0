From: Jonathan Liu <net147@gmail.com>
Date: Mon, 13 Aug 2012 16:42:08 +1000
Subject: [Buildroot] [PATCH v3] p7zip-light: new package
Message-ID: <1344840128-29740-1-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in                                  |   1 +
 package/p7zip-light/Config.in                      |  26 +++++
 package/p7zip-light/p7zip-light-disable-rar.patch  | 112 +++++++++++++++++++++
 package/p7zip-light/p7zip-light-exclude-docs.patch |  30 ++++++
 .../p7zip-light/p7zip-light-makefile-flags.patch   |  80 +++++++++++++++
 package/p7zip-light/p7zip-light.mk                 |  31 ++++++
 6 files changed, 280 insertions(+)
 create mode 100644 package/p7zip-light/Config.in
 create mode 100644 package/p7zip-light/p7zip-light-disable-rar.patch
 create mode 100644 package/p7zip-light/p7zip-light-exclude-docs.patch
 create mode 100644 package/p7zip-light/p7zip-light-makefile-flags.patch
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
index 0000000..9aaec23
--- /dev/null
+++ b/package/p7zip-light/Config.in
@@ -0,0 +1,26 @@
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
+	help
+	  Enable support for creating self-extracting archives.
+
+config BR2_PACKAGE_P7ZIP_LIGHT_7Z
+	bool "7z"
+	help
+	  Build 7z executable. Uses plugins to handle archives.
+
+config BR2_PACKAGE_P7ZIP_LIGHT_7ZR
+	bool "7zr"
+	help
+	  Build 7zr executable. Only supports 7z archives.
+
+endif
diff --git a/package/p7zip-light/p7zip-light-disable-rar.patch b/package/p7zip-light/p7zip-light-disable-rar.patch
new file mode 100644
index 0000000..d605c6b
--- /dev/null
+++ b/package/p7zip-light/p7zip-light-disable-rar.patch
@@ -0,0 +1,112 @@
+Disable RAR support
+
+The RAR support is non-free and licensed under the unRAR restriction.
+As this support is usually not neeeded, disable it to reduce footprint
+and simplify licensing.
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ CPP/7zip/Bundles/Format7zFree/makefile | 11 -----------
+ makefile                               |  3 ---
+ makefile.rules                         | 17 -----------------
+ 3 files changed, 31 deletions(-)
+
+Index: p7zip_9.20.1/CPP/7zip/Bundles/Format7zFree/makefile
+===================================================================
+--- p7zip_9.20.1.orig/CPP/7zip/Bundles/Format7zFree/makefile
++++ p7zip_9.20.1/CPP/7zip/Bundles/Format7zFree/makefile
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
+Index: p7zip_9.20.1/makefile
+===================================================================
+--- p7zip_9.20.1.orig/makefile
++++ p7zip_9.20.1/makefile
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
+Index: p7zip_9.20.1/makefile.rules
+===================================================================
+--- p7zip_9.20.1.orig/makefile.rules
++++ p7zip_9.20.1/makefile.rules
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
diff --git a/package/p7zip-light/p7zip-light-exclude-docs.patch b/package/p7zip-light/p7zip-light-exclude-docs.patch
new file mode 100644
index 0000000..f01f114
--- /dev/null
+++ b/package/p7zip-light/p7zip-light-exclude-docs.patch
@@ -0,0 +1,30 @@
+Do not install documentation
+
+The install script installs documentation files which are not needed.
+Exclude them to reduce footprint.
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ install.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: p7zip_9.20.1/install.sh
+===================================================================
+--- p7zip_9.20.1.orig/install.sh
++++ p7zip_9.20.1/install.sh
+@@ -129,6 +129,7 @@
+   fi
+ fi
+ 
++:<<DISABLED
+ mkdir -p "${DEST_DIR}${DEST_MAN}/man1"
+ if [ -d DOCS ]
+ then
+@@ -181,6 +182,7 @@
+   find "${DEST_DIR}${DEST_SHARE_DOC}/DOCS" -type d -exec chmod 555 {} \;
+   find "${DEST_DIR}${DEST_SHARE_DOC}/DOCS" -type f -exec chmod 444 {} \;
+ fi
++DISABLED
+ 
+ use_lang="n"
+ 
diff --git a/package/p7zip-light/p7zip-light-makefile-flags.patch b/package/p7zip-light/p7zip-light-makefile-flags.patch
new file mode 100644
index 0000000..0babe95
--- /dev/null
+++ b/package/p7zip-light/p7zip-light-makefile-flags.patch
@@ -0,0 +1,80 @@
+Allow CC/CFLAGS/CXX/CXXFLAGS overrides
+
+The makefiles currently use hardcoded values for the compiler and
+compiler flags. This patch removes flags that not essential or are
+already added by buildroot and then modifies the makefiles to
+to allow specifying custom compiler and compiler flags.
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ CPP/7zip/Compress/LZMA_Alone/makefile |  7 +++----
+ makefile                              |  1 +
+ makefile.glb                          |  4 ++--
+ makefile.machine                      | 15 +++++----------
+ 4 files changed, 11 insertions(+), 16 deletions(-)
+
+Index: p7zip_9.20.1/CPP/7zip/Compress/LZMA_Alone/makefile
+===================================================================
+--- p7zip_9.20.1.orig/CPP/7zip/Compress/LZMA_Alone/makefile
++++ p7zip_9.20.1/CPP/7zip/Compress/LZMA_Alone/makefile
+@@ -1,12 +1,11 @@
++LOCAL_FLAGS = -c -I. -I../../../  -I../../../myWindows  -I../../../include_windows \
++         -UENV_UNIX -DCOMPRESS_MF_MT -DBENCH_MT
++
+ include ../../../../makefile.machine
+ 
+ PROG = lzma
+ LIB = $(LOCAL_LIBS)
+ RM = rm -f
+-CFLAGS = -c -I. -I../../../  -I../../../myWindows  -I../../../include_windows \
+-         -UENV_UNIX -DCOMPRESS_MF_MT -DBENCH_MT
+-
+-CXXFLAGS=$(CFLAGS)
+ 
+ OBJS = \
+   LzmaAlone.o \
+Index: p7zip_9.20.1/makefile.glb
+===================================================================
+--- p7zip_9.20.1.orig/makefile.glb
++++ p7zip_9.20.1/makefile.glb
+@@ -1,12 +1,12 @@
+ 
+ RM=rm -f
+-CFLAGS=-c -I. \
++override CFLAGS+=-c -I. \
+ -I../../../../C \
+ -I../../../myWindows \
+ -I../../../include_windows \
+ -I../../..
+ 
+-CXXFLAGS=-c -I. \
++override CXXFLAGS+=-c -I. \
+ -I../../../myWindows \
+ -I../../../ \
+ -I../../../include_windows
+Index: p7zip_9.20.1/makefile.machine
+===================================================================
+--- p7zip_9.20.1.orig/makefile.machine
++++ p7zip_9.20.1/makefile.machine
+@@ -2,16 +2,11 @@
+ # makefile for Linux (x86, PPC, alpha ...)
+ #
+ 
+-OPTFLAGS=-O
+-
+-ALLFLAGS=${OPTFLAGS} -pipe -s \
+-    	-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
+-	-DNDEBUG -D_REENTRANT -DENV_UNIX \
+-	-D_7ZIP_LARGE_PAGES \
+-	$(LOCAL_FLAGS)
+-
+-CXX=g++ $(ALLFLAGS)
+-CC=gcc $(ALLFLAGS)
++ALLFLAGS=-DNDEBUG -D_REENTRANT -DENV_UNIX -D_7ZIP_LARGE_PAGES $(LOCAL_FLAGS)
++CXX?=g++
++CC?=gcc $(ALLFLAGS)
++override CXXFLAGS+=$(ALLFLAGS)
++override CCFLAGS+=$(ALLFLAGS)
+ CC_SHARED=-fPIC
+ LINK_SHARED=-fPIC -shared
+ 
diff --git a/package/p7zip-light/p7zip-light.mk b/package/p7zip-light/p7zip-light.mk
new file mode 100644
index 0000000..b2f597b
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
+
+define P7ZIP_LIGHT_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		CXX="$(TARGET_CXX)" CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		-C $(@D) 7za \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_SFX),sfx) \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7Z),7z) \
+		$(if $(BR2_PACKAGE_P7ZIP_LIGHT_7ZR),7zr)
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
