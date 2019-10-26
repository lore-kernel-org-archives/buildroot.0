From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 21:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/leveldb: fix build for gcc < 5.x
Message-ID: <20191026192707.23083-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without defining LEVELDB_HAS_PORT_CONFIG_H port/port_config.h will not
be included:
https://github.com/google/leveldb/blob/master/port/port_stdcxx.h#L8

which breaks endian detection. Add the define to our memenv patch to fix
building with gcc < 5.
__has_include was added in gcc5: https://gcc.gnu.org/gcc-5/changes.html

Fixes:
http://autobuild.buildroot.net/results/4ac/4ac8fbed79307326086ab294eba9e68cf208e6ac/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leveldb/0002-CMake-install-libmemenv.a.patch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leveldb/0002-CMake-install-libmemenv.a.patch b/package/leveldb/0002-CMake-install-libmemenv.a.patch
index 85ee8a824b..f2e88a8a6c 100644
--- a/package/leveldb/0002-CMake-install-libmemenv.a.patch
+++ b/package/leveldb/0002-CMake-install-libmemenv.a.patch
@@ -32,6 +32,12 @@ index a65afbf..83b2425 100644
 +    # Used by port/port.h.
 +    ${LEVELDB_PLATFORM_NAME}=1
 +)
++if (NOT HAVE_CXX17_HAS_INCLUDE)
++  target_compile_definitions(memenv
++    PRIVATE
++      LEVELDB_HAS_PORT_CONFIG_H=1
++  )
++endif(NOT HAVE_CXX17_HAS_INCLUDE)
 +target_include_directories(memenv
 +  PUBLIC
 +    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
-- 
2.20.1
