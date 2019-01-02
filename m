From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@collabora.com>
Date: Wed,  2 Jan 2019 15:56:27 -0500
Subject: [Buildroot] [PATCH v3 0/3] qt5webkit: fix build issue using system
 leveldb
Message-ID: <20190102205630.18725-1-gael.portay@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patchset fixes the build issue reported by autobuilder [0].

        /home/naourr/work/instance-2/output/build/qt5webkit-5.9.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o: In function `WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
LevelDBDatabase.cpp.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x34): undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
        collect2: error: ld returned 1 exit status
        make[3]: *** [Makefile.api:97: ../lib/libQt5WebKit.so.5.9.1] Error 1

The issue happens when the package leveldb is enabled.

QtWebKit builds its own copy of leveldb [1] (as a third-party) if the system
does not provided it (i.e. buildroot). It builds it differently and this is the
origin of that issue. Instead of using the Makefile provided by leveldb [2],
QtWebKit uses qmake to build that library [3].

The missing symbol issue happens because the symbol leveldb::NewMemEnv is
bundled in the static library libmemenv.a (aside libleveldb.so). This static
library consists of this single symbol which is like an extra that is built but
*NOT* shipped by default at installation in the staging directory.
Unfortunatly, that symbol is required later by WebCore [4].

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

To fix that issue, this patchset builds the leveldb package and tells QtWebKit
to use it instead of building its own copy.

The first two patches concern the leveldb package.

The first one adds installation of headers and the missing static library in
the staging directory.

The second one patches leveldb to generate position independant code for the
static library libmemenv.a; in order let it linkable by the Qt5WebKit module.
Without that patch, the build raises the error below:

        /home/gportay/src/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-amd-linux-gnu/6.2.0/../../../../x86_64-amd-linux-gnu/bin/ld: /home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a(memenv.o): relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC
        /home/gportay/src/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libmemenv.a: error adding symbols: Bad value
        collect2: error: ld returned 1 exit status

It it not relevant to upstream that patch since the project has already moved
to cmake [6] for the (upcoming?) version 1.21. Backporting the upstreamed
patches was way too complicated.

The last patch selects the leveldb package in qt5webkit and sets the
appropriate qmake flag to tell it to use the package provided by
buildroot.

[0]: http://autobuild.buildroot.net/results/8afc8771741f62da3b2117d2124d1c6f2d941903/
[1]: https://github.com/qt/qtwebkit/tree/5.9/Source/ThirdParty/leveldb
[2]: https://github.com/qt/qtwebkit/blob/5.9/Source/ThirdParty/leveldb/Makefile#L167-L169
[3]: https://github.com/qt/qtwebkit/blob/5.9/Source/ThirdParty/leveldb/Target.pri#L80
[4]: https://github.com/qt/qtwebkit/blob/5.9/Source/WebCore/platform/leveldb/LevelDBDatabase.cpp#L185
[5]: https://github.com/qt/qtwebkit/blob/5.9/Source/WebCore/WebCore.pri#L254
[6]: https://github.com/google/leveldb/commit/739c25100e46576cdcdfff2d6f43f9f7008103c7

Changes since v2:
 - remove option BR2_PACKAGE_LEVELDB_MEMENV
 - use install -D option and full destination path

Changes since v1:
 - add option BR2_PACKAGE_LEVELDB_MEMENV to install static library and
   header

Regards,
Ga?l PORTAY (3):
  leveldb: install memenv static library and header
  leveldb: generate pic for static libraries
  qt5webkit: select leveldb package and memenv

 ...n-independant-code-for-static-librar.patch | 52 +++++++++++++++++++
 package/leveldb/leveldb.mk                    |  2 +
 package/qt5/qt5webkit/Config.in               |  3 ++
 package/qt5/qt5webkit/qt5webkit.mk            |  4 +-
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 package/leveldb/0001-Generate-position-independant-code-for-static-librar.patch

-- 
2.20.1
