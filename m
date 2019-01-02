From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Wed,  2 Jan 2019 15:56:30 -0500
Subject: [Buildroot] [PATCH v3 3/3] qt5webkit: select leveldb package and
 memenv
In-Reply-To: <20190102205630.18725-1-gael.portay@collabora.com>
References: <20190102205630.18725-1-gael.portay@collabora.com>
Message-ID: <20190102205630.18725-4-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the build issue reported by autobuilder [0].

        /home/naourr/work/instance-2/output/build/qt5webkit-5.9.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o: In function
	`WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
	LevelDBDatabase.cpp.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x34): undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
        collect2: error: ld returned 1 exit status
        make[3]: *** [Makefile.api:97: ../lib/libQt5WebKit.so.5.9.1]
	Error 1

The issue happens when both packages leveldb and qt5webkit are enabled.

QtWebKit builds its own copy of leveldb [1] (as a third-party) if the
system does not provided it (i.e. buildroot). It builds it differently
and this is the origin of that issue. Instead of using the Makefile
provided by leveldb [2], QtWebKit uses qmake to build that library [3].

The missing symbol issue happens because the symbol leveldb::NewMemEnv
is bundled in the static library libmemenv.a (aside libleveldb.so).
This static library consists of this single symbol which is like an
extra that is built but *NOT* shipped by default at installation in the
staging directory. Unfortunatly, that symbol is required later by
WebCore [4].

The copy built by QtWebKit is an all-in-one library including both
libleveldb and libmemenv; thus QtWebKit links against libleveldb only.
Also, the linker finds the buildroot's copy first (not the third-party):
that explains why it is complaining about a missing symbol. That copy
does not have the symbol leveldb::NewMemEnv.

Fortunatly, QtWebKit provides a facility to link against the system
leveldb package. The qmake flag WEBKIT_CONFIG+=use_system_leveldb tells
Qt5WebKit to link against libleveldb *AND* libmemenv [5].

To fix that issue, this commit selects the package leveldb that now
installs the libmemenv static library and its header. It ensures that
QtWebKit has every thing it needs to be built. It also sets the
appropriate qmake configure flags to tells QtWebKit to use the leveldb
copy build by the system (instead of the one that can be build internaly
as a third-party).

[0]: http://autobuild.buildroot.net/results/8afc8771741f62da3b2117d2124d1c6f2d941903/
[1]: https://github.com/qt/qtwebkit/tree/5.9/Source/ThirdParty/leveldb
[2]: https://github.com/qt/qtwebkit/blob/5.9/Source/ThirdParty/leveldb/Makefile#L167-L169
[3]: https://github.com/qt/qtwebkit/blob/5.9/Source/ThirdParty/leveldb/Target.pri#L80
[4]: https://github.com/qt/qtwebkit/blob/5.9/Source/WebCore/platform/leveldb/LevelDBDatabase.cpp#L185
[5]: https://github.com/qt/qtwebkit/blob/5.9/Source/WebCore/WebCore.pri#L254
[6]: https://github.com/google/leveldb/commit/739c25100e46576cdcdfff2d6f43f9f7008103c7

Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>
---
 package/qt5/qt5webkit/Config.in    | 3 +++
 package/qt5/qt5webkit/qt5webkit.mk | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 72c641b9f7..e8008f7bab 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -3,10 +3,13 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_INSTALL_LIBSTDCPP # leveldb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # leveldb
 	depends on !BR2_BINFMT_FLAT # icu
 	# assumes a FPU is available on MIPS
 	depends on !BR2_MIPS_SOFT_FLOAT
+	select BR2_PACKAGE_LEVELDB
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index e8d368fb01..a0a0998d12 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -16,7 +16,7 @@ endif
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
-	qt5base sqlite
+	leveldb qt5base sqlite
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
@@ -45,7 +45,7 @@ endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake WEBKIT_CONFIG+=use_system_leveldb)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
-- 
2.20.1
