From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 16:51:28 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] cmake: explicitly disable
	openssl support for host-cmake
Message-ID: <20170921145320.4A377810E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a86d28d850583091bd1a9d137be12794b1102eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

host-cmake will optionally link with openssl for the embedded copy of
libarchive if available, leaking host dependencies and possibly causing
build issues in case of compatibility issues - E.G. the host-cmake version
we have in 2017.02.x doesn't build against openssl-1.1.0+:

https://github.com/libarchive/libarchive/issues/810

The openssl support in libarchive is unlikely to be needed, so explicitly
disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f87138339b17bc2b1d84c59ea176abb941413550)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index bc55509..69ddbb9 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -46,6 +46,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
 			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_CXXFLAGS)" \
 			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
+			-DCMAKE_USE_OPENSSL:BOOL=OFF \
 			-DBUILD_CursesDialog=OFF \
 	)
 endef
